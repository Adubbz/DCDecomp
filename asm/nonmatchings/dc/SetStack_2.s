.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStack__FP12RS_STACKDATAf
/* 8A500 0018A400 0000858C */  lw         $5, 0x0($4)
/* 8A504 0018A404 03000324 */  addiu      $3, $0, 0x3
/* 8A508 0018A408 0300A314 */  bne        $5, $3, .L0018A418
/* 8A50C 0018A40C 00000000 */   nop
/* 8A510 0018A410 0400838C */  lw         $3, 0x4($4)
/* 8A514 0018A414 04006CE4 */  swc1       $f12, 0x4($3)
.L0018A418:
/* 8A518 0018A418 0800E003 */  jr         $31
/* 8A51C 0018A41C 00000000 */   nop
