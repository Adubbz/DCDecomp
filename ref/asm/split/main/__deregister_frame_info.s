.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __deregister_frame_info
/* 011FC8 00111EC8 2A00023C */  lui         $2, %hi(objects)
/* 011FCC 00111ECC E0FFBD27 */  addiu       $29, $29, -0x20
/* 011FD0 00111ED0 904F438C */  lw          $3, %lo(objects)($2)
/* 011FD4 00111ED4 904F4524 */  addiu       $5, $2, %lo(objects)
/* 011FD8 00111ED8 1000BFFF */  sd          $31, 0x10($29)
/* 011FDC 00111EDC 0F006010 */  beqz        $3, .L00111F1C
/* 011FE0 00111EE0 0000B0FF */   sd         $16, 0x0($29)
/* 011FE4 00111EE4 00000000 */  nop
.L00111EE8:
/* 011FE8 00111EE8 0000B08C */  lw          $16, 0x0($5)
/* 011FEC 00111EEC 0800028E */  lw          $2, 0x8($16)
/* 011FF0 00111EF0 08004414 */  bne         $2, $4, .L00111F14
/* 011FF4 00111EF4 1400028E */   lw         $2, 0x14($16)
/* 011FF8 00111EF8 0000038E */  lw          $3, 0x0($16)
/* 011FFC 00111EFC 0B006010 */  beqz        $3, .L00111F2C
/* 012000 00111F00 0000A2AC */   sw         $2, 0x0($5)
/* 012004 00111F04 060A040C */  jal         free
/* 012008 00111F08 0C00048E */   lw         $4, 0xC($16)
/* 01200C 00111F0C 08000010 */  b           .L00111F30
/* 012010 00111F10 2D100002 */   daddu      $2, $16, $0
.L00111F14:
/* 012014 00111F14 F4FF4014 */  bnez        $2, .L00111EE8
/* 012018 00111F18 14000526 */   addiu      $5, $16, 0x14
.L00111F1C:
/* 01201C 00111F1C 1000BFDF */  ld          $31, 0x10($29)
/* 012020 00111F20 0000B0DF */  ld          $16, 0x0($29)
/* 012024 00111F24 6A000408 */  j           abort
/* 012028 00111F28 2000BD27 */   addiu      $29, $29, 0x20
.L00111F2C:
/* 01202C 00111F2C 2D100002 */  daddu       $2, $16, $0
.L00111F30:
/* 012030 00111F30 1000BFDF */  ld          $31, 0x10($29)
/* 012034 00111F34 0000B0DF */  ld          $16, 0x0($29)
/* 012038 00111F38 0800E003 */  jr          $31
/* 01203C 00111F3C 2000BD27 */   addiu      $29, $29, 0x20
