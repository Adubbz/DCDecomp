# Texture animation group control

The player owns 24 parallel group slots. `Initialize` stores its pool pointer
at `0x1e0` and count at `0x1e4`, then clears five 24-word arrays in the order
`0x60`, `0x120`, `0xc0`, `0x180`, `0x00`. Existing callers embed the player
at its established `0x1f0` size; the last eight bytes remain unknown.

| Offset | Meaning | Evidence |
| --- | --- | --- |
| 0x000 | enabled flags | Enable sets one; Disable clears one; TexAnime tests each |
| 0x060 | first records | NewTexAnimeGroupData initializes empty slots; Disable rewinds current to first |
| 0x0c0 | last records | NewTexAnimeGroupData appends through the previous record's +0x54 next pointer |
| 0x120 | current records | TexAnime processes this record and follows its next pointer |
| 0x180 | frame counters | TexAnime increments these, compares against record duration, and resets on advancement |

The five implemented functions were analyzed through `decompile.sh`/m2c,
then checked against the reference assembly. `Initialize`, the constructor,
`Enable`, `Disable`, and `DisableAll` all pass the two-axis checker as
PERFECT. Their reference spans total 352 bytes including padding; the checker
compares 320 function bytes excluding trailing padding.

Both indexed control functions silently ignore negative indices and indices
at or above 24. Disable resets the selected group's frame counter and record
pointer. DisableAll calls Disable on each group rather than bulk-clearing
arrays. The constructor calls Initialize and does not initialize record
storage itself.

Remaining work: CTexAnimeData's opaque 0x58 bytes need record fields and two
embedded 0x18 texture descriptors. Initialize clears both descriptors and sets
their initial halfwords to -1. NewTexAnimeData searches for a record whose
initial halfword is -1. NewTexAnimeGroupData returns a CTexAnimeData pointer,
and EnterTexAnime returns success as an integer; their header return types
remain unresolved until those functions are implemented. The larger TexAnime
body also needs graphics interfaces and global-state ownership. CTextureTexAnime
is absent from the current header, blocking Copy.
