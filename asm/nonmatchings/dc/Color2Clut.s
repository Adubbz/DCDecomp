.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Color2Clut__FUi
/* 4CB10 0014CA10 28160070 */  paddub     $2, $0, $0
/* 4CB14 0014CA14 0B000010 */  b          .L0014CA44
/* 4CB18 0014CA18 00000000 */   nop
.L0014CA1C:
/* 4CB1C 0014CA1C 80280200 */  sll        $5, $2, 2
/* 4CB20 0014CA20 2500033C */  lui        $3, %hi(FontColorTbl)
/* 4CB24 0014CA24 903D6324 */  addiu      $3, $3, %lo(FontColorTbl)
/* 4CB28 0014CA28 21186500 */  addu       $3, $3, $5
/* 4CB2C 0014CA2C 0000638C */  lw         $3, 0x0($3)
/* 4CB30 0014CA30 03008314 */  bne        $4, $3, .L0014CA40
/* 4CB34 0014CA34 00000000 */   nop
/* 4CB38 0014CA38 06000010 */  b          .L0014CA54
/* 4CB3C 0014CA3C 00000000 */   nop
.L0014CA40:
/* 4CB40 0014CA40 01004224 */  addiu      $2, $2, 0x1
.L0014CA44:
/* 4CB44 0014CA44 10004328 */  slti       $3, $2, 0x10
/* 4CB48 0014CA48 F4FF6014 */  bnez       $3, .L0014CA1C
/* 4CB4C 0014CA4C 00000000 */   nop
/* 4CB50 0014CA50 28160070 */  paddub     $2, $0, $0
.L0014CA54:
/* 4CB54 0014CA54 0800E003 */  jr         $31
/* 4CB58 0014CA58 00000000 */   nop
/* 4CB5C 0014CA5C 00000000 */  nop
