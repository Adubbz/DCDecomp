#!/usr/bin/env python3
"""Give MWCC the pragmas it needs to be told what state it is in.

    statefix.py [--verify] -- <compiler arguments>   compile under the pragmas
    statefix.py --wibo -- <exe> <arguments>          stand in for wibo

MWCC carries state from one source file of an invocation to the next and never
resets it, and it reads memory nothing ever wrote (re/ai/compiler/leaked_state.md).
Retail compiled every unit of a program in one invocation; this build compiles
one unit per invocation, so that state is empty where retail's was not.

Rather than model what retail's invocation had reached, each unit states the
state it is compiled under, in its own source:

    #pragma helper_mask_gpr 0x30      set the integer helper-argument mask
    #pragma helper_mask_fpr 0x1000    set the float one
    #pragma helper_mask_gpr +0x20     or a bit into it
    #pragma constant_flag 1           what every later float constant reads
    #pragma constant_flag_next 1      what the next one reads, once
    #pragma constant_flag_ones 3,17   which constants of the unit read 1 instead
    #pragma argument_flag 0           what every float argument of a call reads
    #pragma argument_flag_ones 4,9    which of those reads 1 instead
    #pragma argument_flag_free 7,8    which of them to leave to the node's own byte
    #pragma order_flag_zeros 3,7      which of the ordering pass's writes to drop
    #pragma name_counter 910          where the invented-name counter starts

The compiler has no such pragmas. This runs it under gdb, stands at its pragma
handler, acts on these five spellings and sends them to its own "unknown
pragma" exit, so the compiler never sees them; mwcc ignores an unknown pragma
silently, so a source carrying them still compiles without this script -- it
just does not get the state.

`--wibo` makes it a drop-in for wibo itself -- it takes the guest executable as
its first argument and keeps quiet otherwise -- which is how the build reaches
it: `scripts/build/mwccgap.sh` hands mwccgap `--wibo-path` pointing at
`scripts/build/statefix-wibo.sh`.

Compiling one unit this way and diffing the object against a plain compile is
how to see what a unit's pragmas are worth.
"""

import os
import re
import sys
import tempfile
import subprocess

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
COMPILER = os.path.join(REPO, 'tools', 'compilers', 'mw', '2.3.3', 'mwccmips.exe')
# The build image has wibo on PATH; a host checkout usually has it under
# ~/.local/bin. WIBO overrides both.
WIBO = (os.environ.get('WIBO')
        or __import__('shutil').which('wibo')
        or os.path.expanduser('~/.local/bin/wibo'))

# The compiler's `#pragma` handler is a chain of strcmp against its own table.
# PRAGMA is the point just past its "the name is an identifier" check, where
# the name is the token at `[TOKEN] + NAME_TEXT`; PRAGMA_IGNORE is the exit it
# takes for a name it does not know -- skip to end of line and return -- which
# is where a pragma of ours is sent once it has been acted on. LEXER holds the
# source pointer, standing just past the name, which is how the argument is
# read. All four come from tools/mwcc-debug/profiles/.
PRAGMA, PRAGMA_IGNORE = 0x004440C6, 0x00444505
TOKEN, LEXER = 0x005570FC, 0x00555614
NAME_TEXT = 10

# The arguments a compiler-emitted helper call reads, ORed by 0x0049F270 per
# argument pushed and read by the call builder at 0x0049E420, which turns a set
# bit into the USE annotation that keeps that register live across the call.
# Nothing in the image clears either word.
HELPER_MASK = {'gpr': 0x0051CE00, 'fpr': 0x0051CE04}

# The `must be evaluated first` byte of an expression node. The annotation pass
# 0x004B28C0 writes it for every node kind it handles, but for a float constant
# it asks whether the constant is exactly representable and, when it is,
# returns at NODE_HOOK without writing -- so the node keeps whatever its arena
# slot last held. Call lowering reads it to decide which argument to
# materialise first.
NODE_HOOK, NODE_FIELD = 0x004B290D, 5

# Where call lowering reads that byte, all five of them: one per argument of a
# call, then the two operands of a binary node, then the two the float path
# takes. Each is a `cmp BYTE [<reg>+5],0` whose answer decides whether the
# operand is emitted in the first walk or the second. Standing here rather than
# at NODE_HOOK reaches every operand, not only the ones whose expression is a
# float constant -- a local, or an integer converted to float, is decided by the
# same byte and never passes through the constant case at all. One counter runs
# across all five, in the order the compiler reaches them.
ARGUMENT_READS = ((0x0049E925, 'ecx'), (0x0049E94F, 'eax'),
                  (0x0049E97B, 'eax'), (0x0049EFFB, 'eax'),
                  (0x0049F06C, 'eax'))

