.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _cleanup
/* 001BE0 00101AE0 2500023C */  lui         $2, (0x250000 >> 16)
/* 001BE4 00101AE4 B4060408 */  j           _cleanup_r
/* 001BE8 00101AE8 ECFD448C */   lw         $4, -0x214($2)
/* 001BEC 00101AEC 00000000 */  nop
