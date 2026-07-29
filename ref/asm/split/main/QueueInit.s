.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel QueueInit
/* 015688 00115588 2A00023C */  lui         $2, %hi(q.3)
/* 01568C 0011558C 00544324 */  addiu       $3, $2, %lo(q.3)
/* 015690 00115590 005444AC */  sw          $4, %lo(q.3)($2)
/* 015694 00115594 10006424 */  addiu       $4, $3, 0x10
/* 015698 00115598 2D106000 */  daddu       $2, $3, $0
/* 01569C 0011559C 080064AC */  sw          $4, 0x8($3)
/* 0156A0 001155A0 040060AC */  sw          $0, 0x4($3)
/* 0156A4 001155A4 0800E003 */  jr          $31
/* 0156A8 001155A8 0C0064AC */   sw         $4, 0xC($3)
/* 0156AC 001155AC 00000000 */  nop
