.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPadUp__8CGamePadFv
/* 2B760 0012B660 5C04828C */  lw         $2, 0x45C($4)
/* 2B764 0012B664 04004010 */  beqz       $2, .L0012B678
/* 2B768 0012B668 00000000 */   nop
/* 2B76C 0012B66C 28160070 */  paddub     $2, $0, $0
/* 2B770 0012B670 05000010 */  b          .L0012B688
/* 2B774 0012B674 00000000 */   nop
.L0012B678:
/* 2B778 0012B678 0400828C */  lw         $2, 0x4($4)
/* 2B77C 0012B67C 27184000 */  not        $3, $2
/* 2B780 0012B680 9C00828C */  lw         $2, 0x9C($4)
/* 2B784 0012B684 24106200 */  and        $2, $3, $2
.L0012B688:
/* 2B788 0012B688 0800E003 */  jr         $31
/* 2B78C 0012B68C 00000000 */   nop
