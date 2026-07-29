.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DRAW_EDIT_WATER__FP12RS_STACKDATAi
/* 093380 00193280 F0FFBD27 */  addiu       $29, $29, -0x10
/* 093384 00193284 0000BF7F */  sq          $31, 0x0($29)
/* 093388 00193288 D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 09338C 0019328C 10D4228C */  lw          $2, %lo(EdEventInfo + 0x240)($1)
/* 093390 00193290 0B004010 */  beqz        $2, .L001932C0
/* 093394 00193294 00000000 */   nop
/* 093398 00193298 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09339C 0019329C 00000000 */   nop
/* 0933A0 001932A0 2B100200 */  sltu        $2, $0, $2
/* 0933A4 001932A4 01004238 */  xori        $2, $2, 0x1
/* 0933A8 001932A8 FF004330 */  andi        $3, $2, 0xFF
/* 0933AC 001932AC D401013C */  lui         $1, %hi(EdEventInfo + 0x240)
/* 0933B0 001932B0 10D4228C */  lw          $2, %lo(EdEventInfo + 0x240)($1)
/* 0933B4 001932B4 0200013C */  lui         $1, (0x2095C >> 16)
/* 0933B8 001932B8 21084100 */  addu        $1, $2, $1
/* 0933BC 001932BC 5C0923AC */  sw          $3, (0x2095C & 0xFFFF)($1)
.L001932C0:
/* 0933C0 001932C0 01000224 */  addiu       $2, $0, 0x1
/* 0933C4 001932C4 0000BF7B */  lq          $31, 0x0($29)
/* 0933C8 001932C8 1000BD27 */  addiu       $29, $29, 0x10
/* 0933CC 001932CC 0800E003 */  jr          $31
/* 0933D0 001932D0 00000000 */   nop
/* 0933D4 001932D4 00000000 */  nop
/* 0933D8 001932D8 00000000 */  nop
/* 0933DC 001932DC 00000000 */  nop
