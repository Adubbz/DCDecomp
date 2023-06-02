.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetItemToPos__10CStockItemFiPsPs
/* 13F7C0 0023F6C0 40180500 */  sll        $3, $5, 1
/* 13F7C4 0023F6C4 21288300 */  addu       $5, $4, $3
/* 13F7C8 0023F6C8 0000A484 */  lh         $4, 0x0($5)
/* 13F7CC 0023F6CC 0000C384 */  lh         $3, 0x0($6)
/* 13F7D0 0023F6D0 0000A3A4 */  sh         $3, 0x0($5)
/* 13F7D4 0023F6D4 0000C4A4 */  sh         $4, 0x0($6)
/* 13F7D8 0023F6D8 7800A484 */  lh         $4, 0x78($5)
/* 13F7DC 0023F6DC 0000E384 */  lh         $3, 0x0($7)
/* 13F7E0 0023F6E0 7800A3A4 */  sh         $3, 0x78($5)
/* 13F7E4 0023F6E4 0000E4A4 */  sh         $4, 0x0($7)
/* 13F7E8 0023F6E8 0800E003 */  jr         $31
/* 13F7EC 0023F6EC 00000000 */   nop
