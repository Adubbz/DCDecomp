cmake_minimum_required(VERSION 3.20)
project(dcdecomp NONE)

# Targets: setup (extract + disassemble), elf, iso, run. `build`, the default,
# is elf plus verification against the retail hashes.

set(BASENAME SCUS_971.11)

# The three images the disassembler splits the disc into, and the order the
# reference indexes are read in.
set(SECTIONS main title dun)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(ObjectLists)
include(Overlays)
include(Migration)

# Directories
set(SRC_DIR src)
set(INCLUDE_DIR include)
set(TOOLS_DIR tools)
set(SCRIPTS_DIR scripts)
set(ROM_DIR rom)
# Where splat writes: one file per translation unit, the per-function
# reference assembly each marker names, and the whole-section dumps.
set(ASM_DIR asm)
set(ASM_DATA_DIR ${ASM_DIR}/data)
set(CONFIG_DIR config)
# The symbol list splat runs against, which stands for "the configuration is
# present". Every object reads what splat produced -- a compiled one through
# mwccgap, an assembled one directly -- so they all depend on it, or a build
# that has to split first races the step writing the files it is reading.
set(REF_INDEX ${CONFIG_DIR}/main.symbols.txt)
if(EXISTS ${CMAKE_SOURCE_DIR}/${REF_INDEX})
    set(REF_STAMP ${CMAKE_SOURCE_DIR}/${REF_INDEX})
else()
    set(REF_STAMP "")
endif()

# What `derive_config` reads, so that editing any of it re-runs CMake.
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/main.yaml
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/title.yaml
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/dun.yaml)

# Every tool runs from the source root and is given source-relative paths, so
# the objects record the same paths the Makefile build produced. BUILD_DIR is
# the binary directory expressed the same way.
file(RELATIVE_PATH BUILD_DIR ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})

# Build tools. Everything but the Metrowerks compiler and linker comes from
# binutils-mips-ps2-decompals, on PATH, replacing ProDG and ps2toolchain-ee.
set(MIPS_TOOL_PREFIX mips-ps2-decompals-
    CACHE STRING "Prefix of the binutils-mips-ps2-decompals tools")

set(MW ${TOOLS_DIR}/compilers/mw/2.3.3/)
# MWCIncludes is mwcc's <> search list, which -i does not feed: -i only appends
# to the "" list. The libraries are reached through it and the game's own
# headers through -i, which is what keeps `#include <cstring>` and `#include
# <libvu0.h>` apart from `#include "frame.hpp"`: include/std declares the C
# functions retail carried, include/sce the PlayStation 2 library ones.
#
# The escaped separator is what the Windows tool splits the list on, and the
# backslash is what stops CMake taking the string for a two-element list and
# passing it as two arguments.
set(STD_INCLUDE_DIR ${INCLUDE_DIR}/std)
set(SCE_INCLUDE_DIR ${INCLUDE_DIR}/sce)
set(LIB_INCLUDE_DIRS "${STD_INCLUDE_DIR}\;${SCE_INCLUDE_DIR}")
set(CC_MW ${CMAKE_COMMAND} -E env MWCIncludes=${LIB_INCLUDE_DIRS} wibo ${MW}mwccmips.exe)
set(LD_MW wibo ${MW}mwldmips.exe)
set(AS ${MIPS_TOOL_PREFIX}as)
set(OBJCOPY ${MIPS_TOOL_PREFIX}objcopy)
set(OBJDUMP ${MIPS_TOOL_PREFIX}objdump)
# HINTS are searched before PATH, so the container's virtualenv wins: the
# system python3 is missing pycdlib and the disassembler packages, and the
# image puts the venv at the end of PATH.
find_program(PYTHON NAMES python3 python REQUIRED HINTS $ENV{VIRTUAL_ENV}/bin)

# -u because Python block-buffers stdout when it is not a terminal, which
# would hold a long script's progress until it finished.
set(PYTHON_CMD ${PYTHON} -u)

