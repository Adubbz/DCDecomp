.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFIRE__FPPv
/* 076A70 00176970 0800E003 */  jr          $31
/* 076A74 00176974 00000000 */   nop
/* 076A78 00176978 00000000 */  nop
/* 076A7C 0017697C 00000000 */  nop
