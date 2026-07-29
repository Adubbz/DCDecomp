# Object lists and the per-object build rules. The lists under cmake/objects/
# are the single source of truth for link order, which is significant, so their
# order is preserved exactly; the build path and .o suffix are derived here
# rather than spelled out per entry.

# Load one ordered source list and return the objects built from it.
function(read_obj_list name out_var)
    set(path ${CMAKE_SOURCE_DIR}/cmake/objects/${name}.cmake)
    if(NOT EXISTS ${path})
        message(FATAL_ERROR "No object list at ${path}")
    endif()
    set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${path})

    include(${path})

    set(objs "")
    foreach(src IN LISTS OBJECT_SOURCES)
        list(APPEND objs ${BUILD_DIR}/${src}.o)
    endforeach()
    set(${out_var} "${objs}" PARENT_SCOPE)
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
