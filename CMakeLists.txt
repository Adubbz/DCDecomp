cmake_minimum_required(VERSION 3.20)
project(dcdecomp NONE)

set(BASENAME SCUS_971.11)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(ObjectLists)
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
find_program(PYTHON NAMES python3 python REQUIRED)

# Files
set(LD_SCRIPT ${BASENAME}.lcf)
set(OUTPUT ${BUILD_DIR}/${BASENAME})

# Compiler flags
set(AS_FLAGS -c -EL -mcpu=5900 -32 -g2 -non_shared -G0 -I include)
set(CC_MW_FLAGS -O2 -c -Cpp_exceptions off -strings readonly -i include -g)
set(LD_MW_FLAGS -map -nostdlib -m _start -nodead -g)
set(BIN_FLAGS -B mips:5900 -I binary -O elf32-littlemips)

# TODO: title/dun object lists are not linked yet.
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
set(ALL_OBJS ${MAIN_O_FILES} ${GENERATED_O_FILES} ${ADDITIONAL_O_FILES})

# Ninja does not create custom-command output directories on its own.
make_object_dirs("${ALL_OBJS}")

foreach(obj IN LISTS ALL_OBJS)
    add_object(${obj})
endforeach()

# The final linker command file is generated from the checked-in template by
# expanding its `// @MIGRATE <section>` markers, computing each island's
# alignment padding from the real objects' section sizes via objdump.
migration_enabled(MIGRATION_ENABLED)
if(MIGRATION_ENABLED)
    set(GEN_LCF ${BUILD_DIR}/${BASENAME}.lcf)
    migrated_contrib_objs(LCF_CONTRIB_OBJS ${BUILD_DIR}/${SRC_DIR})

    add_custom_command(
        OUTPUT ${CMAKE_SOURCE_DIR}/${GEN_LCF}
        COMMAND ${CMAKE_COMMAND} -E env OBJDUMP=${OBJDUMP}
                ${PYTHON} ${SCRIPTS_DIR}/gen_lcf.py ${LD_SCRIPT}
                ${BUILD_DIR}/generated/main ${BUILD_DIR}/${SRC_DIR} ${GEN_LCF}
        DEPENDS ${CMAKE_SOURCE_DIR}/${LD_SCRIPT}
                ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/gen_lcf.py
                ${GENERATED_PLAN_FILES} ${LCF_CONTRIB_OBJS}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Generating ${GEN_LCF}"
        VERBATIM)
else()
    set(GEN_LCF ${LD_SCRIPT})
endif()

# mwld takes the object list via a response file; link order is significant.
list(JOIN ALL_OBJS " " O_FILES_CONTENT)
file(GENERATE OUTPUT ${CMAKE_BINARY_DIR}/o_files CONTENT "${O_FILES_CONTENT}\n")

set(ABS_OBJS "")
foreach(obj IN LISTS ALL_OBJS)
    list(APPEND ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${OUTPUT}
    COMMAND ${LD_MW} ${LD_MW_FLAGS} -o ${OUTPUT} ${GEN_LCF} @${BUILD_DIR}/o_files
    DEPENDS ${ABS_OBJS} ${CMAKE_SOURCE_DIR}/${GEN_LCF} ${CMAKE_BINARY_DIR}/o_files
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Linking ${OUTPUT}"
    VERBATIM)

add_custom_target(elf DEPENDS ${CMAKE_SOURCE_DIR}/${OUTPUT})

add_custom_target(verify_extracted
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/verify.py -e
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)

add_custom_target(build ALL
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/verify.py -p -f ${OUTPUT}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)
add_dependencies(build verify_extracted elf)

# We create a symlink for asm-differ to resolve the correct expected file.
add_custom_target(setup
    COMMAND sha256sum -c checksum.sha256
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR} ${PYTHON} ${SCRIPTS_DIR}/extract.py
    COMMAND ${CMAKE_COMMAND} -E create_symlink
            ${CMAKE_SOURCE_DIR}/rom/extracted/iso ${CMAKE_SOURCE_DIR}/rom/extracted/build
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR} ${PYTHON} ${SCRIPTS_DIR}/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/${ROM_DIR}
    VERBATIM)

add_custom_target(disassemble
    COMMAND ${PYTHON} ${SCRIPTS_DIR}/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    VERBATIM)
