.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkReserve
/* 21078 00120F78 0000828C */  lw         $2, 0x0($4)
/* 2107C 00120F7C 80280500 */  sll        $5, $5, 2
/* 21080 00120F80 21284500 */  addu       $5, $2, $5
/* 21084 00120F84 0800E003 */  jr         $31
/* 21088 00120F88 000085AC */   sw        $5, 0x0($4)
/* 2108C 00120F8C 00000000 */  nop
