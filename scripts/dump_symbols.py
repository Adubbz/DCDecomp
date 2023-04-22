import os
import subprocess

# Change to work from the root directory
root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
os.chdir(root_dir)

sym_tab = subprocess.check_output(['tools/mips64r5900el-ps2-elf-objdump.exe', '--syms', 'rom/SCUS_971.11']).decode()

prev_symbols = set()

def make_unique_symbol(sym):
    suffix = 2
    new_sym = sym
    while new_sym in prev_symbols:
        new_sym = f'{sym}__DSUFF_{suffix}__'
        suffix += 1
    prev_symbols.add(new_sym)
    return new_sym

def sub_char(chr):
    return f'__DSUBS_{ord(chr)}__'

with open('config/symbols.txt', 'w') as f:
    for line in sym_tab.splitlines():
        # Skip irrelevant lines. NOTE: This currently ignores symbols for dun.bin
        if not 'main' in line:
            continue

        offset = line[0:8]
        sym_type = line[15]
        sym_size = line[22:30]
        symbol = line[31:].replace('<', sub_char('<')).replace('>', sub_char('>')).replace('@', sub_char('@')).replace(',', sub_char(','))

        if sym_type == 'F':
            out_type = 'type:func'
        elif sym_type == 'O':
            out_type = 'type:label'
        else:
            # Ignore symbols that aren't functions or objects
            continue

        out_size = f'size:0x{sym_size}'
        f.write(f'{make_unique_symbol(symbol)} = 0x{offset}; // {out_type} {out_size}\n')

print('Successfully dumped symbols')