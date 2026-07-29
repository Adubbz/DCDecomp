.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifSetCmdBuffer
/* 016938 00116838 2A00033C */  lui         $3, %hi(_data_table)
/* 01693C 0011683C 18596324 */  addiu       $3, $3, %lo(_data_table)
/* 016940 00116840 1400628C */  lw          $2, 0x14($3)
/* 016944 00116844 180065AC */  sw          $5, 0x18($3)
/* 016948 00116848 0800E003 */  jr          $31
/* 01694C 0011684C 140064AC */   sw         $4, 0x14($3)
