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

ISO_PATH = Path('rom/extracted/iso/')
ELF_PATH = ISO_PATH / 'SCUS_971.11'
TITLE_PATH = ISO_PATH / 'TITLE.BIN'
DUN_PATH = ISO_PATH / 'DUN.BIN'
REF_PATH = Path('ref/asm/')
# Every binutils tool comes from binutils-mips-ps2-decompals.
TOOL_PREFIX = os.environ.get('MIPS_TOOL_PREFIX', 'mips-ps2-decompals-')

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

# Longest split-file name, before the ".s" it is written with and the ".o" the
# build produces from it. mwld keeps an object's base name in a 64-byte buffer
# and walks off the end of anything longer -- it does not report an error, it
# corrupts its own error path, which surfaces as wibo aborting on a missing
# FormatMessageA import. Mangled names reach 126 characters, so they are cut to
# fit; the symbol inside the file is always the full name.
MAX_SPLIT_NAME_LENGTH = 59

def ensure_dir(path):
    path.mkdir(parents=True, exist_ok=True)

def readelf(args):
    return subprocess.check_output([f'{TOOL_PREFIX}readelf', *args]).decode()

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

    # readelf prints a symbol's size in decimal until it gets large, then
    # switches to hex. Matching only decimal silently dropped every symbol over
    # that threshold -- six of them here, including Chara (0x196d0) and
    # GlobalDataBuffer (0x19c9910) -- so the disassembler never knew their names
    # and emitted auto-generated ones instead.
    for match in re.finditer(r'^ *\d+: +([0-9a-f]+) +(0x[0-9a-fA-F]+|\d+) +([A-Z]+) +([A-Z]+) +([A-Z]+) +([0-9UND]+) +(.*)', readelf(['-W', '-s', ELF_PATH]), re.MULTILINE):
        addr, size, sym_type, bind, visibility, index, name = match.group(1, 2, 3, 4, 5, 6, 7)

        # Skip symbols with an undefined index
        if index == 'UND':
            continue

        addr = int(addr, 16)
        size = int(size, 0)
        index = int(index)
        name = name.strip()
        section = sections[index]

        yield (addr, size, sym_type, bind, visibility, section, name)

def configure():
    # Configure spimdisasm
    spimdisasm.common.GlobalConfig.GLABEL_ASM_COUNT = False
    spimdisasm.common.GlobalConfig.PRODUCE_SYMBOLS_PLUS_OFFSET = True
    spimdisasm.common.GlobalConfig.ASM_USE_PRELUDE = False

    # Emit one label macro for every kind of symbol, undecorated and at column
    # zero. Newer spimdisasm defaults to naming each kind separately (dlabel
    # for data, jlabel for jump tables, an `endlabel` closing every symbol, a
    # `nonmatching` marker before it) and to indenting the body.
    #
    # The dumps are not just assembler input: scripts/build/migrate_section.py reads
    # them to carve migrated data out, matching labels and the address comment
    # that follows them. Keeping the emission as it was leaves that -- and the
    # macro.inc the dumps include -- working unchanged, and keeps the upgrade
    # to what it is actually for: better decoding and real MWCC PS2 support,
    # not a reshuffle of every reference file.
    spimdisasm.common.GlobalConfig.ASM_DATA_LABEL = 'glabel'
    spimdisasm.common.GlobalConfig.ASM_JTBL_LABEL = 'jlabel'
    # Branch targets and alternate entry points go through alabel, which is a
    # local label -- see include/macro.inc for why they must not be global.
    spimdisasm.common.GlobalConfig.ASM_TEXT_ALT_LABEL = 'alabel'
    spimdisasm.common.GlobalConfig.ASM_EHTBL_LABEL = 'glabel'
    spimdisasm.common.GlobalConfig.ASM_TEXT_END_LABEL = ''
    spimdisasm.common.GlobalConfig.ASM_DATA_END_LABEL = ''
    spimdisasm.common.GlobalConfig.ASM_NM_LABEL = ''
    spimdisasm.common.GlobalConfig.ASM_INDENTATION = 0
    spimdisasm.common.GlobalConfig.ASM_INDENTATION_LABELS = 0

    # Leave a data symbol's trailing alignment padding inside that symbol
    # rather than splitting it out under a generated D_<addr> label. The
    # migrated objects supply the padding too -- mwcc pads .data out to the
    # section's alignment -- so a split pad makes the hole carved for an
    # object smaller than the object itself, which gen_lcf.py rejects.
    # .bss pads stay on: the B_<addr> labels they produce are what
    # scripts/build/migrate_section.py already recognises as padding there.
    spimdisasm.common.GlobalConfig.CREATE_DATA_PADS = False
    spimdisasm.common.GlobalConfig.CREATE_BSS_PADS = True

    # A value only becomes a symbol if it lands in a declared segment; anything
    # else stays the constant it is. The segment ranges are the thing that
    # decides this (see changeGlobalSegmentRanges below) -- the
    # SYMBOL_FINDER_FILTER_* defaults bracket N64 RAM and are left alone,
    # because widening them to this game's address space only re-admits the
    # values the segment ranges just excluded, such as main code's constant
    # 0x1EA1D20 becoming a reference to dun's bss.
    spimdisasm.common.GlobalConfig.SYMBOL_FINDER_FILTERED_ADDRESSES_AS_CONSTANTS = True

    # Do not invent symbols for addresses that belong to no segment being
    # disassembled. main's code does reach into the overlays -- retail relocates
    # e.g. 0x01EA1D20 against dun's `CharaMain` -- but from main's side those
    # segments are not visible, so the address lands in the "unknown segment"
    # and comes out as a %hi/%lo pair against a D_01EA1D20 that nothing
    # defines, and the link fails on it. Left as the constant it is, the
    # instruction assembles to exactly the same bytes.
    spimdisasm.common.GlobalConfig.ALLOW_UNKSEGMENT = False

    # Wrong guesses cause the binary to be non-matching. Newer spimdisasm
    # replaced the single flag with per-section levels, where 0 is off; both
    # are set so the guesser stays off whichever one the version honours.
    spimdisasm.common.GlobalConfig.STRING_GUESSER = False
    spimdisasm.common.GlobalConfig.RODATA_STRING_GUESSER_LEVEL = 0
    spimdisasm.common.GlobalConfig.DATA_STRING_GUESSER_LEVEL = 0
    spimdisasm.common.GlobalConfig.ENDIAN = spimdisasm.common.InputEndian.LITTLE
    # The game is Metrowerks CodeWarrior for PS2. spimdisasm models that
    # compiler directly now; it used to have to be told UNKNOWN.
    spimdisasm.common.GlobalConfig.COMPILER = spimdisasm.common.Compiler.MWCCPS2
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

