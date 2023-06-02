.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SwapItem__FP9ITEM_PACKii
/* 1318C0 002317C0 40180500 */  sll        $3, $5, 1
/* 1318C4 002317C4 21406400 */  addu       $8, $3, $4
/* 1318C8 002317C8 0E000785 */  lh         $7, 0xE($8)
/* 1318CC 002317CC DC000585 */  lh         $5, 0xDC($8)
/* 1318D0 002317D0 40180600 */  sll        $3, $6, 1
/* 1318D4 002317D4 21206400 */  addu       $4, $3, $4
/* 1318D8 002317D8 0E008384 */  lh         $3, 0xE($4)
/* 1318DC 002317DC 0E0003A5 */  sh         $3, 0xE($8)
/* 1318E0 002317E0 DC008384 */  lh         $3, 0xDC($4)
/* 1318E4 002317E4 DC0003A5 */  sh         $3, 0xDC($8)
/* 1318E8 002317E8 0E0087A4 */  sh         $7, 0xE($4)
/* 1318EC 002317EC DC0085A4 */  sh         $5, 0xDC($4)
/* 1318F0 002317F0 0800E003 */  jr         $31
/* 1318F4 002317F4 00000000 */   nop
/* 1318F8 002317F8 00000000 */  nop
/* 1318FC 002317FC 00000000 */  nop
