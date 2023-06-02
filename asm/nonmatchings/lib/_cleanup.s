.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _cleanup
/* 1BE0 00101AE0 2500023C */  lui        $2, (0x250000 >> 16)
/* 1BE4 00101AE4 B4060408 */  j          _cleanup_r
/* 1BE8 00101AE8 ECFD448C */   lw        $4, -0x214($2)
/* 1BEC 00101AEC 00000000 */  nop
