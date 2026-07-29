.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchDataSlot__16CDungeonEventManFv
/* 0CCC30 001CCB30 282E0070 */  paddub      $5, $0, $0
/* 0CCC34 001CCB34 11000010 */  b           .L001CCB7C
/* 0CCC38 001CCB38 00000000 */   nop
.L001CCB3C:
/* 0CCC3C 001CCB3C 80310500 */  sll         $6, $5, 6
/* 0CCC40 001CCB40 2118C400 */  addu        $3, $6, $4
/* 0CCC44 001CCB44 0010628C */  lw          $2, 0x1000($3)
/* 0CCC48 001CCB48 04004010 */  beqz        $2, .L001CCB5C
/* 0CCC4C 001CCB4C 00000000 */   nop
/* 0CCC50 001CCB50 3810628C */  lw          $2, 0x1038($3)
/* 0CCC54 001CCB54 02000010 */  b           .L001CCB60
/* 0CCC58 001CCB58 00000000 */   nop
.L001CCB5C:
/* 0CCC5C 001CCB5C 28160070 */  paddub      $2, $0, $0
.L001CCB60:
/* 0CCC60 001CCB60 05004014 */  bnez        $2, .L001CCB78
/* 0CCC64 001CCB64 00000000 */   nop
/* 0CCC68 001CCB68 21108600 */  addu        $2, $4, $6
/* 0CCC6C 001CCB6C 00104224 */  addiu       $2, $2, 0x1000
/* 0CCC70 001CCB70 06000010 */  b           .L001CCB8C
/* 0CCC74 001CCB74 00000000 */   nop
.L001CCB78:
/* 0CCC78 001CCB78 0100A524 */  addiu       $5, $5, 0x1
.L001CCB7C:
/* 0CCC7C 001CCB7C 6000A228 */  slti        $2, $5, 0x60
/* 0CCC80 001CCB80 EEFF4014 */  bnez        $2, .L001CCB3C
/* 0CCC84 001CCB84 00000000 */   nop
/* 0CCC88 001CCB88 28160070 */  paddub      $2, $0, $0
.L001CCB8C:
/* 0CCC8C 001CCB8C 0800E003 */  jr          $31
/* 0CCC90 001CCB90 00000000 */   nop
/* 0CCC94 001CCB94 00000000 */  nop
/* 0CCC98 001CCB98 00000000 */  nop
/* 0CCC9C 001CCB9C 00000000 */  nop
