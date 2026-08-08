.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_480__2
/* 19F3D0 0029F2D0 6D616E75 */ .word 0x756E616D
/* 19F3D4 0029F2D4 616C2F6D */ .word 0x6D2F6C61
/* 19F3D8 0029F2D8 2564622E */ .word 0x2E626425
/* 19F3DC 0029F2DC 70616300 */ .word GlobalDataBuffer + 0x38B0F0
