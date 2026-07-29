#!/usr/bin/env python3
"""Generate the declaration context m2c decompiles against.

    m2ctx.py                     whole project -> ctx.c at the repo root
    m2ctx.py -o build/ctx.c      ...somewhere else; this is what the build runs
    m2ctx.py src/savedata.cpp    one translation unit instead of the project

Whole-project mode writes ctx.cpp, every header folded into one C++ file, and
ctx.c, that same content re-emitted as C by clang. m2c parses context as C;
anything that compiles it -- decomp.me, with mwcc and -lang=c++ -- wants the
C++ one.

Two things in the headers stop ctx.cpp compiling, both handled here rather than
by editing them: common.h's STATIC_ASSERT pastes `__COUNTER__` instead of
expanding it, so every use declares the same typedef name, and CRunScript is
defined twice (opaquely in dataalloc.hpp with the real layout, as a bare
constructor in runscript.hpp).

The conversion keeps what C can express -- record layouts, enums, typedefs,
free functions -- and drops member functions, access specifiers and templates,
which carry no layout m2c can use. Emission order matters: enums first (C has
no incomplete enum type), then forward typedefs so bare C++ names resolve, then
the remaining typedefs, the records that use them, and finally functions.
"""

import argparse
import os
import re
import sys

import clang.cindex as ci

script_dir = os.path.dirname(os.path.realpath(__file__))
root_dir = os.path.abspath(os.path.join(script_dir, "..", ".."))
include_dir = os.path.join(root_dir, "include")

# Project-specific. -ffreestanding keeps the host's system headers out of a
# context describing a PlayStation 2 binary; M2CTX is the escape hatch for
# anything a header needs to say differently here.
CPP_FLAGS = [
    "-Iinclude",
    "-Isrc",
    "-D_LANGUAGE_C",
    "-DF3DEX_GBI_2",
    "-D_MIPS_SZLONG=32",
    "-DSCRIPT(...)={}",
    "-D__attribute__(...)=",
    "-D__asm__(...)=",
    "-ffreestanding",
    "-DM2CTX",
]

K = ci.CursorKind
T = ci.TypeKind

REF = (T.LVALUEREFERENCE, T.RVALUEREFERENCE)
ARRAY = (T.CONSTANTARRAY, T.INCOMPLETEARRAY, T.VARIABLEARRAY)
FUNC = (T.FUNCTIONPROTO, T.FUNCTIONNOPROTO)

INCLUDE = re.compile(r'^\s*#\s*include\s+"([^"]+)"')
STATIC_ASSERT_DEF = re.compile(r'^\s*#\s*define\s+STATIC_ASSERT\b.*$', re.MULTILINE)
REDEFINED = re.compile(r"redefinition of '([^']+)'")


#
# Amalgamation: the headers as one C++ file
#

def amalgamate(headers_dir):
    """Every header, in one file, each inlined once."""
    seen = set()
    out = []

    def expand(path):
        real = os.path.realpath(path)
        if real in seen:
            return
        seen.add(real)

        with open(path, encoding="utf-8") as f:
            for line in f:
                m = INCLUDE.match(line)
                if m:
                    nested = os.path.join(headers_dir, m.group(1))
                    if os.path.exists(nested):
                        expand(nested)
                    else:
                        out.append("/* unresolved: %s */\n" % line.strip())
                    continue
                if line.strip() == "#pragma once":
                    continue
                out.append(line)

    for name in sorted(os.listdir(headers_dir)):
        if name.endswith((".hpp", ".h")):
            expand(os.path.join(headers_dir, name))

    return STATIC_ASSERT_DEF.sub("#define STATIC_ASSERT(expr) /* see m2ctx.py */",
                                 "".join(out))


def redefined_names(text, flags, filename="ctx.cpp"):
    """Records defined more than once, from clang's diagnostics rather than its
    AST -- it recovers by keeping the first, so the rest are never cursors."""
    tu = ci.Index.create().parse(
        filename, args=list(flags) + ["-x", "c++"],
        unsaved_files=[(filename, text)])

    names = []
    for d in tu.diagnostics:
        m = REDEFINED.search(d.spelling)
        if m and m.group(1) not in names:
            names.append(m.group(1))
    return names


