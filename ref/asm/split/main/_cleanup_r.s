.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _cleanup_r
/* 001BD0 00101AD0 1000053C */  lui         $5, %hi(fflush)
/* 001BD4 00101AD4 2E090408 */  j           _fwalk
/* 001BD8 00101AD8 2018A524 */   addiu      $5, $5, %lo(fflush)
/* 001BDC 00101ADC 00000000 */  nop
