"""Where the title overlay's functions part company with retail's."""
import subprocess, re, os
prefix = os.environ.get('MIPS_TOOL_PREFIX', 'mips-ps2-decompals-')
LOW, HIGH = 0x01DABD40, 0x01DD5380
retail = {}
for line in open('config/title.symbols.txt'):
    m = re.match(r'(\S+) = 0x([0-9a-fA-F]+); // type:func', line)
    if m and LOW <= int(m.group(2), 16) < HIGH:
        retail.setdefault(m.group(1), int(m.group(2), 16))
ours, dupe = {}, set()
for line in subprocess.run([prefix + 'nm', 'build/SCUS_971.11'],
                           capture_output=True, text=True).stdout.splitlines():
    f = line.split()
    if len(f) == 3 and LOW <= int(f[0], 16) < HIGH:
        if f[2] in ours:
            dupe.add(f[2])
        ours[f[2]] = int(f[0], 16)
both = sorted((retail[n], ours[n], n) for n in retail if n in ours and n not in dupe)
print('%d functions compared' % len(both))
last = 'x'
for r, o, n in both:
    if o - r != last:
        print('  %08X -> %08X  %+5d  %s' % (r, o, o - r, n))
        last = o - r
