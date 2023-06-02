.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetSreg
/* 16630 00116530 2A00023C */  lui        $2, %hi(D_002A5A40)
/* 16634 00116534 80200400 */  sll        $4, $4, 2
/* 16638 00116538 405A4224 */  addiu      $2, $2, %lo(D_002A5A40)
/* 1663C 0011653C 21208200 */  addu       $4, $4, $2
/* 16640 00116540 2D10A000 */  daddu      $2, $5, $0
/* 16644 00116544 0800E003 */  jr         $31
/* 16648 00116548 000085AC */   sw        $5, 0x0($4)
/* 1664C 0011654C 00000000 */  nop
