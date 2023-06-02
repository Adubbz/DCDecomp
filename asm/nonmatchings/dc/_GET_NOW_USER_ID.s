.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NOW_USER_ID__FP12RS_STACKDATAi
/* BCA90 001BC990 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* BCA94 001BC994 2000BF7F */  sq         $31, 0x20($sp)
/* BCA98 001BC998 1000B17F */  sq         $17, 0x10($sp)
/* BCA9C 001BC99C 0000B07F */  sq         $16, 0x0($sp)
/* BCAA0 001BC9A0 288E8070 */  paddub     $17, $4, $0
/* BCAA4 001BC9A4 789C828F */  lw         $2, -0x6388($gp)
/* BCAA8 001BC9A8 04005080 */  lb         $16, 0x4($2)
/* BCAAC 001BC9AC 2A00023C */  lui        $2, %hi(_817)
/* BCAB0 001BC9B0 38BD4424 */  addiu      $4, $2, %lo(_817)
/* BCAB4 001BC9B4 282E0072 */  paddub     $5, $16, $0
/* BCAB8 001BC9B8 A611040C */  jal        printf
/* BCABC 001BC9BC 00000000 */   nop
/* BCAC0 001BC9C0 28262072 */  paddub     $4, $17, $0
/* BCAC4 001BC9C4 282E0072 */  paddub     $5, $16, $0
/* BCAC8 001BC9C8 70EE060C */  jal        SetStack__FP12RS_STACKDATAi_2
/* BCACC 001BC9CC 00000000 */   nop
/* BCAD0 001BC9D0 01000224 */  addiu      $2, $0, 0x1
/* BCAD4 001BC9D4 2000BF7B */  lq         $31, 0x20($sp)
/* BCAD8 001BC9D8 1000B17B */  lq         $17, 0x10($sp)
/* BCADC 001BC9DC 0000B07B */  lq         $16, 0x0($sp)
/* BCAE0 001BC9E0 3000BD27 */  addiu      $sp, $sp, 0x30
/* BCAE4 001BC9E4 0800E003 */  jr         $31
/* BCAE8 001BC9E8 00000000 */   nop
/* BCAEC 001BC9EC 00000000 */  nop
