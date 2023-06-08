#!/usr/bin/env python3
import subprocess

def apply(config, args):
    config["arch"] = 'mipsee'
    config['baseimg'] = 'extracted/iso/SCUS_971.11'
    config['myimg'] = 'build/SCUS_971.11'
    config['objdump_executable'] = 'mips64r5900el-ps2-elf-objdump'
    config['source_directories'] = ['src', 'include', 'asm']
    config['disassemble_all'] = True
    config['expected_dir'] = 'extracted/' # Combine with a folder symlink to hack around asm-differ's folder structure requirements
    config['show_line_numbers_default'] = False # Line numbers are associated with a significant performance penalty

    nproc = subprocess.check_output(['nproc']).decode().rstrip()
    config['makeflags'] = [f'-j{nproc}']