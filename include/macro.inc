# Assembly Macros
.macro glabel label
    .global \label
    \label:
.endm

.macro move a, b
    or \a, \b, $0
.endm
