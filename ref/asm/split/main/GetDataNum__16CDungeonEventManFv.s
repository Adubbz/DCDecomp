.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDataNum__16CDungeonEventManFv
/* 0CCBD0 001CCAD0 28160070 */  paddub      $2, $0, $0
/* 0CCBD4 001CCAD4 28360070 */  paddub      $6, $0, $0
/* 0CCBD8 001CCAD8 0E000010 */  b           .L001CCB14
/* 0CCBDC 001CCADC 00000000 */   nop
.L001CCAE0:
/* 0CCBE0 001CCAE0 80190600 */  sll         $3, $6, 6
/* 0CCBE4 001CCAE4 21286400 */  addu        $5, $3, $4
/* 0CCBE8 001CCAE8 0010A38C */  lw          $3, 0x1000($5)
/* 0CCBEC 001CCAEC 04006010 */  beqz        $3, .L001CCB00
/* 0CCBF0 001CCAF0 00000000 */   nop
/* 0CCBF4 001CCAF4 3810A38C */  lw          $3, 0x1038($5)
/* 0CCBF8 001CCAF8 02000010 */  b           .L001CCB04
/* 0CCBFC 001CCAFC 00000000 */   nop
.L001CCB00:
/* 0CCC00 001CCB00 281E0070 */  paddub      $3, $0, $0
.L001CCB04:
/* 0CCC04 001CCB04 02006014 */  bnez        $3, .L001CCB10
/* 0CCC08 001CCB08 00000000 */   nop
/* 0CCC0C 001CCB0C 01004224 */  addiu       $2, $2, 0x1
.L001CCB10:
/* 0CCC10 001CCB10 0100C624 */  addiu       $6, $6, 0x1
.L001CCB14:
/* 0CCC14 001CCB14 6000C328 */  slti        $3, $6, 0x60
/* 0CCC18 001CCB18 F1FF6014 */  bnez        $3, .L001CCAE0
/* 0CCC1C 001CCB1C 00000000 */   nop
/* 0CCC20 001CCB20 0800E003 */  jr          $31
/* 0CCC24 001CCB24 00000000 */   nop
/* 0CCC28 001CCB28 00000000 */  nop
/* 0CCC2C 001CCB2C 00000000 */  nop
