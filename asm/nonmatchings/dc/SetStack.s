.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetStack__FP12RS_STACKDATAi
/* 8A4E0 0018A3E0 0000868C */  lw         $6, 0x0($4)
/* 8A4E4 0018A3E4 03000324 */  addiu      $3, $0, 0x3
/* 8A4E8 0018A3E8 0300C314 */  bne        $6, $3, .L0018A3F8
/* 8A4EC 0018A3EC 00000000 */   nop
/* 8A4F0 0018A3F0 0400838C */  lw         $3, 0x4($4)
/* 8A4F4 0018A3F4 040065AC */  sw         $5, 0x4($3)
.L0018A3F8:
/* 8A4F8 0018A3F8 0800E003 */  jr         $31
/* 8A4FC 0018A3FC 00000000 */   nop