def definition_spans(text, name):
    """(start, end) of each `class/struct/union <name> { ... };` in `text`.
    Comments and strings are skipped so their braces cannot end one early."""
    opener = re.compile(r'\b(?:class|struct|union)\s+%s\b\s*(?::[^{;]*)?\{'
                        % re.escape(name))
    spans = []

    for m in opener.finditer(text):
        i = m.end()            # just past the opening brace
        depth = 1
        while i < len(text) and depth:
            c = text[i]
            if c == '/' and text[i:i + 2] == '//':
                i = text.find('\n', i)
                if i < 0:
                    break
                continue
            if c == '/' and text[i:i + 2] == '/*':
                i = text.find('*/', i)
                if i < 0:
                    break
                i += 2
                continue
            if c in '"\'':
                quote, i = c, i + 1
                while i < len(text) and text[i] != quote:
                    i += 2 if text[i] == '\\' else 1
            elif c == '{':
                depth += 1
            elif c == '}':
                depth -= 1
            i += 1
        while i < len(text) and text[i] in ' \t;':
            i += 1
        spans.append((m.start(), i))

    return spans


def duplicate_extents(text, flags):
    """Byte ranges of every record definition after the first of its name."""
    drop = []
    for name in redefined_names(text, flags):
        drop += definition_spans(text, name)[1:]
    return sorted(drop)


def elide(text, extents):
    """Remove those ranges, latest first so earlier offsets stay valid."""
    for start, end in reversed(extents):
        text = (text[:start]
                + "/* definition elided: redefined elsewhere */"
                + text[end:])
    return text


def build_cpp(headers_dir, flags):
    text = amalgamate(headers_dir)
    return elide(text, duplicate_extents(text, flags))


#
# Conversion: that C++ as C declarations
#

def declarator(t, name=""):
    """A C declaration of `name` with type `t`, built inside-out the way C's
    declarator syntax nests, so function pointers and arrays come out right."""
    k = t.kind

    if k == T.ELABORATED:
        return declarator(t.get_named_type(), name)

    if k == T.POINTER:
        return declarator(t.get_pointee(), "*" + name)

    if k in REF:
        # A reference is a pointer in the ABI, which is the level m2c works at,
        # and C has no other way to spell one.
        return declarator(t.get_pointee(), "*" + name)

    if k in ARRAY:
        if name.startswith("*"):
            name = "(" + name + ")"
        n = t.element_count if k == T.CONSTANTARRAY else ""
        return declarator(t.element_type, "%s[%s]" % (name, n))

    if k in FUNC:
        if name.startswith("*"):
            name = "(" + name + ")"
        args = [declarator(a) for a in t.argument_types()]
        if k == T.FUNCTIONPROTO and t.is_function_variadic():
            args.append("...")
        return declarator(t.get_result(),
                          "%s(%s)" % (name, ", ".join(args) or "void"))

    # clang spells C++ record types bare ("CFoo"); the forward typedefs below
    # are what make that legal C, so any remaining tag keyword is redundant.
    base = t.spelling
    for tag in ("class ", "struct ", "union ", "enum "):
        base = base.replace(tag, "")
    return (base + " " + name).rstrip()


def record_fields(cur):
    out = []
    for f in cur.get_children():
        if f.kind != K.FIELD_DECL:
            continue
        if f.is_bitfield():
            out.append("    %s : %d;" % (declarator(f.type, f.spelling),
                                         f.get_bitfield_width()))
        else:
            out.append("    %s;" % declarator(f.type, f.spelling))
    return out


def usable(cur, root):
    """Named, declared in this project, and not one of the artefacts below."""
    if not cur.spelling or "(" in cur.spelling:
        # Anonymous records: clang spells these "(unnamed struct at ...)".
        return False

    loc = cur.location.file
    # clang reports each path as it was written, which under `-Iinclude` is
    # relative to the working directory -- resolve before comparing. Builtins
    # have no file at all, and are what this mainly filters out.
    if loc is None or not os.path.abspath(str(loc)).startswith(root):
        return False

    # Belt and braces: the amalgamation already defines STATIC_ASSERT away, but
    # a single .cpp converted directly still goes through common.h's version.
    return not cur.spelling.startswith("_static_assert")


