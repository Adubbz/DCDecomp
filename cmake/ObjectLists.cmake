# The per-object build rules. What to build comes from the disassembler's
# address index; what to link, and in what order, is decided at build time by
# scripts/build/gen_layout.py -- neither is written down by hand.

# Every source the disassembler recorded for one image, from its address index.
# `exclude` names section dumps the migration carves; those are replaced by the
# generated parts and never assembled from the dump itself.
function(read_index_sources section out_var exclude)
    set(path ${CMAKE_SOURCE_DIR}/${REF_DIR}/asm/objects/${section}.index)
    set(srcs "")

    if(EXISTS ${path})
        set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})
        file(STRINGS ${path} lines)
        foreach(line IN LISTS lines)
            if(NOT line MATCHES "^#")
                string(REGEX MATCH "^[^	]+" src "${line}")
                get_filename_component(base ${src} NAME)
                string(REGEX REPLACE "\\.s$" "" stem ${base})
                if(NOT stem IN_LIST exclude)
                    list(APPEND srcs ${src})
                endif()
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

    # Objects belonging to an overlay get their sections renamed onto that
    # overlay's private prefix, in the same pass that strips the empty ones.
    # Compiled objects only need the pass when they are in an overlay; the
    # main application has always linked them exactly as mwcc emits them.
    overlay_for_object(${obj} overlay)
    set(rename_flags "")
    set(overlay_fixup "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        set(overlay_fixup COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${rename_flags})
    endif()

    # No USES_TERMINAL: its console pool runs one edge at a time, which built
    # all four thousand of these serially.
    if(src MATCHES "\\.s$")
        # MWLD rejects zero-sized input sections, so the empty ones the
        # assembler emits are stripped. macro.inc is named outright rather than
        # found from a depfile: it is the only thing any of these .s include.
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND ${AS} ${AS_FLAGS} -o ${obj} ${src}
            COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${rename_flags}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/macro.inc
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            COMMENT "AS ${src}"
            VERBATIM)
    elseif(src MATCHES "\\.(c|cpp)$")
        # Compiled through scripts/build/mwcc.sh rather than directly, for the
        # depfile: without it an edit to a header, or to a .cpp that another
        # one #includes, rebuilds nothing at all. See that script for what it
        # has to fix about MWCC's own output.
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND sh ${SCRIPTS_DIR}/build/mwcc.sh ${obj} ${obj}.d
                    ${CC_MW} ${CC_MW_FLAGS} -MMD -o ${obj} ${src}
            ${overlay_fixup}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src}
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
