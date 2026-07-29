# Assembly Macros
.macro glabel label
    .global \label
    \label:
.endm

# Jump-table targets. Global, unlike the branch labels below: the table itself
# lives in .rodata, in a different object from the code it points into, so
# these really do have to be resolved by the linker.
.macro jlabel label
    .global \label
    \label:
.endm

# Branch targets and alternate entry points. Deliberately NOT global: gas
# resolves a branch to a locally defined label itself, but a branch to a global
# one becomes an R_MIPS_PC16 relocation for mwld to finish, and the two
# disagree by one instruction about the addend -- 79 encodings in DUN.BIN alone
# came out as e.g. beqz 0x42 where retail has 0x43. Anything that genuinely has
# to be visible to the linker -- a jump table's targets -- goes through jlabel.
.macro alabel label
    \label:
.endm

.macro move a, b
    or \a, \b, $0
.endm
