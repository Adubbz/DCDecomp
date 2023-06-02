.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDataNum__16CDungeonEventManFv
/* CCBD0 001CCAD0 28160070 */  paddub     $2, $0, $0
/* CCBD4 001CCAD4 28360070 */  paddub     $6, $0, $0
/* CCBD8 001CCAD8 0E000010 */  b          .L001CCB14
/* CCBDC 001CCADC 00000000 */   nop
.L001CCAE0:
/* CCBE0 001CCAE0 80190600 */  sll        $3, $6, 6
/* CCBE4 001CCAE4 21286400 */  addu       $5, $3, $4
/* CCBE8 001CCAE8 0010A38C */  lw         $3, 0x1000($5)
/* CCBEC 001CCAEC 04006010 */  beqz       $3, .L001CCB00
/* CCBF0 001CCAF0 00000000 */   nop
/* CCBF4 001CCAF4 3810A38C */  lw         $3, 0x1038($5)
/* CCBF8 001CCAF8 02000010 */  b          .L001CCB04
/* CCBFC 001CCAFC 00000000 */   nop
.L001CCB00:
/* CCC00 001CCB00 281E0070 */  paddub     $3, $0, $0
.L001CCB04:
/* CCC04 001CCB04 02006014 */  bnez       $3, .L001CCB10
/* CCC08 001CCB08 00000000 */   nop
/* CCC0C 001CCB0C 01004224 */  addiu      $2, $2, 0x1
.L001CCB10:
/* CCC10 001CCB10 0100C624 */  addiu      $6, $6, 0x1
.L001CCB14:
/* CCC14 001CCB14 6000C328 */  slti       $3, $6, 0x60
/* CCC18 001CCB18 F1FF6014 */  bnez       $3, .L001CCAE0
/* CCC1C 001CCB1C 00000000 */   nop
/* CCC20 001CCB20 0800E003 */  jr         $31
/* CCC24 001CCB24 00000000 */   nop
/* CCC28 001CCB28 00000000 */  nop
/* CCC2C 001CCB2C 00000000 */  nop
