.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel QueueInit
/* 15688 00115588 2A00023C */  lui        $2, (0x2A5400 >> 16)
/* 1568C 0011558C 00544324 */  addiu      $3, $2, %lo(D_002A5400)
/* 15690 00115590 005444AC */  sw         $4, (0x2A5400 & 0xFFFF)($2)
/* 15694 00115594 10006424 */  addiu      $4, $3, 0x10
/* 15698 00115598 2D106000 */  daddu      $2, $3, $0
/* 1569C 0011559C 080064AC */  sw         $4, 0x8($3)
/* 156A0 001155A0 040060AC */  sw         $0, 0x4($3)
/* 156A4 001155A4 0800E003 */  jr         $31
/* 156A8 001155A8 0C0064AC */   sw        $4, 0xC($3)
/* 156AC 001155AC 00000000 */  nop
