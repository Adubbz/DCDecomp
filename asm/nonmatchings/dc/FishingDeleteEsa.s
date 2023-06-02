.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingDeleteEsa__Fv
/* A9110 001A9010 4C9380AF */  sw         $0, -0x6CB4($gp)
/* A9114 001A9014 FFFF0324 */  addiu      $3, $0, -0x1
/* A9118 001A9018 509383AF */  sw         $3, -0x6CB0($gp)
/* A911C 001A901C 0800E003 */  jr         $31
/* A9120 001A9020 00000000 */   nop
/* A9124 001A9024 00000000 */  nop
/* A9128 001A9028 00000000 */  nop
/* A912C 001A902C 00000000 */  nop
