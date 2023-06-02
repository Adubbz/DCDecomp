.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifGetDataTable
/* 16650 00116550 2A00023C */  lui        $2, %hi(D_002A5918)
/* 16654 00116554 0800E003 */  jr         $31
/* 16658 00116558 18594224 */   addiu     $2, $2, %lo(D_002A5918)
/* 1665C 0011655C 00000000 */  nop
