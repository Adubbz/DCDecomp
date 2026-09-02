"""Every unmatched function, sorted by how it differs from retail's."""
import re, struct, sys, os, collections

IMAGES = {'main': ('build/SCUS_971.11', 'rom/extracted/iso/SCUS_971.11', 'config/main.symbols.txt', None),
          'title': ('build/TITLE.BIN', 'rom/extracted/iso/TITLE.BIN', 'config/title.symbols.txt', 0x01DABD00),
          'dun': ('build/DUN.BIN', 'rom/extracted/iso/DUN.BIN', 'config/dun.symbols.txt', 0x01DABD00)}

def elf_text(path):
    d = open(path, 'rb').read()
    if d[:4] != b'\x7fELF':
        return None, d
    e_shoff, = struct.unpack_from('<I', d, 0x20)
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from('<HHH', d, 0x2E)
    secs = [struct.unpack_from('<10I', d, e_shoff + i * e_shentsize) for i in range(e_shnum)]
    out = []
    for name, stype, flags, addr, off, size, *_ in secs:
        if stype == 1 and addr:
            out.append((addr, off, size))
    return out, d

def reader(image):
    ours, theirs, cfg, base = IMAGES[image]
    if base is None:
        secs_a, da = elf_text(ours)
        secs_b, db = elf_text(theirs)
        def get(buf, secs, addr, size):
            for a, o, s in secs:
                if a <= addr and addr + size <= a + s:
                    return buf[o + addr - a:o + addr - a + size]
            return None
        return (lambda addr, size: get(da, secs_a, addr, size),
                lambda addr, size: get(db, secs_b, addr, size), cfg)
    da, db = open(ours, 'rb').read(), open(theirs, 'rb').read()
    return (lambda addr, size: da[addr - base:addr - base + size],
            lambda addr, size: db[addr - base:addr - base + size], cfg)

def classify(a, b):
    """(kind, count) for two equal-length function bodies."""
    n = len(a) // 4
    reg = imm = other = 0
    for i in range(n):
        x, = struct.unpack_from('<I', a, i * 4)
        y, = struct.unpack_from('<I', b, i * 4)
        if x == y:
            continue
        if (x >> 26) != (y >> 26):
            other += 1
        elif (x & 0xFFFF) == (y & 0xFFFF) and (x >> 16) != (y >> 16):
            reg += 1
        elif (x >> 16) == (y >> 16):
            imm += 1
        else:
            other += 1
    return reg, imm, other

rows = []
for image in sys.argv[1:] or list(IMAGES):
    get_a, get_b, cfg = reader(image)
    for line in open(cfg):
        m = re.match(r'(\S+) = 0x([0-9a-fA-F]+); // type:func size:0x([0-9a-fA-F]+)', line)
        if not m:
            continue
        addr, size = int(m.group(2), 16), int(m.group(3), 16)
        a, b = get_a(addr, size), get_b(addr, size)
        if not a or not b or len(a) != size or len(b) != size:
            continue
        if a == b:
            continue
        reg, imm, other = classify(a, b)
        rows.append((reg + imm + other, reg, imm, other, size // 4, image, m.group(1)))

rows.sort()
kinds = collections.Counter()
for tot, reg, imm, other, n, image, name in rows:
    kinds['registers only' if tot == reg else
          'fields only' if tot == imm else
          'registers and fields' if not other else 'code'] += 1
print('%d unmatched functions' % len(rows))
for k, v in kinds.most_common():
    print('  %-22s %d' % (k, v))
print('\nclosest:')
for tot, reg, imm, other, n, image, name in rows:
    print('  %3d/%4d  r%-3d f%-3d c%-3d  %-6s %s'
          % (tot, n, reg, imm, other, image, name))
