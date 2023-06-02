.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponCalMoney__FP11WEAPON_HAVEi
/* EB410 001EB310 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* EB414 001EB314 0000BF7F */  sq         $31, 0x0($sp)
/* EB418 001EB318 28468070 */  paddub     $8, $4, $0
/* EB41C 001EB31C 04000015 */  bnez       $8, .L001EB330
/* EB420 001EB320 00000000 */   nop
/* EB424 001EB324 28160070 */  paddub     $2, $0, $0
/* EB428 001EB328 16000010 */  b          .L001EB384
/* EB42C 001EB32C 00000000 */   nop
.L001EB330:
/* EB430 001EB330 28360070 */  paddub     $6, $0, $0
/* EB434 001EB334 283E0070 */  paddub     $7, $0, $0
/* EB438 001EB338 0E000010 */  b          .L001EB374
/* EB43C 001EB33C 00000000 */   nop
.L001EB340:
/* EB440 001EB340 40110700 */  sll        $2, $7, 5
/* EB444 001EB344 21100201 */  addu       $2, $8, $2
/* EB448 001EB348 28004224 */  addiu      $2, $2, 0x28
/* EB44C 001EB34C 08004010 */  beqz       $2, .L001EB370
/* EB450 001EB350 00000000 */   nop
/* EB454 001EB354 00004484 */  lh         $4, 0x0($2)
/* EB458 001EB358 51008228 */  slti       $2, $4, 0x51
/* EB45C 001EB35C 04004014 */  bnez       $2, .L001EB370
/* EB460 001EB360 00000000 */   nop
/* EB464 001EB364 B4AC070C */  jal        CalItemMoney__Fii
/* EB468 001EB368 00000000 */   nop
/* EB46C 001EB36C 2130C200 */  addu       $6, $6, $2
.L001EB370:
/* EB470 001EB370 0100E724 */  addiu      $7, $7, 0x1
.L001EB374:
/* EB474 001EB374 0600E228 */  slti       $2, $7, 0x6
/* EB478 001EB378 F1FF4014 */  bnez       $2, .L001EB340
/* EB47C 001EB37C 00000000 */   nop
/* EB480 001EB380 2816C070 */  paddub     $2, $6, $0
.L001EB384:
/* EB484 001EB384 0000BF7B */  lq         $31, 0x0($sp)
/* EB488 001EB388 1000BD27 */  addiu      $sp, $sp, 0x10
/* EB48C 001EB38C 0800E003 */  jr         $31
/* EB490 001EB390 00000000 */   nop
/* EB494 001EB394 00000000 */  nop
/* EB498 001EB398 00000000 */  nop
/* EB49C 001EB39C 00000000 */  nop
