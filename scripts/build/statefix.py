#!/usr/bin/env python3
"""Apply reproducible compiler-state and expression-node overrides to MWCC.

    statefix.py [--verify] -- <compiler arguments>   compile under the model
    statefix.py --wibo -- <exe> <arguments>          stand in for wibo

MWCC carries state from one source file of an invocation to the next and never
resets it, and it reads memory nothing ever wrote (re/ai/compiler/leaked_state.md).
Retail compiled every unit of a program in one invocation; this build compiles
one unit per invocation, so that state is empty where retail's was not.

Expression constants are selected from
`config/expression_node_overrides.json`. Other compiler state that cannot yet
be identified structurally remains stated in source:

    #pragma helper_mask_gpr 0x30      set the integer helper-argument mask
    #pragma helper_mask_fpr 0x1000    set the float one
    #pragma helper_mask_gpr +0x20     or a bit into it
    #pragma argument_flag 0           what every float argument of a call reads
    #pragma argument_flag_ones 4,9    which of those reads 1 instead
    #pragma argument_flag_free 7,8    which of them to leave to the node's own byte
    #pragma order_flag_zeros 3,7      which of the ordering pass's writes to drop
    #pragma name_counter 910          where the invented-name counter starts

The compiler has no such pragmas. This runs it under gdb, stands at its pragma
handler, acts on these spellings and sends them to its own "unknown
pragma" exit, so the compiler never sees them; mwcc ignores an unknown pragma
silently, so a source carrying them still compiles without this script -- it
just does not get the state.

`--wibo` makes it a drop-in for wibo itself -- it takes the guest executable as
its first argument and keeps quiet otherwise -- which is how the build reaches
it: `scripts/build/mwccgap.sh` hands mwccgap `--wibo-path` pointing at
`scripts/build/statefix-wibo.sh`.

Compiling one unit this way and diffing the object against a plain compile is
how to measure the model's effect.
"""

import os
import re
import sys
import tempfile
import subprocess
import json
import struct

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
COMPILER = os.path.join(REPO, 'tools', 'compilers', 'mw', '2.3.3', 'mwccmips.exe')
EXPRESSION_NODE_OVERRIDES = os.environ.get(
    'EXPRESSION_NODE_OVERRIDES',
    os.path.join(REPO, 'config', 'expression_node_overrides.json'))
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
# it tests whether the raw representation has a simple bit pattern and, when
# that test succeeds,
# returns at NODE_HOOK without writing -- so the node keeps whatever its arena
# slot last held. Call lowering reads it to decide which argument to
# materialise first.
NODE_HOOK, NODE_FIELD = 0x004B290D, 5
CURRENT_FILE_NAME_LENGTH = 0x00557B28
CURRENT_FILE_NAME = 0x00557B29
CURRENT_FUNCTION = 0x00555EC0
OBJECT_PLAIN_NAME = 0x08
OBJECT_LINK_NAME = 0x2C
HASH_NAME_TEXT = 0x0A
NODE_TYPE = 0x0A
NODE_VALUE = 0x14
TYPE_SIZE = 0x02

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
# constant is filed under, which retail's linker kept as `@<n>`. 0x0042E540
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
           'argument_flag', 'argument_flag_ones', 'argument_flag_free',
           'order_flag_zeros', 'name_counter')

# The remaining source-controlled hooks. Expression constants are selected by
# the external exact-identity config instead of by source pragmas.
WANTS_ARGUMENT = re.compile(r'^\s*#\s*pragma\s+argument_flag', re.M)
WANTS_ORDER = re.compile(r'^\s*#\s*pragma\s+order_flag', re.M)


