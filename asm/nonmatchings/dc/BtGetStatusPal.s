.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetStatusPal__Fiff
/* B04F0 001B03F0 1C8580C7 */  lwc1       $f0, -0x7AE4($gp)
/* B04F4 001B03F4 02000C46 */  mul.s      $f0, $f0, $f12
/* B04F8 001B03F8 36680046 */  c.le.s     $f13, $f0
/* B04FC 001B03FC 00000000 */  nop
/* B0500 001B0400 09000145 */  bc1t       .L001B0428
/* B0504 001B0404 00000000 */   nop
/* B0508 001B0408 04008014 */  bnez       $4, .L001B041C
/* B050C 001B040C 00000000 */   nop
/* B0510 001B0410 A8938227 */  addiu      $2, $gp, -0x6C58
/* B0514 001B0414 02000010 */  b          .L001B0420
/* B0518 001B0418 00000000 */   nop
.L001B041C:
/* B051C 001B041C AC938227 */  addiu      $2, $gp, -0x6C54
.L001B0420:
/* B0520 001B0420 11000010 */  b          .L001B0468
/* B0524 001B0424 00000000 */   nop
.L001B0428:
/* B0528 001B0428 908280C7 */  lwc1       $f0, -0x7D70($gp)
/* B052C 001B042C 02000C46 */  mul.s      $f0, $f0, $f12
/* B0530 001B0430 36680046 */  c.le.s     $f13, $f0
/* B0534 001B0434 00000000 */  nop
/* B0538 001B0438 0A000045 */  bc1f       .L001B0464
/* B053C 001B043C 00000000 */   nop
/* B0540 001B0440 488280C7 */  lwc1       $f0, -0x7DB8($gp)
/* B0544 001B0444 02000C46 */  mul.s      $f0, $f0, $f12
/* B0548 001B0448 36680046 */  c.le.s     $f13, $f0
/* B054C 001B044C 00000000 */  nop
/* B0550 001B0450 04000145 */  bc1t       .L001B0464
/* B0554 001B0454 00000000 */   nop
/* B0558 001B0458 B0938227 */  addiu      $2, $gp, -0x6C50
/* B055C 001B045C 02000010 */  b          .L001B0468
/* B0560 001B0460 00000000 */   nop
.L001B0464:
/* B0564 001B0464 B4938227 */  addiu      $2, $gp, -0x6C4C
.L001B0468:
/* B0568 001B0468 0800E003 */  jr         $31
/* B056C 001B046C 00000000 */   nop
