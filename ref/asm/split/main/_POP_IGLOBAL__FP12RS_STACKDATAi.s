.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _POP_IGLOBAL__FP12RS_STACKDATAi
/* 0E6560 001E6460 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0E6564 001E6464 2000BF7F */  sq          $31, 0x20($29)
/* 0E6568 001E6468 1000B17F */  sq          $17, 0x10($29)
/* 0E656C 001E646C 0000B07F */  sq          $16, 0x0($29)
/* 0E6570 001E6470 E09C828F */  lw          $2, -0x6320($28)
/* 0E6574 001E6474 9000508C */  lw          $16, 0x90($2)
/* 0E6578 001E6478 08009124 */  addiu       $17, $4, 0x8
/* 0E657C 001E647C 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E6580 001E6480 00000000 */   nop
/* 0E6584 001E6484 04004004 */  bltz        $2, .L001E6498
/* 0E6588 001E6488 00000000 */   nop
/* 0E658C 001E648C 08004128 */  slti        $1, $2, 0x8
/* 0E6590 001E6490 04002014 */  bnez        $1, .L001E64A4
/* 0E6594 001E6494 00000000 */   nop
.L001E6498:
/* 0E6598 001E6498 28160070 */  paddub      $2, $0, $0
/* 0E659C 001E649C 0C000010 */  b           .L001E64D0
/* 0E65A0 001E64A0 00000000 */   nop
.L001E64A4:
/* 0E65A4 001E64A4 28262072 */  paddub      $4, $17, $0
/* 0E65A8 001E64A8 40291000 */  sll         $5, $16, 5
/* 0E65AC 001E64AC D901033C */  lui         $3, %hi(PUSH_INT_DATA)
/* 0E65B0 001E64B0 80FA6324 */  addiu       $3, $3, %lo(PUSH_INT_DATA)
/* 0E65B4 001E64B4 21186500 */  addu        $3, $3, $5
/* 0E65B8 001E64B8 80100200 */  sll         $2, $2, 2
/* 0E65BC 001E64BC 21104300 */  addu        $2, $2, $3
/* 0E65C0 001E64C0 0000458C */  lw          $5, 0x0($2)
/* 0E65C4 001E64C4 B485070C */  jal         SetStack__FP12RS_STACKDATAi__3
/* 0E65C8 001E64C8 00000000 */   nop
/* 0E65CC 001E64CC 01000224 */  addiu       $2, $0, 0x1
.L001E64D0:
/* 0E65D0 001E64D0 2000BF7B */  lq          $31, 0x20($29)
/* 0E65D4 001E64D4 1000B17B */  lq          $17, 0x10($29)
/* 0E65D8 001E64D8 0000B07B */  lq          $16, 0x0($29)
/* 0E65DC 001E64DC 3000BD27 */  addiu       $29, $29, 0x30
/* 0E65E0 001E64E0 0800E003 */  jr          $31
/* 0E65E4 001E64E4 00000000 */   nop
/* 0E65E8 001E64E8 00000000 */  nop
/* 0E65EC 001E64EC 00000000 */  nop
