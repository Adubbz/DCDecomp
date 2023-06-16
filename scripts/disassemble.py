#!/usr/bin/env python3
import verify

import os
import spimdisasm
import subprocess
import rabbitizer
import re
import shutil
from itertools import chain
from functools import reduce
from pathlib import Path
from spimdisasm.common import FileSectionType

PRODG_PATH = os.environ['PRODG']

ISO_PATH = Path('rom/extracted/iso/')
ELF_PATH = ISO_PATH / 'SCUS_971.11'
TITLE_PATH = ISO_PATH / 'TITLE.BIN'
DUN_PATH = ISO_PATH / 'DUN.BIN'
REF_PATH = Path('ref/asm/')
REF_SECTION_PATH = REF_PATH / 'sections'
REF_SPLIT_PATH = REF_PATH / 'split'

# ROM addresses
ROM_ELF_START      = 0x0
ROM_ELF_TEXT_START = 0x000100
ROM_ELF_TEXT_END   = 0x145400
ROM_ELF_MAIN_END   = 0x1A2480
ROM_ELF_END        = 0x2B148C

ROM_TITLE_START    = 0x2B1500
ROM_TITLE_END      = 0x2E7300
ROM_TITLE_SIZE     = 0x35E00

ROM_DUN_START      = 0x2E7300
ROM_DUN_END        = 0x2FFA80
ROM_DUN_SIZE       = 0x18780

# VRAM addresses
VRAM_START      = 0x00100000
VRAM_END        = 0x01F06B00
VRAM_ELF_TEXT_START      = VRAM_START
VRAM_ELF_TEXT_END        = 0x00245300
VRAM_ELF_VUTEXT_START    = VRAM_ELF_TEXT_END
VRAM_ELF_VUTEXT_END      = 0x0024FAC0
VRAM_ELF_DATA_START      = VRAM_ELF_VUTEXT_END
VRAM_ELF_DATA_END        = 0x00296680
VRAM_ELF_VUDATA_START    = VRAM_ELF_DATA_END
VRAM_ELF_VUDATA_END      = 0x00296780
VRAM_ELF_RODATA_START    = VRAM_ELF_VUDATA_END
VRAM_ELF_RODATA_END      = 0x0029FE80

# NOTE: A lot of these were inferred and there may be alignment that slightly offsets the starts/end rather than being included in each section
VRAM_ELF_INIT_START      = VRAM_ELF_RODATA_END
VRAM_ELF_INIT_END        = 0x002A1010
VRAM_ELF_CTOR_START      = VRAM_ELF_INIT_END
VRAM_ELF_CTOR_END        = 0x002A1064
VRAM_ELF_VTABLES_START   = VRAM_ELF_CTOR_END
VRAM_ELF_VTABLES_END     = 0x002A17B0
VRAM_ELF_EXCEPTION_START = VRAM_ELF_VTABLES_END
VRAM_ELF_EXCEPTION_END   = VRAM_ELF_EXCEPTION_START
VRAM_ELF_OVL_ADDRS_START = VRAM_ELF_EXCEPTION_END
VRAM_ELF_OVL_ADDRS_END   = 0x002A17B8
VRAM_ELF_LIT4_START      = VRAM_ELF_OVL_ADDRS_END
VRAM_ELF_LIT4_END        = 0x002A1E80
VRAM_ELF_SDATA_START     = VRAM_ELF_LIT4_END
VRAM_ELF_SDATA_END       = 0x002A2380
VRAM_ELF_SBSS_START      = VRAM_ELF_SDATA_END
VRAM_ELF_SBSS_END        = 0x002A3709
VRAM_ELF_BSS_START       = VRAM_ELF_SBSS_END
VRAM_ELF_BSS_END         = 0x01DABD00

VRAM_OVERLAY_START       = VRAM_ELF_BSS_END

VRAM_TITLE_TEXT_START = 0x1DABD40
VRAM_TITLE_TEXT_END   = 0x1DD5380
VRAM_TITLE_DATA_START = VRAM_TITLE_TEXT_END
VRAM_TITLE_DATA_END   = 0x1DE1AFC
VRAM_TITLE_BSS_START  = VRAM_TITLE_DATA_END
VRAM_TITLE_BSS_END    = 0x1E5DF80
VRAM_TITLE_END        = VRAM_TITLE_BSS_END

