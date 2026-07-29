.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel srand
/* 0047E8 001046E8 2500023C */  lui         $2, %hi(_impure_ptr)
/* 0047EC 001046EC ECFD438C */  lw          $3, %lo(_impure_ptr)($2)
/* 0047F0 001046F0 0800E003 */  jr          $31
/* 0047F4 001046F4 580064AC */   sw         $4, 0x58($3)
