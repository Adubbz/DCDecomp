.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SSET_NPC_TALK_MES__FP12RS_STACKDATAi
/* 08FA10 0018F910 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08FA14 0018F914 2000BF7F */  sq          $31, 0x20($29)
/* 08FA18 0018F918 1000B17F */  sq          $17, 0x10($29)
/* 08FA1C 0018F91C 0000B07F */  sq          $16, 0x0($29)
/* 08FA20 0018F920 08009124 */  addiu       $17, $4, 0x8
/* 08FA24 0018F924 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FA28 0018F928 00000000 */   nop
/* 08FA2C 0018F92C 1C8D848F */  lw          $4, -0x72E4($28)
/* 08FA30 0018F930 2090858F */  lw          $5, -0x6FE0($28)
/* 08FA34 0018F934 28364070 */  paddub      $6, $2, $0
/* 08FA38 0018F938 3460050C */  jal         GetGrdNPCData__9CSaveDataFii
/* 08FA3C 0018F93C 00000000 */   nop
/* 08FA40 0018F940 28864070 */  paddub      $16, $2, $0
/* 08FA44 0018F944 04000016 */  bnez        $16, .L0018F958
/* 08FA48 0018F948 00000000 */   nop
/* 08FA4C 0018F94C 28160070 */  paddub      $2, $0, $0
/* 08FA50 0018F950 06000010 */  b           .L0018F96C
/* 08FA54 0018F954 00000000 */   nop
.L0018F958:
/* 08FA58 0018F958 28262072 */  paddub      $4, $17, $0
/* 08FA5C 0018F95C D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FA60 0018F960 00000000 */   nop
/* 08FA64 0018F964 080002AE */  sw          $2, 0x8($16)
/* 08FA68 0018F968 01000224 */  addiu       $2, $0, 0x1
.L0018F96C:
/* 08FA6C 0018F96C 2000BF7B */  lq          $31, 0x20($29)
/* 08FA70 0018F970 1000B17B */  lq          $17, 0x10($29)
/* 08FA74 0018F974 0000B07B */  lq          $16, 0x0($29)
/* 08FA78 0018F978 3000BD27 */  addiu       $29, $29, 0x30
/* 08FA7C 0018F97C 0800E003 */  jr          $31
/* 08FA80 0018F980 00000000 */   nop
/* 08FA84 0018F984 00000000 */  nop
/* 08FA88 0018F988 00000000 */  nop
/* 08FA8C 0018F98C 00000000 */  nop
