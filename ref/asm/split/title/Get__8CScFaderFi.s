.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Get__8CScFaderFi
/* 0294F0 01DD51F0 0000828C */  lw          $2, 0x0($4)
/* 0294F4 01DD51F4 2A084500 */  slt         $1, $2, $5
/* 0294F8 01DD51F8 08002010 */  beqz        $1, .L01DD521C_2DAA1C
/* 0294FC 01DD51FC 00000000 */   nop
/* 029500 01DD5200 04004104 */  bgez        $2, .L01DD5214_2DAA14
/* 029504 01DD5204 00000000 */   nop
/* 029508 01DD5208 28160070 */  paddub      $2, $0, $0
/* 02950C 01DD520C 01000010 */  b           .L01DD5214_2DAA14
/* 029510 01DD5210 00000000 */   nop
.L01DD5214_2DAA14:
/* 029514 01DD5214 02000010 */  b           .L01DD5220_2DAA20
/* 029518 01DD5218 00000000 */   nop
.L01DD521C_2DAA1C:
/* 02951C 01DD521C 2816A070 */  paddub      $2, $5, $0
.L01DD5220_2DAA20:
/* 029520 01DD5220 0800E003 */  jr          $31
/* 029524 01DD5224 00000000 */   nop
/* 029528 01DD5228 00000000 */  nop
/* 02952C 01DD522C 00000000 */  nop
