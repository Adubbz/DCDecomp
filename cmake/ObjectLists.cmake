# The per-object build rules. What to build comes from the disassembler's
# address index; what to link, and in what order, is decided at build time by
# scripts/build/layout.py from the unit placement in the linker script.

# The whole-section dumps the disassembler recorded for one image, from its
# address index. `exclude` names the ones the migration carves; those are
# replaced by the generated parts and never assembled from the dump itself.
#
# Only the section dumps: every function is supplied by an INCLUDE_ASM marker
# in the translation unit it belongs to, so the per-function dumps are read by
# tools/mwccgap rather than assembled into objects of their own. objdiff still
# wants them as its targets and gets them from
# `layout.py --list-extra-objects`, which builds them under the objdiff
# target alone -- an `elf` build now assembles nine of these, not four thousand.
function(read_index_sources section out_var exclude)
    set(path ${CMAKE_SOURCE_DIR}/${REF_DIR}/asm/objects/${section}.index)
    set(srcs "")

    # Deliberately not a CMAKE_CONFIGURE_DEPENDS: the index is also an output
    # of the disassemble step, so making configure depend on it puts CMake and
    # ninja in a loop -- "manifest still dirty after 100 tries". A changed
    # index is picked up by the configure scripts/build/cmake.sh runs at the
    # start of every invocation.
    if(EXISTS ${path})
        # REGEX filters in file(STRINGS) itself: the `sym` rows are four times
        # the bulk of this file and only layout.py reads them, so matching
        # them line by line in CMake would be the slowest thing in configure --
        # which the objdiff GUI runs on every save.
        file(STRINGS ${path} lines REGEX "^src	${REF_DIR}/asm/sections/")
        foreach(line IN LISTS lines)
            string(REGEX REPLACE "^src	([^	]+)	.*" "\\1" src "${line}")
            get_filename_component(base ${src} NAME)
            string(REGEX REPLACE "\\.s$" "" stem ${base})
            if(NOT stem IN_LIST exclude)
                list(APPEND srcs ${src})
            endif()
        endforeach()
        list(REMOVE_DUPLICATES srcs)
    endif()

    set(${out_var} "${srcs}" PARENT_SCOPE)
endfunction()

# Create every directory the object rules will write into.
function(make_object_dirs objs)
    set(dirs "")
    foreach(obj IN LISTS objs)
        get_filename_component(dir ${CMAKE_SOURCE_DIR}/${obj} DIRECTORY)
        list(APPEND dirs ${dir})
    endforeach()
    list(REMOVE_DUPLICATES dirs)
    foreach(dir IN LISTS dirs)
        file(MAKE_DIRECTORY ${dir})
    endforeach()
endfunction()

# Declare the rule that builds one object, picked from its source extension.
# `obj` is relative to the source root, e.g. build/src/main.cpp.o.
function(add_object obj)
    string(REGEX REPLACE "^${BUILD_DIR}/" "" rel ${obj})
    string(REGEX REPLACE "\\.o$" "" src ${rel})

    # Carved data sections are generated into the build tree.
    if(rel MATCHES "^generated/")
        set(src ${BUILD_DIR}/${src})
    endif()

    # Every object goes through the fixup pass, which strips the zero-sized
    # sections mwld rejects and applies whatever else the object needs.
    #
    # Objects belonging to an overlay get their sections renamed onto that
    # overlay's private prefix. The library units get .text dropped to 4-byte
    # alignment: mwcc gives every function's .text 16-byte alignment, which is
    # what retail's own code has, but the libraries were built by other
    # compilers and sit on 8-byte boundaries -- see fixup_sections.sh.
    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()
    if(src MATCHES "^${SRC_DIR}/lib/")
        list(APPEND fixup_flags --set-section-alignment .text=4)
    endif()
    set(fixup COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${fixup_flags})

    # No USES_TERMINAL: its console pool runs one edge at a time, which built
    # all four thousand of these serially.
    if(src MATCHES "\\.s$")
        # MWLD rejects zero-sized input sections, so the empty ones the
        # assembler emits are stripped. macro.inc is named outright rather than
        # found from a depfile: it is the only thing any of these .s include.
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND ${AS} ${AS_FLAGS} -o ${obj} ${src}
            ${fixup}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/macro.inc
                    ${ASM_OBJECT_EXTRA_DEPENDS} ${REF_STAMP}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            COMMENT "AS ${src}"
            VERBATIM)
    elseif(src MATCHES "\\.(c|cpp)$")
        # Everything compiled goes through scripts/build/mwccgap.sh, which puts
        # retail's own bytes where each INCLUDE_ASM and INCLUDE_RODATA marker
        # stands. A source carrying no marker costs nothing extra there -- it
        # compiles once and the object is written out as mwcc produced it -- and
        # routing every source the same way means configure no longer has to
        # read all four hundred of them to decide which script each needs.
        #
        # The script exists for the depfile as much as anything: without it an
        # edit to a header, or to a .cpp that another one #includes, rebuilds
        # nothing at all. -MD rather than -MMD because the libraries are
        # reached as <cstring> and <libvu0.h>, and -MMD leaves every <> include
        # out of the map -- an edit to one of those headers would rebuild
        # nothing, silently.
        #
        # scripts/build/literals.py runs on what comes out: a float constant
        # MWCC put in a .lit4 or .lit8 section of its own is bound to the
        # entry of retail's literal pool that retail loads it from, and the
        # section dropped, so the object adds nothing to the pool. See that
        # script; only compiled code has such sections.
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND ${CMAKE_COMMAND} -E env
                    MW_DIR=${MW} MIPS_TOOL_PREFIX=${MIPS_TOOL_PREFIX}
                    LIB_INCLUDE_DIRS=${LIB_INCLUDE_DIRS}
                    ASM_DIR=${ASM_DIR}
                    sh ${SCRIPTS_DIR}/build/mwccgap.sh ${obj} ${obj}.d ${src}
                    ${CC_MW_FLAGS} -MD
            COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/literals.py --bind ${obj}
            ${fixup}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${REF_STAMP}
                    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/literals.py
            DEPFILE ${CMAKE_SOURCE_DIR}/${obj}.d
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            COMMENT "CC ${src}"
            VERBATIM)
    elseif(src MATCHES "\\.bin$")
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND ${OBJCOPY} ${BIN_FLAGS} ${src} ${obj}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            COMMENT "BIN ${src}"
            VERBATIM)
    else()
        message(FATAL_ERROR "No rule to build ${obj}")
    endif()
endfunction()
