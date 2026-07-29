.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdClearItemOverFlag__Fv
/* 073340 00173240 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073344 00173244 0000BF7F */  sq          $31, 0x0($29)
/* 073348 00173248 1C8D848F */  lw          $4, -0x72E4($28)
/* 07334C 0017324C 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 073350 00173250 00000000 */   nop
/* 073354 00173254 1C4340AC */  sw          $0, 0x431C($2)
/* 073358 00173258 0000BF7B */  lq          $31, 0x0($29)
/* 07335C 0017325C 1000BD27 */  addiu       $29, $29, 0x10
/* 073360 00173260 0800E003 */  jr          $31
/* 073364 00173264 00000000 */   nop
/* 073368 00173268 00000000 */  nop
/* 07336C 0017326C 00000000 */  nop
