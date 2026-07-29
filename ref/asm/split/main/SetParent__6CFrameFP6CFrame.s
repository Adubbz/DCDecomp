.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetParent__6CFrameFP6CFrame
/* 028180 00128080 F0FFBD27 */  addiu       $29, $29, -0x10
/* 028184 00128084 0000BF7F */  sq          $31, 0x0($29)
/* 028188 00128088 28368070 */  paddub      $6, $4, $0
/* 02818C 0012808C 1001838C */  lw          $3, 0x110($4)
/* 028190 00128090 08006014 */  bnez        $3, .L001280B4
/* 028194 00128094 00000000 */   nop
/* 028198 00128098 1001C5AC */  sw          $5, 0x110($6)
/* 02819C 0012809C 0500A010 */  beqz        $5, .L001280B4
/* 0281A0 001280A0 00000000 */   nop
/* 0281A4 001280A4 2826A070 */  paddub      $4, $5, $0
/* 0281A8 001280A8 282EC070 */  paddub      $5, $6, $0
/* 0281AC 001280AC 48A0040C */  jal         SetChild__6CFrameFP6CFrame
/* 0281B0 001280B0 00000000 */   nop
.L001280B4:
/* 0281B4 001280B4 0000BF7B */  lq          $31, 0x0($29)
/* 0281B8 001280B8 1000BD27 */  addiu       $29, $29, 0x10
/* 0281BC 001280BC 0800E003 */  jr          $31
/* 0281C0 001280C0 00000000 */   nop
/* 0281C4 001280C4 00000000 */  nop
/* 0281C8 001280C8 00000000 */  nop
/* 0281CC 001280CC 00000000 */  nop
