.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Lighting__10CRunEffectFi
/* 063570 00163470 000085AC */  sw          $5, 0x0($4)
/* 063574 00163474 0800E003 */  jr          $31
/* 063578 00163478 00000000 */   nop
/* 06357C 0016347C 00000000 */  nop
