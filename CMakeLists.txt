cmake_minimum_required(VERSION 3.20)
project(dcdecomp NONE)

# The build has five stages, each with its own target:
#
#   setup        extract the retail ISO and disassemble it into ref/
#   <objects>    re-assemble the still-unmatched .s files, compile the
#                matched .c/.cpp files (both with the MW toolchain)
#   elf          link everything with MWLD into the main ELF and the
#                TITLE.BIN / DUN.BIN overlays
#   iso          write the built files back into a copy of the retail ISO
#   run          boot that ISO in PCSX2
#
# `build` (the default target) does everything up to and including `elf` and
# then verifies the results against the retail hashes.

set(BASENAME SCUS_971.11)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(ObjectLists)
include(Overlays)
include(Migration)

# Directories
set(SRC_DIR src)
set(TOOLS_DIR tools)
set(SCRIPTS_DIR scripts)
set(ROM_DIR rom)
set(REF_DIR ref)

# Every tool runs from the source root and is given source-relative paths, so
# the objects record the same paths the Makefile build produced. BUILD_DIR is
# the binary directory expressed the same way.
file(RELATIVE_PATH BUILD_DIR ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})

# Build tools
set(PRODG "$ENV{PRODG}" CACHE PATH "ProDG installation root")
if(NOT PRODG)
    message(FATAL_ERROR "PRODG is not set; point it at the ProDG installation root")
endif()

set(EE ${PRODG}/ee/gcc/bin/ee-)
set(MW ${TOOLS_DIR}/compilers/mw/2.3.1.01/)
set(PS2DEV mips64r5900el-ps2-elf-)
set(CC_MW wibo ${MW}mwccmips.exe)
set(LD_MW wibo ${MW}mwldmips.exe)
set(AS_PRODG wibo ${EE}as.exe)
set(OBJCOPY ${PS2DEV}objcopy)
set(OBJDUMP ${PS2DEV}objdump)
# HINTS are searched before PATH, so the container's virtualenv wins: the
# system python3 is missing pycdlib and the disassembler packages, and the
# image puts the venv at the end of PATH.
find_program(PYTHON NAMES python3 python REQUIRED HINTS $ENV{VIRTUAL_ENV}/bin)

# Files
set(LD_TEMPLATE ${BASENAME}.lcf)
set(OUTPUT ${BUILD_DIR}/${BASENAME})
set(RETAIL_ISO "${ROM_DIR}/Dark Cloud (USA).iso")
set(BUILT_ISO "${BUILD_DIR}/Dark Cloud (Build).iso")

# Compiler flags
set(AS_FLAGS -c -EL -mcpu=5900 -32 -g2 -non_shared -G0 -I include)
set(CC_MW_FLAGS -O2 -c -Cpp_exceptions off -strings readonly -i include -g)
set(LD_MW_FLAGS -map -nostdlib -m _start -nodead -g)
# `-sym on,noelf` keeps the relocations resolved but drops the symbol table and
# section headers, leaving just the loadable image the console needs.
set(LD_MW_ISO_FLAGS -nostdlib -m _start -nodead -sym on,noelf)
set(BIN_FLAGS -B mips:5900 -I binary -O elf32-littlemips)

read_obj_list(main_obj_files.mk MAIN_O_FILES)
read_obj_list(title_obj_files.mk TITLE_O_FILES)
read_obj_list(dun_obj_files.mk DUN_O_FILES)
read_obj_list(additional_obj_files.mk ADDITIONAL_O_FILES)

# Data migration: as global data symbols get decompiled into real, typed C/C++
# translation units, their bytes are carved out of copies of the monolithic
# reference section dumps (never the ref/ dumps themselves) and the compiled
# objects that now supply them are placed exactly into the resulting holes, so
# every other symbol keeps its retail address. The carving, the split at island
# boundaries, the object list and the linker-script placement are all derived
# from asm/migrated_symbols.txt. See docs/RE/migrated_data_layout.md.
add_migrated_sections(GENERATED_S_FILES GENERATED_PLAN_FILES)

# Generated data-section objects stay ahead of ADDITIONAL_O_FILES, matching the
# link order they had when hand-listed at the tail of main_obj_files.mk.
set(GENERATED_O_FILES "")
foreach(s IN LISTS GENERATED_S_FILES)
    list(APPEND GENERATED_O_FILES ${s}.o)
endforeach()
set(MAIN_OBJS ${MAIN_O_FILES} ${GENERATED_O_FILES} ${ADDITIONAL_O_FILES})

# The overlays' objects are passed after their -overlay option instead of in
# the main response file, but they are still built the same way.
set(ALL_OBJS ${MAIN_OBJS} ${TITLE_O_FILES} ${DUN_O_FILES})

# Ninja does not create custom-command output directories on its own.
make_object_dirs("${ALL_OBJS}")

foreach(obj IN LISTS ALL_OBJS)
    add_object(${obj})
endforeach()

#
# Linker command file
#
# The checked-in .lcf is a template. Overlay placement is expanded into it here
# at configure time (it only depends on the object lists, which the setup stage
# regenerates); migrated-data placement is expanded at build time, because it
# has to objdump the compiled objects to size each island.
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
                ${PYTHON} ${SCRIPTS_DIR}/gen_lcf.py ${OVERLAY_LCF}
                ${BUILD_DIR}/generated/main ${BUILD_DIR}/${SRC_DIR} ${GEN_LCF}
        DEPENDS ${CMAKE_SOURCE_DIR}/${OVERLAY_LCF}
                ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/gen_lcf.py
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
# mwld takes the main application's objects via a response file; link order is
# significant. The overlays come out of this same command, and their MWo3
# headers are stamped on immediately afterwards.
list(JOIN MAIN_OBJS " " O_FILES_CONTENT)
file(GENERATE OUTPUT ${CMAKE_BINARY_DIR}/o_files CONTENT "${O_FILES_CONTENT}\n")

