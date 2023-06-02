.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _END_BEE__FP12RS_STACKDATAi
/* BD280 001BD180 FFFF0224 */  addiu      $2, $0, -0x1
/* BD284 001BD184 D501013C */  lui        $at, (0x1D567D4 >> 16)
/* BD288 001BD188 D46722AC */  sw         $2, (0x1D567D4 & 0xFFFF)($at)
/* BD28C 001BD18C 01000224 */  addiu      $2, $0, 0x1
/* BD290 001BD190 0800E003 */  jr         $31
/* BD294 001BD194 00000000 */   nop
/* BD298 001BD198 00000000 */  nop
/* BD29C 001BD19C 00000000 */  nop
