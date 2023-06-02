.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_ROT_REF__FP12RS_STACKDATAi
/* 944C0 001943C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 944C4 001943C4 2000BF7F */  sq         $31, 0x20($sp)
/* 944C8 001943C8 1000B17F */  sq         $17, 0x10($sp)
/* 944CC 001943CC 0000B07F */  sq         $16, 0x0($sp)
/* 944D0 001943D0 08009124 */  addiu      $17, $4, 0x8
/* 944D4 001943D4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 944D8 001943D8 00000000 */   nop
/* 944DC 001943DC 28264070 */  paddub     $4, $2, $0
/* 944E0 001943E0 242C060C */  jal        GetActSeq__Fi
/* 944E4 001943E4 00000000 */   nop
/* 944E8 001943E8 28864070 */  paddub     $16, $2, $0
/* 944EC 001943EC 04000016 */  bnez       $16, .L00194400
/* 944F0 001943F0 00000000 */   nop
/* 944F4 001943F4 28160070 */  paddub     $2, $0, $0
/* 944F8 001943F8 0F000010 */  b          .L00194438
/* 944FC 001943FC 00000000 */   nop
.L00194400:
/* 94500 00194400 28262072 */  paddub     $4, $17, $0
/* 94504 00194404 3000A527 */  addiu      $5, $sp, 0x30
/* 94508 00194408 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 9450C 0019440C 00000000 */   nop
/* 94510 00194410 18003126 */  addiu      $17, $17, 0x18
/* 94514 00194414 28262072 */  paddub     $4, $17, $0
/* 94518 00194418 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9451C 0019441C 00000000 */   nop
/* 94520 00194420 28260072 */  paddub     $4, $16, $0
/* 94524 00194424 3000A527 */  addiu      $5, $sp, 0x30
/* 94528 00194428 06030046 */  mov.s      $f12, $f0
/* 9452C 0019442C 1054050C */  jal        RotRefSeq__10CActionSeqFPff
/* 94530 00194430 00000000 */   nop
/* 94534 00194434 01000224 */  addiu      $2, $0, 0x1
.L00194438:
/* 94538 00194438 2000BF7B */  lq         $31, 0x20($sp)
/* 9453C 0019443C 1000B17B */  lq         $17, 0x10($sp)
/* 94540 00194440 0000B07B */  lq         $16, 0x0($sp)
/* 94544 00194444 4000BD27 */  addiu      $sp, $sp, 0x40
/* 94548 00194448 0800E003 */  jr         $31
/* 9454C 0019444C 00000000 */   nop
