.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdCheckItemOver__Fv
/* 073310 00173210 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073314 00173214 0000BF7F */  sq          $31, 0x0($29)
/* 073318 00173218 1C8D848F */  lw          $4, -0x72E4($28)
/* 07331C 0017321C 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 073320 00173220 00000000 */   nop
/* 073324 00173224 1C43428C */  lw          $2, 0x431C($2)
/* 073328 00173228 0000BF7B */  lq          $31, 0x0($29)
/* 07332C 0017322C 1000BD27 */  addiu       $29, $29, 0x10
/* 073330 00173230 0800E003 */  jr          $31
/* 073334 00173234 00000000 */   nop
/* 073338 00173238 00000000 */  nop
/* 07333C 0017323C 00000000 */  nop