# A pass of its own, at 0x004C78C0, that walks two lists and writes the same
# byte: it clears it for one chain and then, for every node of the list at
# 0x005570A8 whose byte is still zero, **sets it to one**. It runs after the
# nodes are built and nothing else touches it, so a constant whose byte the
# source pinned can still arrive at call lowering non-zero. ORDER_SET is that
# store; skipping it to ORDER_NEXT leaves the byte alone.
ORDER_SET, ORDER_NEXT, ORDER_REGISTER = 0x004C78ED, 0x004C78F1, 'eax'

# The counter behind every name the compiler invents -- the `@<n>` a floating
# constant is filed under, which retail's linker kept as `LIT_<n>`. 0x0042E540
# hands out the value and increments it, and nothing resets it between units, so
# retail's ran for the whole program. The compiler initialises it at startup,
# which is before any pragma of the source is read, so writing it here holds.
NAME_COUNTER = 0x0052B5D0

# Where the code generator is entered, and how the function it is about to
# compile is named: the argument at esp+4 holds a record pointer at +8 whose
# name begins at +10. Only --verify needs this, and standing here costs a stop
# per function, so the breakpoint is installed only for it.
CODEGEN = 0x004356B0
NAME_ARGUMENT, NAME_RECORD = 4, 8

PRAGMAS = ('helper_mask_gpr', 'helper_mask_fpr',
           'constant_flag', 'constant_flag_next', 'constant_flag_ones',
           'argument_flag', 'argument_flag_ones', 'argument_flag_free',
           'order_flag_zeros', 'name_counter')

# Whether a source asks for the constant-flag pragmas at all. Standing at
# NODE_HOOK costs a stop per floating-point constant, which is most of what
# running under gdb costs, and a unit that says nothing about them wants the
# compiler's own residue left alone.
WANTS_NODE = re.compile(r'^\s*#\s*pragma\s+constant_flag', re.M)
WANTS_ARGUMENT = re.compile(r'^\s*#\s*pragma\s+argument_flag', re.M)
WANTS_ORDER = re.compile(r'^\s*#\s*pragma\s+order_flag', re.M)


def source_of(arguments):
    """The unit being compiled.

    `STATEFIX_SOURCE` wins over the command line: mwccgap's second pass
    compiles a temporary whose name says nothing about the unit.
    """
    named = os.environ.get('STATEFIX_SOURCE')
    if named:
        return named
    for argument in arguments:
        if argument.endswith(('.c', '.cpp')):
            return argument
    return None


def asks_for_nodes(arguments):
    path = source_of(arguments)
    if not path or not os.path.exists(path):
        return False
    try:
        with open(path, encoding='utf-8', errors='replace') as f:
            return bool(WANTS_NODE.search(f.read()))
    except OSError:
        return False


def asks_for_order(arguments):
    """Whether the source asks about the ordering pass's own writes."""
    path = source_of(arguments)
    if not path:
        return False
    try:
        with open(path, encoding='utf-8', errors='replace') as f:
            return bool(WANTS_ORDER.search(f.read()))
    except OSError:
        return False


def asks_for_arguments(arguments):
    """Whether the source asks for the argument-read pragmas."""
    path = source_of(arguments)
    if not path:
        return False
    try:
        with open(path, encoding='utf-8', errors='replace') as f:
            return bool(WANTS_ARGUMENT.search(f.read()))
    except OSError:
        return False


# -------------------------------------------------------------- the gdb side

