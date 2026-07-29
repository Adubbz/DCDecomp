.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdPadDown__Fii
/* 069A90 00169990 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069A94 00169994 0000BF7F */  sq          $31, 0x0($29)
/* 069A98 00169998 281E8070 */  paddub      $3, $4, $0
/* 069A9C 0016999C 2826A070 */  paddub      $4, $5, $0
/* 069AA0 001699A0 F0A5050C */  jal         check_key_mode__Fi
/* 069AA4 001699A4 00000000 */   nop
/* 069AA8 001699A8 08004010 */  beqz        $2, .L001699CC
/* 069AAC 001699AC 00000000 */   nop
/* 069AB0 001699B0 CC01023C */  lui         $2, %hi(GamePad)
/* 069AB4 001699B4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 069AB8 001699B8 282E6070 */  paddub      $5, $3, $0
/* 069ABC 001699BC 1CAE040C */  jal         Down__8CGamePadFi
/* 069AC0 001699C0 00000000 */   nop
/* 069AC4 001699C4 02000010 */  b           .L001699D0
/* 069AC8 001699C8 00000000 */   nop
.L001699CC:
/* 069ACC 001699CC 28160070 */  paddub      $2, $0, $0
.L001699D0:
/* 069AD0 001699D0 0000BF7B */  lq          $31, 0x0($29)
/* 069AD4 001699D4 1000BD27 */  addiu       $29, $29, 0x10
/* 069AD8 001699D8 0800E003 */  jr          $31
/* 069ADC 001699DC 00000000 */   nop
