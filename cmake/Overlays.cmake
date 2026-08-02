# Overlay support. TITLE.BIN and DUN.BIN are MWLD overlays, produced by the
# same mwld run as the main ELF and loaded one at a time where its .bss ends.
# Four mechanisms: -overlaygroup/-overlay to declare them, MEMORY/SECTIONS to
# place them, WRITEB/WRITEW for the 64-byte MWo3 header, and renamed input
# sections so main's trailing *(.text) wildcards cannot swallow their objects.

set(OVERLAYS title dun)

# Where the overlays load: the end of the main ELF's .bss. Retail constant --
# it is also disassemble.py's VRAM_OVERLAY_START.
set(OVERLAY_ORIGIN 0x01DABD00)
set(OVERLAY_HEADER_SIZE 0x40)

# Retail rounds each overlay file up to this boundary with zeros. mwld cannot
# emit it: the padding covers the start of .bss, so advancing the location
# counter would move every bss symbol. Hence the round-up on the finished file.
set(OVERLAY_FILE_ALIGN 128)

# Each overlay's private input-section prefix, e.g. title -> ".t". Kept short
# because it is spelled out in the linker command file for every section.
function(overlay_section_prefix name out_var)
    string(SUBSTRING ${name} 0 1 initial)
    set(${out_var} ".${initial}" PARENT_SCOPE)
endfunction()

# Two overlays sharing an initial would share a prefix, and their objects would
# land in whichever region the linker command file names first.
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

# The overlay an object belongs to, or "" for the main application.
function(overlay_for_object obj out_var)
    set(${out_var} "" PARENT_SCOPE)
    foreach(name IN LISTS OVERLAYS)
        if(obj MATCHES "/${name}/[^/]+$")
            set(${out_var} ${name} PARENT_SCOPE)
            return()
        endif()
    endforeach()
endfunction()

# The objcopy arguments that move an overlay object's sections onto its private
# prefix. Applied while the object is built, so the linker never sees the
# generic names.
function(overlay_rename_flags name out_var)
    overlay_section_prefix(${name} p)
    set(${out_var}
        --rename-section .text=${p}text
        --rename-section .data=${p}data
        --rename-section .bss=${p}bss
        PARENT_SCOPE)
endfunction()

# The overlay's file name, which the header carries at offset 0x20. Written a
# byte at a time, the way CodeWarrior's LCF generator writes it; mwld zero-fills
# the rest of the reservation.
function(overlay_name_bytes name out_var)
    string(HEX "${name}.bin" hex)
    string(REGEX MATCHALL ".." octets "${hex}")

    set(lines "")
    foreach(octet IN LISTS octets)
        string(APPEND lines "\n        WRITEB 0x${octet};")
    endforeach()
    set(${out_var} "${lines}" PARENT_SCOPE)
endfunction()

# The placement body for one overlay, expanded into the linker template.
# Wildcards over the private prefix suffice: mwld matches them in command-line
# order, which is the address order of the object lists. The 64 bytes at the
# top are the MWo3 header the loader reads (bss size at 0x14, static-init
# bounds at 0x18/0x1C). Those size fields are declared up front and assigned
# below, because mwld rejects a forward reference -- which is what the PS2 LCF
# Generator prelinker emits too.
function(overlay_placement name out_var)
    overlay_section_prefix(${name} p)
    overlay_name_bytes(${name} name_bytes)
    set(${out_var} "
        // Declared before the header reads them; assigned for real below.
        _${name}_text = 0;
        _${name}_data = 0;
        _${name}_bss = 0;
        _${name}_end = 0;

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
        ALIGNALL(16);
        *(${p}text)

        . = ALIGN(16);
        _${name}_data = .;
        *(${p}data)

        ALIGNALL(1);
        _${name}_bss = .;
        *(${p}bss)
        _${name}_end = .;" PARENT_SCOPE)
endfunction()

# Expand the linker template: replace every `// @OVERLAY <name>` marker with
# that overlay's placement. Any `// @MIGRATE` markers are left alone for
# gen_lcf.py, which runs afterwards.
function(expand_overlay_markers template out)
    file(READ ${template} content)

    foreach(name IN LISTS OVERLAYS)
        overlay_placement(${name} body)
        string(REPLACE "        // @OVERLAY ${name}" "${body}" content "${content}")
    endforeach()

    # Only when it changed. file(WRITE) always touches the file, and this runs
    # at configure time -- which every build does -- so an unconditional write
    # would make the generated .lcf that consumes this look stale and relink
    # the whole executable on every build.
    set(previous "")
    if(EXISTS ${out})
        file(READ ${out} previous)
    endif()
    if(NOT previous STREQUAL content)
        file(WRITE ${out} "${content}")
    endif()
endfunction()

# The `-overlaygroup`/`-overlay` arguments for the link. Every overlay shares
# one group, because they all load at the same address. Objects follow the
# `-overlay` that owns them, so they are passed here rather than in the main
# response file.
function(overlay_link_args out_var)
    set(args -og ovl,${OVERLAY_ORIGIN})
    foreach(name IN LISTS OVERLAYS)
        # A response file, like the main image: mwld accepts one after -overlay,
        # and gen_layout.py writes it with this overlay's objects in order.
        list(APPEND args -ol ${name} @${BUILD_DIR}/${name}_o_files)
    endforeach()
    set(${out_var} "${args}" PARENT_SCOPE)
endfunction()
