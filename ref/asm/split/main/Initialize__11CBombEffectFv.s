.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__11CBombEffectFv
/* 043590 00143490 282E0070 */  paddub      $5, $0, $0
/* 043594 00143494 05000010 */  b           .L001434AC
/* 043598 00143498 00000000 */   nop
.L0014349C:
/* 04359C 0014349C 80180500 */  sll         $3, $5, 2
/* 0435A0 001434A0 21186400 */  addu        $3, $3, $4
/* 0435A4 001434A4 000160AC */  sw          $0, 0x100($3)
/* 0435A8 001434A8 0100A524 */  addiu       $5, $5, 0x1
.L001434AC:
/* 0435AC 001434AC 0800A328 */  slti        $3, $5, 0x8
/* 0435B0 001434B0 FAFF6014 */  bnez        $3, .L0014349C
/* 0435B4 001434B4 00000000 */   nop
/* 0435B8 001434B8 0800E003 */  jr          $31
/* 0435BC 001434BC 00000000 */   nop
