.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RELEASE_CHARA_ITEM__FP12RS_STACKDATAi
/* 8DE60 0018DD60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8DE64 0018DD64 0000BF7F */  sq         $31, 0x0($sp)
/* 8DE68 0018DD68 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DE6C 0018DD6C 00000000 */   nop
/* 8DE70 0018DD70 28264070 */  paddub     $4, $2, $0
/* 8DE74 0018DD74 A02C060C */  jal        GetItemFrame__Fi
/* 8DE78 0018DD78 00000000 */   nop
/* 8DE7C 0018DD7C 04004010 */  beqz       $2, .L0018DD90
/* 8DE80 0018DD80 00000000 */   nop
/* 8DE84 0018DD84 28264070 */  paddub     $4, $2, $0
/* 8DE88 0018DD88 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8DE8C 0018DD8C 00000000 */   nop
.L0018DD90:
/* 8DE90 0018DD90 01000224 */  addiu      $2, $0, 0x1
/* 8DE94 0018DD94 0000BF7B */  lq         $31, 0x0($sp)
/* 8DE98 0018DD98 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8DE9C 0018DD9C 0800E003 */  jr         $31
/* 8DEA0 0018DDA0 00000000 */   nop
/* 8DEA4 0018DDA4 00000000 */  nop
/* 8DEA8 0018DDA8 00000000 */  nop
/* 8DEAC 0018DDAC 00000000 */  nop
