.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel unlink
/* 014B98 00114A98 F0FFBD27 */  addiu       $29, $29, -0x10
/* 014B9C 00114A9C 0000BFFF */  sd          $31, 0x0($29)
/* 014BA0 00114AA0 D805040C */  jal         __errno
/* 014BA4 00114AA4 00000000 */   nop
/* 014BA8 00114AA8 05000324 */  addiu       $3, $0, 0x5
/* 014BAC 00114AAC 0000BFDF */  ld          $31, 0x0($29)
/* 014BB0 00114AB0 000043AC */  sw          $3, 0x0($2)
/* 014BB4 00114AB4 FFFF0224 */  addiu       $2, $0, -0x1
/* 014BB8 00114AB8 0800E003 */  jr          $31
/* 014BBC 00114ABC 1000BD27 */   addiu      $29, $29, 0x10
