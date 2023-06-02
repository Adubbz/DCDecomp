.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceFsReset
/* 17EE0 00117DE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 17EE4 00117DE4 2500023C */  lui        $2, (0x250A08 >> 16)
/* 17EE8 00117DE8 2B00043C */  lui        $4, %hi(D_002A8138)
/* 17EEC 00117DEC 0000BFFF */  sd         $31, 0x0($sp)
/* 17EF0 00117DF0 080A40AC */  sw         $0, (0x250A08 & 0xFFFF)($2)
/* 17EF4 00117DF4 38818424 */  addiu      $4, $4, %lo(D_002A8138)
/* 17EF8 00117DF8 2D280000 */  daddu      $5, $0, $0
/* 17EFC 00117DFC 5A0D040C */  jal        memset
/* 17F00 00117E00 04000624 */   addiu     $6, $0, 0x4
/* 17F04 00117E04 0000BFDF */  ld         $31, 0x0($sp)
/* 17F08 00117E08 2D100000 */  daddu      $2, $0, $0
/* 17F0C 00117E0C 0800E003 */  jr         $31
/* 17F10 00117E10 1000BD27 */   addiu     $sp, $sp, 0x10
/* 17F14 00117E14 00000000 */  nop