VRAM_DUN_TEXT_START   = 0x1DABD40
VRAM_DUN_TEXT_END     = 0x1DC1B00
VRAM_DUN_DATA_START   = VRAM_DUN_TEXT_END
VRAM_DUN_DATA_END     = 0x1DC4414
VRAM_DUN_BSS_START    = VRAM_DUN_DATA_END
VRAM_DUN_BSS_END      = 0x1F06B00
VRAM_DUN_END          = VRAM_DUN_BSS_END

OVERLAY_CATEGORY = 'ovl'

ASM_PRELUDE = '''\
.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

'''

SYMBOL_SUFFIX_PATTERN = re.compile(r'\$\$_[0-9]+$')

def ensure_dir(path):
    path.mkdir(parents=True, exist_ok=True)

def readelf(args):
    return subprocess.check_output(['mips64r5900el-ps2-elf-readelf', *args]).decode()

def cppfilt(sym):
    return 

def demangle_all(syms):
    out = {}
    # Split into lists of no more than 1024
    for i in range(0, len(syms), 1024):
        subset = syms[i:min(i+1024, len(syms))]
        demangled = subprocess.check_output(['wine', f'{PRODG_PATH}/ee/gcc/bin/ee-c__filt.exe', *subset]).decode().strip().splitlines()
        out.update(dict([(subset[i], s) for i, s in enumerate(demangled)]))
    return out

def align(val, alignment):
    return ((val + (alignment - 1)) & ~(alignment - 1))

def is_vram_in_vrom(vram, section):
    if section == 'main':
        return vram >= VRAM_START and vram < VRAM_START + (ROM_ELF_END - ROM_ELF_START)
    elif section == 'title':
        return vram >= VRAM_OVERLAY_START and vram < (VRAM_OVERLAY_START + ROM_TITLE_SIZE)
    elif section == 'dun':
        return vram >= VRAM_OVERLAY_START and vram < (VRAM_OVERLAY_START + ROM_DUN_SIZE)
    else:
        return False

def calculate_vrom_for_section(vram, section):
    if not is_vram_in_vrom(vram, section):
        raise ValueError(f'VRAM {vram:x} out of bounds for vrom conversion for {section}')

    if section == 'main':
        return vram - VRAM_START + ROM_ELF_TEXT_START
    elif section == 'title':
        return vram - VRAM_OVERLAY_START + ROM_TITLE_START
    elif section == 'dun':
        return vram - VRAM_OVERLAY_START + ROM_DUN_START
    else:
        raise ValueError(f'Attempted to calculate vrom for invalid section {section}')

def get_section_segment_vrom_start(section):
    if section == 'title':
        return ROM_TITLE_START
    elif section == 'dun':
        return ROM_DUN_START
    else:
        return 0 # Global segment

def read_symbols():
    sections = {}
    for match in re.finditer(r'^ *\[ *([0-9]+)\] +([A-Za-z.]+) +[A-Z_]+', readelf(['-W', '-S', ELF_PATH]), re.MULTILINE):
        n, name = match.group(1, 2)
        sections[int(n)] = name

    for match in re.finditer(r'^ *\d+: +([0-9a-f]+) +(\d+) +([A-Z]+) +([A-Z]+) +([A-Z]+) +([0-9UND]+) +(.*)', readelf(['-W', '-s', ELF_PATH]), re.MULTILINE):
        addr, size, sym_type, bind, visibility, index, name = match.group(1, 2, 3, 4, 5, 6, 7)

        # Skip symbols with an undefined index
        if index == 'UND':
            continue

        addr = int(addr, 16)
        size = int(size)
        index = int(index)
        name = name.strip()
        section = sections[index]

        yield (addr, size, sym_type, bind, visibility, section, name)

def configure():
    # Configure spimdisasm
    spimdisasm.common.GlobalConfig.GLABEL_ASM_COUNT = False
    spimdisasm.common.GlobalConfig.PRODUCE_SYMBOLS_PLUS_OFFSET = True
    spimdisasm.common.GlobalConfig.ASM_USE_PRELUDE = False
    spimdisasm.common.GlobalConfig.STRING_GUESSER = False # Wrong guesses cause the binary to be non-matching
    spimdisasm.common.GlobalConfig.ENDIAN = spimdisasm.common.InputEndian.LITTLE
    spimdisasm.common.GlobalConfig.COMPILER = spimdisasm.common.Compiler.UNKNOWN # MWCC
    spimdisasm.common.GlobalConfig.ARCHLEVEL = spimdisasm.common.ArchLevel.MIPS3
    # spimdisasm.common.GlobalConfig.GP_VALUE = 0x002A97F0 - This causes assembler issues

    # Configure rabbitizer
    rabbitizer.config.regNames_namedRegisters = False

