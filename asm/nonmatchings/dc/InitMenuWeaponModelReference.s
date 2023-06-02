.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMenuWeaponModelReference__Fv
/* 10D520 0020D420 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10D524 0020D424 0000BF7F */  sq         $31, 0x0($sp)
/* 10D528 0020D428 28260070 */  paddub     $4, $0, $0
/* 10D52C 0020D42C 07000010 */  b          .L0020D44C
/* 10D530 0020D430 00000000 */   nop
.L0020D434:
/* 10D534 0020D434 0035080C */  jal        GetMenuWeaponModelInfo__Fi
/* 10D538 0020D438 00000000 */   nop
/* 10D53C 0020D43C FFFF0324 */  addiu      $3, $0, -0x1
/* 10D540 0020D440 000043AC */  sw         $3, 0x0($2)
/* 10D544 0020D444 040043AC */  sw         $3, 0x4($2)
/* 10D548 0020D448 01008424 */  addiu      $4, $4, 0x1
.L0020D44C:
/* 10D54C 0020D44C 0C008328 */  slti       $3, $4, 0xC
/* 10D550 0020D450 F8FF6014 */  bnez       $3, .L0020D434
/* 10D554 0020D454 00000000 */   nop
/* 10D558 0020D458 0000BF7B */  lq         $31, 0x0($sp)
/* 10D55C 0020D45C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10D560 0020D460 0800E003 */  jr         $31
/* 10D564 0020D464 00000000 */   nop
/* 10D568 0020D468 00000000 */  nop
/* 10D56C 0020D46C 00000000 */  nop
