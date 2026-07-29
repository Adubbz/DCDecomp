.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPadUp__8CGamePadFv
/* 02B760 0012B660 5C04828C */  lw          $2, 0x45C($4)
/* 02B764 0012B664 04004010 */  beqz        $2, .L0012B678
/* 02B768 0012B668 00000000 */   nop
/* 02B76C 0012B66C 28160070 */  paddub      $2, $0, $0
/* 02B770 0012B670 05000010 */  b           .L0012B688
/* 02B774 0012B674 00000000 */   nop
.L0012B678:
/* 02B778 0012B678 0400828C */  lw          $2, 0x4($4)
/* 02B77C 0012B67C 27184000 */  not         $3, $2
/* 02B780 0012B680 9C00828C */  lw          $2, 0x9C($4)
/* 02B784 0012B684 24106200 */  and         $2, $3, $2
.L0012B688:
/* 02B788 0012B688 0800E003 */  jr          $31
/* 02B78C 0012B68C 00000000 */   nop
