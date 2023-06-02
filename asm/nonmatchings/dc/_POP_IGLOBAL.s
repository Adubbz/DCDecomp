.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _POP_IGLOBAL__FP12RS_STACKDATAi
/* E6560 001E6460 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* E6564 001E6464 2000BF7F */  sq         $31, 0x20($sp)
/* E6568 001E6468 1000B17F */  sq         $17, 0x10($sp)
/* E656C 001E646C 0000B07F */  sq         $16, 0x0($sp)
/* E6570 001E6470 E09C828F */  lw         $2, -0x6320($gp)
/* E6574 001E6474 9000508C */  lw         $16, 0x90($2)
/* E6578 001E6478 08009124 */  addiu      $17, $4, 0x8
/* E657C 001E647C 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E6580 001E6480 00000000 */   nop
/* E6584 001E6484 04004004 */  bltz       $2, .L001E6498
/* E6588 001E6488 00000000 */   nop
/* E658C 001E648C 08004128 */  slti       $at, $2, 0x8
/* E6590 001E6490 04002014 */  bnez       $at, .L001E64A4
/* E6594 001E6494 00000000 */   nop
.L001E6498:
/* E6598 001E6498 28160070 */  paddub     $2, $0, $0
/* E659C 001E649C 0C000010 */  b          .L001E64D0
/* E65A0 001E64A0 00000000 */   nop
.L001E64A4:
/* E65A4 001E64A4 28262072 */  paddub     $4, $17, $0
/* E65A8 001E64A8 40291000 */  sll        $5, $16, 5
/* E65AC 001E64AC D901033C */  lui        $3, %hi(PUSH_INT_DATA)
/* E65B0 001E64B0 80FA6324 */  addiu      $3, $3, %lo(PUSH_INT_DATA)
/* E65B4 001E64B4 21186500 */  addu       $3, $3, $5
/* E65B8 001E64B8 80100200 */  sll        $2, $2, 2
/* E65BC 001E64BC 21104300 */  addu       $2, $2, $3
/* E65C0 001E64C0 0000458C */  lw         $5, 0x0($2)
/* E65C4 001E64C4 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E65C8 001E64C8 00000000 */   nop
/* E65CC 001E64CC 01000224 */  addiu      $2, $0, 0x1
.L001E64D0:
/* E65D0 001E64D0 2000BF7B */  lq         $31, 0x20($sp)
/* E65D4 001E64D4 1000B17B */  lq         $17, 0x10($sp)
/* E65D8 001E64D8 0000B07B */  lq         $16, 0x0($sp)
/* E65DC 001E64DC 3000BD27 */  addiu      $sp, $sp, 0x30
/* E65E0 001E64E0 0800E003 */  jr         $31
/* E65E4 001E64E4 00000000 */   nop
/* E65E8 001E64E8 00000000 */  nop
/* E65EC 001E64EC 00000000 */  nop