# Files
set(LD_TEMPLATE ${BASENAME}.lcf)
set(OUTPUT ${BUILD_DIR}/${BASENAME})
set(RETAIL_ISO "${ROM_DIR}/Dark Cloud (USA).iso")
set(BUILT_ISO "${BUILD_DIR}/Dark Cloud (Build).iso")
set(CTX ${BUILD_DIR}/ctx.c)
set(CTX_CPP ${BUILD_DIR}/ctx.cpp)

# Compiler flags, translated from the ProDG spellings these were written in.
# -mabi=eabi (not -32) because o32's 32-bit registers turn every `ld` into an
# $at macro the dumps forbid, and eabi64 is what retail carries. -mno-pdr
# because the .lcf has no placement for the .pdr GNU as emits alongside -g.
set(AS_FLAGS -EL -march=r5900 -mabi=eabi -g -mno-pdr -non_shared -G0 -I include)
# -RTTI off because retail's vtables carry a zero where mwcc otherwise puts a
# pointer to the class's __RTTI__ record; the game was built without it.
set(CC_MW_FLAGS -O2 -c -Cpp_exceptions off -RTTI off -strings readonly -i include)
set(LD_MW_FLAGS -map -nostdlib -m _start -nodead -g)
# `-sym on,noelf` keeps the relocations resolved but drops the symbol table and
# section headers, leaving just the loadable image the console needs.
set(LD_MW_ISO_FLAGS -nostdlib -m _start -nodead -sym on,noelf)
set(BIN_FLAGS -B mips:5900 -I binary -O elf32-littlemips)

# Data migration: decompiled globals are carved out of copies of the section
# dumps and placed back into their retail holes, all derived from
# asm/decompiled_symbols.txt. See re/ai/build_pipeline.md.
add_migrated_sections(GENERATED_S_FILES GENERATED_PLAN_FILES)

set(GENERATED_O_FILES "")
foreach(s IN LISTS GENERATED_S_FILES)
    list(APPEND GENERATED_O_FILES ${s}.o)
endforeach()

# What gets built, as opposed to what gets linked. Every reference dump the
# disassembler recorded is assembled and every source under src/ is compiled,
# whether or not the link ends up using it -- a dump superseded by decompiled
# C++ is still what objdiff compares that C++ against. Which of them the link
# takes, and in what order, is decided from the compiled objects themselves at
# build time; see scripts/build/layout.py.
#
# The carved sections are the exception: the migration replaces them with the
# generated parts above, so their dumps are never assembled.
migrated_section_names(CARVED_SECTIONS)

set(ASM_SOURCES "")
foreach(section IN LISTS SECTIONS)
    read_index_sources(${section} section_srcs "${CARVED_SECTIONS}")
    list(APPEND ASM_SOURCES ${section_srcs})
endforeach()

# Only for its CONFIGURE_DEPENDS: ninja re-evaluates the glob each build and
# re-runs CMake when the set of sources changed, so a newly added one is picked
# up without anyone having to remember. What is built comes from the unit rows
# below.
file(GLOB_RECURSE ALL_CPP_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR}
     ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.cpp ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.c)

# Which units are compiled and which are taken whole. A unit with nothing
# decompiled in it is linked straight from the single assembly file splat
# writes for it, and its source -- markers and nothing else -- is not compiled
# at all. Decompile one function in such a unit and re-run the `disassemble`
# target; it becomes a compiled unit and gets the reference files it now needs.
derive_config(--list-units unit_rows)

set(CPP_SOURCES "")
set(UNIT_ASM_SOURCES "")
set(WHOLE_UNIT_OBJS "")
set(WHOLE_UNIT_REFS "")
foreach(row IN LISTS unit_rows)
    string(REPLACE "\t" ";" parts "${row}")
    list(GET parts 0 kind)
    list(GET parts 2 source)
    list(GET parts 3 reference)
    list(APPEND UNIT_ASM_SOURCES ${reference})
    if(kind STREQUAL "asm")
        # Assembled into the object the source would have produced, so the
        # linker script's placement never has to know which it was.
        list(APPEND WHOLE_UNIT_OBJS ${BUILD_DIR}/${source}.o)
        list(APPEND WHOLE_UNIT_REFS ${reference})
    else()
        list(APPEND CPP_SOURCES ${source})
    endif()