def normalize_sym(sym):
    if sym.startswith('@'):
        sym = sym.replace('@', 'LIT_')
    sym = sym.replace(',', '_').replace('<', '_').replace('>', '_')
    return sym

def process_relocations(context):
    relocs = readelf(['-W', '--relocs', ELF_PATH])
    
    reloc_section_pat = re.compile(r"^Relocation section '(.+)' at")
    reloc_entry_pat = re.compile(r'^([0-9A-Fa-f]{8})  ([0-9A-Fa-f]{8}) (.+) ([0-9A-Fa-f]{8})   (.*)')

    cur_section = None
    for line in relocs.splitlines():
        m = reloc_section_pat.match(line)

        # Set the current relocation section
        if m:
            cur_section = m.group(1).strip()
            continue
        elif not cur_section:
            continue

        m = reloc_entry_pat.match(line)

        # Skip lines that do not contain reloc entries
        if not m:
            continue

        offset, info, reloc_type, sym_value, sym_name = m.group(1, 2, 3, 4, 5)

        offset = int(offset, 16)
        reloc_type = reloc_type.strip()
        sym_name = sym_name.strip()

        sym_name = normalize_sym(sym_name)

        vrom = calculate_vrom_for_section(offset, cur_section[4:])
        context.addGlobalReloc(vrom, spimdisasm.common.RelocType.fromStr(reloc_type.replace('R_', '')), sym_name)

prev_symbols = set()

def make_unique_symbol(sym):
    suffix = 2
    new_sym = sym
    while new_sym.lower() in prev_symbols:
        new_sym = f'{sym}__{suffix}'
        suffix += 1
    prev_symbols.add(new_sym.lower())
    return new_sym

def process_symbols(context: spimdisasm.common.Context, title_segment, dun_segment):
    for addr, size, sym_type, bind, visibility, section, name in read_symbols():
        # Exclude undesirable symbols        
        if name in ['gcc2_compiled.', '__gnu_compiled_c']:
            continue

        # Make symbol names unique
        name = make_unique_symbol(normalize_sym(name))                

        # Select the segment appropriate for the symbol's address
        if section == 'title':
            segment = title_segment
        elif section == 'dun':
            segment = dun_segment
        elif context.globalSegment.isVramInRange(addr):
            segment = context.globalSegment
        else:
            segment = context.unknownSegment

        # Add symbols depending on the symbol type
        if sym_type == 'FUNC':
            context_sym = segment.addFunction(addr)
        elif sym_type == 'SECTION':
            continue
        elif sym_type == 'OBJECT':
            # Skip symbols with an address of 0
            if addr == 0:
                continue

            context_sym = segment.addSymbol(addr)
        elif sym_type == 'NOTYPE':
            context_sym = segment.addSymbol(addr)
            context_sym.isElfNotype = True
        else:
            raise RuntimeError(f'Unhandled symbol type {sym_type}')

        # Set the name of the context_sym
        if name:
            if name.startswith("."):
                context_sym._isStatic = True
            else:
                context_sym.name = name

        # Set other symbol properties
        context_sym.isUserDeclared = True
        context_sym.setSizeIfUnset(size)

        # Set symbol overlay category
        if section == 'title' or section == 'dun':
            context_sym.overlayCategory = OVERLAY_CATEGORY

def write_section(section, out_path):
    out_path.parent.mkdir(parents=True, exist_ok=True)

    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(ASM_PRELUDE)
        f.write(f'.section {section.name}\n')
        f.write(section.disassemble())

