# Derive object rules from the split configuration.
function(derive_config flag out_var)
    execute_process(
        COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/disassemble.py ${flag}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE rows
        RESULT_VARIABLE status
        OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(NOT status EQUAL 0)
        message(FATAL_ERROR "disassemble.py ${flag} failed (${status})")
    endif()
    string(REPLACE "\n" ";" rows "${rows}")
    set(${out_var} "${rows}" PARENT_SCOPE)
endfunction()

# Read uncarved whole-section dumps for one image.
function(read_index_sources section out_var exclude)
    derive_config(--list-dumps rows)

    set(srcs "")
    foreach(row IN LISTS rows)
        string(REPLACE "\t" ";" parts "${row}")
        list(GET parts 0 image)
        list(GET parts 1 name)
        list(GET parts 2 dump)
        if(image STREQUAL section AND NOT name IN_LIST exclude)
            list(APPEND srcs ${dump})
        endif()
    endforeach()
    list(REMOVE_DUPLICATES srcs)

    set(${out_var} "${srcs}" PARENT_SCOPE)
endfunction()

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

# Assemble a unit that has no decompiled source.
function(add_unit_asm_object obj src)
    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()
    # Retail game units use 16-byte text alignment; libraries use 4-byte alignment.
    if(src MATCHES "^${ASM_DIR}/lib/")
        list(APPEND fixup_flags --set-section-alignment .text=4)
    else()
        list(APPEND fixup_flags --set-section-alignment .text=16)
    endif()

    add_custom_command(
        OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
        COMMAND ${AS} ${AS_FLAGS} -o ${obj} ${src}
        COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${fixup_flags}
        DEPENDS ${CMAKE_SOURCE_DIR}/${src}
                ${CMAKE_SOURCE_DIR}/${INCLUDE_DIR}/macro.inc ${REF_STAMP}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "AS ${src}"
        VERBATIM)
endfunction()

# Compile a source-only object for objdiff.
function(add_diff_base_object obj src)
    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()
    add_custom_command(
        OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
        # Use the same compiler-state shim as the linked object. Otherwise the
        # source-only object ignores the unit's state pragmas and objdiff
        # reports register/order differences that are absent from the build.
        COMMAND ${CMAKE_COMMAND} -E env "MWCIncludes=${LIB_INCLUDE_DIRS}"
                "STATEFIX_SOURCE=${src}"
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/statefix-wibo.sh
                ${MW}mwccmips.exe ${CC_MW_FLAGS} -o ${obj} ${src}
        COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/literals.py --bind ${obj}
        COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/postprocess_object.py ${obj} ${src}
        COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${fixup_flags}
        DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${REF_STAMP}
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/literals.py
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/postprocess_object.py
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/statefix.py
                ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/statefix-wibo.sh
                ${CMAKE_SOURCE_DIR}/config/object_fixups.json
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "CC (diff base) ${src}"
        VERBATIM)
endfunction()

# Build one object from its extension.
function(add_object obj)
    string(REGEX REPLACE "^${BUILD_DIR}/" "" rel ${obj})
    string(REGEX REPLACE "\\.o$" "" src ${rel})

    # Carved data sections are generated into the build tree.
    if(rel MATCHES "^generated/")
        set(src ${BUILD_DIR}/${src})
    endif()

    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()
    if(src MATCHES "^${SRC_DIR}/lib/")
        list(APPEND fixup_flags --set-section-alignment .text=4)
    endif()
    if(OBJDIFF_TARGET_ONLY)
        list(APPEND fixup_flags -w --localize-symbol=.L*)
    endif()
    set(fixup COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${fixup_flags})

    if(src MATCHES "\\.s$")
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
        # mwccgap inserts remaining retail assembly and writes header dependencies.
        add_custom_command(
            OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
            COMMAND ${CMAKE_COMMAND} -E env
                    MW_DIR=${MW} MIPS_TOOL_PREFIX=${MIPS_TOOL_PREFIX}
                    LIB_INCLUDE_DIRS=${LIB_INCLUDE_DIRS}
                    ASM_DIR=.
                    sh ${SCRIPTS_DIR}/build/mwccgap.sh ${obj} ${obj}.d ${src}
                    ${CC_MW_FLAGS} -MD
            COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/literals.py --bind ${obj}
            COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/postprocess_object.py ${obj} ${src}
            ${fixup}
            DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${REF_STAMP}
                    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/literals.py
                    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/postprocess_object.py
                    ${CMAKE_SOURCE_DIR}/config/object_fixups.json
                    ${CMAKE_SOURCE_DIR}/${TOOLS_DIR}/mwccgap/mwccgap/mwccgap.py
                    ${CMAKE_SOURCE_DIR}/${TOOLS_DIR}/mwccgap/mwccgap/elf.py
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