# {address: [final name, ...]} for every symbol registered. Several retail
# symbols can share one address; only one of them can label it in the dumps.
symbols_by_addr = {}

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

        # MWLD emits its segment measurements as ordinary symbols whose *value*
        # is a byte count, not an address -- __bss_size, _dun_text_size, the
        # _align_segment granularity, and so on. Read as addresses they land at
        # arbitrary points in the image and split whatever symbol covers that
        # point. __bss_size (0x01B085F7) falls inside GlobalDataBuffer and cut
        # its .bss reservation from the declared 0x19C9910 down to 0x185D577,
        # which is what the "Range check triggered" warning was reporting.
        #
        # NOTYPE is what distinguishes them: every real symbol here is a FUNC
        # or an OBJECT, so genuine data like `config_file_size` is unaffected.
        if sym_type == 'NOTYPE' and (name.endswith('_size') or name == '_align_segment'):
            continue

        # Make symbol names unique
        name = make_unique_symbol(normalize_sym(name))
        if name and not name.startswith('.'):
            symbols_by_addr.setdefault(addr, []).append(name)

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

            # main's code calls into the overlays and reads their data --
            # retail relocates those references against the overlay's own
            # symbols, e.g. SetMIniMapStatus__Fi and CharaMain in dun. An
            # overlay segment is not visible from main, so without a global
            # declaration the reference disassembles to an invented
            # func_1DC12C0 / D_01EA1D20 that nothing defines and the link
            # fails on. Declaring the same name globally lets main name it,
            # while the definition still comes from the overlay's own dump.
            # Only the symbols the overlay's own dumps go on to define. Retail
            # also carries boundary symbols such as _dun_segment_start and
            # _dun_bss_end, which sit either side of the disassembled range and
            # which this build has no definition for -- naming a reference
            # after one of those would just move the link error.
            lo, hi = ((VRAM_TITLE_TEXT_START, VRAM_TITLE_BSS_END)
                      if section == 'title'
                      else (VRAM_DUN_TEXT_START, VRAM_DUN_BSS_END))

            if name and not name.startswith('.') and lo <= addr < hi:
                if sym_type == 'FUNC':
                    global_sym = context.globalSegment.addFunction(addr)
                else:
                    global_sym = context.globalSegment.addSymbol(addr)
                global_sym.name = name
                global_sym.isUserDeclared = True
                global_sym.setSizeIfUnset(size)

# Auto-generated branch labels: `.L<vram>` or `.L<vram>_<vrom>`.
BRANCH_LABEL_RE = re.compile(r'^glabel (\.L[0-9A-F]+(?:_[0-9A-F]+)?)$', re.MULTILINE)
JUMP_TABLE_LABEL_RE = re.compile(r'^jlabel (\S+)$', re.MULTILINE)
FUNCTION_LABEL_RE = re.compile(r'^glabel (\S+)$', re.MULTILINE)

