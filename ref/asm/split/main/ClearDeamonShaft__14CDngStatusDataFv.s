.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClearDeamonShaft__14CDngStatusDataFv
/* 0BE150 001BE050 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BE154 001BE054 C54283A0 */  sb          $3, 0x42C5($4)
/* 0BE158 001BE058 0800E003 */  jr          $31
/* 0BE15C 001BE05C 00000000 */   nop
