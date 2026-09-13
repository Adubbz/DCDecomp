# `CDranMapField::AddCollision` matching note

The high-level body is established: return the incoming polygon count when no
field collision frames are loaded; otherwise loop over `unk_D4A4`, skip null
frames and states below two, and add each frame's `PickUpNearPoly` result.

All tried forms produce the retail 62-instruction size and exact immediates.
The best scores 92.98387% and differs only in saved-register allocation and
when the by-value `CBoxVu0` argument is copied. Declaring the loop index before
the typed set view gives the retail `s16` index and `s17` result, but MWCC puts
the set and polygon pointer in `s18` and `s19` instead of retail's `s19` and
`s18`. A set-first form scores 92.58064%; repeated inline set casts introduce
an additional saved register and score 85.629036%.

The source body came from Dayuppy's private export 1707723 and was hand-ported
onto the typed container layout. Resume with register-allocation diagnostics
or a permuter while retaining the established control flow.
