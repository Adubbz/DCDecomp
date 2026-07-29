.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SYNC_SCENE_CAMERA__FP12RS_STACKDATAi
/* 08D8D0 0018D7D0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08D8D4 0018D7D4 1000BF7F */  sq          $31, 0x10($29)
/* 08D8D8 0018D7D8 0000B07F */  sq          $16, 0x0($29)
/* 08D8DC 0018D7DC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D8E0 0018D7E0 00000000 */   nop
/* 08D8E4 0018D7E4 28264070 */  paddub      $4, $2, $0
/* 08D8E8 0018D7E8 6C2C060C */  jal         GetScene__Fi
/* 08D8EC 0018D7EC 00000000 */   nop
/* 08D8F0 0018D7F0 28864070 */  paddub      $16, $2, $0
/* 08D8F4 0018D7F4 04000016 */  bnez        $16, .L0018D808
/* 08D8F8 0018D7F8 00000000 */   nop
/* 08D8FC 0018D7FC 28160070 */  paddub      $2, $0, $0
/* 08D900 0018D800 0B000010 */  b           .L0018D830
/* 08D904 0018D804 00000000 */   nop
.L0018D808:
/* 08D908 0018D808 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08D90C 0018D80C 10D2248C */  lw          $4, %lo(EdEventInfo + 0x40)($1)
/* 08D910 0018D810 06008010 */  beqz        $4, .L0018D82C
/* 08D914 0018D814 00000000 */   nop
/* 08D918 0018D818 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 08D91C 0018D81C 00000000 */   nop
/* 08D920 0018D820 D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 08D924 0018D824 10D2228C */  lw          $2, %lo(EdEventInfo + 0x40)($1)
/* 08D928 0018D828 100302AE */  sw          $2, 0x310($16)
.L0018D82C:
/* 08D92C 0018D82C 01000224 */  addiu       $2, $0, 0x1
.L0018D830:
/* 08D930 0018D830 1000BF7B */  lq          $31, 0x10($29)
/* 08D934 0018D834 0000B07B */  lq          $16, 0x0($29)
/* 08D938 0018D838 2000BD27 */  addiu       $29, $29, 0x20
/* 08D93C 0018D83C 0800E003 */  jr          $31
/* 08D940 0018D840 00000000 */   nop
/* 08D944 0018D844 00000000 */  nop
/* 08D948 0018D848 00000000 */  nop
/* 08D94C 0018D84C 00000000 */  nop
