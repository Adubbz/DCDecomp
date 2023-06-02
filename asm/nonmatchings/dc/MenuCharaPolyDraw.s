.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuCharaPolyDraw__Fv
/* 106BB0 00206AB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 106BB4 00206AB4 0000BF7F */  sq         $31, 0x0($sp)
/* 106BB8 00206AB8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 106BBC 00206ABC F2EB2484 */  lh         $4, -0x140E($at)
/* 106BC0 00206AC0 BC37080C */  jal        SetNowCharaMotionNo__Fi
/* 106BC4 00206AC4 00000000 */   nop
/* 106BC8 00206AC8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 106BCC 00206ACC F2EB2484 */  lh         $4, -0x140E($at)
/* 106BD0 00206AD0 0838080C */  jal        SetItemMenuColor__Fi
/* 106BD4 00206AD4 00000000 */   nop
/* 106BD8 00206AD8 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 106BDC 00206ADC 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 106BE0 00206AE0 4CE1040C */  jal        Step__10CCharacterFv
/* 106BE4 00206AE4 00000000 */   nop
/* 106BE8 00206AE8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 106BEC 00206AEC F2EB2284 */  lh         $2, -0x140E($at)
/* 106BF0 00206AF0 06004014 */  bnez       $2, .L00206B0C
/* 106BF4 00206AF4 00000000 */   nop
/* 106BF8 00206AF8 D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 106BFC 00206AFC 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 106C00 00206B00 282E0070 */  paddub     $5, $0, $0
/* 106C04 00206B04 94E3040C */  jal        ClothStep__10CCharacterFi
/* 106C08 00206B08 00000000 */   nop
.L00206B0C:
/* 106C0C 00206B0C D901023C */  lui        $2, %hi(MenuCharaFrame)
/* 106C10 00206B10 80044424 */  addiu      $4, $2, %lo(MenuCharaFrame)
/* 106C14 00206B14 C4E4040C */  jal        Draw__10CCharacterFv
/* 106C18 00206B18 00000000 */   nop
/* 106C1C 00206B1C 5C38080C */  jal        SetItemMenuOldAmbient__Fv
/* 106C20 00206B20 00000000 */   nop
/* 106C24 00206B24 0000BF7B */  lq         $31, 0x0($sp)
/* 106C28 00206B28 1000BD27 */  addiu      $sp, $sp, 0x10
/* 106C2C 00206B2C 0800E003 */  jr         $31
/* 106C30 00206B30 00000000 */   nop
/* 106C34 00206B34 00000000 */  nop
/* 106C38 00206B38 00000000 */  nop
/* 106C3C 00206B3C 00000000 */  nop
