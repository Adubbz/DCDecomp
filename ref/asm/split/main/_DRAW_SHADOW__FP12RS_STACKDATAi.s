.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DRAW_SHADOW__FP12RS_STACKDATAi
/* 0932B0 001931B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0932B4 001931B4 0000BF7F */  sq          $31, 0x0($29)
/* 0932B8 001931B8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0932BC 001931BC 00000000 */   nop
/* 0932C0 001931C0 2B100200 */  sltu        $2, $0, $2
/* 0932C4 001931C4 01004238 */  xori        $2, $2, 0x1
/* 0932C8 001931C8 FF004230 */  andi        $2, $2, 0xFF
/* 0932CC 001931CC D401013C */  lui         $1, %hi(EdEventInfo + 0x2E0)
/* 0932D0 001931D0 B0D422AC */  sw          $2, %lo(EdEventInfo + 0x2E0)($1)
/* 0932D4 001931D4 01000224 */  addiu       $2, $0, 0x1
/* 0932D8 001931D8 0000BF7B */  lq          $31, 0x0($29)
/* 0932DC 001931DC 1000BD27 */  addiu       $29, $29, 0x10
/* 0932E0 001931E0 0800E003 */  jr          $31
/* 0932E4 001931E4 00000000 */   nop
/* 0932E8 001931E8 00000000 */  nop
/* 0932EC 001931EC 00000000 */  nop
