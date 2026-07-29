.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __errno
/* 001860 00101760 2500033C */  lui         $3, %hi(_impure_ptr)
/* 001864 00101764 0800E003 */  jr          $31
/* 001868 00101768 ECFD628C */   lw         $2, %lo(_impure_ptr)($3)
/* 00186C 0010176C 00000000 */  nop
