.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _PUSH_IGLOBAL__FP12RS_STACKDATAi
/* 0E64C0 001E63C0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0E64C4 001E63C4 3000BF7F */  sq          $31, 0x30($29)
/* 0E64C8 001E63C8 2000B27F */  sq          $18, 0x20($29)
/* 0E64CC 001E63CC 1000B17F */  sq          $17, 0x10($29)
/* 0E64D0 001E63D0 0000B07F */  sq          $16, 0x0($29)
/* 0E64D4 001E63D4 E09C828F */  lw          $2, -0x6320($28)
/* 0E64D8 001E63D8 9000518C */  lw          $17, 0x90($2)
/* 0E64DC 001E63DC 08009224 */  addiu       $18, $4, 0x8
/* 0E64E0 001E63E0 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E64E4 001E63E4 00000000 */   nop
/* 0E64E8 001E63E8 28864070 */  paddub      $16, $2, $0
/* 0E64EC 001E63EC 04000006 */  bltz        $16, .L001E6400
/* 0E64F0 001E63F0 00000000 */   nop
/* 0E64F4 001E63F4 0800012A */  slti        $1, $16, 0x8
/* 0E64F8 001E63F8 04002014 */  bnez        $1, .L001E640C
/* 0E64FC 001E63FC 00000000 */   nop
.L001E6400:
/* 0E6500 001E6400 28160070 */  paddub      $2, $0, $0
/* 0E6504 001E6404 0C000010 */  b           .L001E6438
/* 0E6508 001E6408 00000000 */   nop
.L001E640C:
/* 0E650C 001E640C 28264072 */  paddub      $4, $18, $0
/* 0E6510 001E6410 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E6514 001E6414 00000000 */   nop
/* 0E6518 001E6418 40211100 */  sll         $4, $17, 5
/* 0E651C 001E641C D901033C */  lui         $3, %hi(PUSH_INT_DATA)
/* 0E6520 001E6420 80FA6324 */  addiu       $3, $3, %lo(PUSH_INT_DATA)
/* 0E6524 001E6424 21206400 */  addu        $4, $3, $4
/* 0E6528 001E6428 80181000 */  sll         $3, $16, 2
/* 0E652C 001E642C 21186400 */  addu        $3, $3, $4
/* 0E6530 001E6430 000062AC */  sw          $2, 0x0($3)
/* 0E6534 001E6434 01000224 */  addiu       $2, $0, 0x1
.L001E6438:
/* 0E6538 001E6438 3000BF7B */  lq          $31, 0x30($29)
/* 0E653C 001E643C 2000B27B */  lq          $18, 0x20($29)
/* 0E6540 001E6440 1000B17B */  lq          $17, 0x10($29)
/* 0E6544 001E6444 0000B07B */  lq          $16, 0x0($29)
/* 0E6548 001E6448 4000BD27 */  addiu       $29, $29, 0x40
/* 0E654C 001E644C 0800E003 */  jr          $31
/* 0E6550 001E6450 00000000 */   nop
/* 0E6554 001E6454 00000000 */  nop
/* 0E6558 001E6458 00000000 */  nop
/* 0E655C 001E645C 00000000 */  nop