def convert(tu, root):
    enums, fwd, typedefs, records, rest = [], [], [], [], []
    tags = []
    defined = set()

    for cur in tu.cursor.get_children():
        if not usable(cur, root):
            continue

        if cur.kind == K.ENUM_DECL and cur.is_definition():
            if cur.spelling in defined:
                continue
            defined.add(cur.spelling)
            vals = ["    %s = %d," % (c.spelling, c.enum_value)
                    for c in cur.get_children() if c.kind == K.ENUM_CONSTANT_DECL]
            enums.append("enum %s {\n%s\n};" % (cur.spelling, "\n".join(vals)))
            enums.append("typedef enum %s %s;" % (cur.spelling, cur.spelling))

        elif cur.kind in (K.STRUCT_DECL, K.CLASS_DECL, K.UNION_DECL):
            tag = "union" if cur.kind == K.UNION_DECL else "struct"
            if cur.spelling not in tags:
                tags.append(cur.spelling)
                fwd.append("typedef %s %s %s;" % (tag, cur.spelling, cur.spelling))
            # First definition wins, matching the elision above.
            if cur.is_definition() and cur.spelling not in defined:
                defined.add(cur.spelling)
                body = record_fields(cur)
                records.append("%s %s {\n%s\n};" % (
                    tag, cur.spelling, "\n".join(body) or "    char _empty;"))

        elif cur.kind == K.TYPEDEF_DECL:
            under = cur.underlying_typedef_type
            if under.get_declaration().spelling == cur.spelling:
                continue        # `typedef struct X X;` -- already emitted above
            typedefs.append("typedef %s;" % declarator(under, cur.spelling))

        elif cur.kind == K.FUNCTION_DECL:
            rest.append("%s;" % declarator(cur.type, cur.spelling))

        elif cur.kind == K.VAR_DECL:
            rest.append("extern %s;" % declarator(cur.type, cur.spelling))

    return "\n".join(enums + fwd + typedefs + records + rest) + "\n"


def translate(source, flags, root=None):
    """Parse `source` as C++ with `flags`, and return it as C declarations."""
    root = root or os.getcwd()
    tu = ci.Index.create().parse(source, args=list(flags) + ["-x", "c++"])

    # Quiet by default: a whole-project context is not a translation unit any
    # build produces, and provokes errors that are expected there and handled
    # above. Printing them on every build would be noise. Set M2CTX_VERBOSE=1
    # to see what clang actually said.
    if os.environ.get("M2CTX_VERBOSE"):
        for d in tu.diagnostics:
            if d.severity >= ci.Diagnostic.Error:
                print("m2ctx: %s" % d.spelling, file=sys.stderr)

    return convert(tu, root)


#
# Entry point
#

def import_project(cpp_path):
    """Context covering the whole project rather than one translation unit, so
    it works for any function. The C++ amalgamation is written to `cpp_path`
    and converted from there, so the two files cannot diverge."""
    text = build_cpp(include_dir, CPP_FLAGS)

    os.makedirs(os.path.dirname(cpp_path) or ".", exist_ok=True)
    with open(cpp_path, "w", encoding="UTF-8") as f:
        f.write(text)

    return translate(os.path.relpath(cpp_path, root_dir), CPP_FLAGS, root_dir)


def main():
    parser = argparse.ArgumentParser(
        description="Create a context file which can be used for m2c")
    parser.add_argument(
        "c_file", nargs="?",
        help="""File from which to create context. Omit to cover the whole
                project, which is what the build generates.""")
    parser.add_argument(
        "-o", "--output",
        help="""Where to write the context (default: ctx.c at the repo root,
                which is where the m2c workflow expects it by hand).""")
    args = parser.parse_args()

    os.chdir(root_dir)

    out_path = args.output or "ctx.c"
    if not os.path.isabs(out_path):
        out_path = os.path.join(root_dir, out_path)

    if args.c_file:
        # One TU: there is no amalgamation to write, the file itself is it.
        source = os.path.relpath(os.path.abspath(args.c_file), root_dir)
        output = translate(source, CPP_FLAGS, root_dir)
    else:
        cpp_path = os.path.splitext(out_path)[0] + ".cpp"
        output = import_project(cpp_path)

    os.makedirs(os.path.dirname(out_path), exist_ok=True)

    with open(out_path, "w", encoding="UTF-8") as f:
        f.write(output)


if __name__ == "__main__":
    main()
