.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel getAtraToSaveData__FiiP9CSaveDataii
/* 0B7570 001B7470 A0FFBD27 */  addiu       $29, $29, -0x60
/* 0B7574 001B7474 5000BF7F */  sq          $31, 0x50($29)
/* 0B7578 001B7478 4000B47F */  sq          $20, 0x40($29)
/* 0B757C 001B747C 3000B37F */  sq          $19, 0x30($29)
/* 0B7580 001B7480 2000B27F */  sq          $18, 0x20($29)
/* 0B7584 001B7484 1000B17F */  sq          $17, 0x10($29)
/* 0B7588 001B7488 0000B07F */  sq          $16, 0x0($29)
/* 0B758C 001B748C 28A68070 */  paddub      $20, $4, $0
/* 0B7590 001B7490 289EA070 */  paddub      $19, $5, $0
/* 0B7594 001B7494 2896C070 */  paddub      $18, $6, $0
/* 0B7598 001B7498 288EE070 */  paddub      $17, $7, $0
/* 0B759C 001B749C 28860071 */  paddub      $16, $8, $0
/* 0B75A0 001B74A0 2A00023C */  lui         $2, %hi(LIT_958)
/* 0B75A4 001B74A4 70BC4424 */  addiu       $4, $2, %lo(LIT_958)
/* 0B75A8 001B74A8 282E8072 */  paddub      $5, $20, $0
/* 0B75AC 001B74AC A611040C */  jal         printf
/* 0B75B0 001B74B0 00000000 */   nop
/* 0B75B4 001B74B4 2800812A */  slti        $1, $20, 0x28
/* 0B75B8 001B74B8 08002010 */  beqz        $1, .L001B74DC
/* 0B75BC 001B74BC 00000000 */   nop
/* 0B75C0 001B74C0 28264072 */  paddub      $4, $18, $0
/* 0B75C4 001B74C4 282E2072 */  paddub      $5, $17, $0
/* 0B75C8 001B74C8 28368072 */  paddub      $6, $20, $0
/* 0B75CC 001B74CC 9861050C */  jal         AtraPartsGet__9CSaveDataFii
/* 0B75D0 001B74D0 00000000 */   nop
/* 0B75D4 001B74D4 06000010 */  b           .L001B74F0
/* 0B75D8 001B74D8 00000000 */   nop
.L001B74DC:
/* 0B75DC 001B74DC D8FF8626 */  addiu       $6, $20, -0x28
/* 0B75E0 001B74E0 28264072 */  paddub      $4, $18, $0
/* 0B75E4 001B74E4 282E2072 */  paddub      $5, $17, $0
/* 0B75E8 001B74E8 D861050C */  jal         AtraChipGet__9CSaveDataFii
/* 0B75EC 001B74EC 00000000 */   nop
.L001B74F0:
/* 0B75F0 001B74F0 789C848F */  lw          $4, -0x6388($28)
/* 0B75F4 001B74F4 282E2072 */  paddub      $5, $17, $0
/* 0B75F8 001B74F8 28360072 */  paddub      $6, $16, $0
/* 0B75FC 001B74FC 283E6072 */  paddub      $7, $19, $0
/* 0B7600 001B7500 54FE060C */  jal         GetAtraData__14CDngStatusDataFiii
/* 0B7604 001B7504 00000000 */   nop
/* 0B7608 001B7508 5000BF7B */  lq          $31, 0x50($29)
/* 0B760C 001B750C 4000B47B */  lq          $20, 0x40($29)
/* 0B7610 001B7510 3000B37B */  lq          $19, 0x30($29)
/* 0B7614 001B7514 2000B27B */  lq          $18, 0x20($29)
/* 0B7618 001B7518 1000B17B */  lq          $17, 0x10($29)
/* 0B761C 001B751C 0000B07B */  lq          $16, 0x0($29)
/* 0B7620 001B7520 6000BD27 */  addiu       $29, $29, 0x60
/* 0B7624 001B7524 0800E003 */  jr          $31
/* 0B7628 001B7528 00000000 */   nop
/* 0B762C 001B752C 00000000 */  nop
