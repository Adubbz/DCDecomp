.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _RELEASE_SCENE_CAMERA__FP12RS_STACKDATAi
/* 08D9E0 0018D8E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08D9E4 0018D8E4 0000BF7F */  sq          $31, 0x0($29)
/* 08D9E8 0018D8E8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D9EC 0018D8EC 00000000 */   nop
/* 08D9F0 0018D8F0 28264070 */  paddub      $4, $2, $0
/* 08D9F4 0018D8F4 6C2C060C */  jal         GetScene__Fi
/* 08D9F8 0018D8F8 00000000 */   nop
/* 08D9FC 0018D8FC 04004014 */  bnez        $2, .L0018D910
/* 08DA00 0018D900 00000000 */   nop
/* 08DA04 0018D904 28160070 */  paddub      $2, $0, $0
/* 08DA08 0018D908 05000010 */  b           .L0018D920
/* 08DA0C 0018D90C 00000000 */   nop
.L0018D910:
/* 08DA10 0018D910 D501033C */  lui         $3, %hi(DmmyCamera)
/* 08DA14 0018D914 70A16324 */  addiu       $3, $3, %lo(DmmyCamera)
/* 08DA18 0018D918 100343AC */  sw          $3, 0x310($2)
/* 08DA1C 0018D91C 01000224 */  addiu       $2, $0, 0x1
.L0018D920:
/* 08DA20 0018D920 0000BF7B */  lq          $31, 0x0($29)
/* 08DA24 0018D924 1000BD27 */  addiu       $29, $29, 0x10
/* 08DA28 0018D928 0800E003 */  jr          $31
/* 08DA2C 0018D92C 00000000 */   nop
