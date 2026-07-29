.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceFsReset
/* 017EE0 00117DE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 017EE4 00117DE4 2500023C */  lui         $2, %hi(_fs_init)
/* 017EE8 00117DE8 2B00043C */  lui         $4, %hi(_fsversion)
/* 017EEC 00117DEC 0000BFFF */  sd          $31, 0x0($29)
/* 017EF0 00117DF0 080A40AC */  sw          $0, %lo(_fs_init)($2)
/* 017EF4 00117DF4 38818424 */  addiu       $4, $4, %lo(_fsversion)
/* 017EF8 00117DF8 2D280000 */  daddu       $5, $0, $0
/* 017EFC 00117DFC 5A0D040C */  jal         memset
/* 017F00 00117E00 04000624 */   addiu      $6, $0, 0x4
/* 017F04 00117E04 0000BFDF */  ld          $31, 0x0($29)
/* 017F08 00117E08 2D100000 */  daddu       $2, $0, $0
/* 017F0C 00117E0C 0800E003 */  jr          $31
/* 017F10 00117E10 1000BD27 */   addiu      $29, $29, 0x10
/* 017F14 00117E14 00000000 */  nop
