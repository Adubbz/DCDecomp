# The per-object build rules. What to build comes from the splat
# configuration; what to link, and in what order, is decided at build time by
# scripts/build/layout.py from the unit placement in the linker script.

# Ask scripts/build/disassemble.py for one of the lists it derives -- the
# translation units, or the whole-section dumps -- as one row per list element,
# tab-separated. Nothing is cached: a stale answer names an object that is
# still on disk and still linked.
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

# The whole-section dumps splat writes for one image. `exclude` names the ones
# the migration carves; those are replaced by the generated parts and never
# assembled from the dump itself.
#
# Only the section dumps: every function is supplied by an INCLUDE_ASM marker
# in the translation unit it belongs to, so the per-function files are read by
# tools/mwccgap rather than assembled into objects of their own. objdiff gets
# them from `layout.py --list-extra-objects` and builds them under the objdiff
# target alone -- an `elf` build assembles nine of these, not four thousand.
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

# The object of a unit that has nothing decompiled in it, assembled from the
# single file splat writes for it. The object keeps the name the source would
# have produced -- mwld places a unit by its object's base name, and the linker
# script must not have to change every time a unit gains or loses its first
# decompiled function.
function(add_unit_asm_object obj src)
    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()
    # The game's own code is 16-aligned in retail, which is also what mwcc
    # gives a compiled unit -- and it is the next object's alignment that pads
    # out the trailing bytes of the one before it. Assembled from a .s the
    # section comes out 4-aligned, so a compiled unit that ends mid-paragraph
    # is never padded back up and everything after it sits eight bytes low.
    #
    # The libraries are the exception: 305 of their 739 functions start eight
    # bytes off a paragraph, so theirs stays at four.
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

# The object objdiff compares a unit against: the source compiled on its own,
# with no assembly spliced into it.
#
# The object the link takes is not usable for this. tools/mwccgap fills every
# INCLUDE_ASM marker with retail's own instructions, so an undecompiled
# function in it matches retail perfectly and the unit reads as finished long
# before it is. Compiled plainly the markers expand to nothing -- that is all
# they are to the compiler -- so the object holds the decompiled functions and
# nothing else, and objdiff counts the rest as the work still to do.
function(add_diff_base_object obj src)
    overlay_for_object(${obj} overlay)
    set(fixup_flags "")
    if(overlay)
        overlay_rename_flags(${overlay} rename_flags)
        list(APPEND fixup_flags ${rename_flags})
    endif()

    add_custom_command(
        OUTPUT ${CMAKE_SOURCE_DIR}/${obj}
        # The include list is one argument with a separator inside it, so it
        # has to be quoted or CMake hands mwcc two.
        COMMAND ${CMAKE_COMMAND} -E env "MWCIncludes=${LIB_INCLUDE_DIRS}"
                wibo ${MW}mwccmips.exe ${CC_MW_FLAGS} -o ${obj} ${src}
        COMMAND sh ${SCRIPTS_DIR}/build/fixup_sections.sh ${obj} ${fixup_flags}
        DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${REF_STAMP}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        COMMENT "CC (diff base) ${src}"
        VERBATIM)
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
        # stands. A marker names its directory from the source root -- splat
        # writes `asm/nonmatchings/<unit>/` -- so the prefix mwccgap resolves
        # against is the root itself. A source carrying no marker costs nothing extra there -- it
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
                    ASM_DIR=.
                    sh ${SCRIPTS_DIR}/build/mwccgap.sh ${obj} ${obj}.d ${src}
                    ${CC_MW_FLAGS} -MD
            COMMAND ${PYTHON_CMD} ${SCRIPTS_DIR}/build/literals.py --bind ${obj}
            # A constant tools/mwccgap transplanted is retail's own bytes with
            # retail's own padding and must not be touched; it arrives under a
            # section name of its own so it can be told apart from what the
            # compiler emitted, and is put back under `.rodata` for the link.
            COMMAND ${OBJCOPY} --rename-section .rodata.gap=.rodata ${obj}
            ${fixup}
            # tools/mwccgap decides how a transplanted function and its
            # constants are laid out in the object, so a change to it has to
            # rebuild everything it compiled.
            DEPENDS ${CMAKE_SOURCE_DIR}/${src} ${REF_STAMP}
                    ${CMAKE_SOURCE_DIR}/${SCRIPTS_DIR}/build/literals.py
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
