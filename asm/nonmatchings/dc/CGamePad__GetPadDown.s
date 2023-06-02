.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPadDown__8CGamePadFv
/* 2B730 0012B630 5C04828C */  lw         $2, 0x45C($4)
/* 2B734 0012B634 04004010 */  beqz       $2, .L0012B648
/* 2B738 0012B638 00000000 */   nop
/* 2B73C 0012B63C 28160070 */  paddub     $2, $0, $0
/* 2B740 0012B640 05000010 */  b          .L0012B658
/* 2B744 0012B644 00000000 */   nop
.L0012B648:
/* 2B748 0012B648 9C00828C */  lw         $2, 0x9C($4)
/* 2B74C 0012B64C 27184000 */  not        $3, $2
/* 2B750 0012B650 0400828C */  lw         $2, 0x4($4)
/* 2B754 0012B654 24104300 */  and        $2, $2, $3
.L0012B658:
/* 2B758 0012B658 0800E003 */  jr         $31
/* 2B75C 0012B65C 00000000 */   nop
