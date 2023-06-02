.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _OPEN_ENTRANCE_WINDOW__FP12RS_STACKDATAi
/* BC4E0 001BC3E0 0000828C */  lw         $2, 0x0($4)
/* BC4E4 001BC3E4 03000324 */  addiu      $3, $0, 0x3
/* BC4E8 001BC3E8 04004310 */  beq        $2, $3, .L001BC3FC
/* BC4EC 001BC3EC 00000000 */   nop
/* BC4F0 001BC3F0 28160070 */  paddub     $2, $0, $0
/* BC4F4 001BC3F4 07000010 */  b          .L001BC414
/* BC4F8 001BC3F8 00000000 */   nop
.L001BC3FC:
/* BC4FC 001BC3FC 0400828C */  lw         $2, 0x4($4)
/* BC500 001BC400 D501013C */  lui        $at, (0x1D567C4 >> 16)
/* BC504 001BC404 C46722AC */  sw         $2, (0x1D567C4 & 0xFFFF)($at)
/* BC508 001BC408 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BC50C 001BC40C D86723AC */  sw         $3, (0x1D567D8 & 0xFFFF)($at)
/* BC510 001BC410 01000224 */  addiu      $2, $0, 0x1
.L001BC414:
/* BC514 001BC414 0800E003 */  jr         $31
/* BC518 001BC418 00000000 */   nop
/* BC51C 001BC41C 00000000 */  nop
