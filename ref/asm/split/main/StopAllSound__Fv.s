.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StopAllSound__Fv
/* 077850 00177750 0800E003 */  jr          $31
/* 077854 00177754 00000000 */   nop
/* 077858 00177758 00000000 */  nop
/* 07785C 0017775C 00000000 */  nop
