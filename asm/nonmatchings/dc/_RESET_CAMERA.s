.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RESET_CAMERA__FP12RS_STACKDATAi
/* 929F0 001928F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 929F4 001928F4 0000BF7F */  sq         $31, 0x0($sp)
/* 929F8 001928F8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 929FC 001928FC 00000000 */   nop
/* 92A00 00192900 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92A04 00192904 14D222AC */  sw         $2, -0x2DEC($at)
/* 92A08 00192908 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 92A0C 0019290C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 92A10 00192910 18D220E4 */  swc1       $f0, -0x2DE8($at)
/* 92A14 00192914 01000224 */  addiu      $2, $0, 0x1
/* 92A18 00192918 0000BF7B */  lq         $31, 0x0($sp)
/* 92A1C 0019291C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 92A20 00192920 0800E003 */  jr         $31
/* 92A24 00192924 00000000 */   nop
/* 92A28 00192928 00000000 */  nop
/* 92A2C 0019292C 00000000 */  nop
