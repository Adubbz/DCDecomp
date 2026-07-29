.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPadOn__8CGamePadFv
/* 02B700 0012B600 5C04828C */  lw          $2, 0x45C($4)
/* 02B704 0012B604 04004010 */  beqz        $2, .L0012B618
/* 02B708 0012B608 00000000 */   nop
/* 02B70C 0012B60C 28160070 */  paddub      $2, $0, $0
/* 02B710 0012B610 03000010 */  b           .L0012B620
/* 02B714 0012B614 00000000 */   nop
.L0012B618:
/* 02B718 0012B618 0400828C */  lw          $2, 0x4($4)
/* 02B71C 0012B61C 00000000 */  nop
.L0012B620:
/* 02B720 0012B620 0800E003 */  jr          $31
/* 02B724 0012B624 00000000 */   nop
/* 02B728 0012B628 00000000 */  nop
/* 02B72C 0012B62C 00000000 */  nop
