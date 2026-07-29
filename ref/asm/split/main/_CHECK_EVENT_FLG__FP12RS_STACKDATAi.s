.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _CHECK_EVENT_FLG__FP12RS_STACKDATAi
/* 0BBCC0 001BBBC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BBCC4 001BBBC4 1000BF7F */  sq          $31, 0x10($29)
/* 0BBCC8 001BBBC8 0000B07F */  sq          $16, 0x0($29)
/* 0BBCCC 001BBBCC 08009024 */  addiu       $16, $4, 0x8
/* 0BBCD0 001BBBD0 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BBCD4 001BBBD4 00000000 */   nop
/* 0BBCD8 001BBBD8 789C848F */  lw          $4, -0x6388($28)
/* 0BBCDC 001BBBDC 282E4070 */  paddub      $5, $2, $0
/* 0BBCE0 001BBBE0 B0F6060C */  jal         ChkEventFlag__11CUserStatusFi
/* 0BBCE4 001BBBE4 00000000 */   nop
/* 0BBCE8 001BBBE8 282E4070 */  paddub      $5, $2, $0
/* 0BBCEC 001BBBEC 28260072 */  paddub      $4, $16, $0
/* 0BBCF0 001BBBF0 70EE060C */  jal         SetStack__FP12RS_STACKDATAi__2
/* 0BBCF4 001BBBF4 00000000 */   nop
/* 0BBCF8 001BBBF8 01000224 */  addiu       $2, $0, 0x1
/* 0BBCFC 001BBBFC 1000BF7B */  lq          $31, 0x10($29)
/* 0BBD00 001BBC00 0000B07B */  lq          $16, 0x0($29)
/* 0BBD04 001BBC04 2000BD27 */  addiu       $29, $29, 0x20
/* 0BBD08 001BBC08 0800E003 */  jr          $31
/* 0BBD0C 001BBC0C 00000000 */   nop
