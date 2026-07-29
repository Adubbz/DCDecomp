.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _change_addr
/* 016608 00116508 1000828C */  lw          $2, 0x10($4)
/* 01660C 0011650C 0800E003 */  jr          $31
/* 016610 00116510 0800A2AC */   sw         $2, 0x8($5)
/* 016614 00116514 00000000 */  nop
