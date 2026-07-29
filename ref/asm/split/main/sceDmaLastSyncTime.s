.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaLastSyncTime
/* 00CF18 0010CE18 2900043C */  lui         $4, (0x290000 >> 16)
/* 00CF1C 0010CE1C A6110408 */  j           printf
/* 00CF20 0010CE20 18748424 */   addiu      $4, $4, 0x7418
/* 00CF24 0010CE24 00000000 */  nop
