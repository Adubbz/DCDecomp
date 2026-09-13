# Sprite-table matching notes

The six bodies are adapted from Dayuppy's promoted source at `1707723`.
The entry pool, list heads/tails and cursor/end fields are supported by the
matched initialization, append and draw methods. SPRITE_TABLE is 0x38 bytes,
MG_SPRITE is 0x20, and CSpriteTable remains 0x94. The editor's 32-entry pool
still occupies 0x700 bytes at 0x1D48770; its two tables remain at 0x1D48E70
and 0x1D48F10. The existing 16-byte sequence-group boundary is unchanged.

Three source details are retained for the generated instructions:

- The sprite overload takes a reference to the actual 16-element tails array
  before indexing it. This produces the retail operand order for one `addu`
  without converting the owning object to an integer address.
- The texture/rectangle overload's local union reserves three quadwords, matching
  retail's temporary stack storage while exposing a typed MG_SPRITE member.
- DrawTable retains the separate drawn counter from the promoted body as well
  as the packet-entry counter. The linked routine is checked as a whole; the
  latter counter controls GIF packet flushes after 128 entries.

The SDK's XYZF3/XYZF2 register IDs name the first/second sprite-vertex writes.
No integer address arithmetic or new linker placement is used in this unit.
