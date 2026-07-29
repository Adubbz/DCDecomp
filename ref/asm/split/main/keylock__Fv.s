.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel keylock__Fv
/* 069AE0 001699E0 F48E828F */  lw          $2, -0x710C($28)
/* 069AE4 001699E4 03004230 */  andi        $2, $2, 0x3
/* 069AE8 001699E8 0800E003 */  jr          $31
/* 069AEC 001699EC 00000000 */   nop
