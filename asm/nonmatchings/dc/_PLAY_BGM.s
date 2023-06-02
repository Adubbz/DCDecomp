.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _PLAY_BGM__FP12RS_STACKDATAi
/* 95DF0 00195CF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 95DF4 00195CF4 0000BF7F */  sq         $31, 0x0($sp)
/* 95DF8 00195CF8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95DFC 00195CFC 00000000 */   nop
/* 95E00 00195D00 28264070 */  paddub     $4, $2, $0
/* 95E04 00195D04 CC66050C */  jal        SndBgmPlay__Fi
/* 95E08 00195D08 00000000 */   nop
/* 95E0C 00195D0C 01000224 */  addiu      $2, $0, 0x1
/* 95E10 00195D10 0000BF7B */  lq         $31, 0x0($sp)
/* 95E14 00195D14 1000BD27 */  addiu      $sp, $sp, 0x10
/* 95E18 00195D18 0800E003 */  jr         $31
/* 95E1C 00195D1C 00000000 */   nop
