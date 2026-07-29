.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkReserve
/* 021078 00120F78 0000828C */  lw          $2, 0x0($4)
/* 02107C 00120F7C 80280500 */  sll         $5, $5, 2
/* 021080 00120F80 21284500 */  addu        $5, $2, $5
/* 021084 00120F84 0800E003 */  jr          $31
/* 021088 00120F88 000085AC */   sw         $5, 0x0($4)
/* 02108C 00120F8C 00000000 */  nop
