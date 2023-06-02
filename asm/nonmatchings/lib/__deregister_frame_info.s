.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __deregister_frame_info
/* 11FC8 00111EC8 2A00023C */  lui        $2, (0x2A4F90 >> 16)
/* 11FCC 00111ECC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11FD0 00111ED0 904F438C */  lw         $3, (0x2A4F90 & 0xFFFF)($2)
/* 11FD4 00111ED4 904F4524 */  addiu      $5, $2, %lo(D_002A4F90)
/* 11FD8 00111ED8 1000BFFF */  sd         $31, 0x10($sp)
/* 11FDC 00111EDC 0F006010 */  beqz       $3, .L00111F1C
/* 11FE0 00111EE0 0000B0FF */   sd        $16, 0x0($sp)
/* 11FE4 00111EE4 00000000 */  nop
.L00111EE8:
/* 11FE8 00111EE8 0000B08C */  lw         $16, 0x0($5)
/* 11FEC 00111EEC 0800028E */  lw         $2, 0x8($16)
/* 11FF0 00111EF0 08004414 */  bne        $2, $4, .L00111F14
/* 11FF4 00111EF4 1400028E */   lw        $2, 0x14($16)
/* 11FF8 00111EF8 0000038E */  lw         $3, 0x0($16)
/* 11FFC 00111EFC 0B006010 */  beqz       $3, .L00111F2C
/* 12000 00111F00 0000A2AC */   sw        $2, 0x0($5)
/* 12004 00111F04 060A040C */  jal        free
/* 12008 00111F08 0C00048E */   lw        $4, 0xC($16)
/* 1200C 00111F0C 08000010 */  b          .L00111F30
/* 12010 00111F10 2D100002 */   daddu     $2, $16, $0
.L00111F14:
/* 12014 00111F14 F4FF4014 */  bnez       $2, .L00111EE8
/* 12018 00111F18 14000526 */   addiu     $5, $16, 0x14
.L00111F1C:
/* 1201C 00111F1C 1000BFDF */  ld         $31, 0x10($sp)
/* 12020 00111F20 0000B0DF */  ld         $16, 0x0($sp)
/* 12024 00111F24 6A000408 */  j          abort
/* 12028 00111F28 2000BD27 */   addiu     $sp, $sp, 0x20
.L00111F2C:
/* 1202C 00111F2C 2D100002 */  daddu      $2, $16, $0
.L00111F30:
/* 12030 00111F30 1000BFDF */  ld         $31, 0x10($sp)
/* 12034 00111F34 0000B0DF */  ld         $16, 0x0($sp)
/* 12038 00111F38 0800E003 */  jr         $31
/* 1203C 00111F3C 2000BD27 */   addiu     $sp, $sp, 0x20
