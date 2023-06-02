.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _cleanup_r
/* 1BD0 00101AD0 1000053C */  lui        $5, %hi(fflush)
/* 1BD4 00101AD4 2E090408 */  j          _fwalk
/* 1BD8 00101AD8 2018A524 */   addiu     $5, $5, %lo(fflush)
/* 1BDC 00101ADC 00000000 */  nop
