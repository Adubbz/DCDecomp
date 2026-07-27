#!/usr/bin/env python3
import os

def apply(config, args):
    config["arch"] = 'mipsee'
    config['objdump_executable'] = 'mips64r5900el-ps2-elf-objdump'
    config['source_directories'] = ['src', 'include', 'asm']
    config['expected_dir'] = 'rom/extracted/' # Combine with a folder symlink to hack around asm-differ's folder structure requirements
    config['show_line_numbers_default'] = False # Line numbers are associated with a significant performance penalty

    # diff.sh sets this when diffing an overlay. The overlays are raw
    # images rather than ELFs, so they are diffed by address instead of by
    # symbol, and the images have to replace the executable as the two sides.
    overlay = os.environ.get('DCDECOMP_OVERLAY')
    if overlay:
        image = f'{overlay.upper()}.BIN'
        config['baseimg'] = f'rom/extracted/iso/{image}'
        config['myimg'] = f'build/{image}'
    else:
        config['baseimg'] = 'rom/extracted/iso/SCUS_971.11'
        config['myimg'] = 'build/SCUS_971.11'

    # -m rebuilds before diffing. asm-differ appends the path it wants built,
    # but the project builds in one step, so that argument is discarded here.
    # Ninja parallelises on its own, so there are no make flags to pass.
    config['make_command'] = ['sh', '-c', 'exec cmake --build build', 'asm-differ']
