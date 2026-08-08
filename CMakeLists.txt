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
set(REF_DIR ref)

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
# to the "" list. Pointing it at include/std is what makes `#include <cstring>`
# resolve to this project's declarations of the C functions retail carried.
set(STD_INCLUDE_DIR ${INCLUDE_DIR}/std)
set(CC_MW ${CMAKE_COMMAND} -E env MWCIncludes=${STD_INCLUDE_DIR} wibo ${MW}mwccmips.exe)
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
set(CC_MW_FLAGS -O2 -c -Cpp_exceptions off -strings readonly -i include)
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

# CONFIGURE_DEPENDS so a newly added source is picked up without anyone having
# to remember to reconfigure: ninja re-evaluates the glob each build and only
# re-runs CMake when the set of files actually changed. That matters for the
# objdiff GUI, whose rebuild deliberately skips configuring.
# GLOB_RECURSE: the overlays have a directory each and the library translation
# units are filed under src/lib/ by the library they came out of. Both
# extensions: the game's own code is C++, and everything under src/lib/ -- the
# SDK, newlib, libgcc -- is C.
file(GLOB_RECURSE CPP_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR}
     ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.cpp ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.c)
file(GLOB EXTRA_ASM_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/asm/*.s)

# Everything disassemble.py writes, declared as that step's outputs so ninja
# orders the assemble steps after it. Nothing under ref/ may be a
# CMAKE_CONFIGURE_DEPENDS as a result: a file that is both a configure input
# and a build output puts CMake and ninja in a loop ("manifest still dirty
# after 100 tries"). scripts/build/cmake.sh configures on every invocation,
# which is what picks a regenerated ref/ up. Without this the .s look like plain
# sources, and a re-disassembly runs concurrently with the four thousand jobs
# reading the files it is rewriting.
set(REF_OUTPUTS "")
foreach(section IN LISTS SECTIONS)
    read_index_sources(${section} all_index_srcs "")
    foreach(src IN LISTS all_index_srcs)
        list(APPEND REF_OUTPUTS ${CMAKE_SOURCE_DIR}/${src})
    endforeach()
    list(APPEND REF_OUTPUTS ${CMAKE_SOURCE_DIR}/${REF_DIR}/asm/objects/${section}.index)
endforeach()
list(REMOVE_DUPLICATES REF_OUTPUTS)

# Where the per-function and per-constant dumps live. An INCLUDE_ASM or
# INCLUDE_RODATA marker names a symbol, and tools/mwccgap turns that name
# straight into a path under here -- the dumps are named for the whole of their
# symbol, so no table or link farm sits in between.
set(ASM_DIR ${REF_DIR}/asm/split)

set(ALL_OBJS "")
foreach(src IN LISTS ASM_SOURCES CPP_SOURCES EXTRA_ASM_SOURCES)
    list(APPEND ALL_OBJS ${BUILD_DIR}/${src}.o)
endforeach()
list(APPEND ALL_OBJS ${GENERATED_O_FILES})

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
    add_object(${obj})
endforeach()

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
        DEPENDS ${CMAKE_SOURCE_DIR}/${OVERLAY_LCF}
                ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/migrate.py
                ${GENERATED_PLAN_FILES} ${LCF_CONTRIB_OBJS}
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

set(CPP_OBJS "")
foreach(src IN LISTS CPP_SOURCES)
    list(APPEND CPP_OBJS ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${src}.o)
endforeach()

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
    DEPENDS ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE} ${CPP_SOURCES}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/layout.py
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
file(GLOB CTX_HEADERS CONFIGURE_DEPENDS
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.hpp
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.h)

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

    make_object_dirs("${OBJDIFF_TARGET_OBJS}")
    foreach(obj IN LISTS OBJDIFF_TARGET_OBJS)
        add_object(${obj})
    endforeach()
endif()

set(OBJDIFF_CONFIG objdiff.json)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${OBJDIFF_CONFIG}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/layout.py
            --objdiff ${OBJDIFF_CONFIG} --build-dir ${BUILD_DIR}
            --lcf ${LD_TEMPLATE}
    DEPENDS ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE} ${CPP_SOURCES}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/layout.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating ${OBJDIFF_CONFIG}"
    VERBATIM)

set(OBJDIFF_ABS_OBJS "")
foreach(obj IN LISTS OBJDIFF_TARGET_OBJS)
    list(APPEND OBJDIFF_ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

# The objects and the config, but deliberately not `elf`: objdiff compares
# object files and never looks at the executable, so linking it -- and
# generating the linker script to do so -- is pure latency in the edit-save
# loop the GUI drives.
add_custom_target(objdiff
    DEPENDS ${CMAKE_SOURCE_DIR}/${OBJDIFF_CONFIG} ${OBJDIFF_ABS_OBJS} ${ABS_OBJS})
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

# verify.py decides per file how much of it has to match: the executable over
# its code/data span, the overlays byte for byte.
add_custom_target(build ALL
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/verify.py -f ${VERIFY_FILES}
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
set(EXTRACTED_ELF ${ROM_DIR}/extracted/iso/${BASENAME})
set(REF_INDEX ${REF_DIR}/asm/objects/main.index)

# Only when there is a disc to set up from. A checkout without one -- CI --
# builds against the committed ref/, where these dumps are ordinary sources
# with no rule behind them.
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

# Every dump it writes is an output, not just the index it is named by.
add_custom_command(
    OUTPUT ${REF_OUTPUTS}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/disassemble.py
    DEPENDS ${CMAKE_SOURCE_DIR}/${EXTRACTED_ELF}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/verify.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Disassembling the disc"
    USES_TERMINAL
    VERBATIM)

add_custom_target(setup DEPENDS ${CMAKE_SOURCE_DIR}/${REF_INDEX})

else()

add_custom_target(setup
    COMMAND ${CMAKE_COMMAND} -E echo
            "No disc image; building against the committed ref/."
    VERBATIM)

endif()

add_custom_target(disassemble
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
