#!/usr/bin/env python3
"""Look up a retail symbol in the reference index.

disassemble.py writes ``ref/asm/objects/<section>.index``: one tab-separated
row per source the build can link, carrying the retail address and size of
what that source contains. That makes it the project's symbol table for the
retail side. It is preferred over the link map for two reasons: it covers
every function, including the ones already superseded by a compiled ``.cpp``,
and it names them the way the compiler does (mangled) rather than the way mwld
prints them (demangled, with spaces in the signature).

    python3 scripts/diff/ref_index.py <symbol> [section]

prints ``<section> <source> <vram> <size> <image>`` with the numbers in hex,
and exits non-zero with a message on stderr if the symbol is not indexed.
With no section it searches all of them, which is how a caller can find out
whether a symbol belongs to an overlay.
"""
import bisect
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
INDEX_DIR = os.path.join(REPO, 'ref', 'asm', 'objects')

# The main executable first: it is what most lookups are for, and the overlays
# reuse its address space, so a plain search order would otherwise be ambiguous.
SECTIONS = ('main', 'title', 'dun')


class Entry:
    """One indexed symbol: where retail keeps it and which dump holds it."""

    def __init__(self, section, source, symbol, vram, size):
        self.section = section
        self.source = source
        self.symbol = symbol
        self.vram = vram
        self.size = size

    def __repr__(self):
        return 'Entry(%s, %s, %#x, %#x)' % (self.section, self.symbol,
                                            self.vram, self.size)

    @property
    def is_overlay(self):
        return self.section != 'main'

    @property
    def is_function(self):
        """Whether this row is one function or a whole data section.

        disassemble.py splits text a function at a time into ref/asm/split/,
        and dumps every other section whole into ref/asm/sections/ -- so the
        path says which of the two a row is, and nothing else has to guess.
        """
        return '/split/' in self.source

    @property
    def end(self):
        return self.vram + self.size

    def contains(self, addr):
        return self.vram <= addr < self.end

    def offset_of(self, addr):
        return addr - self.vram

    @property
    def image_offset(self):
        """Where the symbol sits in the file that gets diffed.

        An overlay ships as a raw image whose byte 0 is the MWo3 header, and
        the header loads at the overlay origin -- so an offset into the file is
        just the address biased by that origin. main ships as an ELF and is
        diffed by symbol, so there its address is the answer as it stands.
        """
        return self.vram - overlay_origin() if self.is_overlay else self.vram


def overlay_origin():
    """Where the overlays load, read from the linker script generator.

    Kept out of this file deliberately: cmake/Overlays.cmake is where the
    address is decided, and a second copy of it here would be one more thing
    to keep in step.
    """
    path = os.path.join(REPO, 'cmake', 'Overlays.cmake')
    with open(path, encoding='utf-8') as f:
        match = re.search(r'set\(OVERLAY_ORIGIN\s+(0x[0-9A-Fa-f]+)\)', f.read())
    if not match:
        raise SystemExit('ref_index: no OVERLAY_ORIGIN in %s' % path)
    return int(match.group(1), 16)


def index_path(section):
    return os.path.join(INDEX_DIR, '%s.index' % section)


_CACHE = {}
_STARTS = {}   # section -> the cached rows' start addresses, for bisect


def entries(section):
    """Every row of one section's index, in address order.

    Cached: the callers that walk a whole binary ask for this per address, and
    main alone is four thousand rows.
    """
    if section in _CACHE:
        return _CACHE[section]

    path = index_path(section)
    if not os.path.exists(path):
        raise SystemExit(
            'ref_index: %s is missing; run `cmake --build build --target setup` '
            'to disassemble the retail binary first.' % os.path.relpath(path, REPO))

    out = []
    with open(path, encoding='utf-8') as f:
        for line in f:
            if line.startswith('#'):
                continue
            fields = line.rstrip('\n').split('\t')
            # `sym` rows are the symbol -> address map folded into the same
            # file; only `src` rows name something the link can take.
            if len(fields) != 5 or fields[0] != 'src':
                continue
            _kind, source, symbol, vram, size = fields
            out.append(Entry(section, source, symbol, int(vram, 16), int(size, 16)))

    out.sort(key=lambda entry: entry.vram)
    _CACHE[section] = out
    return out


def lookup(symbol, section=None):
    """Find `symbol`, in `section` if given or in all of them otherwise."""
    for name in (section,) if section else SECTIONS:
        for entry in entries(name):
            if entry.symbol == symbol:
                return entry
    return None


def covering(section, addr):
    """The indexed row whose span contains `addr`, or None if there is a hole.

    This is what turns a raw byte offset in the image back into "which
    function", and it is exact rather than nearest-preceding: the rows carry
    their own sizes, so an address between two of them reports as unattributed
    instead of being blamed on whatever came before it.
    """
    rows = entries(section)
    if section not in _STARTS:
        _STARTS[section] = [row.vram for row in rows]
    at = bisect.bisect_right(_STARTS[section], addr) - 1
    if at < 0:
        return None
    row = rows[at]
    return row if row.contains(addr) else None


def main():
    args = sys.argv[1:]
    if not 1 <= len(args) <= 2:
        raise SystemExit(__doc__)
    symbol, section = args[0], args[1] if len(args) == 2 else None
    if section and section not in SECTIONS:
        raise SystemExit('ref_index: unknown section %r; expected one of %s'
                         % (section, ', '.join(SECTIONS)))

    entry = lookup(symbol, section)
    if not entry:
        where = 'the %s index' % section if section else 'any reference index'
        raise SystemExit('ref_index: %s is not in %s' % (symbol, where))

    print('%s %s %#x %#x %#x' % (entry.section, entry.source, entry.vram,
                                 entry.size, entry.image_offset))


if __name__ == '__main__':
    main()
