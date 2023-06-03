import os
import subprocess

def get_max_alignment(addr):
    align = 1
    while True:
        if addr % (align * 2) == 0:
            align *= 2
        else:
            return align

# Change to work from the root directory
root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
os.chdir(root_dir)

sym_tab = subprocess.check_output(['tools/mips64r5900el-ps2-elf-objdump.exe', '--syms', 'rom/SCUS_971.11']).decode()

entries = []

for line in sym_tab.splitlines():
    if not 'main' in line:
        continue
    
    offset = int(line[0:8], 16)
    sym_type = line[15]
    sym_size = line[22:30]
    symbol = line[31:].rstrip()

    if not sym_type == 'F':
        continue

    entries.append((offset, symbol))

entries.sort(key=lambda x: x[0])

for i, entry in enumerate(entries):
    offset, symbol = entry
    align = get_max_alignment(offset)

    if i < (len(entries)-1):
        end_offset = entries[i+1][0]
        end_alignment = get_max_alignment(end_offset)
        align = min(align, end_alignment)

    print(f'{offset:X} {align} {symbol}')

