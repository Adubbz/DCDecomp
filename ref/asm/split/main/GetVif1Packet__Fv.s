.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetVif1Packet__Fv
/* 02E380 0012E280 D48B828F */  lw          $2, -0x742C($28)
/* 02E384 0012E284 0800E003 */  jr          $31
/* 02E388 0012E288 00000000 */   nop
/* 02E38C 0012E28C 00000000 */  nop
