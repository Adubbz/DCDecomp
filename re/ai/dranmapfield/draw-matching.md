# `CDranMapField::Draw` matching note

The high-level body is established: treat `this` as the first element of the
owning `DRAN_MAP_FIELD_SET`, loop through `unk_D4A0` fields, and virtually draw
each field whose `frame` and corresponding `unk_D470` state are nonzero.

The closest form keeps a local typed pointer to the set and a local field
pointer. It produces the retail 43-instruction size and 98.72093% objdiff.
Only the two long-lived saved registers differ: retail keeps the set in `s17`
and the loop index in `s16`, while MWCC chooses the reverse. A qualified base
draw changes the required virtual call and scores 92.674416%; spelling every
set access as an inline cast introduces a third saved register and scores
86.39535%.

The source body came from Dayuppy's private export 1707723 and was hand-ported
onto the typed container layout. Resume with register-allocation diagnostics
or a permuter rather than changing the established control flow.
