cmake_minimum_required(VERSION 3.20)
project(dcdecomp NONE)

# The default target builds and verifies the executable.

set(BASENAME SCUS_971.11)

set(SECTIONS main title dun)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(ObjectLists)
include(Overlays)

set(SRC_DIR src)
set(INCLUDE_DIR include)
set(TOOLS_DIR tools)
set(SCRIPTS_DIR scripts)
set(ROM_DIR rom)
set(ASM_DIR asm)
set(ASM_DATA_DIR ${ASM_DIR}/data)
set(CONFIG_DIR config)
set(REF_INDEX ${CONFIG_DIR}/main.symbols.txt)
if(EXISTS ${CMAKE_SOURCE_DIR}/${REF_INDEX})
    set(REF_STAMP ${CMAKE_SOURCE_DIR}/${REF_INDEX})
else()
    set(REF_STAMP "")
endif()

set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/main.yaml
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/title.yaml
    ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/dun.yaml)

file(RELATIVE_PATH BUILD_DIR ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})

set(MIPS_TOOL_PREFIX mips-ps2-decompals-
    CACHE STRING "Prefix of the binutils-mips-ps2-decompals tools")

set(MW ${TOOLS_DIR}/compilers/mw/2.3.3/)
# MWCIncludes supplies the compiler's system-header search path.
set(STD_INCLUDE_DIR ${INCLUDE_DIR}/std)
set(SCE_INCLUDE_DIR ${INCLUDE_DIR}/sce)
set(LIB_INCLUDE_DIRS "${STD_INCLUDE_DIR}\;${SCE_INCLUDE_DIR}")
set(CC_MW ${CMAKE_COMMAND} -E env MWCIncludes=${LIB_INCLUDE_DIRS} wibo ${MW}mwccmips.exe)
set(LD_MW wibo ${MW}mwldmips.exe)
set(AS ${MIPS_TOOL_PREFIX}as)
set(OBJCOPY ${MIPS_TOOL_PREFIX}objcopy)
set(OBJDUMP ${MIPS_TOOL_PREFIX}objdump)
find_program(PYTHON NAMES python3 python REQUIRED HINTS $ENV{VIRTUAL_ENV}/bin)

set(PYTHON_CMD ${PYTHON} -u)

set(LD_TEMPLATE ${BASENAME}.lcf)
set(OUTPUT ${BUILD_DIR}/${BASENAME})
set(RETAIL_ISO "${ROM_DIR}/Dark Cloud (USA).iso")
set(BUILT_ISO "${BUILD_DIR}/Dark Cloud (Build).iso")
set(CTX ${BUILD_DIR}/ctx.c)
set(CTX_CPP ${BUILD_DIR}/ctx.cpp)

set(AS_FLAGS -EL -march=r5900 -mabi=eabi -g -mno-pdr -non_shared -G0 -I include)
set(CC_MW_FLAGS -O2 -c -Cpp_exceptions off -RTTI off -strings readonly
    -pragma "divbyzerocheck on" -i include)
set(LD_MW_FLAGS -map -nostdlib -m _start -nodead -g)
set(LD_MW_ISO_FLAGS -nostdlib -m _start -nodead -sym on,noelf)
set(BIN_FLAGS -B mips:5900 -I binary -O elf32-littlemips)

# Decompiled globals replace these retail section dumps.
set(REPLACED_SECTIONS main.bss main.data main.rdata main.sbss main.sdata
                      title.data title.bss dun.data)

set(ASM_SOURCES "")
foreach(section IN LISTS SECTIONS)
    read_index_sources(${section} section_srcs "${REPLACED_SECTIONS}")
    list(APPEND ASM_SOURCES ${section_srcs})
