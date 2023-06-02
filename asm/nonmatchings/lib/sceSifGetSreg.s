.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifGetSreg
/* 16618 00116518 2A00023C */  lui        $2, %hi(D_002A5A40)
/* 1661C 0011651C 80200400 */  sll        $4, $4, 2
/* 16620 00116520 405A4224 */  addiu      $2, $2, %lo(D_002A5A40)
/* 16624 00116524 21208200 */  addu       $4, $4, $2
/* 16628 00116528 0800E003 */  jr         $31
/* 1662C 0011652C 0000828C */   lw        $2, 0x0($4)