def install(arguments=()):
    import gdb

    def u32(address):
        return int.from_bytes(gdb.selected_inferior().read_memory(address, 4), 'little')

    def cstring(address, limit=128):
        blob = bytes(gdb.selected_inferior().read_memory(address, limit))
        return blob.split(b'\0')[0].decode('latin1')

    verify = os.environ.get('STATEFIX_VERIFY') == '1'
    # In shim mode gdb's own stream is redirected away so the build log
    # stays the compiler's; anything worth saying goes to the real stderr.
    quiet = os.environ.get('STATEFIX_QUIET') == '1'
    say = (lambda text: sys.stderr.write(text)) if quiet else gdb.write
    counted = {'pragmas': 0, 'nodes': 0, 'arguments': 0, 'order': 0}
    cur = {'name': '?'}
    # What the source has asked for: a standing constant flag, one that covers
    # only the next constant, and the constants of the unit -- numbered from 1
    # in the order the annotation pass reaches them -- that read 1 rather than
    # the standing value. Retail's residue is not one value per unit but one
    # per constant, so the standing flag alone cannot say it.
    said = {'flag': None, 'next': None, 'ones': set(),
            'argument': None, 'argument_ones': set(), 'argument_free': set(),
            'order_zeros': set()}

    class Pragma(gdb.Breakpoint):
        def __init__(self):
            super().__init__('*' + hex(PRAGMA), internal=True)

        def stop(self):
            try:
                name = cstring(u32(TOKEN) + NAME_TEXT, 64)
            except gdb.MemoryError:
                return False
            if name not in PRAGMAS:
                return False
            try:
                # mwcc's own buffer ends a line with `\r`, whatever the file had.
                rest = re.split(r'[\r\n]', cstring(u32(LEXER), 96))[0]
            except gdb.MemoryError:
                rest = ''
            text = rest.split('/*')[0].split('//')[0].strip()
            combine = text.startswith('+')
            if name in ('constant_flag_ones', 'argument_flag_ones',
                        'argument_flag_free', 'order_flag_zeros'):
                where = {'constant_flag_ones': 'ones',
                         'argument_flag_ones': 'argument_ones',
                         'argument_flag_free': 'argument_free',
                         'order_flag_zeros': 'order_zeros'}[name]
                # A list, and repeatable: the lexer hands over 96 characters at
                # a time, so a long unit says its indices a line at a time.
                try:
                    said[where].update(
                        int(item, 0) for item in text.replace(',', ' ').split())
                except ValueError:
                    say('statefix: #pragma %s: cannot read %r\n' % (name, text))
                    return False
                counted['pragmas'] += 1
                if verify:
                    say('statefix: #pragma %s %s\n' % (name, text))
                gdb.execute('set $eip = %s' % hex(PRAGMA_IGNORE))
                return False
            try:
                value = int(text.lstrip('+').strip() or '0', 0)
            except ValueError:
                say('statefix: #pragma %s: cannot read %r\n' % (name, text))
                return False
            if name.startswith('helper_mask_'):
                address = HELPER_MASK[name[-3:]]
                if combine:
                    value |= u32(address)
                gdb.selected_inferior().write_memory(
                    address, value.to_bytes(4, 'little'))
            elif name == 'name_counter':
                if verify:
                    say('statefix: name counter %d -> %d\n'
                        % (u32(NAME_COUNTER), value))
                gdb.selected_inferior().write_memory(
                    NAME_COUNTER, value.to_bytes(4, 'little'))
            elif name == 'constant_flag':
                said['flag'] = value & 0xFF
            elif name == 'argument_flag':
                said['argument'] = value & 0xFF
            else:
                said['next'] = value & 0xFF
            counted['pragmas'] += 1
            if verify:
                say('statefix: #pragma %s %s\n' % (name, text))
            # The compiler's own exit for a name it does not know: skip to the
            # end of the line and return. Leaves the stack as its entry left it.
            gdb.execute('set $eip = %s' % hex(PRAGMA_IGNORE))
            return False

    Pragma()

    if asks_for_nodes(arguments):
        class Node(gdb.Breakpoint):
            def __init__(self):
                super().__init__('*' + hex(NODE_HOOK), internal=True)

            def stop(self):
                counted['nodes'] += 1
                if counted['nodes'] in said['ones']:
                    want = 1
                elif said['next'] is not None:
                    want, said['next'] = said['next'], None
                elif said['flag'] is not None:
                    want = said['flag']
                else:
                    want = None           # leave the compiler's own residue
                try:
                    node = int(gdb.parse_and_eval('$ebp')) & 0xffffffff
                    if verify:
                        was = bytes(gdb.selected_inferior().read_memory(
                            node + NODE_FIELD, 1))[0]
                        say('statefix: node %4d %-40s constant %02x -> %s\n'
                            % (counted['nodes'], cur['name'], was,
                               '--' if want is None else '%02x' % want))
                    if want is not None:
                        gdb.selected_inferior().write_memory(
                            node + NODE_FIELD, bytes([want]))
                except gdb.MemoryError:
                    pass
                return False

        Node()

    if asks_for_arguments(arguments):
        class Argument(gdb.Breakpoint):
            def __init__(self, address, register):
                self.register = register
                super().__init__('*' + hex(address), internal=True)

            def stop(self):
                counted['arguments'] += 1
                if counted['arguments'] in said['argument_ones']:
                    # naming a read explicitly always wins: a whole range can be
                    # freed for the constant flag and one read of it still said
                    want = 1
                elif counted['arguments'] in said['argument_free']:
                    # left for whatever the node itself carries, which is what
                    # `constant_flag` writes -- the one way the two axes meet
                    want = None
                elif said['argument'] is not None:
                    want = said['argument']
                else:
                    want = None
                try:
                    record = int(gdb.parse_and_eval(
                        '$' + self.register)) & 0xffffffff
                    if verify:
                        was = bytes(gdb.selected_inferior().read_memory(
                            record + NODE_FIELD, 1))[0]
                        kind = bytes(gdb.selected_inferior().read_memory(
                            record, 1))[0]
                        say('statefix: argument %4d %-30s kind %02x at %08x'
                            ' %02x -> %s\n'
                            % (counted['arguments'], cur['name'], kind, record,
                               was, '--' if want is None else '%02x' % want))
                    if want is not None:
                        gdb.selected_inferior().write_memory(
                            record + NODE_FIELD, bytes([want]))
                except gdb.MemoryError:
                    pass
                return False

        for address, register in ARGUMENT_READS:
            Argument(address, register)

    if asks_for_order(arguments):
        class Order(gdb.Breakpoint):
            def __init__(self):
                super().__init__('*' + hex(ORDER_SET), internal=True)

            def stop(self):
                counted['order'] += 1
                if counted['order'] in said['order_zeros']:
                    if verify:
                        say('statefix: order %4d %-30s dropped\n'
                            % (counted['order'], cur['name']))
                    gdb.execute('set $eip = %s' % hex(ORDER_NEXT))
                elif verify:
                    say('statefix: order %4d %-30s set\n'
                        % (counted['order'], cur['name']))
                return False

        Order()

    if verify:
        class Entry(gdb.Breakpoint):
            def __init__(self):
                super().__init__('*' + hex(CODEGEN), internal=True)

            def stop(self):
                try:
                    esp = int(gdb.parse_and_eval('$esp'))
                    record = u32(u32(esp + NAME_ARGUMENT) + NAME_RECORD)
                    cur['name'] = cstring(record + NAME_TEXT)
                except gdb.MemoryError:
                    pass
                return False

        Entry()

    gdb.execute('continue')
    if not quiet:
        say('statefix: %d pragmas, %d constant nodes, %d argument reads\n'
            % (counted['pragmas'], counted['nodes'], counted['arguments']))