def load_expression_node_overrides(path=EXPRESSION_NODE_OVERRIDES):
    """Load exact floating-constant identities and their replacement bytes."""
    try:
        with open(path, encoding='utf-8') as f:
            document = json.load(f)
    except FileNotFoundError:
        return {}
    except (OSError, ValueError) as error:
        raise SystemExit('statefix: cannot read %s: %s' % (path, error))

    if (document.get('version') != 2 or
            not isinstance(document.get('translation_units'), dict)):
        raise SystemExit('statefix: %s has an unsupported format' % path)

    overrides = {}
    widths = {'binary32': 8, 'binary64': 16}
    numbered = []
    for unit, functions in document['translation_units'].items():
        if not isinstance(unit, str) or not isinstance(functions, dict):
            raise SystemExit('statefix: %s has an invalid translation-unit group'
                             % path)
        for function, nodes in functions.items():
            if not isinstance(function, str) or not isinstance(nodes, list):
                raise SystemExit('statefix: %s: invalid function group %s/%s'
                                 % (path, unit, function))
            numbered.extend((unit, function, row) for row in nodes)
    for number, (unit, function, row) in enumerate(numbered, 1):
        try:
            value_type = row['type']
            bits_text = row['value_bits']
            bits = int(bits_text, 16)
            key = (unit, function, value_type, bits, int(row['ordinal']))
            flag = int(row['evaluate_first'])
        except (KeyError, TypeError, ValueError) as error:
            raise SystemExit('statefix: %s: invalid node %d: %s'
                             % (path, number, error))
        if value_type not in widths or not isinstance(bits_text, str):
            raise SystemExit('statefix: %s: invalid type/bits in node %d'
                             % (path, number))
        if bits < 0 or bits >= (1 << (widths[value_type] * 4)):
            raise SystemExit('statefix: %s: value_bits out of range in node %d'
                             % (path, number))
        if key[4] < 1 or flag not in (0, 1):
            raise SystemExit('statefix: %s: invalid ordinal/flag in node %d'
                             % (path, number))
        if key in overrides:
            raise SystemExit('statefix: %s: duplicate node identity at node %d'
                             % (path, number))
        overrides[key] = flag
    return overrides


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

    def current_translation_unit():
        length = bytes(gdb.selected_inferior().read_memory(
            CURRENT_FILE_NAME_LENGTH, 1))[0]
        text = bytes(gdb.selected_inferior().read_memory(
            CURRENT_FILE_NAME, length)).decode('latin1')
        return os.path.basename(text.replace('\\', '/'))

    def current_function_name():
        obj = u32(CURRENT_FUNCTION)
        if not obj:
            return '?'
        name = u32(obj + OBJECT_LINK_NAME)
        if not name:
            name = u32(obj + OBJECT_PLAIN_NAME)
        return cstring(name + HASH_NAME_TEXT) if name else '?'

    def constant_identity(node):
        """Return (type name, exact normalized bits) from the live node."""
        type_record = u32(node + NODE_TYPE)
        size = u32(type_record + TYPE_SIZE)
        stored = bytes(gdb.selected_inferior().read_memory(node + NODE_VALUE, 8))
        if size == 4:
            value = struct.unpack('<d', stored)[0]
            try:
                packed = struct.pack('<f', value)
            except OverflowError:
                packed = struct.pack('<f', float('-inf') if value < 0 else float('inf'))
            return 'binary32', int.from_bytes(packed, 'little')
        if size == 8:
            return 'binary64', int.from_bytes(stored, 'little')
        return 'size-%d' % size, int.from_bytes(stored, 'little')

    verify = os.environ.get('STATEFIX_VERIFY') == '1'
    # In shim mode gdb's own stream is redirected away so the build log
    # stays the compiler's; anything worth saying goes to the real stderr.
    quiet = os.environ.get('STATEFIX_QUIET') == '1'
    say = (lambda text: sys.stderr.write(text)) if quiet else gdb.write
    counted = {'pragmas': 0, 'nodes': 0, 'arguments': 0, 'order': 0}
    cur = {'name': '?'}
    expression_overrides = load_expression_node_overrides()
    source_hint = source_of(arguments)
    source_hint = os.path.basename(source_hint) if source_hint else None
    override_units = {key[0] for key in expression_overrides}
    node_occurrences = {}
    # Argument/order pragmas remain source-controlled. Node-index settings are
    # ephemeral search instrumentation; persistent node choices use exact keys.
    said = {'argument': None, 'argument_ones': set(), 'argument_free': set(),
            'order_zeros': set()}
    node_default_text = os.environ.get('STATEFIX_NODE_DEFAULT')
    node_default = (int(node_default_text, 0) & 0xff
                    if node_default_text is not None else None)
    node_ones = {int(item, 0) for item in
                 os.environ.get('STATEFIX_NODE_ONES', '').replace(',', ' ').split()}
    node_audit = os.environ.get('STATEFIX_NODE_AUDIT') == '1'

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
            if name in ('argument_flag_ones', 'argument_flag_free',
                        'order_flag_zeros'):
                where = {'argument_flag_ones': 'argument_ones',
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
            elif name == 'argument_flag':
                said['argument'] = value & 0xFF
            counted['pragmas'] += 1
            if verify:
                say('statefix: #pragma %s %s\n' % (name, text))
            # The compiler's own exit for a name it does not know: skip to the
            # end of the line and return. Leaves the stack as its entry left it.
            gdb.execute('set $eip = %s' % hex(PRAGMA_IGNORE))
            return False

    Pragma()

    if node_audit or node_default is not None or node_ones or source_hint in override_units:
        class Node(gdb.Breakpoint):
            def __init__(self):
                super().__init__('*' + hex(NODE_HOOK), internal=True)

            def stop(self):
                counted['nodes'] += 1
                try:
                    node = int(gdb.parse_and_eval('$ebp')) & 0xffffffff
                    memory_unit = current_translation_unit()
                    memory_function = current_function_name()
                    function = memory_function
                    value_type, bits = constant_identity(node)
                    # mwccgap's second compile uses a temporary filename. The
                    # live FSSpec remains authoritative for ordinary compiles;
                    # STATEFIX_SOURCE supplies the original identity only for
                    # a recognized temporary compilation.
                    unit = memory_unit
                    if (source_hint and memory_unit != source_hint and
                            (memory_unit.startswith('tmp') or
                             memory_unit.startswith('.tmp'))):
                        unit = source_hint
                        if memory_function.startswith('__sinit_'):
                            function = '__sinit_' + source_hint
                    base = (unit, function, value_type, bits)
                    ordinal = node_occurrences.get(base, 0) + 1
                    node_occurrences[base] = ordinal
                    identity = base + (ordinal,)
                except (gdb.MemoryError, struct.error):
                    node = None
                    memory_unit = unit = function = '?'
                    memory_function = '?'
                    value_type, bits, ordinal = '?', 0, 0
                    identity = None

                if counted['nodes'] in node_ones:
                    want = 1
                elif node_default is not None:
                    want = node_default
                elif identity in expression_overrides:
                    want = expression_overrides[identity]
                else:
                    want = None           # leave the compiler's own residue
                try:
                    if node is None:
                        return False
                    if verify:
                        was = bytes(gdb.selected_inferior().read_memory(
                            node + NODE_FIELD, 1))[0]
                        say('statefix: node %4d %-40s constant %02x -> %s\n'
                            % (counted['nodes'], cur['name'], was,
                               '--' if want is None else '%02x' % want))
                        record = {
                            'translation_unit': unit,
                            'memory_translation_unit': memory_unit,
                            'function': function,
                            'memory_function': memory_function,
                            'type': value_type,
                            'value_bits': ('0x%08x' if value_type == 'binary32'
                                           else '0x%016x') % bits,
                            'ordinal': ordinal,
                            'evaluate_first': was,
                            'override': want,
                        }
                        say('statefix: expression-node %s\n'
                            % json.dumps(record, sort_keys=True,
                                         separators=(',', ':')))
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
                    # Naming a read explicitly always wins: a whole range can be
                    # freed for node overrides and one read of it still said
                    want = 1
                elif counted['arguments'] in said['argument_free']:
                    # left for whatever the node itself carries, which is what
                    # An expression-node override is where the two axes meet.
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
