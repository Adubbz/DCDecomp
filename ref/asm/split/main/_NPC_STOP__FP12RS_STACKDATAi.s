.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NPC_STOP__FP12RS_STACKDATAi
/* 08F260 0018F160 B0FFBD27 */  addiu       $29, $29, -0x50
/* 08F264 0018F164 4000BF7F */  sq          $31, 0x40($29)
/* 08F268 0018F168 3000B37F */  sq          $19, 0x30($29)
/* 08F26C 0018F16C 2000B27F */  sq          $18, 0x20($29)
/* 08F270 0018F170 1000B17F */  sq          $17, 0x10($29)
/* 08F274 0018F174 0000B07F */  sq          $16, 0x0($29)
/* 08F278 0018F178 2896A070 */  paddub      $18, $5, $0
/* 08F27C 0018F17C 08009324 */  addiu       $19, $4, 0x8
/* 08F280 0018F180 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F284 0018F184 00000000 */   nop
/* 08F288 0018F188 28864070 */  paddub      $16, $2, $0
/* 08F28C 0018F18C 288E0070 */  paddub      $17, $0, $0
/* 08F290 0018F190 12000010 */  b           .L0018F1DC
/* 08F294 0018F194 00000000 */   nop
.L0018F198:
/* 08F298 0018F198 28266072 */  paddub      $4, $19, $0
/* 08F29C 0018F19C 08009324 */  addiu       $19, $4, 0x8
/* 08F2A0 0018F1A0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F2A4 0018F1A4 00000000 */   nop
/* 08F2A8 0018F1A8 06004004 */  bltz        $2, .L0018F1C4
/* 08F2AC 0018F1AC 00000000 */   nop
/* 08F2B0 0018F1B0 80200200 */  sll         $4, $2, 2
/* 08F2B4 0018F1B4 D401033C */  lui         $3, %hi(EdEventInfo + 0x174)
/* 08F2B8 0018F1B8 44D36324 */  addiu       $3, $3, %lo(EdEventInfo + 0x174)
/* 08F2BC 0018F1BC 21186400 */  addu        $3, $3, $4
/* 08F2C0 0018F1C0 000070AC */  sw          $16, 0x0($3)
.L0018F1C4:
/* 08F2C4 0018F1C4 FFFF0324 */  addiu       $3, $0, -0x1
/* 08F2C8 0018F1C8 03004314 */  bne         $2, $3, .L0018F1D8
/* 08F2CC 0018F1CC 00000000 */   nop
/* 08F2D0 0018F1D0 D401013C */  lui         $1, %hi(EdEventInfo + 0x6C)
/* 08F2D4 0018F1D4 3CD230AC */  sw          $16, %lo(EdEventInfo + 0x6C)($1)
.L0018F1D8:
/* 08F2D8 0018F1D8 01003126 */  addiu       $17, $17, 0x1
.L0018F1DC:
/* 08F2DC 0018F1DC FFFF4226 */  addiu       $2, $18, -0x1
/* 08F2E0 0018F1E0 2A102202 */  slt         $2, $17, $2
/* 08F2E4 0018F1E4 ECFF4014 */  bnez        $2, .L0018F198
/* 08F2E8 0018F1E8 00000000 */   nop
/* 08F2EC 0018F1EC 01000224 */  addiu       $2, $0, 0x1
/* 08F2F0 0018F1F0 4000BF7B */  lq          $31, 0x40($29)
/* 08F2F4 0018F1F4 3000B37B */  lq          $19, 0x30($29)
/* 08F2F8 0018F1F8 2000B27B */  lq          $18, 0x20($29)
/* 08F2FC 0018F1FC 1000B17B */  lq          $17, 0x10($29)
/* 08F300 0018F200 0000B07B */  lq          $16, 0x0($29)
/* 08F304 0018F204 5000BD27 */  addiu       $29, $29, 0x50
/* 08F308 0018F208 0800E003 */  jr          $31
/* 08F30C 0018F20C 00000000 */   nop
