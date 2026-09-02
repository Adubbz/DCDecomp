"""One function, retail's beside ours, in any image."""
import subprocess, sys, re, os, struct
prefix = os.environ.get('MIPS_TOOL_PREFIX', 'mips-ps2-decompals-')
IMAGES = {'main': ('build/SCUS_971.11', 'rom/extracted/iso/SCUS_971.11', 'config/main.symbols.txt', None),
          'title': ('build/TITLE.BIN', 'rom/extracted/iso/TITLE.BIN', 'config/title.symbols.txt', 0x01DABD00),
          'dun': ('build/DUN.BIN', 'rom/extracted/iso/DUN.BIN', 'config/dun.symbols.txt', 0x01DABD00)}
image, want = sys.argv[1], sys.argv[2]
ours, theirs, cfg, base = IMAGES[image]
names = {}
for f in ('config/title.symbols.txt', 'config/main.symbols.txt', 'config/dun.symbols.txt'):
    if os.path.exists(f):
        for line in open(f):
            m = re.match(r'(\S+) = 0x([0-9a-fA-F]+);', line)
            if m:
                names.setdefault(int(m.group(2), 16), m.group(1))
addr = size = None
for line in open(cfg):
    m = re.match(re.escape(want) + r' = 0x([0-9a-fA-F]+); // type:func size:0x([0-9a-fA-F]+)', line)
    if m:
        addr, size = int(m.group(1), 16), int(m.group(2), 16)
        break
if addr is None:
    raise SystemExit('no such function')

def dis(path):
    args = [prefix + 'objdump', '-D', '-m', 'mips:5900', '-EL',
            '--start-address=0x%x' % addr, '--stop-address=0x%x' % (addr + size)]
    if base is not None:
        args += ['-b', 'binary', '--adjust-vma=0x%x' % base]
    text = subprocess.run(args + [path], capture_output=True, text=True).stdout
    rows = []
    for line in text.splitlines():
        m = re.match(r'\s*[0-9a-f]+:\s+[0-9a-f]{8}\s+(.*)', line)
        if m:
            ins = re.sub(r'\s*<[^>]*>', '', m.group(1)).strip()
            t = re.search(r'\b0?x?([0-9a-f]{5,8})$', ins)
            if t:
                v = int(t.group(1), 16)
                if v in names:
                    ins = ins[:t.start()] + names[v]
            rows.append(ins)
    return rows

a, b = dis(theirs), dis(ours)
print('%-44s %s' % ('--- retail %s' % want, 'ours'))
for i in range(max(len(a), len(b))):
    x, y = (a[i] if i < len(a) else ''), (b[i] if i < len(b) else '')
    print('%-44s %s%s' % (x, y, '' if x == y else '   <--'))
