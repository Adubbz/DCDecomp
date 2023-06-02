.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSoundLoad__Fi
/* 5A5F0 0015A4F0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 5A5F4 0015A4F4 1000BF7F */  sq         $31, 0x10($sp)
/* 5A5F8 0015A4F8 0000B07F */  sq         $16, 0x0($sp)
/* 5A5FC 0015A4FC 28868070 */  paddub     $16, $4, $0
/* 5A600 0015A500 FC8D828F */  lw         $2, -0x7204($gp)
/* 5A604 0015A504 04005014 */  bne        $2, $16, .L0015A518
/* 5A608 0015A508 00000000 */   nop
/* 5A60C 0015A50C 28160070 */  paddub     $2, $0, $0
/* 5A610 0015A510 16000010 */  b          .L0015A56C
/* 5A614 0015A514 00000000 */   nop
.L0015A518:
/* 5A618 0015A518 2000A527 */  addiu      $5, $sp, 0x20
/* 5A61C 0015A51C A000A627 */  addiu      $6, $sp, 0xA0
/* 5A620 0015A520 9068050C */  jal        GetSoundFile__FiPcPc
/* 5A624 0015A524 00000000 */   nop
/* 5A628 0015A528 2000A427 */  addiu      $4, $sp, 0x20
/* 5A62C 0015A52C F08D858F */  lw         $5, -0x7210($gp)
/* 5A630 0015A530 28360070 */  paddub     $6, $0, $0
/* 5A634 0015A534 283E0070 */  paddub     $7, $0, $0
/* 5A638 0015A538 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 5A63C 0015A53C 00000000 */   nop
/* 5A640 0015A540 09004010 */  beqz       $2, .L0015A568
/* 5A644 0015A544 00000000 */   nop
/* 5A648 0015A548 28260072 */  paddub     $4, $16, $0
/* 5A64C 0015A54C F08D858F */  lw         $5, -0x7210($gp)
/* 5A650 0015A550 A000A627 */  addiu      $6, $sp, 0xA0
/* 5A654 0015A554 B068050C */  jal        SetSoundFile__FiPUiPc
/* 5A658 0015A558 00000000 */   nop
/* 5A65C 0015A55C 01000224 */  addiu      $2, $0, 0x1
/* 5A660 0015A560 02000010 */  b          .L0015A56C
/* 5A664 0015A564 00000000 */   nop
.L0015A568:
/* 5A668 0015A568 28160070 */  paddub     $2, $0, $0
.L0015A56C:
/* 5A66C 0015A56C 1000BF7B */  lq         $31, 0x10($sp)
/* 5A670 0015A570 0000B07B */  lq         $16, 0x0($sp)
/* 5A674 0015A574 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 5A678 0015A578 0800E003 */  jr         $31
/* 5A67C 0015A57C 00000000 */   nop
