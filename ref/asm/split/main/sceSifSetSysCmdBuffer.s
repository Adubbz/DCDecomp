.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifSetSysCmdBuffer
/* 016950 00116850 2A00033C */  lui         $3, %hi(_data_table)
/* 016954 00116854 18596324 */  addiu       $3, $3, %lo(_data_table)
/* 016958 00116858 0C00628C */  lw          $2, 0xC($3)
/* 01695C 0011685C 100065AC */  sw          $5, 0x10($3)
/* 016960 00116860 0800E003 */  jr          $31
/* 016964 00116864 0C0064AC */   sw         $4, 0xC($3)
