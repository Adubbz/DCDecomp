.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SystemMesCheck__Fv
/* 060210 00160110 6C8E828F */  lw          $2, -0x7194($28)
/* 060214 00160114 2A100200 */  slt         $2, $0, $2
/* 060218 00160118 0800E003 */  jr          $31
/* 06021C 0016011C 00000000 */   nop
