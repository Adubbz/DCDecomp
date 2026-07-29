.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadPackFile__FPcPUiPi
/* 03F7A0 0013F6A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03F7A4 0013F6A4 0000BF7F */  sq          $31, 0x0($29)
/* 03F7A8 0013F6A8 F88C85AF */  sw          $5, -0x7308($28)
/* 03F7AC 0013F6AC 283E0070 */  paddub      $7, $0, $0
/* 03F7B0 0013F6B0 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 03F7B4 0013F6B4 00000000 */   nop
/* 03F7B8 0013F6B8 05004014 */  bnez        $2, .L0013F6D0
/* 03F7BC 0013F6BC 00000000 */   nop
/* 03F7C0 0013F6C0 F88C80AF */  sw          $0, -0x7308($28)
/* 03F7C4 0013F6C4 28160070 */  paddub      $2, $0, $0
/* 03F7C8 0013F6C8 02000010 */  b           .L0013F6D4
/* 03F7CC 0013F6CC 00000000 */   nop
.L0013F6D0:
/* 03F7D0 0013F6D0 01000224 */  addiu       $2, $0, 0x1
.L0013F6D4:
/* 03F7D4 0013F6D4 0000BF7B */  lq          $31, 0x0($29)
/* 03F7D8 0013F6D8 1000BD27 */  addiu       $29, $29, 0x10
/* 03F7DC 0013F6DC 0800E003 */  jr          $31
/* 03F7E0 0013F6E0 00000000 */   nop
/* 03F7E4 0013F6E4 00000000 */  nop
/* 03F7E8 0013F6E8 00000000 */  nop
/* 03F7EC 0013F6EC 00000000 */  nop
