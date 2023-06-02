.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__12CategoryAttrFv
/* 43540 00143440 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 43544 00143444 000083AC */  sw         $3, 0x0($4)
/* 43548 00143448 100080AC */  sw         $0, 0x10($4)
/* 4354C 0014344C 03000324 */  addiu      $3, $0, 0x3
/* 43550 00143450 140083AC */  sw         $3, 0x14($4)
/* 43554 00143454 0800E003 */  jr         $31
/* 43558 00143458 00000000 */   nop
/* 4355C 0014345C 00000000 */  nop
