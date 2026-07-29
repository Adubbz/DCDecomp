.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RESET_CAMERA__FP12RS_STACKDATAi
/* 0929F0 001928F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0929F4 001928F4 0000BF7F */  sq          $31, 0x0($29)
/* 0929F8 001928F8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0929FC 001928FC 00000000 */   nop
/* 092A00 00192900 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 092A04 00192904 14D222AC */  sw          $2, %lo(EdEventInfo + 0x44)($1)
/* 092A08 00192908 288180C7 */  lwc1        $f0, -0x7ED8($28)
/* 092A0C 0019290C D401013C */  lui         $1, %hi(EdEventInfo + 0x48)
/* 092A10 00192910 18D220E4 */  swc1        $f0, %lo(EdEventInfo + 0x48)($1)
/* 092A14 00192914 01000224 */  addiu       $2, $0, 0x1
/* 092A18 00192918 0000BF7B */  lq          $31, 0x0($29)
/* 092A1C 0019291C 1000BD27 */  addiu       $29, $29, 0x10
/* 092A20 00192920 0800E003 */  jr          $31
/* 092A24 00192924 00000000 */   nop
/* 092A28 00192928 00000000 */  nop
/* 092A2C 0019292C 00000000 */  nop
