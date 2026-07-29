.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RELEASE_CHARA_ITEM__FP12RS_STACKDATAi
/* 08DE60 0018DD60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08DE64 0018DD64 0000BF7F */  sq          $31, 0x0($29)
/* 08DE68 0018DD68 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DE6C 0018DD6C 00000000 */   nop
/* 08DE70 0018DD70 28264070 */  paddub      $4, $2, $0
/* 08DE74 0018DD74 A02C060C */  jal         GetItemFrame__Fi
/* 08DE78 0018DD78 00000000 */   nop
/* 08DE7C 0018DD7C 04004010 */  beqz        $2, .L0018DD90
/* 08DE80 0018DD80 00000000 */   nop
/* 08DE84 0018DD84 28264070 */  paddub      $4, $2, $0
/* 08DE88 0018DD88 68A0040C */  jal         DeleteReference__6CFrameFv
/* 08DE8C 0018DD8C 00000000 */   nop
.L0018DD90:
/* 08DE90 0018DD90 01000224 */  addiu       $2, $0, 0x1
/* 08DE94 0018DD94 0000BF7B */  lq          $31, 0x0($29)
/* 08DE98 0018DD98 1000BD27 */  addiu       $29, $29, 0x10
/* 08DE9C 0018DD9C 0800E003 */  jr          $31
/* 08DEA0 0018DDA0 00000000 */   nop
/* 08DEA4 0018DDA4 00000000 */  nop
/* 08DEA8 0018DDA8 00000000 */  nop
/* 08DEAC 0018DDAC 00000000 */  nop
