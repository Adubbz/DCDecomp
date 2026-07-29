.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _OPEN_ENTRANCE_WINDOW__FP12RS_STACKDATAi
/* 0BC4E0 001BC3E0 0000828C */  lw          $2, 0x0($4)
/* 0BC4E4 001BC3E4 03000324 */  addiu       $3, $0, 0x3
/* 0BC4E8 001BC3E8 04004310 */  beq         $2, $3, .L001BC3FC
/* 0BC4EC 001BC3EC 00000000 */   nop
/* 0BC4F0 001BC3F0 28160070 */  paddub      $2, $0, $0
/* 0BC4F4 001BC3F4 07000010 */  b           .L001BC414
/* 0BC4F8 001BC3F8 00000000 */   nop
.L001BC3FC:
/* 0BC4FC 001BC3FC 0400828C */  lw          $2, 0x4($4)
/* 0BC500 001BC400 D501013C */  lui         $1, %hi(BtEventInfo + 0x84)
/* 0BC504 001BC404 C46722AC */  sw          $2, %lo(BtEventInfo + 0x84)($1)
/* 0BC508 001BC408 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BC50C 001BC40C D86723AC */  sw          $3, %lo(BtEventInfo + 0x98)($1)
/* 0BC510 001BC410 01000224 */  addiu       $2, $0, 0x1
.L001BC414:
/* 0BC514 001BC414 0800E003 */  jr          $31
/* 0BC518 001BC418 00000000 */   nop
/* 0BC51C 001BC41C 00000000 */  nop
