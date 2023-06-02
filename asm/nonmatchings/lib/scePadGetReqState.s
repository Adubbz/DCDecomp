.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadGetReqState
/* 1FD78 0011FC78 2D308000 */  daddu      $6, $4, $0
/* 1FD7C 0011FC7C 70000324 */  addiu      $3, $0, 0x70
/* 1FD80 0011FC80 1C000424 */  addiu      $4, $0, 0x1C
/* 1FD84 0011FC84 1818C370 */  mult1      $3, $6, $3
/* 1FD88 0011FC88 1820A400 */  mult       $4, $5, $4
/* 1FD8C 0011FC8C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1FD90 0011FC90 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FD94 0011FC94 0000BFFF */  sd         $31, 0x0($sp)
/* 1FD98 0011FC98 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FD9C 0011FC9C 21208300 */  addu       $4, $4, $3
/* 1FDA0 0011FCA0 21104400 */  addu       $2, $2, $4
/* 1FDA4 0011FCA4 1000438C */  lw         $3, 0x10($2)
/* 1FDA8 0011FCA8 04006010 */  beqz       $3, .L0011FCBC
/* 1FDAC 0011FCAC 2D100000 */   daddu     $2, $0, $0
/* 1FDB0 0011FCB0 8C7E040C */  jal        scePadGetDmaStr
/* 1FDB4 0011FCB4 2D20C000 */   daddu     $4, $6, $0
/* 1FDB8 0011FCB8 71004290 */  lbu        $2, 0x71($2)
.L0011FCBC:
/* 1FDBC 0011FCBC 0000BFDF */  ld         $31, 0x0($sp)
/* 1FDC0 0011FCC0 0800E003 */  jr         $31
/* 1FDC4 0011FCC4 1000BD27 */   addiu     $sp, $sp, 0x10
