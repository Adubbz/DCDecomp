.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0CopyMatrix
/* 021940 00121840 0000A678 */  lq          $6, 0x0($5)
/* 021944 00121844 1000A778 */  lq          $7, 0x10($5)
/* 021948 00121848 2000A878 */  lq          $8, 0x20($5)
/* 02194C 0012184C 3000A978 */  lq          $9, 0x30($5)
/* 021950 00121850 0000867C */  sq          $6, 0x0($4)
/* 021954 00121854 1000877C */  sq          $7, 0x10($4)
/* 021958 00121858 2000887C */  sq          $8, 0x20($4)
/* 02195C 0012185C 0800E003 */  jr          $31
/* 021960 00121860 3000897C */   sq         $9, 0x30($4)
/* 021964 00121864 00000000 */  nop