# A PC-relative branch and the label it lands on. `j`/`jal` are deliberately
# not matched: those encode an absolute target, mwld resolves them correctly,
# and pointing one at a file-local twin would leave it with no relocation at
# all. `break` is the one other b-word and takes no label.
BRANCH_TARGET_RE = re.compile(
    r'^(/\*.*?\*/\s+b(?!reak\b)[a-z0-9]*\s+(?:[^,\s]+,\s*)*)([A-Za-z_$][\w.$]*)[ \t]*$',
    re.MULTILINE)

# Suffix for the file-local twin of a label that also has to be global.
LOCAL_TWIN_SUFFIX = '$b'


def localize_branch_labels(text):
    """Make every branch in this file resolvable by the assembler alone.

    gas encodes a branch to a locally defined label itself, but leaves one to a
    global label as an R_MIPS_PC16 for mwld -- and the two disagree by one
    instruction about the addend, so the branch assembles one short.

    Retail's symbol table has unnamed entries mid-function, which spimdisasm
    declares as global symbols. Three cases: a plain branch target becomes a
    local `.L...`; a jump table's target stays global (the table is in another
    object) and gains a local twin for the branches; a function's own name
    stays global and gets the same treatment, but only its branches are
    repointed, since a `jal` still needs the relocation.
    """
    text = BRANCH_LABEL_RE.sub(r'\1:', text)
    text = twin_branched_functions(text)

    names = list(dict.fromkeys(JUMP_TABLE_LABEL_RE.findall(text)))
    if not names:
        return text

    # One pass over the file, not one per label: the section dumps are large
    # and carry thousands of these between them.
    alternation = '|'.join(re.escape(n) for n in names)
    text = re.sub(rf'(?<![\w.$])({alternation})(?![\w.$])',
                  lambda m: m.group(1) + LOCAL_TWIN_SUFFIX, text)

    # The definition itself has to keep the global name, with the twin beside it.
    suffix = re.escape(LOCAL_TWIN_SUFFIX)
    return re.sub(rf'^jlabel (\S+){suffix}$',
                  lambda m: f'jlabel {m.group(1)}\n{m.group(1)}{LOCAL_TWIN_SUFFIX}:',
                  text, flags=re.MULTILINE)


def twin_branched_functions(text):
    """Give a local twin to every glabel this file branches to.

    Only names defined here can get one -- a branch into another object has to
    stay a relocation, and there is nothing local to point it at.
    """
    defined = set(FUNCTION_LABEL_RE.findall(text))
    branched = {m.group(2) for m in BRANCH_TARGET_RE.finditer(text)} & defined
    if not branched:
        return text

    text = BRANCH_TARGET_RE.sub(
        lambda m: m.group(1) + m.group(2) + (LOCAL_TWIN_SUFFIX
                                             if m.group(2) in branched else ''),
        text)
    return re.sub(rf'^glabel ({"|".join(re.escape(n) for n in branched)})$',
                  lambda m: f'glabel {m.group(1)}\n{m.group(1)}{LOCAL_TWIN_SUFFIX}:',
                  text, flags=re.MULTILINE)


LABEL_RE = re.compile(r'^(?:glabel|jlabel)\s+(\S+)$')
INDEX_ADDR_RE = re.compile(r'^/\*\s*([0-9A-Fa-f]+)(?:\s+([0-9A-Fa-f]+))?')


def write_symbol_index():
    """Record every symbol the dumps define, under the name they define it by.

    This is the authority the build resolves against, not the retail symbol
    table: where retail has two symbols called VSyncField, the dumps have
    VSyncField and VSyncField__2, and it is the latter that a decompiled .cpp
    declares and that the linker has to match.
    """
    out = REF_PATH / 'objects' / 'symbols.index'
    out.parent.mkdir(parents=True, exist_ok=True)

    rows = []
    for path in sorted(REF_PATH.rglob('*.s')):
        lines = path.read_text(errors='replace').splitlines()
        for i, line in enumerate(lines):
            m = LABEL_RE.match(line)
            if not m:
                continue
            for nxt in lines[i + 1:]:
                am = INDEX_ADDR_RE.match(nxt)
                if am:
                    # file-backed sections carry `fileoffset vaddr`, .bss only vaddr
                    rows.append((m.group(1), int(am.group(2) or am.group(1), 16),
                                 str(path)))
                    break
                if nxt.strip():
                    break

    with open(out, 'w') as f:
        f.write('# symbol\tvram\tsource\n')
        for name, vram, src in sorted(rows, key=lambda r: (r[1], r[0])):
            f.write(f'{name}\t{vram:#010x}\t{src}\n')


