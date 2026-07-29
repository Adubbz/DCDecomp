.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifRpcLoop
/* 017C30 00117B30 E0FFBD27 */  addiu       $29, $29, -0x20
/* 017C34 00117B34 0000B0FF */  sd          $16, 0x0($29)
/* 017C38 00117B38 1000BFFF */  sd          $31, 0x10($29)
/* 017C3C 00117B3C 04000010 */  b           .L00117B50
/* 017C40 00117B40 2D808000 */   daddu      $16, $4, $0
/* 017C44 00117B44 00000000 */  nop
.L00117B48:
/* 017C48 00117B48 545E040C */  jal         sceSifExecRequest
/* 017C4C 00117B4C 00000000 */   nop
.L00117B50:
/* 017C50 00117B50 405E040C */  jal         sceSifGetNextRequest
/* 017C54 00117B54 2D200002 */   daddu      $4, $16, $0
/* 017C58 00117B58 FBFF4014 */  bnez        $2, .L00117B48
/* 017C5C 00117B5C 2D204000 */   daddu      $4, $2, $0
/* 017C60 00117B60 9050040C */  jal         SleepThread
/* 017C64 00117B64 00000000 */   nop
/* 017C68 00117B68 F9FF0010 */  b           .L00117B50
/* 017C6C 00117B6C 00000000 */   nop
