.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMenuCharaEffectReadFlag__Fv
/* 10D160 0020D060 E0958287 */  lh          $2, -0x6A20($28)
/* 10D164 0020D064 0800E003 */  jr          $31
/* 10D168 0020D068 00000000 */   nop
/* 10D16C 0020D06C 00000000 */  nop
