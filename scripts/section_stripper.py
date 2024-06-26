import argparse
import os
import subprocess

PRODG_PATH = os.environ['PRODG']

def read_empty_sections(obj):
    output = subprocess.check_output(['wibo', f'{PRODG_PATH}/ee/gcc/bin/ee-readelf.exe', '-S', obj]).decode()
    empty_sections = []

    for line in output.splitlines():
        # Skip lines that don't provide the info we care about
        if not line.startswith('  [') or '[Nr]' in line:
            continue

        name = line[7:25].rstrip() 
        size = int(line[57:63], 16)

        # Skip sections with empty names
        if name not in ['.text', '.data', '.bss'] or size > 0:
            continue

        empty_sections.append(name)

    return empty_sections

def strip_sections(obj, sections):
    print(f'Stripping {obj}')
    command = ['mips64r5900el-ps2-elf-objcopy', '-I', 'elf32-littlemips', '-O', 'elf32-littlemips']
    
    for section in sections:
        command.append(f'--remove-section={section}')

    command.append(obj)
    subprocess.run(command)

# Change to work from the root directory
root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
os.chdir(root_dir)

parser = argparse.ArgumentParser(description='Strips zero-sized sections from object files')
parser.add_argument('object')
args = parser.parse_args()

empty_sections = read_empty_sections(args.object)

if empty_sections:
    strip_sections(args.object, empty_sections)
