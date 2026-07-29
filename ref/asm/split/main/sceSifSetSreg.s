.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifSetSreg
/* 016630 00116530 2A00023C */  lui         $2, %hi(soft_reg)
/* 016634 00116534 80200400 */  sll         $4, $4, 2
/* 016638 00116538 405A4224 */  addiu       $2, $2, %lo(soft_reg)
/* 01663C 0011653C 21208200 */  addu        $4, $4, $2
/* 016640 00116540 2D10A000 */  daddu       $2, $5, $0
/* 016644 00116544 0800E003 */  jr          $31
/* 016648 00116548 000085AC */   sw         $5, 0x0($4)
/* 01664C 0011654C 00000000 */  nop
