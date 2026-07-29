.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandTEX_ANIME_END__FPPv
/* 0681F0 001680F0 0800E003 */  jr          $31
/* 0681F4 001680F4 00000000 */   nop
/* 0681F8 001680F8 00000000 */  nop
/* 0681FC 001680FC 00000000 */  nop
