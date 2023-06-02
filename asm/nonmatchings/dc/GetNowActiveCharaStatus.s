.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowActiveCharaStatus__Fi
/* 10DFC0 0020DEC0 D494838F */  lw         $3, -0x6B2C($gp)
/* 10DFC4 0020DEC4 04006014 */  bnez       $3, .L0020DED8
/* 10DFC8 0020DEC8 00000000 */   nop
/* 10DFCC 0020DECC 28160070 */  paddub     $2, $0, $0
/* 10DFD0 0020DED0 05000010 */  b          .L0020DEE8
/* 10DFD4 0020DED4 00000000 */   nop
.L0020DED8:
/* 10DFD8 0020DED8 80100400 */  sll        $2, $4, 2
/* 10DFDC 0020DEDC 21104300 */  addu       $2, $2, $3
/* 10DFE0 0020DEE0 C842428C */  lw         $2, 0x42C8($2)
/* 10DFE4 0020DEE4 00000000 */  nop
.L0020DEE8:
/* 10DFE8 0020DEE8 0800E003 */  jr         $31
/* 10DFEC 0020DEEC 00000000 */   nop
