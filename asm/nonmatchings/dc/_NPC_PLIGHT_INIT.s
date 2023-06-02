.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_PLIGHT_INIT__FP12RS_STACKDATAi
/* 8F870 0018F770 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8F874 0018F774 0000BF7F */  sq         $31, 0x0($sp)
/* 8F878 0018F778 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F87C 0018F77C 00000000 */   nop
/* 8F880 0018F780 28264070 */  paddub     $4, $2, $0
/* 8F884 0018F784 842C060C */  jal        GetChara__Fi
/* 8F888 0018F788 00000000 */   nop
/* 8F88C 0018F78C 04004014 */  bnez       $2, .L0018F7A0
/* 8F890 0018F790 00000000 */   nop
/* 8F894 0018F794 28160070 */  paddub     $2, $0, $0
/* 8F898 0018F798 05000010 */  b          .L0018F7B0
/* 8F89C 0018F79C 00000000 */   nop
.L0018F7A0:
/* 8F8A0 0018F7A0 28264070 */  paddub     $4, $2, $0
/* 8F8A4 0018F7A4 A8DF040C */  jal        ClearPointLight__10CCharacterFv
/* 8F8A8 0018F7A8 00000000 */   nop
/* 8F8AC 0018F7AC 01000224 */  addiu      $2, $0, 0x1
.L0018F7B0:
/* 8F8B0 0018F7B0 0000BF7B */  lq         $31, 0x0($sp)
/* 8F8B4 0018F7B4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8F8B8 0018F7B8 0800E003 */  jr         $31
/* 8F8BC 0018F7BC 00000000 */   nop
