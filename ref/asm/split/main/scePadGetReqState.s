.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadGetReqState
/* 01FD78 0011FC78 2D308000 */  daddu       $6, $4, $0
/* 01FD7C 0011FC7C 70000324 */  addiu       $3, $0, 0x70
/* 01FD80 0011FC80 1C000424 */  addiu       $4, $0, 0x1C
/* 01FD84 0011FC84 1818C370 */  mult1       $3, $6, $3
/* 01FD88 0011FC88 1820A400 */  mult        $4, $5, $4
/* 01FD8C 0011FC8C F0FFBD27 */  addiu       $29, $29, -0x10
/* 01FD90 0011FC90 2B00023C */  lui         $2, %hi(PadInfo)
/* 01FD94 0011FC94 0000BFFF */  sd          $31, 0x0($29)
/* 01FD98 0011FC98 909C4224 */  addiu       $2, $2, %lo(PadInfo)
/* 01FD9C 0011FC9C 21208300 */  addu        $4, $4, $3
/* 01FDA0 0011FCA0 21104400 */  addu        $2, $2, $4
/* 01FDA4 0011FCA4 1000438C */  lw          $3, 0x10($2)
/* 01FDA8 0011FCA8 04006010 */  beqz        $3, .L0011FCBC
/* 01FDAC 0011FCAC 2D100000 */   daddu      $2, $0, $0
/* 01FDB0 0011FCB0 8C7E040C */  jal         scePadGetDmaStr
/* 01FDB4 0011FCB4 2D20C000 */   daddu      $4, $6, $0
/* 01FDB8 0011FCB8 71004290 */  lbu         $2, 0x71($2)
.L0011FCBC:
/* 01FDBC 0011FCBC 0000BFDF */  ld          $31, 0x0($29)
/* 01FDC0 0011FCC0 0800E003 */  jr          $31
/* 01FDC4 0011FCC4 1000BD27 */   addiu      $29, $29, 0x10