def write_section(section, out_path):
    out_path.parent.mkdir(parents=True, exist_ok=True)

    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(ASM_PRELUDE)
        f.write(f'.section {section.name}\n')
        f.write(localize_branch_labels(section.disassemble()))

def write_split(processed_segments, section_name):
    text_sections = sorted(processed_segments[FileSectionType.Text], key=lambda x: x.vram)
    prev_names = set()

    def make_name(sym):
        """The file name for one function: its own symbol, as mangled.

        The game uses GCC 2.x (ARM-style) mangling, which is what appears in
        the objects and the link map -- Load__7CScriptPCc, not CScript::Load.
        No current demangler reads that form, so demangling would mean
        carrying a checked-in table. `$$_N` suffixes are spimdisasm's way of
        separating same-named symbols and are stripped, which can bring two
        files back into collision; the loop below keeps them apart, as does
        truncation.
        """
        name = SYMBOL_SUFFIX_PATTERN.sub('', sym)[:MAX_SPLIT_NAME_LENGTH]

        suffix = 2
        new_name = name
        while new_name.lower() in prev_names:
            tail = f'_{suffix}'
            new_name = f'{name[:MAX_SPLIT_NAME_LENGTH - len(tail)]}{tail}'
            suffix += 1
        prev_names.add(new_name.lower())
        return new_name

    # Write each function to its own file, recording where retail keeps it.
    # The index is what lets the build work out, without reading four thousand
    # object files, which .s a compiled .cpp supersedes: see gen_layout.py.
    index = []
    for section in text_sections:
        for func in section.symbolList:
            name = make_name(func.getName())
            index.append((f'{REF_SPLIT_PATH}/{section_name}/{name}.s',
                          func.getName(), func.vram, func.sizew * 4))
            out_path = REF_SPLIT_PATH / f'{section_name}/{name}.s'
            out_path.parent.mkdir(parents=True, exist_ok=True)

            with open(out_path, 'w', encoding='utf-8') as f:
                f.write(ASM_PRELUDE)
                f.write(f'.section .text\n')
                f.write(localize_branch_labels(func.disassemble()))

    non_text_sections = sorted([e for k, v in processed_segments.items() if k != FileSectionType.Text for e in v], key=lambda x: x.vram)

    # The address index: one row per source the build can link, with the retail
    # address it occupies. Data sections are whole dumps rather than one symbol,
    # so they are recorded by their span.
    index_path = REF_PATH / 'objects' / f'{section_name}.index'
    index_path.parent.mkdir(parents=True, exist_ok=True)

    with open(index_path, 'w') as f:
        f.write('# source\tsymbol\tvram\tsize\n')
        for path, sym, vram, size in index:
            f.write(f'{path}\t{sym}\t{vram:#010x}\t{size:#x}\n')
        for section in non_text_sections:
            path = f'{REF_SECTION_PATH}/{section_name}/{section_name}{section.name}.s'
            f.write(f'{path}\t{section_name}{section.name}\t{section.vram:#010x}\t{section.sizew * 4:#x}\n')

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
    write_symbol_index()

data = b''

def append_rom(path):
    global data
    with open(path, 'rb') as f:
        data += f.read()
        data = data.ljust(align(len(data), 128), b'\x00')

if __name__ == "__main__":
    print('Disassembling...')

    # verify.verify_extracted()
    os.chdir(os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir, os.pardir)))

    # Configure spimdisasm
    configure()

    # Load rom files
    append_rom(ELF_PATH)
    append_rom(TITLE_PATH)
    append_rom(DUN_PATH)

    # Create the spim context
    context = spimdisasm.common.Context()
    # The global segment starts where the game is loaded, not at 0. Declaring it
    # from 0 makes every small constant look like an address inside the segment,
    # which is how a displacement such as the 0x16028 in
    #     lui $1, %hi(..) / addu $1, $3, $1 / lw $2, %lo(..)($1)
    # ends up named D_00016028 and referenced as a symbol nothing defines.
    context.changeGlobalSegmentRanges(0, ROM_ELF_END, VRAM_START, VRAM_OVERLAY_START)
    title_segment = context.addOverlaySegment(OVERLAY_CATEGORY, ROM_TITLE_START, ROM_TITLE_END, VRAM_OVERLAY_START, VRAM_TITLE_END)
    dun_segment = context.addOverlaySegment(OVERLAY_CATEGORY, ROM_DUN_START, ROM_DUN_END, VRAM_OVERLAY_START, VRAM_DUN_END)

    # Add relocations to context
    # Skip relocations for now as they break the assembler
    # process_relocations(context)

    # Add symbols to context
    process_symbols(context, title_segment, dun_segment)

    # Disassemble
    disassemble(context)
