.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddStr__FP10CDebugFontPc
/* 704D0 001703D0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 704D4 001703D4 3000BF7F */  sq         $31, 0x30($sp)
/* 704D8 001703D8 2000B27F */  sq         $18, 0x20($sp)
/* 704DC 001703DC 1000B17F */  sq         $17, 0x10($sp)
/* 704E0 001703E0 0000B07F */  sq         $16, 0x0($sp)
/* 704E4 001703E4 28968070 */  paddub     $18, $4, $0
/* 704E8 001703E8 288EA070 */  paddub     $17, $5, $0
/* 704EC 001703EC 28262072 */  paddub     $4, $17, $0
/* 704F0 001703F0 A015040C */  jal        strlen
/* 704F4 001703F4 00000000 */   nop
/* 704F8 001703F8 28864070 */  paddub     $16, $2, $0
/* 704FC 001703FC 1800428E */  lw         $2, 0x18($18)
/* 70500 00170400 21104202 */  addu       $2, $18, $2
/* 70504 00170404 1C004424 */  addiu      $4, $2, 0x1C
/* 70508 00170408 282E2072 */  paddub     $5, $17, $0
/* 7050C 0017040C 5A15040C */  jal        strcpy
/* 70510 00170410 00000000 */   nop
/* 70514 00170414 508F838F */  lw         $3, -0x70B0($gp)
/* 70518 00170418 1800628C */  lw         $2, 0x18($3)
/* 7051C 0017041C 21105000 */  addu       $2, $2, $16
/* 70520 00170420 180062AC */  sw         $2, 0x18($3)
/* 70524 00170424 28160072 */  paddub     $2, $16, $0
/* 70528 00170428 3000BF7B */  lq         $31, 0x30($sp)
/* 7052C 0017042C 2000B27B */  lq         $18, 0x20($sp)
/* 70530 00170430 1000B17B */  lq         $17, 0x10($sp)
/* 70534 00170434 0000B07B */  lq         $16, 0x0($sp)
/* 70538 00170438 4000BD27 */  addiu      $sp, $sp, 0x40
/* 7053C 0017043C 0800E003 */  jr         $31
/* 70540 00170440 00000000 */   nop
/* 70544 00170444 00000000 */  nop
/* 70548 00170448 00000000 */  nop
/* 7054C 0017044C 00000000 */  nop