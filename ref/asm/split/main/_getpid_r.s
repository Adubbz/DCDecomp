.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _getpid_r
/* 0050D0 00104FD0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0050D4 00104FD4 0000BFFF */  sd          $31, 0x0($29)
/* 0050D8 00104FD8 9052040C */  jal         getpid
/* 0050DC 00104FDC 00000000 */   nop
/* 0050E0 00104FE0 0000BFDF */  ld          $31, 0x0($29)
/* 0050E4 00104FE4 0800E003 */  jr          $31
/* 0050E8 00104FE8 1000BD27 */   addiu      $29, $29, 0x10
/* 0050EC 00104FEC 00000000 */  nop
