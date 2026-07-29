.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandSCN__FPPv
/* 074BE0 00174AE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 074BE4 00174AE4 0000BF7F */  sq          $31, 0x0($29)
/* 074BE8 00174AE8 0000858C */  lw          $5, 0x0($4)
/* 074BEC 00174AEC C08F848F */  lw          $4, -0x7040($28)
/* 074BF0 00174AF0 5A15040C */  jal         strcpy
/* 074BF4 00174AF4 00000000 */   nop
/* 074BF8 00174AF8 0000BF7B */  lq          $31, 0x0($29)
/* 074BFC 00174AFC 1000BD27 */  addiu       $29, $29, 0x10
/* 074C00 00174B00 0800E003 */  jr          $31
/* 074C04 00174B04 00000000 */   nop
/* 074C08 00174B08 00000000 */  nop
/* 074C0C 00174B0C 00000000 */  nop
