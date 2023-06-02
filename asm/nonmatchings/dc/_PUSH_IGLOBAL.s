.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _PUSH_IGLOBAL__FP12RS_STACKDATAi
/* E64C0 001E63C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E64C4 001E63C4 3000BF7F */  sq         $31, 0x30($sp)
/* E64C8 001E63C8 2000B27F */  sq         $18, 0x20($sp)
/* E64CC 001E63CC 1000B17F */  sq         $17, 0x10($sp)
/* E64D0 001E63D0 0000B07F */  sq         $16, 0x0($sp)
/* E64D4 001E63D4 E09C828F */  lw         $2, -0x6320($gp)
/* E64D8 001E63D8 9000518C */  lw         $17, 0x90($2)
/* E64DC 001E63DC 08009224 */  addiu      $18, $4, 0x8
/* E64E0 001E63E0 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E64E4 001E63E4 00000000 */   nop
/* E64E8 001E63E8 28864070 */  paddub     $16, $2, $0
/* E64EC 001E63EC 04000006 */  bltz       $16, .L001E6400
/* E64F0 001E63F0 00000000 */   nop
/* E64F4 001E63F4 0800012A */  slti       $at, $16, 0x8
/* E64F8 001E63F8 04002014 */  bnez       $at, .L001E640C
/* E64FC 001E63FC 00000000 */   nop
.L001E6400:
/* E6500 001E6400 28160070 */  paddub     $2, $0, $0
/* E6504 001E6404 0C000010 */  b          .L001E6438
/* E6508 001E6408 00000000 */   nop
.L001E640C:
/* E650C 001E640C 28264072 */  paddub     $4, $18, $0
/* E6510 001E6410 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E6514 001E6414 00000000 */   nop
/* E6518 001E6418 40211100 */  sll        $4, $17, 5
/* E651C 001E641C D901033C */  lui        $3, %hi(PUSH_INT_DATA)
/* E6520 001E6420 80FA6324 */  addiu      $3, $3, %lo(PUSH_INT_DATA)
/* E6524 001E6424 21206400 */  addu       $4, $3, $4
/* E6528 001E6428 80181000 */  sll        $3, $16, 2
/* E652C 001E642C 21186400 */  addu       $3, $3, $4
/* E6530 001E6430 000062AC */  sw         $2, 0x0($3)
/* E6534 001E6434 01000224 */  addiu      $2, $0, 0x1
.L001E6438:
/* E6538 001E6438 3000BF7B */  lq         $31, 0x30($sp)
/* E653C 001E643C 2000B27B */  lq         $18, 0x20($sp)
/* E6540 001E6440 1000B17B */  lq         $17, 0x10($sp)
/* E6544 001E6444 0000B07B */  lq         $16, 0x0($sp)
/* E6548 001E6448 4000BD27 */  addiu      $sp, $sp, 0x40
/* E654C 001E644C 0800E003 */  jr         $31
/* E6550 001E6450 00000000 */   nop
/* E6554 001E6454 00000000 */  nop
/* E6558 001E6458 00000000 */  nop
/* E655C 001E645C 00000000 */  nop
