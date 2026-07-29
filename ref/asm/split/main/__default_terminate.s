.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __default_terminate
/* 00D680 0010D580 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00D684 0010D584 0000BFFF */  sd          $31, 0x0($29)
/* 00D688 0010D588 6A00040C */  jal         abort
/* 00D68C 0010D58C 00000000 */   nop
