.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckSeq__12CNPCharacterFv
/* 56550 00156450 B411838C */  lw         $3, 0x11B4($4)
/* 56554 00156454 B811828C */  lw         $2, 0x11B8($4)
/* 56558 00156458 26106200 */  xor        $2, $3, $2
/* 5655C 0015645C 2B100200 */  sltu       $2, $0, $2
/* 56560 00156460 0800E003 */  jr         $31
/* 56564 00156464 00000000 */   nop
/* 56568 00156468 00000000 */  nop
/* 5656C 0015646C 00000000 */  nop
