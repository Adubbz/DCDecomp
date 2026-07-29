.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_NPC_FLOOR_ID__FP12RS_STACKDATAi
/* 08F120 0018F020 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08F124 0018F024 2000BF7F */  sq          $31, 0x20($29)
/* 08F128 0018F028 1000B17F */  sq          $17, 0x10($29)
/* 08F12C 0018F02C 0000B07F */  sq          $16, 0x0($29)
/* 08F130 0018F030 08009124 */  addiu       $17, $4, 0x8
/* 08F134 0018F034 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F138 0018F038 00000000 */   nop
/* 08F13C 0018F03C 28264070 */  paddub      $4, $2, $0
/* 08F140 0018F040 842C060C */  jal         GetChara__Fi
/* 08F144 0018F044 00000000 */   nop
/* 08F148 0018F048 28864070 */  paddub      $16, $2, $0
/* 08F14C 0018F04C 04000016 */  bnez        $16, .L0018F060
/* 08F150 0018F050 00000000 */   nop
/* 08F154 0018F054 28160070 */  paddub      $2, $0, $0
/* 08F158 0018F058 09000010 */  b           .L0018F080
/* 08F15C 0018F05C 00000000 */   nop
.L0018F060:
/* 08F160 0018F060 28262072 */  paddub      $4, $17, $0
/* 08F164 0018F064 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F168 0018F068 00000000 */   nop
/* 08F16C 0018F06C 28260072 */  paddub      $4, $16, $0
/* 08F170 0018F070 282E4070 */  paddub      $5, $2, $0
/* 08F174 0018F074 84E0040C */  jal         SetFootSoundID__10CCharacterFi
/* 08F178 0018F078 00000000 */   nop
/* 08F17C 0018F07C 01000224 */  addiu       $2, $0, 0x1
.L0018F080:
/* 08F180 0018F080 2000BF7B */  lq          $31, 0x20($29)
/* 08F184 0018F084 1000B17B */  lq          $17, 0x10($29)
/* 08F188 0018F088 0000B07B */  lq          $16, 0x0($29)
/* 08F18C 0018F08C 3000BD27 */  addiu       $29, $29, 0x30
/* 08F190 0018F090 0800E003 */  jr          $31
/* 08F194 0018F094 00000000 */   nop
/* 08F198 0018F098 00000000 */  nop
/* 08F19C 0018F09C 00000000 */  nop
