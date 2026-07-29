.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NPC_COL__FP12RS_STACKDATAi
/* 08F1B0 0018F0B0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 08F1B4 0018F0B4 4000BF7F */  sq          $31, 0x40($29)
/* 08F1B8 0018F0B8 3000B37F */  sq          $19, 0x30($29)
/* 08F1BC 0018F0BC 2000B27F */  sq          $18, 0x20($29)
/* 08F1C0 0018F0C0 1000B17F */  sq          $17, 0x10($29)
/* 08F1C4 0018F0C4 0000B07F */  sq          $16, 0x0($29)
/* 08F1C8 0018F0C8 2896A070 */  paddub      $18, $5, $0
/* 08F1CC 0018F0CC 08009324 */  addiu       $19, $4, 0x8
/* 08F1D0 0018F0D0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F1D4 0018F0D4 00000000 */   nop
/* 08F1D8 0018F0D8 28864070 */  paddub      $16, $2, $0
/* 08F1DC 0018F0DC 288E0070 */  paddub      $17, $0, $0
/* 08F1E0 0018F0E0 12000010 */  b           .L0018F12C
/* 08F1E4 0018F0E4 00000000 */   nop
.L0018F0E8:
/* 08F1E8 0018F0E8 28266072 */  paddub      $4, $19, $0
/* 08F1EC 0018F0EC 08009324 */  addiu       $19, $4, 0x8
/* 08F1F0 0018F0F0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F1F4 0018F0F4 00000000 */   nop
/* 08F1F8 0018F0F8 06004004 */  bltz        $2, .L0018F114
/* 08F1FC 0018F0FC 00000000 */   nop
/* 08F200 0018F100 80200200 */  sll         $4, $2, 2
/* 08F204 0018F104 D401033C */  lui         $3, %hi(EdEventInfo + 0x74)
/* 08F208 0018F108 44D26324 */  addiu       $3, $3, %lo(EdEventInfo + 0x74)
/* 08F20C 0018F10C 21186400 */  addu        $3, $3, $4
/* 08F210 0018F110 000070AC */  sw          $16, 0x0($3)
.L0018F114:
/* 08F214 0018F114 FFFF0324 */  addiu       $3, $0, -0x1
/* 08F218 0018F118 03004314 */  bne         $2, $3, .L0018F128
/* 08F21C 0018F11C 00000000 */   nop
/* 08F220 0018F120 D401013C */  lui         $1, %hi(EdEventInfo + 0x5C)
/* 08F224 0018F124 2CD230AC */  sw          $16, %lo(EdEventInfo + 0x5C)($1)
.L0018F128:
/* 08F228 0018F128 01003126 */  addiu       $17, $17, 0x1
.L0018F12C:
/* 08F22C 0018F12C FFFF4226 */  addiu       $2, $18, -0x1
/* 08F230 0018F130 2A102202 */  slt         $2, $17, $2
/* 08F234 0018F134 ECFF4014 */  bnez        $2, .L0018F0E8
/* 08F238 0018F138 00000000 */   nop
/* 08F23C 0018F13C 01000224 */  addiu       $2, $0, 0x1
/* 08F240 0018F140 4000BF7B */  lq          $31, 0x40($29)
/* 08F244 0018F144 3000B37B */  lq          $19, 0x30($29)
/* 08F248 0018F148 2000B27B */  lq          $18, 0x20($29)
/* 08F24C 0018F14C 1000B17B */  lq          $17, 0x10($29)
/* 08F250 0018F150 0000B07B */  lq          $16, 0x0($29)
/* 08F254 0018F154 5000BD27 */  addiu       $29, $29, 0x50
/* 08F258 0018F158 0800E003 */  jr          $31
/* 08F25C 0018F15C 00000000 */   nop
