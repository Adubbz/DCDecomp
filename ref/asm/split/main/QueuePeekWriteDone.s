.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel QueuePeekWriteDone
/* 0156B0 001155B0 2D288000 */  daddu       $5, $4, $0
/* 0156B4 001155B4 0400A28C */  lw          $2, 0x4($5)
/* 0156B8 001155B8 0C00A48C */  lw          $4, 0xC($5)
/* 0156BC 001155BC 0000A38C */  lw          $3, 0x0($5)
/* 0156C0 001155C0 01004224 */  addiu       $2, $2, 0x1
/* 0156C4 001155C4 01008424 */  addiu       $4, $4, 0x1
/* 0156C8 001155C8 0400A2AC */  sw          $2, 0x4($5)
/* 0156CC 001155CC 10006324 */  addiu       $3, $3, 0x10
/* 0156D0 001155D0 2118A300 */  addu        $3, $5, $3
/* 0156D4 001155D4 03008314 */  bne         $4, $3, .L001155E4
/* 0156D8 001155D8 0C00A4AC */   sw         $4, 0xC($5)
/* 0156DC 001155DC 1000A224 */  addiu       $2, $5, 0x10
/* 0156E0 001155E0 0C00A2AC */  sw          $2, 0xC($5)
.L001155E4:
/* 0156E4 001155E4 0800E003 */  jr          $31
/* 0156E8 001155E8 00000000 */   nop
/* 0156EC 001155EC 00000000 */  nop