def write_split(processed_segments, section_name):
    text_sections = sorted(processed_segments[FileSectionType.Text], key=lambda x: x.vram)
    func_names = []

    # Generate a list of all function names to minimize calls to c++filt
    for section in text_sections:
        for func in section.symbolList:
            func_names.append(SYMBOL_SUFFIX_PATTERN.sub('', func.getName()))

    demangled_syms = demangle_all(func_names)
    prev_names = set()

    def make_name(sym):
        # Produce an appropriate demangled function name
        name = SYMBOL_SUFFIX_PATTERN.sub('', sym)
        name = demangled_syms[name]
        name = name.split('(')[0].replace(':', '_').replace('<', '_').replace('>', '_').replace(' ', '_').replace('=', 'equals')

        suffix = 2
        new_name = name
        while new_name.lower() in prev_names:
            new_name = f'{name}_{suffix}'
            suffix += 1
        prev_names.add(new_name.lower())
        return new_name

    # Write each function to its own file
    out_names = []
    for section in text_sections:
        for func in section.symbolList:
            name = make_name(func.getName())
            out_names.append(name)
            out_path = REF_SPLIT_PATH / f'{section_name}/{name}.s'
            out_path.parent.mkdir(parents=True, exist_ok=True)

            with open(out_path, 'w', encoding='utf-8') as f:
                f.write(ASM_PRELUDE)
                f.write(f'.section .text\n')
                f.write(func.disassemble())

    non_text_sections = sorted([e for k, v in processed_segments.items() if k != FileSectionType.Text for e in v], key=lambda x: x.vram)

    # Write obj_files.mk
    with open(REF_PATH / f'{section_name}_obj_files.mk', 'w') as f:
        f.write(f'{section_name.upper()}_O_FILES :=\\\n')
                
        for name in out_names:
            f.write(f'    $(BUILD_DIR)/{REF_SPLIT_PATH}/{section_name}/{name}.s.o \\\n')

        for section in non_text_sections:
            f.write(f'    $(BUILD_DIR)/{REF_SECTION_PATH}/{section_name}/{section_name}{section.name}.s.o \\\n')

def disassemble_group(context, group_section_name, entries):
    global data

    processed_segments = {}
    segment_paths = {}
    output_root_path = REF_SECTION_PATH / group_section_name

    for type in [FileSectionType.Text, FileSectionType.Data, FileSectionType.Rodata, FileSectionType.Bss]:
        processed_segments[type] = []
        segment_paths[type] = []

    def add_section(section_type, name, vram_start, vram_end, overlay=None):
        segment_vrom_start = get_section_segment_vrom_start(group_section_name)
        vrom_start = calculate_vrom_for_section(vram_start, group_section_name)

        # bss doesn't use vrom space
        if section_type == FileSectionType.Bss:
            vrom_end = vrom_start
        else:
            vrom_end = calculate_vrom_for_section(vram_end, group_section_name)

        if section_type == FileSectionType.Text:
            section = spimdisasm.mips.sections.SectionText(context, vrom_start, vrom_end, vram_start, name, data, segment_vrom_start, overlay)
        elif section_type == FileSectionType.Data:
            section = spimdisasm.mips.sections.SectionData(context, vrom_start, vrom_end, vram_start, name, data, segment_vrom_start, overlay)
        elif section_type == FileSectionType.Rodata:
            section = spimdisasm.mips.sections.SectionRodata(context, vrom_start, vrom_end, vram_start, name, data, segment_vrom_start, overlay)
        elif section_type == FileSectionType.Bss:
            section = spimdisasm.mips.sections.SectionBss(context, vrom_start, vrom_end, vram_start, vram_end, name, segment_vrom_start, overlay)
        else:
            raise ValueError(f'Invalid section type {section_type}')

        section.setCommentOffset(vrom_start - segment_vrom_start)
        processed_segments[section_type].append(section)
        segment_paths[section_type].append(output_root_path / f'{group_section_name}{name}.s')

    # Add sections based on entries
    for entry in entries:
        add_section(*entry)

    # Configure processed files
    spimdisasm.frontendCommon.FrontendUtilities.configureProcessedFiles(processed_segments, 'r5900')
    processed_files_count = reduce(lambda count, b: count + len(b), processed_segments.values(), 0)

    # Analyze the processed sections
    print(f'{group_section_name}: Analyzing sections...')
    spimdisasm.frontendCommon.FrontendUtilities.analyzeProcessedFiles(processed_segments, segment_paths, processed_files_count)

    # Replace .float with .words to ensure disassembly matches
    for section_type, sections in processed_segments.items():
        if not section_type in [FileSectionType.Data, FileSectionType.Rodata]:
            continue
        
        for section in sections:
            for sym in section.symbolList:
                context_sym = sym.contextSym

                if context_sym.accessType == rabbitizer.AccessType.FLOAT:
                    context_sym.accessType = rabbitizer.AccessType.WORD

    # Write the processed files
    print(f'{group_section_name}: Writing sections...')
    for section_type, sections in processed_segments.items():
        paths = segment_paths[section_type]

        for i, section in enumerate(sections):
            out_path = paths[i]
            write_section(section, out_path)

    # Write individual functions to their own s files
    print(f'{group_section_name}: Writing split files...')
    write_split(processed_segments, group_section_name)

