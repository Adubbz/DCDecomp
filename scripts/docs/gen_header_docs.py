#!/usr/bin/env python3
"""Turn the headers' trailing retail annotations into Doxygen comments.

The skeleton headers carry what the retail symbol table knew about each
function as a trailing comment:

    void Initialize(); // @ 0x23F590 (0x70 bytes) -- mangled: Initialize__10CStockItemFv

Doxygen cannot see that, so this rewrites it as a documentation block using
the @mangled, @address and @size aliases defined in the Doxyfile:

    /**
     * @mangled Initialize__10CStockItemFv
     * @address 0x23F590
     * @size 0x70
     */
    void Initialize();

Idempotent: a declaration whose annotation has already moved into a block has
no trailer left to match, so re-running is a no-op. Run it after adding
declarations for newly identified functions.

    gen_header_docs.py [--check] [path ...]

--check reports what would change and exits non-zero, for CI.
"""

import argparse
import pathlib
import re
import sys

REPO = pathlib.Path(__file__).resolve().parents[2]
DEFAULT_ROOTS = ["include"]

RET_MARKER = "/* ?ret */ "

TRAILER = re.compile(
    r"^(?P<indent>\s*)"
    r"(?P<decl>.*?);"
    r"\s*//\s*@\s*(?P<addr>0x[0-9A-Fa-f]+)"
    r"\s*\((?P<size>0x[0-9A-Fa-f]+) bytes\)"
    r"\s*--\s*mangled:\s*(?P<sym>\S+)"
    r"(?P<note>.*)$"
)


def block(m):
    """The documentation block and declaration replacing one annotated line."""
    indent = m.group("indent")
    decl = m.group("decl")

    # `/* ?ret */` marked a return type the symbol table did not encode. It has
    # to leave the declaration line: a comment between a block and the thing it
    # documents breaks the association, and doxygen silently drops the block.
    unknown_ret = decl.startswith(RET_MARKER)
    if unknown_ret:
        decl = decl[len(RET_MARKER):]

    out = ["%s/**" % indent,
           "%s * @mangled %s" % (indent, m.group("sym")),
           "%s * @address %s" % (indent, m.group("addr")),
           "%s * @size %s" % (indent, m.group("size"))]
    if unknown_ret:
        out.append("%s * @unknownret" % indent)

    # The disassembler's disambiguating suffixes are the only trailing notes
    # in the tree, and they say something real about the name above.
    note = m.group("note").strip()
    if note:
        out.append("%s * @note %s" % (indent, note.lstrip("/ ")))

    out.append("%s */" % indent)
    out.append("%s%s;" % (indent, decl))
    return out


def convert(text):
    out = []
    changed = 0
    for line in text.splitlines():
        m = TRAILER.match(line)
        if m:
            # Blocks run together unreadably otherwise; not after an opening
            # brace or an access specifier, where a blank line reads as a gap.
            if out and out[-1].strip() and not out[-1].rstrip().endswith(("{", ":")):
                out.append("")
            out.extend(block(m))
            changed += 1
        else:
            out.append(line)
    return "\n".join(out) + "\n", changed


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("paths", nargs="*", default=DEFAULT_ROOTS,
                    help="headers or directories to rewrite (default: include)")
    ap.add_argument("--check", action="store_true",
                    help="report what would change, rewrite nothing")
    args = ap.parse_args()

    headers = []
    for raw in args.paths:
        path = REPO / raw
        headers.extend(sorted(path.rglob("*.hpp")) if path.is_dir() else [path])

    total = 0
    touched = []
    for header in headers:
        text = header.read_text(encoding="utf-8")
        new, changed = convert(text)
        if not changed:
            continue
        total += changed
        touched.append(header)
        if not args.check:
            header.write_text(new, encoding="utf-8")

    verb = "would document" if args.check else "documented"
    print("doxygen: %s %d declarations across %d headers"
          % (verb, total, len(touched)))
    if args.check and touched:
        for header in touched:
            print("  %s" % header.relative_to(REPO))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
