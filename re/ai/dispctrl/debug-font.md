# Debug font drawing

`CDebugFont::Draw` first copies glyph rectangles from `ankfnt24` into the
font's destination texture with GS local-to-local transfers. It restores the
frame-buffer registers afterward and draws the completed texture as one
screen sprite. Spaces advance eight pixels and newlines advance sixteen.

Compiling the function emits the `ankfnt24` string that retail keeps at
0x299068. The old `INCLUDE_RODATA` marker supplied the same string from
assembly, producing a second aligned copy and shifting every later datum.
Removing that marker lets the existing `@230` export fixup name the compiled
literal at its retail address.
