.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndGetDefaultBgmVol__Fv
/* 59EF0 00159DF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59EF4 00159DF4 0000BF7F */  sq         $31, 0x0($sp)
/* 59EF8 00159DF8 048E828F */  lw         $2, -0x71FC($gp)
/* 59EFC 00159DFC 04004104 */  bgez       $2, .L00159E10
/* 59F00 00159E00 00000000 */   nop
/* 59F04 00159E04 28160070 */  paddub     $2, $0, $0
/* 59F08 00159E08 07000010 */  b          .L00159E28
/* 59F0C 00159E0C 00000000 */   nop
.L00159E10:
/* 59F10 00159E10 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 59F14 00159E14 D40E050C */  jal        GetMidiState__6CSoundFv
/* 59F18 00159E18 00000000 */   nop
/* 59F1C 00159E1C 3000428C */  lw         $2, 0x30($2)
/* 59F20 00159E20 0C00428C */  lw         $2, 0xC($2)
/* 59F24 00159E24 00000000 */  nop
.L00159E28:
/* 59F28 00159E28 0000BF7B */  lq         $31, 0x0($sp)
/* 59F2C 00159E2C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 59F30 00159E30 0800E003 */  jr         $31
/* 59F34 00159E34 00000000 */   nop
/* 59F38 00159E38 00000000 */  nop
/* 59F3C 00159E3C 00000000 */  nop
