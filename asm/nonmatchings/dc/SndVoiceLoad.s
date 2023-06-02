.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndVoiceLoad__Fi
/* 5B4F0 0015B3F0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 5B4F4 0015B3F4 1000BF7F */  sq         $31, 0x10($sp)
/* 5B4F8 0015B3F8 0000B07F */  sq         $16, 0x0($sp)
/* 5B4FC 0015B3FC 28868070 */  paddub     $16, $4, $0
/* 5B500 0015B400 008E828F */  lw         $2, -0x7200($gp)
/* 5B504 0015B404 04005014 */  bne        $2, $16, .L0015B418
/* 5B508 0015B408 00000000 */   nop
/* 5B50C 0015B40C 28160070 */  paddub     $2, $0, $0
/* 5B510 0015B410 16000010 */  b          .L0015B46C
/* 5B514 0015B414 00000000 */   nop
.L0015B418:
/* 5B518 0015B418 2000A527 */  addiu      $5, $sp, 0x20
/* 5B51C 0015B41C A000A627 */  addiu      $6, $sp, 0xA0
/* 5B520 0015B420 C46C050C */  jal        GetVoiceFile__FiPcPc
/* 5B524 0015B424 00000000 */   nop
/* 5B528 0015B428 2000A427 */  addiu      $4, $sp, 0x20
/* 5B52C 0015B42C F08D858F */  lw         $5, -0x7210($gp)
/* 5B530 0015B430 28360070 */  paddub     $6, $0, $0
/* 5B534 0015B434 283E0070 */  paddub     $7, $0, $0
/* 5B538 0015B438 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 5B53C 0015B43C 00000000 */   nop
/* 5B540 0015B440 09004010 */  beqz       $2, .L0015B468
/* 5B544 0015B444 00000000 */   nop
/* 5B548 0015B448 28260072 */  paddub     $4, $16, $0
/* 5B54C 0015B44C F08D858F */  lw         $5, -0x7210($gp)
/* 5B550 0015B450 A000A627 */  addiu      $6, $sp, 0xA0
/* 5B554 0015B454 E46C050C */  jal        SetVoiceFile__FiPUiPc
/* 5B558 0015B458 00000000 */   nop
/* 5B55C 0015B45C 01000224 */  addiu      $2, $0, 0x1
/* 5B560 0015B460 02000010 */  b          .L0015B46C
/* 5B564 0015B464 00000000 */   nop
.L0015B468:
/* 5B568 0015B468 28160070 */  paddub     $2, $0, $0
.L0015B46C:
/* 5B56C 0015B46C 1000BF7B */  lq         $31, 0x10($sp)
/* 5B570 0015B470 0000B07B */  lq         $16, 0x0($sp)
/* 5B574 0015B474 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 5B578 0015B478 0800E003 */  jr         $31
/* 5B57C 0015B47C 00000000 */   nop