def disassemble(context):
    # Cleanup existing ref directory
    if REF_PATH.exists():
        shutil.rmtree(REF_PATH)

    main = [
        (FileSectionType.Text, '.text', VRAM_ELF_TEXT_START, VRAM_ELF_TEXT_END),
        (FileSectionType.Data, '.vutext', VRAM_ELF_VUTEXT_START, VRAM_ELF_VUTEXT_END),
        (FileSectionType.Data, '.data', VRAM_ELF_DATA_START, VRAM_ELF_DATA_END),
        (FileSectionType.Data, '.vudata', VRAM_ELF_VUDATA_START, VRAM_ELF_VUDATA_END),

        # In the interest of simplicity, we'll group these sections together for now
        (FileSectionType.Rodata, '.rodata', VRAM_ELF_RODATA_START, VRAM_ELF_LIT4_END),

        # (FileSectionType.Rodata, '.rodata', VRAM_ELF_RODATA_START, VRAM_ELF_RODATA_END),
        # (FileSectionType.Rodata, '.init', VRAM_ELF_INIT_START, VRAM_ELF_INIT_END),
        # (FileSectionType.Rodata, '.ctor', VRAM_ELF_CTOR_START, VRAM_ELF_CTOR_END),
        # (FileSectionType.Rodata, '.vtables', VRAM_ELF_VTABLES_START, VRAM_ELF_VTABLES_END),
        # (FileSectionType.Rodata, '.ovladdrs', VRAM_ELF_OVL_ADDRS_START, VRAM_ELF_OVL_ADDRS_END),
        # (FileSectionType.Rodata, '.lit4', VRAM_ELF_LIT4_START, VRAM_ELF_LIT4_END),
        (FileSectionType.Data, '.sdata', VRAM_ELF_SDATA_START, VRAM_ELF_SDATA_END),
        (FileSectionType.Bss, '.sbss', VRAM_ELF_SBSS_START, VRAM_ELF_SBSS_END),
        (FileSectionType.Bss, '.bss', VRAM_ELF_BSS_START, VRAM_ELF_BSS_END)
    ]

    title = [
        (FileSectionType.Text, '.text', VRAM_TITLE_TEXT_START, VRAM_TITLE_TEXT_END, OVERLAY_CATEGORY),
        (FileSectionType.Data, '.data', VRAM_TITLE_DATA_START, VRAM_TITLE_DATA_END, OVERLAY_CATEGORY),
        (FileSectionType.Bss, '.bss', VRAM_TITLE_BSS_START, VRAM_TITLE_BSS_END, OVERLAY_CATEGORY)
    ]

    dun = [
        (FileSectionType.Text, '.text', VRAM_DUN_TEXT_START, VRAM_DUN_TEXT_END, OVERLAY_CATEGORY),
        (FileSectionType.Rodata, '.data', VRAM_DUN_DATA_START, VRAM_DUN_DATA_END, OVERLAY_CATEGORY),
        (FileSectionType.Bss, '.bss', VRAM_DUN_BSS_START, VRAM_DUN_BSS_END, OVERLAY_CATEGORY)
    ]

    disassemble_group(context, 'main', main)
    disassemble_group(context, 'title', title)
    disassemble_group(context, 'dun', dun)

data = b''

def append_rom(path):
    global data
    with open(path, 'rb') as f:
        data += f.read()
        data = data.ljust(align(len(data), 128), b'\x00')

if __name__ == "__main__":
    print('Disassembling...')

    # verify.verify_extracted()
    os.chdir(os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir)))

    # Configure spimdisasm
    configure()

    # Load rom files
    append_rom(ELF_PATH)
    append_rom(TITLE_PATH)
    append_rom(DUN_PATH)

    # Create the spim context
    context = spimdisasm.common.Context()
    context.changeGlobalSegmentRanges(0, ROM_ELF_END, 0, VRAM_OVERLAY_START)
    title_segment = context.addOverlaySegment(OVERLAY_CATEGORY, ROM_TITLE_START, ROM_TITLE_END, VRAM_OVERLAY_START, VRAM_TITLE_END)
    dun_segment = context.addOverlaySegment(OVERLAY_CATEGORY, ROM_DUN_START, ROM_DUN_END, VRAM_OVERLAY_START, VRAM_DUN_END)

    # Add relocations to context
    # Skip relocations for now as they break the assembler
    # process_relocations(context)

    # Add symbols to context
    process_symbols(context, title_segment, dun_segment)

    # Disassemble
    disassemble(context)
