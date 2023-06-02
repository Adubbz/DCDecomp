.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifRpcLoop
/* 17C30 00117B30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 17C34 00117B34 0000B0FF */  sd         $16, 0x0($sp)
/* 17C38 00117B38 1000BFFF */  sd         $31, 0x10($sp)
/* 17C3C 00117B3C 04000010 */  b          .L00117B50
/* 17C40 00117B40 2D808000 */   daddu     $16, $4, $0
/* 17C44 00117B44 00000000 */  nop
.L00117B48:
/* 17C48 00117B48 545E040C */  jal        sceSifExecRequest
/* 17C4C 00117B4C 00000000 */   nop
.L00117B50:
/* 17C50 00117B50 405E040C */  jal        sceSifGetNextRequest
/* 17C54 00117B54 2D200002 */   daddu     $4, $16, $0
/* 17C58 00117B58 FBFF4014 */  bnez       $2, .L00117B48
/* 17C5C 00117B5C 2D204000 */   daddu     $4, $2, $0
/* 17C60 00117B60 9050040C */  jal        SleepThread
/* 17C64 00117B64 00000000 */   nop
/* 17C68 00117B68 F9FF0010 */  b          .L00117B50
/* 17C6C 00117B6C 00000000 */   nop
