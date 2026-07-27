# Overlay support.
#
# TITLE.BIN and DUN.BIN are MWLD overlays: both load at the address where the
# main ELF's .bss ends, one at a time, and the main ELF carries Metrowerks'
# overlay loader (mwLoadOverlay / MWNotifyOverlayLoaded) to swap them in. They
# are produced by the same mwld run as the main ELF, using three mechanisms
# together:
#
#   -overlaygroup/-overlay   declare the overlays and which objects belong to
#                            each, so mwld links them as real overlays
#   MEMORY/SECTIONS          give each overlay its own output file and place
#                            its sections at the retail addresses
#   renamed input sections   keep .main's trailing *(.text)/*(.data)/*(.bss)
#                            wildcards from swallowing the overlays' objects.
#                            mwld resolves placement strictly in the order the
#                            linker command file is written and matches
#                            wildcards against every input object regardless of
#                            overlay membership, so an overlay object whose
#                            sections are still called .text/.data/.bss ends up
#                            inside main. Each overlay's objects therefore get
#                            their sections renamed to a private prefix
#                            (.ttext/.tdata/.tbss for title) as they are built.
#
# mwld 2.3.1.01 stops short of writing the 64-byte MWo3 header the loader
# expects, so the placement reserves those bytes and scripts/mwo3.py fills them
# in after the link. See the header of that script for the fields.

set(OVERLAYS title dun)

# Where the overlays load: the end of the main ELF's .bss. Retail constant --
# it is also disassemble.py's VRAM_OVERLAY_START and asm/symbols.s's __bss_end.
set(OVERLAY_ORIGIN 0x01DABD00)
set(OVERLAY_HEADER_SIZE 0x40)

# Each overlay's private input-section prefix, e.g. title -> ".t".
function(overlay_section_prefix name out_var)
    string(SUBSTRING ${name} 0 1 initial)
    set(${out_var} ".${initial}" PARENT_SCOPE)
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

# The placement body for one overlay, expanded into the linker template.
#
# Wildcards over the private prefix are enough here: mwld matches them in
# command-line order, which is the address order disassemble.py writes the
# object lists in. The symbols mark the boundaries mwo3.py needs, and are
# placed where the section actually starts -- the explicit ALIGN(16) before
# .data is what ALIGNALL(16) would apply anyway, and .bss deliberately starts
# unaligned, exactly where .data ended.
function(overlay_placement name out_var)
    overlay_section_prefix(${name} p)
    set(${out_var} "
        _${name}_load = .;
        // Reserved for the MWo3 header, written by scripts/mwo3.py.
        . = . + ${OVERLAY_HEADER_SIZE};
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

    file(WRITE ${out} "${content}")
endfunction()

# The `-overlaygroup`/`-overlay` arguments for the link. Every overlay shares
# one group, because they all load at the same address. Objects follow the
# `-overlay` that owns them, so they are passed here rather than in the main
# response file.
function(overlay_link_args out_var)
    set(args -og ovl,${OVERLAY_ORIGIN})
    foreach(name IN LISTS OVERLAYS)
        string(TOUPPER ${name} upper)
        list(APPEND args -ol ${name} ${${upper}_O_FILES})
    endforeach()
    set(${out_var} "${args}" PARENT_SCOPE)
endfunction()
