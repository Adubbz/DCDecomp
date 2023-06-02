.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetElemData__9CSaveDataFi
/* 582A0 001581A0 0400A004 */  bltz       $5, .L001581B4
/* 582A4 001581A4 00000000 */   nop
/* 582A8 001581A8 0600A228 */  slti       $2, $5, 0x6
/* 582AC 001581AC 04004014 */  bnez       $2, .L001581C0
/* 582B0 001581B0 00000000 */   nop
.L001581B4:
/* 582B4 001581B4 28160070 */  paddub     $2, $0, $0
/* 582B8 001581B8 04000010 */  b          .L001581CC
/* 582BC 001581BC 00000000 */   nop
.L001581C0:
/* 582C0 001581C0 00120500 */  sll        $2, $5, 8
/* 582C4 001581C4 21108200 */  addu       $2, $4, $2
/* 582C8 001581C8 CC4C4224 */  addiu      $2, $2, 0x4CCC
.L001581CC:
/* 582CC 001581CC 0800E003 */  jr         $31
/* 582D0 001581D0 00000000 */   nop
/* 582D4 001581D4 00000000 */  nop
/* 582D8 001581D8 00000000 */  nop
/* 582DC 001581DC 00000000 */  nop
