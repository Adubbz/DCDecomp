# `CDungeonEventMan::SearchItemEventHold` matching notes

The function visits all 96 runtime event records. For every enabled record
whose source definition has the requested script number, it clears the word
at runtime-record offset `0x30`.

A structured loop with separate source and enabled-state locals reaches 98.8%
object similarity. Retail keeps the loop index in `$6`, the scaled offset in
`$7`, and the source pointer in `$8`; MWCC assigns those values to different
registers. Hoisting all locals to function scope reaches 90.32%, while a
single short-circuit condition reaches 81.6%. The 98.8% form has no data,
relocation, immediate, or control-flow differences beyond those registers.
