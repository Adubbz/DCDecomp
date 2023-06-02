.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _set_sreg
/* 165E8 001164E8 1000828C */  lw         $2, 0x10($4)
/* 165EC 001164EC 1C00A68C */  lw         $6, 0x1C($5)
/* 165F0 001164F0 1400838C */  lw         $3, 0x14($4)
/* 165F4 001164F4 80100200 */  sll        $2, $2, 2
/* 165F8 001164F8 21104600 */  addu       $2, $2, $6
/* 165FC 001164FC 0800E003 */  jr         $31
/* 16600 00116500 000043AC */   sw        $3, 0x0($2)
/* 16604 00116504 00000000 */  nop