set(ABS_OBJS "")
foreach(obj IN LISTS ALL_OBJS)
    list(APPEND ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

overlay_link_args(OVERLAY_ARGS)
check_overlay_prefixes()

# Each overlay contributes an image to the link, a header-stamping step after
# it, and a file to verify. Overlay ids are 1-based and follow declaration
# order, matching the order the -overlay options are passed in.
set(OVERLAY_BINS "")
set(STAMP_COMMANDS "")
set(VERIFY_FILES ${OUTPUT})
set(overlay_id 0)
foreach(name IN LISTS OVERLAYS)
    math(EXPR overlay_id "${overlay_id} + 1")
    string(TOUPPER ${name} upper)
    list(APPEND OVERLAY_BINS ${CMAKE_BINARY_DIR}/${upper}.BIN)
    list(APPEND VERIFY_FILES ${BUILD_DIR}/${upper}.BIN)
    list(APPEND STAMP_COMMANDS
        COMMAND ${PYTHON} ${SCRIPTS_DIR}/mwo3.py --elf ${OUTPUT}
                --name ${name} --id ${overlay_id} ${BUILD_DIR}/${upper}.BIN)
endforeach()

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${OUTPUT} ${OVERLAY_BINS}
    COMMAND ${LD_MW} ${LD_MW_FLAGS} -o ${OUTPUT} ${GEN_LCF}
            @${BUILD_DIR}/o_files ${OVERLAY_ARGS}
    ${STAMP_COMMANDS}
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${GEN_LCF} ${CMAKE_BINARY_DIR}/o_files
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/mwo3.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Linking ${OUTPUT} + overlays"
    VERBATIM)

add_custom_target(elf DEPENDS ${CMAKE_SOURCE_DIR}/${OUTPUT} ${OVERLAY_BINS})

#
# Verification
#
add_custom_target(verify_extracted
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/verify.py -e
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)

# verify.py decides per file how much of it has to match: the executable over
# its code/data span, the overlays byte for byte.
add_custom_target(build ALL
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/verify.py -f ${VERIFY_FILES}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)
add_dependencies(build verify_extracted elf)

#
# ISO
#
# The ELF that goes on the disc is linked a second time without debugging
# information. The main output keeps its symbols -- asm-differ needs them, and
# so does the overlay header stamping -- but that makes it far larger than the
# retail file, which has to fit back into the sectors the retail file occupies.
# Everything else about the two links is identical -- including the overlay
# files it drops beside the ELF, which are the same images without their
# headers stamped on, and are not what ends up on the disc.
set(ISO_ELF ${BUILD_DIR}/nodebug/${BASENAME})

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${ISO_ELF}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUILD_DIR}/nodebug
    COMMAND ${LD_MW} ${LD_MW_ISO_FLAGS} -o ${ISO_ELF} ${GEN_LCF}
            @${BUILD_DIR}/o_files ${OVERLAY_ARGS}
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${GEN_LCF} ${CMAKE_BINARY_DIR}/o_files
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Linking ${ISO_ELF} (no debug info)"
    VERBATIM)

# A fresh image is mastered from the extracted disc with the built files put in
# place of their retail counterparts, so a built file may be any size.
add_custom_command(
    OUTPUT "${CMAKE_SOURCE_DIR}/${BUILT_ISO}"
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/make_iso.py
            --source "${RETAIL_ISO}" --tree ${ROM_DIR}/extracted/iso
            --out "${BUILT_ISO}"
            ${ISO_ELF} ${BUILD_DIR}/TITLE.BIN ${BUILD_DIR}/DUN.BIN
    DEPENDS ${CMAKE_SOURCE_DIR}/${ISO_ELF} ${OVERLAY_BINS}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/make_iso.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Mastering ${BUILT_ISO}"
    VERBATIM)

# Deliberately not tied to the verification target: booting a build that does
# not match retail yet is exactly what the emulator is useful for.
add_custom_target(iso DEPENDS "${CMAKE_SOURCE_DIR}/${BUILT_ISO}")

#
# Run
#
# PCSX2 needs a display, so this only works outside the build container. Use
# run.sh instead, which builds in the container and then launches the
# emulator on the host; this target is for a native toolchain.
add_custom_target(run
    COMMAND ${SCRIPTS_DIR}/pcsx2.sh "${BUILT_ISO}"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
add_dependencies(run iso)

#
# Setup
#
# asm-differ resolves the expected file as <expected_dir>/<our path>, so it
# looks for rom/extracted/build/... ; the symlink points that at the extracted
# disc. It is relative on purpose, so it resolves both on the host and at
# whatever path the container mounts the tree on.
add_custom_target(setup
    COMMAND sha256sum -c checksum.sha256
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR} ${PYTHON} ${SCRIPTS_DIR}/extract.py
    COMMAND ${CMAKE_COMMAND} -E create_symlink
            iso ${CMAKE_SOURCE_DIR}/rom/extracted/build
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR} ${PYTHON} ${SCRIPTS_DIR}/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/${ROM_DIR}
    VERBATIM)

add_custom_target(disassemble
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)
