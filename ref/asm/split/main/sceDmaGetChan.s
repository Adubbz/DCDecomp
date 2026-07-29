.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaGetChan
/* 00C4A8 0010C3A8 0A00822C */  sltiu       $2, $4, 0xA
/* 00C4AC 0010C3AC 06004010 */  beqz        $2, .L0010C3C8
/* 00C4B0 0010C3B0 2500023C */   lui        $2, %hi(dch)
/* 00C4B4 0010C3B4 80180400 */  sll         $3, $4, 2
/* 00C4B8 0010C3B8 D0024224 */  addiu       $2, $2, %lo(dch)
/* 00C4BC 0010C3BC 21186200 */  addu        $3, $3, $2
/* 00C4C0 0010C3C0 0800E003 */  jr          $31
/* 00C4C4 0010C3C4 0000628C */   lw         $2, 0x0($3)
.L0010C3C8:
/* 00C4C8 0010C3C8 0800E003 */  jr          $31
/* 00C4CC 0010C3CC 2D100000 */   daddu      $2, $0, $0
