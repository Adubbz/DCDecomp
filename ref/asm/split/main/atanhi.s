.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel atanhi
/* 198A70 00298970 4FBB6105 */ .word 0x0561BB4F
/* 198A74 00298974 67ACDD3F */ .word 0x3FDDAC67
/* 198A78 00298978 182D4454 */ .word 0x54442D18
/* 198A7C 0029897C FB21E93F */ .word 0x3FE921FB
/* 198A80 00298980 9BF681D2 */ .word 0xD281F69B
/* 198A84 00298984 0B73EF3F */ .word 0x3FEF730B
/* 198A88 00298988 182D4454 */ .word 0x54442D18
/* 198A8C 0029898C FB21F93F */ .word 0x3FF921FB