# ----------------------------------------------------------------- the driver

def drive(arguments, executable=None, verify=False, quiet=False):
    """Run the compiler under gdb with the pragma handler installed."""
    commands = [
        'set pagination off', 'set confirm off',
        # A 32-bit guest inside a 64-bit inferior: stepping a breakpoint out of
        # line decodes the guest with the wrong rules and faults.
        'set displaced-stepping off',
        'file %s' % WIBO,
        # wibo maps the guest image only once it has loaded it, so the guest
        # breakpoints cannot be armed before this symbol is reached.
        'break wibo::Executable::resolveImports',
        # gdb's `run` re-splits its line, so an argument with a space in it --
        # `-pragma "divbyzerocheck on"` -- has to keep its quotes.
        'run %s %s' % (executable or COMPILER, ' '.join(
            '"%s"' % a if ' ' in a else a for a in arguments)),
        'python import sys; sys.path.insert(0, %r)' % os.path.dirname(
            os.path.abspath(__file__)),
        'python import statefix; statefix.install(%r)' % (list(arguments),),
    ]
    if quiet:
        # gdb's own chatter would otherwise reach the build log as if the
        # compiler had written it. The inferior keeps the real stdout.
        commands[2:2] = ['set logging file /dev/null',
                         'set logging redirect on',
                         'set logging enabled on']
    with tempfile.NamedTemporaryFile('w', suffix='.gdb', delete=False) as f:
        f.write('\n'.join(commands) + '\n')
        path = f.name
    environment = dict(os.environ, MWCIncludes=os.environ.get(
        'MWCIncludes', 'include/std;include/sce'))
    if verify:
        environment['STATEFIX_VERIFY'] = '1'
    if quiet:
        environment['STATEFIX_QUIET'] = '1'
    try:
        done = subprocess.run(['gdb', '--batch', '--nx', '--quiet', '--command', path],
                              cwd=REPO, env=environment)
    finally:
        os.unlink(path)
    return done.returncode


def main(argv):
    verify, shim = False, False
    arguments = []
    rest = list(argv)
    while rest:
        item = rest.pop(0)
        if item == '--verify':
            verify = True
        elif item == '--wibo':
            shim = True
        elif item == '--':
            arguments = rest
            break
        else:
            arguments.append(item)

    if shim:
        # wibo's own argument order: the guest executable, then its arguments.
        if not arguments:
            print('statefix: --wibo needs the guest executable', file=sys.stderr)
            return 2
        return drive(arguments[1:], executable=arguments[0], verify=verify,
                     quiet=True)
    return drive(arguments, verify=verify)


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
