.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadChara__Fv
/* 09EFC0 0019EEC0 0800E003 */  jr          $31
/* 09EFC4 0019EEC4 00000000 */   nop
/* 09EFC8 0019EEC8 00000000 */  nop
/* 09EFCC 0019EECC 00000000 */  nop
