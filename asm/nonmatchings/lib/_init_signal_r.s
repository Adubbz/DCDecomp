.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _init_signal_r
/* 4D20 00104C20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4D24 00104C24 0000B0FF */  sd         $16, 0x0($sp)
/* 4D28 00104C28 1000BFFF */  sd         $31, 0x10($sp)
/* 4D2C 00104C2C 2D808000 */  daddu      $16, $4, $0
/* 4D30 00104C30 D401028E */  lw         $2, 0x1D4($16)
/* 4D34 00104C34 12004014 */  bnez       $2, .L00104C80
/* 4D38 00104C38 2D100000 */   daddu     $2, $0, $0
/* 4D3C 00104C3C A00A040C */  jal        _malloc_r
/* 4D40 00104C40 80000524 */   addiu     $5, $0, 0x80
/* 4D44 00104C44 03004014 */  bnez       $2, .L00104C54
/* 4D48 00104C48 D40102AE */   sw        $2, 0x1D4($16)
/* 4D4C 00104C4C 0C000010 */  b          .L00104C80
/* 4D50 00104C50 FFFF0224 */   addiu     $2, $0, -0x1
.L00104C54:
/* 4D54 00104C54 7C004224 */  addiu      $2, $2, 0x7C
/* 4D58 00104C58 1F000324 */  addiu      $3, $0, 0x1F
/* 4D5C 00104C5C 00000000 */  nop
.L00104C60:
/* 4D60 00104C60 000040AC */  sw         $0, 0x0($2)
/* 4D64 00104C64 FFFF6324 */  addiu      $3, $3, -0x1
/* 4D68 00104C68 FCFF4224 */  addiu      $2, $2, -0x4
/* 4D6C 00104C6C 00000000 */  nop
/* 4D70 00104C70 00000000 */  nop
/* 4D74 00104C74 FAFF6104 */  bgez       $3, .L00104C60
/* 4D78 00104C78 00000000 */   nop
/* 4D7C 00104C7C 2D100000 */  daddu      $2, $0, $0
.L00104C80:
/* 4D80 00104C80 1000BFDF */  ld         $31, 0x10($sp)
/* 4D84 00104C84 0000B0DF */  ld         $16, 0x0($sp)
/* 4D88 00104C88 0800E003 */  jr         $31
/* 4D8C 00104C8C 2000BD27 */   addiu     $sp, $sp, 0x20
