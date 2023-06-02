.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPrevEastKingSndVol__Fv
/* 132F00 00232E00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 132F04 00232E04 0000BF7F */  sq         $31, 0x0($sp)
/* 132F08 00232E08 7867050C */  jal        SndGetBgmVol__Fv
/* 132F0C 00232E0C 00000000 */   nop
/* 132F10 00232E10 B49782A7 */  sh         $2, -0x684C($gp)
/* 132F14 00232E14 0000BF7B */  lq         $31, 0x0($sp)
/* 132F18 00232E18 1000BD27 */  addiu      $sp, $sp, 0x10
/* 132F1C 00232E1C 0800E003 */  jr         $31
/* 132F20 00232E20 00000000 */   nop
/* 132F24 00232E24 00000000 */  nop
/* 132F28 00232E28 00000000 */  nop
/* 132F2C 00232E2C 00000000 */  nop
