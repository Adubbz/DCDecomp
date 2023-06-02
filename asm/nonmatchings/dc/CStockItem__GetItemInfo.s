.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetItemInfo__10CStockItemFiPsPs
/* 13F7F0 0023F6F0 40180500 */  sll        $3, $5, 1
/* 13F7F4 0023F6F4 21208300 */  addu       $4, $4, $3
/* 13F7F8 0023F6F8 00008384 */  lh         $3, 0x0($4)
/* 13F7FC 0023F6FC 0000C3A4 */  sh         $3, 0x0($6)
/* 13F800 0023F700 78008384 */  lh         $3, 0x78($4)
/* 13F804 0023F704 0000E3A4 */  sh         $3, 0x0($7)
/* 13F808 0023F708 0800E003 */  jr         $31
/* 13F80C 0023F70C 00000000 */   nop
