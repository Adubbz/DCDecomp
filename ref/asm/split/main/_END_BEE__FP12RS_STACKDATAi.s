.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _END_BEE__FP12RS_STACKDATAi
/* 0BD280 001BD180 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BD284 001BD184 D501013C */  lui         $1, %hi(BtEventInfo + 0x94)
/* 0BD288 001BD188 D46722AC */  sw          $2, %lo(BtEventInfo + 0x94)($1)
/* 0BD28C 001BD18C 01000224 */  addiu       $2, $0, 0x1
/* 0BD290 001BD190 0800E003 */  jr          $31
/* 0BD294 001BD194 00000000 */   nop
/* 0BD298 001BD198 00000000 */  nop
/* 0BD29C 001BD19C 00000000 */  nop
