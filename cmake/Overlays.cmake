# MWLD overlay configuration.

set(OVERLAYS title dun)

set(OVERLAY_ORIGIN 0x01DABD00)
set(OVERLAY_HEADER_SIZE 0x40)

set(OVERLAY_FILE_ALIGN 128)

function(overlay_section_prefix name out_var)
    string(SUBSTRING ${name} 0 1 initial)
    set(${out_var} ".${initial}" PARENT_SCOPE)
endfunction()

function(check_overlay_prefixes)
    set(seen "")
    foreach(name IN LISTS OVERLAYS)
        overlay_section_prefix(${name} prefix)
        if(${prefix} IN_LIST seen)
            message(FATAL_ERROR
                "Overlays ${name} and an earlier one share the section prefix "
                "${prefix}; give overlay_section_prefix a longer prefix.")
        endif()
        list(APPEND seen ${prefix})
    endforeach()
endfunction()

function(overlay_for_object obj out_var)
    set(${out_var} "" PARENT_SCOPE)
    foreach(name IN LISTS OVERLAYS)
        if(obj MATCHES "/${name}/[^/]+$")
            set(${out_var} ${name} PARENT_SCOPE)
            return()
        endif()
    endforeach()
endfunction()

function(overlay_rename_flags name out_var)
    overlay_section_prefix(${name} p)
    set(${out_var}
        --rename-section .text=${p}text
        --rename-section .data=${p}data
        --rename-section .rodata=${p}rodata
        --rename-section .bss=${p}bss
        # The static initialisers an overlay's units carry run from the
        # overlay, not from main: retail keeps them with the overlay's data.
        --rename-section .init=${p}init
        --rename-section .ctor=${p}ctor
        PARENT_SCOPE)
endfunction()

function(overlay_name_bytes name out_var)
    string(HEX "${name}.bin" hex)
    string(REGEX MATCHALL ".." octets "${hex}")

    set(lines "")
    foreach(octet IN LISTS octets)
        string(APPEND lines "\n        WRITEB 0x${octet};")
    endforeach()
    set(${out_var} "${lines}" PARENT_SCOPE)
endfunction()

function(overlay_header name out_var)
    overlay_name_bytes(${name} name_bytes)
    set(${out_var} "
        // Declared before the header reads them; assigned for real below.
        _${name}_text = 0;
        _${name}_data = 0;
        _${name}_bss = 0;
        _${name}_end = 0;
        _${name}_static_init = 0;
        _${name}_static_init_end = 0;

        _${name}_load = .;
        WRITEB 0x4D;                            // 'M'
        WRITEB 0x57;                            // 'W'
        WRITEB 0x6F;                            // 'o'
        WRITEB 0x33;                            // '3', header version
        WRITEW OVERLAYID(.${name});             // overlay id, from -overlay order
        WRITEW ADDR(.${name});                  // load address
        WRITEW _${name}_data - _${name}_text;   // size of text
        WRITEW _${name}_bss - _${name}_data;    // size of data
        WRITEW _${name}_end - _${name}_bss;     // size of bss
        WRITEW _${name}_static_init;            // static-initialiser table
        WRITEW _${name}_static_init_end;
        // Name, at offset 0x20.${name_bytes}
        . = _${name}_load + ${OVERLAY_HEADER_SIZE};

        _${name}_text = .;
        ALIGNALL(16);" PARENT_SCOPE)
endfunction()

# Expand the linker template by replacing each `// @OVERLAY <name>` marker
# with that overlay's header.
function(expand_overlay_markers template out)
    file(READ ${template} content)

    foreach(name IN LISTS OVERLAYS)
        overlay_header(${name} body)
        string(REPLACE "        // @OVERLAY ${name}" "${body}" content "${content}")
    endforeach()

    set(previous "")
    if(EXISTS ${out})
        file(READ ${out} previous)
    endif()
    if(NOT previous STREQUAL content)
        file(WRITE ${out} "${content}")
    endif()
endfunction()

function(overlay_link_args out_var)
    set(args -og ovl,${OVERLAY_ORIGIN})
    foreach(name IN LISTS OVERLAYS)
        list(APPEND args -ol ${name} @${BUILD_DIR}/${name}_o_files)
    endforeach()
    set(${out_var} "${args}" PARENT_SCOPE)
endfunction()
