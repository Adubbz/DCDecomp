.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadSetReqState
/* 1FD10 0011FC10 2D388000 */  daddu      $7, $4, $0
/* 1FD14 0011FC14 70000324 */  addiu      $3, $0, 0x70
/* 1FD18 0011FC18 1C000424 */  addiu      $4, $0, 0x1C
/* 1FD1C 0011FC1C 1818E370 */  mult1      $3, $7, $3
/* 1FD20 0011FC20 1820A400 */  mult       $4, $5, $4
/* 1FD24 0011FC24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1FD28 0011FC28 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FD2C 0011FC2C 0000B0FF */  sd         $16, 0x0($sp)
/* 1FD30 0011FC30 1000BFFF */  sd         $31, 0x10($sp)
/* 1FD34 0011FC34 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FD38 0011FC38 21208300 */  addu       $4, $4, $3
/* 1FD3C 0011FC3C 21104400 */  addu       $2, $2, $4
/* 1FD40 0011FC40 1000438C */  lw         $3, 0x10($2)
/* 1FD44 0011FC44 03006014 */  bnez       $3, .L0011FC54
/* 1FD48 0011FC48 2D80C000 */   daddu     $16, $6, $0
/* 1FD4C 0011FC4C 05000010 */  b          .L0011FC64
/* 1FD50 0011FC50 2D100000 */   daddu     $2, $0, $0
.L0011FC54:
/* 1FD54 0011FC54 8C7E040C */  jal        scePadGetDmaStr
/* 1FD58 0011FC58 2D20E000 */   daddu     $4, $7, $0
/* 1FD5C 0011FC5C 710050A0 */  sb         $16, 0x71($2)
/* 1FD60 0011FC60 01000224 */  addiu      $2, $0, 0x1
.L0011FC64:
/* 1FD64 0011FC64 1000BFDF */  ld         $31, 0x10($sp)
/* 1FD68 0011FC68 0000B0DF */  ld         $16, 0x0($sp)
/* 1FD6C 0011FC6C 0800E003 */  jr         $31
/* 1FD70 0011FC70 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1FD74 0011FC74 00000000 */  nop