endforeach()
file(GLOB STATIC_SECTION_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR}
     ${CMAKE_SOURCE_DIR}/${ASM_DATA_DIR}/main/parts/*.s)
# A residual dump that a decompiled unit now owns part of is carved into the
# runs the unit leaves behind. The cuts are addresses rather than symbol names
# because a compiler-generated constant has no name to key on.
set(CARVED_PART_SOURCES "")
set(CARVED_PART_OUTPUTS "")
function(carve_part part)
    set(input ${ASM_DATA_DIR}/main/parts/${part})
    set(outputs "")
    set(specs "")
    set(relatives "")
    foreach(spec IN LISTS ARGN)
        string(REPLACE "=" ";" fields "${spec}")
        list(GET fields 0 name)
        list(GET fields 1 span)
        string(REPLACE "-" ";" bounds "${span}")
        list(GET bounds 0 low)
        list(GET bounds 1 high)
        set(relative generated/${ASM_DATA_DIR}/main/parts/${name})
        list(APPEND relatives ${relative})
        list(APPEND outputs ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${relative})
        list(APPEND specs ${BUILD_DIR}/${relative}:${low}-${high})
    endforeach()
    add_custom_command(
        OUTPUT ${outputs}
        COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/carve_part.py ${input} ${specs}
        DEPENDS ${CMAKE_SOURCE_DIR}/${input}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/carve_part.py
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Carving ${part} around its decompiled units"
        VERBATIM)
    list(REMOVE_ITEM STATIC_SECTION_SOURCES ${input})
    set(STATIC_SECTION_SOURCES ${STATIC_SECTION_SOURCES} PARENT_SCOPE)
    set(CARVED_PART_SOURCES ${CARVED_PART_SOURCES} ${relatives} PARENT_SCOPE)
endfunction()

# The overlays' dumps are carved the same way, but their parts are named in
# the overlay's own linker section rather than appended to main.
set(OVERLAY_TAIL "")
function(carve_dump image dump)
    set(input ${ASM_DATA_DIR}/${image}/${dump})
    set(outputs "")
    set(specs "")
    foreach(spec IN LISTS ARGN)
        string(REPLACE "=" ";" fields "${spec}")
        list(GET fields 0 name)
        list(GET fields 1 span)
        string(REPLACE "-" ";" bounds "${span}")
        list(GET bounds 0 low)
        list(GET bounds 1 high)
        set(relative generated/${ASM_DATA_DIR}/${image}/${name})
        list(APPEND outputs ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${relative})
        list(APPEND specs ${BUILD_DIR}/${relative}:${low}-${high})
        list(APPEND CARVED_DUMP_SOURCES ${relative})
        list(APPEND OVERLAY_TAIL ${image}=${BUILD_DIR}/${relative}.o)
    endforeach()
    add_custom_command(
        OUTPUT ${outputs}
        COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/carve_part.py ${input} ${specs}
        DEPENDS ${CMAKE_SOURCE_DIR}/${input}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/carve_part.py
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "Carving ${image}/${dump} around its decompiled units"
        VERBATIM)
    set(CARVED_DUMP_SOURCES ${CARVED_DUMP_SOURCES} PARENT_SCOPE)
    set(OVERLAY_TAIL ${OVERLAY_TAIL} PARENT_SCOPE)
endfunction()

set(CARVED_DUMP_SOURCES "")
# The dun overlay is one unit, and the templates its local array initialisers
# emit stand between the globals the dump still supplies, so the dump is cut
# into the four runs the unit leaves behind.
carve_dump(dun data.data.s
           dun.data.part1.s=1DC1B00-1DC1B20
           dun.data.part2.s=1DC1B60-1DC26D0
           dun.data.part3.s=1DC2810-1DC2820
           dun.data.part4.s=1DC2940-1DC2980)

carve_part(main.data.part1.s
           main.data.part1.s=24FAC0-250B30
           main.data.part1b.s=250EB0-250F40)
carve_part(main.data.part2.s
           main.data.part2.s=2514C0-251580
           main.data.part2c.s=251C50-253F20)
# Retail's vtables come out in one run that alternates between the units that
# now own theirs and the dump that still holds the rest, so the dump is cut
# around each owned block rather than having the block removed from it.
carve_part(main.rdata.part1.s
           main.rdata.part1.s=29FE80-29FF40)
carve_part(main.rdata.part2.s
           main.rdata.part2.s=2A00B0-2A1014)
# .sdata: the same interleaving, one datum at a time.
carve_part(main.sdata.part1.s
           main.sdata.part1.s=2A1E88-2A1E8C)
carve_part(main.sdata.part2.s
           main.sdata.part2.s=2A1E98-2A1EC0)
carve_part(main.sdata.part2b.s
           main.sdata.part2b.s=2A1ED0-2A1F14
           main.sdata.part2c.s=2A1F18-2A1F24
           main.sdata.part2d.s=2A1F50-2A2218)
carve_part(main.sdata.part3.s
           main.sdata.part3.s=2A22E0-2A2380)
# .sbss: the same again, one unit's run at a time.
carve_part(main.bss.part1.s
           main.bss.part1.s=2A3709-2AA010
           main.bss.part1b.s=2AB010-2AB030)
carve_part(main.bss.part3.s
           main.bss.part3.s=1C7A6B8-1C7A6C0)
# gameutil.cpp's own run stands in the middle of this one.
carve_part(main.bss.part4.s
           main.bss.part4.s=1CE7570-1CECE80
           main.bss.part4d.s=1CECF00-1CF8F40)
# edit.cpp's own runs stand in the middle of these two.
carve_part(main.bss.part4b.s
           main.bss.part4b.s=1CF91F0-1D19720
           main.bss.part4c.s=1D19AA0-1D19BF0)
carve_part(main.bss.part5.s
           main.bss.part5.s=1D1B218-1D3D1C0
           main.bss.part5b.s=1D3D1D0-1D569A0)
carve_part(main.sbss.part3.s
           main.sbss.part3.s=2A24FC-2A2500)
# The dun overlay's small data runs from GameEnv to the end of retail's .sbss,
# and the unit supplies all of it, so the dump stops in front of it.
carve_part(main.sbss.part5b.s
           main.sbss.part5b.s=2A2FD8-2A2FE4
           main.sbss.part5d.s=2A33A0-2A33A4)
carve_part(main.sbss.part4b.s
           main.sbss.part4b.s=2A25B8-2A2740
           main.sbss.part4c.s=2A27AC-2A29F8
           main.sbss.part4d.s=2A2A04-2A2BF0)
carve_part(main.rdata.part4.s
           main.rdata.part4.s=2A1100-2A1130
           main.rdata.part4b.s=2A1168-2A11E0)
carve_part(main.data.part4.s
           main.data.part4.s=25DF70-266810
           main.data.part4b.s=2668C0-266F70
           main.data.part4c.s=266FB0-279EB0)

# These residual ranges are now fully owned by their decompiled translation
# units. Keep the retail dumps intact as toolchain inputs, but do not assemble
# them into the reconstructed executable.
list(REMOVE_ITEM STATIC_SECTION_SOURCES
     ${ASM_DATA_DIR}/title/data.data.s
     ${ASM_DATA_DIR}/title/bss.bss.s
     ${ASM_DATA_DIR}/main/parts/main.bss.part2b.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part1.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part1b.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part2.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part6.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part7.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part8.s
     ${ASM_DATA_DIR}/main/parts/main.sbss.part9.s)

# fish.cpp now owns the complete fish data run at 0x296050-0x2965C0.
list(REMOVE_ITEM STATIC_SECTION_SOURCES
     ${ASM_DATA_DIR}/main/parts/main.data.part7.s)

set(FILTERED_SBSS_PART1 generated/asm/data/main/parts/main.sbss.part1.s)
add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${FILTERED_SBSS_PART1}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/filter_asm_symbols.py
            ${ASM_DATA_DIR}/main/parts/main.sbss.part1.s
            ${BUILD_DIR}/${FILTERED_SBSS_PART1}
            dset_mds_packet dset_mds_objnum flag$332 init$333 D_002A239D
    DEPENDS ${CMAKE_SOURCE_DIR}/${ASM_DATA_DIR}/main/parts/main.sbss.part1.s
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/filter_asm_symbols.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Filtering source-owned globals from main.sbss.part1"
    VERBATIM)
list(APPEND ASM_SOURCES ${FILTERED_SBSS_PART1})

list(APPEND ASM_SOURCES ${CARVED_PART_SOURCES})
list(APPEND ASM_SOURCES ${CARVED_DUMP_SOURCES})
list(APPEND ASM_SOURCES ${STATIC_SECTION_SOURCES})

file(GLOB_RECURSE ALL_CPP_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR}
     ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.cpp ${CMAKE_SOURCE_DIR}/${SRC_DIR}/*.c)
# tools/mwccgap compiles a temporary beside the source it came from, so a glob
# that runs while another unit is compiling sees a file that is gone by the
# time anything tries to build it.
list(FILTER ALL_CPP_SOURCES EXCLUDE REGEX "(^|/)tmp[^/]*$")

# Classify units as compiled or assembly-only.
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
        list(APPEND WHOLE_UNIT_OBJS ${BUILD_DIR}/${source}.o)
        list(APPEND WHOLE_UNIT_REFS ${reference})
    else()
        list(APPEND CPP_SOURCES ${source})
    endif()
endforeach()

# Typed data carved from residual section dumps.
list(APPEND CPP_SOURCES src/texture_data.cpp)
file(GLOB EXTRA_ASM_SOURCES CONFIGURE_DEPENDS
     RELATIVE ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/asm/handwritten/*.s)

set(CPP_OBJS "")
foreach(src IN LISTS CPP_SOURCES)
    list(APPEND CPP_OBJS ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${src}.o)
endforeach()

# Checked-in splat configuration remains an input, not a generated output.
set(REF_CONFIGS "")
foreach(section IN LISTS SECTIONS)
    list(APPEND REF_CONFIGS ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/${section}.symbols.txt)
    list(APPEND REF_CONFIGS ${CMAKE_SOURCE_DIR}/${CONFIG_DIR}/${section}.yaml)
endforeach()

set(ALL_OBJS "")
foreach(src IN LISTS ASM_SOURCES CPP_SOURCES EXTRA_ASM_SOURCES)
    list(APPEND ALL_OBJS ${BUILD_DIR}/${src}.o)
endforeach()
list(APPEND ALL_OBJS ${WHOLE_UNIT_OBJS})

set(LINK_ORDER "")
foreach(section IN LISTS SECTIONS)
    list(APPEND LINK_ORDER ${CMAKE_SOURCE_DIR}/${BUILD_DIR}/${section}_o_files)
endforeach()

# Data fragments and handwritten definitions follow address-ordered objects.
set(MAIN_TAIL "")
foreach(src IN LISTS STATIC_SECTION_SOURCES)
    list(APPEND MAIN_TAIL ${BUILD_DIR}/${src}.o)
endforeach()
list(APPEND MAIN_TAIL ${BUILD_DIR}/${FILTERED_SBSS_PART1}.o)
foreach(src IN LISTS CARVED_PART_SOURCES)
    list(APPEND MAIN_TAIL ${BUILD_DIR}/${src}.o)
endforeach()
list(APPEND MAIN_TAIL
     ${BUILD_DIR}/src/texture_data.cpp.o)
foreach(src IN LISTS EXTRA_ASM_SOURCES)
    list(APPEND MAIN_TAIL ${BUILD_DIR}/${src}.o)
endforeach()

make_object_dirs("${ALL_OBJS}")

foreach(obj IN LISTS ALL_OBJS)
    if(NOT obj IN_LIST WHOLE_UNIT_OBJS)
        add_object(${obj})
    endif()
endforeach()

# Assemble undecompiled units from their whole-unit references.
list(LENGTH WHOLE_UNIT_OBJS whole_count)
if(whole_count GREATER 0)
    math(EXPR whole_last "${whole_count} - 1")
    foreach(i RANGE ${whole_last})
        list(GET WHOLE_UNIT_OBJS ${i} obj)
        list(GET WHOLE_UNIT_REFS ${i} ref)
        add_unit_asm_object(${obj} ${ref})
    endforeach()
endif()

# Expand overlay placement in the linker command template.
set(OVERLAY_LCF ${BUILD_DIR}/${BASENAME}.overlays.lcf)
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
    ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE})
expand_overlay_markers(${CMAKE_SOURCE_DIR}/${LD_TEMPLATE}
                       ${CMAKE_SOURCE_DIR}/${OVERLAY_LCF})

set(GEN_LCF ${OVERLAY_LCF})

set(ABS_OBJS "")
foreach(obj IN LISTS ALL_OBJS)
    list(APPEND ABS_OBJS ${CMAKE_SOURCE_DIR}/${obj})
endforeach()

overlay_link_args(OVERLAY_ARGS)
check_overlay_prefixes()

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

# Record whether each symbol comes from source or reference assembly.
set(PROVENANCE ${BUILD_DIR}/symbol_provenance.txt)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${PROVENANCE} ${LINK_ORDER}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/layout.py
            --link-order ${BUILD_DIR} --provenance ${PROVENANCE}
            --build-dir ${BUILD_DIR} --main-tail ${MAIN_TAIL}
            --tail ${OVERLAY_TAIL}
            --carved ${REPLACED_SECTIONS} --lcf ${LD_TEMPLATE}
    DEPENDS ${CMAKE_SOURCE_DIR}/${LD_TEMPLATE} ${CPP_SOURCES}
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/layout.py
            ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/disassemble.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Resolving the layout"
    VERBATIM)

add_custom_target(provenance DEPENDS ${CMAKE_SOURCE_DIR}/${PROVENANCE})

# Export compiler flags for diff tooling.
string(JOIN " " CC_MW_FLAGS_TEXT ${CC_MW_FLAGS})
file(GENERATE OUTPUT ${CMAKE_BINARY_DIR}/compiler_flags.txt
     CONTENT "${CC_MW_FLAGS_TEXT}\n")

# Build a shared m2c context from project headers.
file(GLOB CTX_HEADERS CONFIGURE_DEPENDS
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.hpp
     ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/*.h
     ${CMAKE_SOURCE_DIR}/${STD_INCLUDE_DIR}/*
     ${CMAKE_SOURCE_DIR}/${SCE_INCLUDE_DIR}/*)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/${CTX} ${CMAKE_SOURCE_DIR}/${CTX_CPP}
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/diff/m2ctx.py -o ${CTX}
    DEPENDS ${CTX_HEADERS} ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/diff/m2ctx.py
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Generating m2c context"
    VERBATIM)

add_custom_target(ctx DEPENDS ${CMAKE_SOURCE_DIR}/${CTX} ${CMAKE_SOURCE_DIR}/${CTX_CPP})

# Build reference and source objects for objdiff.
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

    set(OBJDIFF_BASE_OBJS "")
    foreach(src IN LISTS CPP_SOURCES)
        list(APPEND OBJDIFF_BASE_OBJS ${BUILD_DIR}/diff/${src}.o)
    endforeach()

    set(SYMBOL_ALIASES ${BUILD_DIR}/symbol_aliases.txt)
    make_object_dirs("${OBJDIFF_TARGET_OBJS};${OBJDIFF_BASE_OBJS}")
    set(ASM_OBJECT_EXTRA_DEPENDS ${CMAKE_SOURCE_DIR}/${SYMBOL_ALIASES})
    set(OBJDIFF_TARGET_ONLY 1)
    foreach(obj IN LISTS OBJDIFF_TARGET_OBJS)
        add_object(${obj})
    endforeach()
    unset(OBJDIFF_TARGET_ONLY)

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

# Align templated reference symbols with MWCC names.
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

add_custom_target(objdiff
    DEPENDS ${CMAKE_SOURCE_DIR}/${OBJDIFF_CONFIG} ${OBJDIFF_ABS_OBJS} ${ABS_OBJS}
            ${CMAKE_SOURCE_DIR}/${SYMBOL_ALIASES})
add_dependencies(objdiff provenance)

add_custom_target(verify_extracted
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/verify.py -e
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)

add_custom_target(build ALL
    COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/verify.py -c
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
add_dependencies(build verify_extracted elf provenance ctx)

# Link a stripped executable for the rebuilt disc.
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

add_custom_target(iso DEPENDS "${CMAKE_SOURCE_DIR}/${BUILT_ISO}")

add_custom_target(run
    COMMAND ${SCRIPTS_DIR}/host/pcsx2.sh "${BUILT_ISO}"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    USES_TERMINAL
    VERBATIM)
add_dependencies(run iso)

set(STAMP_DIR ${BUILD_DIR}/stamps)
set(ROM_VERIFIED ${STAMP_DIR}/rom.verified)
set(DISASSEMBLE_STAMP ${STAMP_DIR}/disassembled)
set(EXTRACTED_ELF ${ROM_DIR}/extracted/iso/${BASENAME})

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
