# `CDngMessageMan::SetSteevMes` matching notes

Retail updates the message only when the timer at offset `0x04` is not
positive. It selects `argument + counter` at `0x24`, resets the timer to 240,
sets the active flag at `0x1C`, increments the counter at `0x20`, and wraps
that counter to zero at ten.

The direct structured translation reaches 99.5% object similarity. Its only
differences are at function offsets `0x38` and `0x3C`: retail emits
`slti $1,$3,10` followed by `bnez $1`, while MWCC emits the same operations
through `$3`. Assigning the comparison to a named condition and expressing
both the outer and inner tests as early returns produce the same two-word
difference. No data, relocation, immediate, or control-flow differences
remain.
