#!/usr/bin/env python3

def apply(config, args):
    config["arch"] = 'mipsel'
    config['baseimg'] = 'rom/SCUS_971.11'
    config['myimg'] = 'build/SCUS_971.11.prelim.elf'
    config['objdump_executable'] = 'tools/mips64r5900el-ps2-elf-objdump.exe'
    config['source_directories'] = ['src', 'include', 'asm']
    config['map_address_offset'] = 0x100 # Skip the elf header