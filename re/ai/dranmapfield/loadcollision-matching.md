# `CDranMapField::LoadCollision` matching note

The high-level body is established: when `unk_D4A4` is below twelve, load a
collision frame into that slot, reset its position and rotation to zero, and
increment the count. At capacity it prints `*********** over!!`.

A local typed set pointer or reference produces the retail 68-instruction
size and 88.23529% objdiff. MWCC evaluates the repeated collision-frame lookup
before the floating arguments, while retail sets up the three zero arguments
first. Repeated inline set casts introduce an extra saved register and score
70.55882%. Integer zero arguments preserve the mismatch and change one
floating register. The compiled string also receives a new local rodata label
instead of the retained retail `@3606` label; placement remains a later Lane A
concern after the object code is solved.

The source body came from Dayuppy's private export 1707723 and was hand-ported
onto the typed container layout. Resume with compiler expression-scheduling
diagnostics while retaining the established control flow.