endforeach()
# Hand-written assembly, kept apart from what splat generates: the per-unit
# files it writes land in asm/ itself, and a glob over those would link every
# translation unit's reference assembly alongside the objects that already
# provide it.
file(GLOB EXTRA_ASM_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/asm/handwritten/*.s)

# The objects the compiled sources produce. Named here rather than where each
# is used because two steps want them: the linker script, whose literal pool
# symbols are read out of their symbol tables, and the provenance pass.
set(CPP_OBJS "")
foreach(src IN LISTS CPP_SOURCES)
    list(APPEND CPP_OBJS ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${src}.o)
endforeach()

# The checked-in configuration that names the split. splat writes several
# thousand files, and declaring each as an output makes the ninja manifest
# enormous for no gain. These files must remain inputs: Ninja deletes custom
# command outputs during clean, but disassemble.py reads and never creates the
# symbol tables.
# Nothing under asm/ or config/ may be a CMAKE_CONFIGURE_DEPENDS: a file that
# is both a configure input and a build output puts CMake and ninja in a loop
# ("manifest still dirty after 100 tries"). scripts/build/cmake.sh configures
# on every invocation, which is what picks a regenerated tree up.
set(REF_CONFIGS "")
foreach(section IN LISTS SECTIONS)
    list(APPEND REF_CONFIGS ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/${section}.symbols.txt)
    list(APPEND REF_CONFIGS ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/${section}.yaml)
endforeach()

set(ALL_OBJS "")
foreach(src IN LISTS ASM_SOURCES CPP_SOURCES EXTRA_ASM_SOURCES)
    list(APPEND ALL_OBJS ${BUILD_DIR}/${src}.o)
endforeach()
list(APPEND ALL_OBJS ${GENERATED_O_FILES} ${WHOLE_UNIT_OBJS})

set(LINK_ORDER "")
foreach(section IN LISTS SECTIONS)
    list(APPEND LINK_ORDER ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${section}_o_files)
endforeach()

# Appended after the address-ordered objects: the carved parts and the
# hand-written symbol definitions have no retail address to sort them by.
set(MAIN_TAIL ${GENERATED_O_FILES})
foreach(src IN LISTS EXTRA_ASM_SOURCES)
    list(APPEND MAIN_TAIL ${BUILD_DIR}/${src}.o)
endforeach()

# Ninja does not create custom-command output directories on its own.
make_object_dirs("${ALL_OBJS}")

foreach(obj IN LISTS ALL_OBJS)
    if(NOT obj IN_LIST WHOLE_UNIT_OBJS)
        add_object(${obj})
    endif()
endforeach()

# The units taken whole, each assembled from its reference rather than compiled.
list(LENGTH WHOLE_UNIT_OBJS whole_count)
if(whole_count GREATER 0)
    math(EXPR whole_last "${whole_count} - 1")
    foreach(i RANGE ${whole_last})
        list(GET WHOLE_UNIT_OBJS ${i} obj)
        list(GET WHOLE_UNIT_REFS ${i} ref)
        add_unit_asm_object(${obj} ${ref})
    endforeach()
endif()

#
# Linker command file
#
# The checked-in .lcf is a template: overlay placement is expanded at configure
# time, migrated-data placement at build time (it has to objdump each island).
#
set(OVERLAY_LCF ${BUILD_DIR}/${BASENAME}.overlays.lcf)
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
    ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE})
expand_overlay_markers(${CMAKE_SOURCE_DIR}/${LD_TEMPLATE}
                       ${CMAKE_SOURCE_DIR}/${OVERLAY_LCF})

migration_enabled(MIGRATION_ENABLED)
if(MIGRATION_ENABLED)
    set(GEN_LCF ${BUILD_DIR}/${BASENAME}.lcf)
    migrated_contrib_objs(LCF_CONTRIB_OBJS ${BUILD_DIR}/${SRC_DIR})

    add_custom_command(
        OUTPUT ${CMAKE_SOURCE_DIR}/${GEN_LCF}
        COMMAND ${CMAKE_COMMAND} -E env OBJDUMP=${OBJDUMP}
                ${PYTHON_CMD} ${SCRIPTS_DIR}/build/migrate.py --lcf ${OVERLAY_LCF}
                ${BUILD_DIR}/generated/main ${BUILD_DIR}/${SRC_DIR} ${GEN_LCF}
        # The compiled objects too: migrate.py reads the literal pool entries
        # they name out of their symbol tables and defines one symbol each, so
        # a source that starts using another entry has to regenerate the
        # script. scripts/build/literals.py is what puts those symbols there.
        DEPENDS ${CMAKE_SOURCE_DIR}/${OVERLAY_LCF}
                ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/migrate.py
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/literals.py
                ${GENERATED_PLAN_FILES} ${LCF_CONTRIB_OBJS} ${CPP_OBJS}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Generating ${GEN_LCF}"
        VERBATIM)
else()
    set(GEN_LCF ${OVERLAY_LCF})
endif()

#
# Link
#
# Every image takes its objects through a response file that layout.py
# wrote, so link order comes from the address index and the compiled objects
# rather than from anything checked in.
set(ABS_OBJS "")
foreach(obj IN LISTS ALL_OBJS)
    list(APPEND ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

overlay_link_args(OVERLAY_ARGS)
check_overlay_prefixes()

# Each overlay contributes an image to the link, a round-up of that image to
# the retail file boundary, and a file to verify. The linker writes the images
# itself, MWo3 header and all; see cmake/Overlays.cmake.
set(OVERLAY_BINS "")
set(PAD_COMMANDS "")
set(VERIFY_FILES ${OUTPUT})
foreach(name IN LISTS OVERLAYS)
    string(TOUPPER ${name} upper)
    list(APPEND OVERLAY_BINS ${CMAKE_BINARY_DIR}/${upper}.BIN)
    list(APPEND VERIFY_FILES ${BUILD_DIR}/${upper}.BIN)
    list(APPEND PAD_COMMANDS
        COMMAND truncate -s %${OVERLAY_FILE_ALIGN} ${BUILD_DIR}/${upper}.BIN)
endforeach()

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${OUTPUT} ${OVERLAY_BINS}
    COMMAND ${LD_MW} ${LD_MW_FLAGS} -o ${OUTPUT} ${GEN_LCF}
            @${BUILD_DIR}/main_o_files ${OVERLAY_ARGS}
    ${PAD_COMMANDS}
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${GEN_LCF} ${LINK_ORDER}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Linking ${OUTPUT} + overlays"
    VERBATIM)

add_custom_target(elf DEPENDS ${CMAKE_SOURCE_DIR}/${OUTPUT} ${OVERLAY_BINS})

#
# Symbol provenance
#
# Which symbols come from the decompiled C++ and which still come from the
# reference assembly, read from the objects themselves rather than any list.
# VERBOSE_PROVENANCE echoes every symbol instead of the one-line summary.
set(PROVENANCE ${BUILD_DIR}/symbol_provenance.txt)

# The link order and the provenance come out of the same pass. Neither reads a
# compiled object: the linker script says where each unit starts, so this
# depends on it and on the sources rather than on the four hundred objects it
# used to open.
add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${PROVENANCE} ${LINK_ORDER}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/layout.py
            --link-order ${BUILD_DIR} --provenance ${PROVENANCE}
            --build-dir ${BUILD_DIR} --main-tail ${MAIN_TAIL}
            --carved ${CARVED_SECTIONS} --lcf ${LD_TEMPLATE}
    # disassemble.py owns the section layout and the unit classification, so
    # the link order changes with it: which object a unit is taken from, and
    # where each whole-section dump lives.
    DEPENDS ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE} ${CPP_SOURCES}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/layout.py
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Resolving the layout"
    VERBATIM)

add_custom_target(provenance DEPENDS ${CMAKE_SOURCE_DIR}/${PROVENANCE})

#
# The compile flags, as a build artefact
#
# diff.sh --scratch sends these to decomp.me. Written out rather than copied
# into that script, so the two cannot drift.
string(JOIN " " CC_MW_FLAGS_TEXT ${CC_MW_FLAGS})
# file(GENERATE) rather than file(WRITE): it leaves the file alone when the
# content is unchanged, so it cannot make anything downstream look stale.
file(GENERATE OUTPUT ${CMAKE_BINARY_DIR}/compiler_flags.txt
     CONTENT "${CC_MW_FLAGS_TEXT}\n")

#
# m2c context
#
# m2c needs the project's declarations as one C file; built from every header
# so the same ctx.c serves any function. See scripts/diff/m2ctx.py.
#
# CONFIGURE_DEPENDS for the same reason as the source globs above: a header
# added while the objdiff GUI is running would otherwise not reach the context
# until someone reconfigured, and that rebuild deliberately skips configuring.
# The library directories too: m2ctx.py folds them in as well, so an edit to
# one has to regenerate the context.
file(GLOB CTX_HEADERS CONFIGURE_DEPENDS
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.hpp
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.h
     ${CMAKE_SOURCE_DIR}/${STD_INCLUDE_DIR}/*
     ${CMAKE_SOURCE_DIR}/${SCE_INCLUDE_DIR}/*)

# One command, two outputs: ctx.cpp is the amalgamated C++ and ctx.c is what
# clang re-emits from it, so they are always the same content either side of
# that step.
add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${CTX} ${CMAKE_SOURCE_DIR}/${CTX_CPP}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/diff/m2ctx.py -o ${CTX}
    DEPENDS ${CTX_HEADERS} ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/diff/m2ctx.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating m2c context"
    VERBATIM)

add_custom_target(ctx DEPENDS ${CMAKE_SOURCE_DIR}/${CTX} ${CMAKE_SOURCE_DIR}/${CTX_CPP})

#
# objdiff / decomp.dev
#
# objdiff.json pairs each retail function's reference object with whatever
# provides it now; scripts/build/layout.py derives it. A decompiled
# function's .s leaves the object lists, so those are assembled here for
# objdiff alone -- they are in no object list, so nothing links them.
execute_process(
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/build/layout.py --list-extra-objects
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE objdiff_extra_raw
    RESULT_VARIABLE objdiff_rc
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE)

set(OBJDIFF_TARGET_OBJS "")
if(objdiff_rc EQUAL 0 AND objdiff_extra_raw)
    string(REGEX REPLACE "[ \t\r\n]+" ";" objdiff_extra "${objdiff_extra_raw}")
    foreach(src IN LISTS objdiff_extra)
        list(APPEND OBJDIFF_TARGET_OBJS ${BUILD_DIR}/${src}.o)
    endforeach()

    # The base objdiff compares each unit against: the source on its own.
    # Only the units that have one -- a unit with nothing decompiled in it is
    # INCLUDE_ASM markers and nothing else, and compiling that produces an
    # empty object for objdiff to pair against nothing.
    set(OBJDIFF_BASE_OBJS "")
    foreach(src IN LISTS CPP_SOURCES)
        list(APPEND OBJDIFF_BASE_OBJS ${BUILD_DIR}/diff/${src}.o)
    endforeach()

    set(SYMBOL_ALIASES ${BUILD_DIR}/symbol_aliases.txt)
    make_object_dirs("${OBJDIFF_TARGET_OBJS};${OBJDIFF_BASE_OBJS}")
    set(ASM_OBJECT_EXTRA_DEPENDS ${CMAKE_SOURCE_DIR}/${SYMBOL_ALIASES})
    foreach(obj IN LISTS OBJDIFF_TARGET_OBJS)
        add_object(${obj})
    endforeach()

    list(LENGTH CPP_SOURCES base_count)
    if(base_count GREATER 0)
        math(EXPR base_last "${base_count} - 1")
        foreach(i RANGE ${base_last})
            list(GET CPP_SOURCES ${i} src)
            list(GET OBJDIFF_BASE_OBJS ${i} obj)
            add_diff_base_object(${obj} ${src})
        endforeach()
    endif()
    unset(ASM_OBJECT_EXTRA_DEPENDS)
endif()

# objdiff pairs a target object with a base by symbol name, so the per-function
# reference objects need the spelling MWCC emits for a templated symbol. Which
# symbols those are is only knowable from the compiled objects, so this reads
# them; scripts/build/fixup_sections.sh applies the result to the reference
# objects alone, and nothing that links is renamed.
add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${SYMBOL_ALIASES}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/disassemble.py
            --symbol-aliases ${SYMBOL_ALIASES} ${ALL_OBJS}
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Collecting templated symbol names for objdiff"
    VERBATIM)

set(OBJDIFF_CONFIG objdiff.json)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${OBJDIFF_CONFIG}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/layout.py
            --objdiff ${OBJDIFF_CONFIG} --build-dir ${BUILD_DIR}
            --lcf ${LD_TEMPLATE}
    DEPENDS ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE} ${CPP_SOURCES}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/layout.py
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating ${OBJDIFF_CONFIG}"
    VERBATIM)

set(OBJDIFF_ABS_OBJS "")
foreach(obj IN LISTS OBJDIFF_TARGET_OBJS OBJDIFF_BASE_OBJS)
    list(APPEND OBJDIFF_ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

# The objects and the config, but deliberately not `elf`: objdiff compares
# object files and never looks at the executable, so linking it -- and
# generating the linker script to do so -- is pure latency in the edit-save
# loop the GUI drives.
add_custom_target(objdiff
    DEPENDS ${CMAKE_SOURCE_DIR}/${OBJDIFF_CONFIG} ${OBJDIFF_ABS_OBJS} ${ABS_OBJS}
            ${CMAKE_SOURCE_DIR}/${SYMBOL_ALIASES})
add_dependencies(objdiff provenance)

#
# Verification
#
# USES_TERMINAL puts a step in Ninja's console pool so its progress appears as
# it happens. That pool runs one edge at a time, so it is only for the few
# steps slow enough to need it -- hashing DATA.DAT alone is 1.7GB.
add_custom_target(verify_extracted
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/verify.py -e
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)

# verify.py sorts every function into perfect, fuzzy and unmatched, and fails
# on an unmatched one or on any difference in data. A fuzzy function is one
# whose source declares FUZZY_MATCH: retail's instructions in retail's order,
# differing only in the registers the compiler picked.
add_custom_target(build ALL
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/verify.py -c
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
add_dependencies(build verify_extracted elf provenance ctx)

#
# ISO
#
# The disc's ELF is linked a second time without debug information: the main
# output keeps its symbols for compare_build.py, which makes it far too large
# for the sectors the retail file occupies. The links are otherwise identical.
set(ISO_ELF ${BUILD_DIR}/nodebug/${BASENAME})

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${ISO_ELF}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUILD_DIR}/nodebug
    COMMAND ${LD_MW} ${LD_MW_ISO_FLAGS} -o ${ISO_ELF} ${GEN_LCF}
            @${BUILD_DIR}/main_o_files ${OVERLAY_ARGS}
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${GEN_LCF} ${LINK_ORDER}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Linking ${ISO_ELF} (no debug info)"
    VERBATIM)

# A fresh image is mastered from the extracted disc with the built files put in
# place of their retail counterparts, so a built file may be any size.
add_custom_command(
    OUTPUT "${CMAKE_SOURCE_DIR}/${BUILT_ISO}"
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/make_iso.py
            --source "${RETAIL_ISO}" --tree ${ROM_DIR}/extracted/iso
            --out "${BUILT_ISO}"
            ${ISO_ELF} ${BUILD_DIR}/TITLE.BIN ${BUILD_DIR}/DUN.BIN
    DEPENDS ${CMAKE_SOURCE_DIR}/${ISO_ELF} ${OVERLAY_BINS}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/make_iso.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Mastering ${BUILT_ISO}"
    USES_TERMINAL
    VERBATIM)

# Deliberately not tied to the verification target: booting a build that does
# not match retail yet is exactly what the emulator is useful for.
add_custom_target(iso DEPENDS "${CMAKE_SOURCE_DIR}/${BUILT_ISO}")

#
# Run
#
# PCSX2 needs a display, so this is for a native toolchain; use run.sh
# otherwise, which builds in the container and launches the emulator outside.
add_custom_target(run
    COMMAND ${SCRIPTS_DIR}/host/pcsx2.sh "${BUILT_ISO}"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
add_dependencies(run iso)

#
# Setup
#
# Three steps with real outputs rather than one target that redoes all of
# them, so ninja skips whichever are already done. The checksum has no natural
# output and leaves a stamp; the others are named by one file each.
set(STAMP_DIR ${BUILD_DIR}/stamps)
set(ROM_VERIFIED ${STAMP_DIR}/rom.verified)
set(DISASSEMBLE_STAMP ${STAMP_DIR}/disassembled)
set(EXTRACTED_ELF ${ROM_DIR}/extracted/iso/${BASENAME})

# Only when there is a disc to set up from. A checkout without one -- CI --
# builds against the committed asm/, where these dumps are ordinary sources
# with no rule behind them.
# Splitting the disc, defined once and used by both `setup` and `disassemble`.
# The configuration splat runs against is checked in under config/; this only
# runs splat and fixes up what splat cannot express.
set(SPLIT_COMMANDS
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/disassemble.py --config ${CONFIG_DIR})

if(EXISTS "${CMAKE_SOURCE_DIR}/${RETAIL_ISO}")

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${ROM_VERIFIED}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${STAMP_DIR}
    COMMAND ${CMAKE_COMMAND} -E chdir ${ROM_DIR} sha256sum -c checksum.sha256
    COMMAND ${CMAKE_COMMAND} -E touch ${ROM_VERIFIED}
    DEPENDS "${CMAKE_SOURCE_DIR}/${RETAIL_ISO}"
            ${CMAKE_SOURCE_DIR}/${ROM_DIR}/checksum.sha256
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Checking the retail disc image"
    USES_TERMINAL
    VERBATIM)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${EXTRACTED_ELF}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/extract.py
    DEPENDS ${CMAKE_SOURCE_DIR}/${ROM_VERIFIED}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/extract.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Extracting the disc"
    USES_TERMINAL
    VERBATIM)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${DISASSEMBLE_STAMP}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${STAMP_DIR}
    ${SPLIT_COMMANDS}
    COMMAND ${CMAKE_COMMAND} -E touch ${DISASSEMBLE_STAMP}
    DEPENDS ${CMAKE_SOURCE_DIR}/${EXTRACTED_ELF}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
            ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE}
            ${REF_CONFIGS}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Splitting the disc with splat"
    USES_TERMINAL
    VERBATIM)

add_custom_target(setup DEPENDS ${CMAKE_SOURCE_DIR}/${DISASSEMBLE_STAMP})

else()

add_custom_target(setup
    COMMAND ${CMAKE_COMMAND} -E echo
            "No disc image; building against the committed asm/."
    VERBATIM)

endif()

add_custom_target(disassemble
    ${SPLIT_COMMANDS}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${STAMP_DIR}
    COMMAND ${CMAKE_COMMAND} -E touch ${DISASSEMBLE_STAMP}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
