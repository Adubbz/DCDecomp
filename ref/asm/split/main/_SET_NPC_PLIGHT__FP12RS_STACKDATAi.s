.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_NPC_PLIGHT__FP12RS_STACKDATAi
/* 08F8C0 0018F7C0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 08F8C4 0018F7C4 2000BF7F */  sq          $31, 0x20($29)
/* 08F8C8 0018F7C8 1000B17F */  sq          $17, 0x10($29)
/* 08F8CC 0018F7CC 0000B07F */  sq          $16, 0x0($29)
/* 08F8D0 0018F7D0 08009124 */  addiu       $17, $4, 0x8
/* 08F8D4 0018F7D4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F8D8 0018F7D8 00000000 */   nop
/* 08F8DC 0018F7DC 28264070 */  paddub      $4, $2, $0
/* 08F8E0 0018F7E0 842C060C */  jal         GetChara__Fi
/* 08F8E4 0018F7E4 00000000 */   nop
/* 08F8E8 0018F7E8 28864070 */  paddub      $16, $2, $0
/* 08F8EC 0018F7EC 04000016 */  bnez        $16, .L0018F800
/* 08F8F0 0018F7F0 00000000 */   nop
/* 08F8F4 0018F7F4 28160070 */  paddub      $2, $0, $0
/* 08F8F8 0018F7F8 1F000010 */  b           .L0018F878
/* 08F8FC 0018F7FC 00000000 */   nop
.L0018F800:
/* 08F900 0018F800 28262072 */  paddub      $4, $17, $0
/* 08F904 0018F804 3000A527 */  addiu       $5, $29, 0x30
/* 08F908 0018F808 7C2D060C */  jal         GetPosition__FP12RS_STACKDATAPf
/* 08F90C 0018F80C 00000000 */   nop
/* 08F910 0018F810 18003126 */  addiu       $17, $17, 0x18
/* 08F914 0018F814 281E0070 */  paddub      $3, $0, $0
/* 08F918 0018F818 09000010 */  b           .L0018F840
/* 08F91C 0018F81C 00000000 */   nop
.L0018F820:
/* 08F920 0018F820 28262072 */  paddub      $4, $17, $0
/* 08F924 0018F824 08009124 */  addiu       $17, $4, 0x8
/* 08F928 0018F828 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 08F92C 0018F82C 00000000 */   nop
/* 08F930 0018F830 80100300 */  sll         $2, $3, 2
/* 08F934 0018F834 21105D00 */  addu        $2, $2, $29
/* 08F938 0018F838 400040E4 */  swc1        $f0, 0x40($2)
/* 08F93C 0018F83C 01006324 */  addiu       $3, $3, 0x1
.L0018F840:
/* 08F940 0018F840 05006228 */  slti        $2, $3, 0x5
/* 08F944 0018F844 F6FF4014 */  bnez        $2, .L0018F820
/* 08F948 0018F848 00000000 */   nop
/* 08F94C 0018F84C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 08F950 0018F850 00888244 */  mtc1        $2, $f17
/* 08F954 0018F854 28260072 */  paddub      $4, $16, $0
/* 08F958 0018F858 3000A527 */  addiu       $5, $29, 0x30
/* 08F95C 0018F85C 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 08F960 0018F860 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 08F964 0018F864 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 08F968 0018F868 4C00AFC7 */  lwc1        $f15, 0x4C($29)
/* 08F96C 0018F86C 5000B0C7 */  lwc1        $f16, 0x50($29)
/* 08F970 0018F870 B8DF040C */  jal         SetPointLight__10CCharacterFPfffffff
/* 08F974 0018F874 00000000 */   nop
.L0018F878:
/* 08F978 0018F878 2000BF7B */  lq          $31, 0x20($29)
/* 08F97C 0018F87C 1000B17B */  lq          $17, 0x10($29)
/* 08F980 0018F880 0000B07B */  lq          $16, 0x0($29)
/* 08F984 0018F884 6000BD27 */  addiu       $29, $29, 0x60
/* 08F988 0018F888 0800E003 */  jr          $31
/* 08F98C 0018F88C 00000000 */   nop
