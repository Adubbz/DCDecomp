.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FadeOutStart__9CDispCtrlFf
/* 3E710 0013E610 04008CE4 */  swc1       $f12, 0x4($4)
/* 3E714 0013E614 000080AC */  sw         $0, 0x0($4)
/* 3E718 0013E618 01000324 */  addiu      $3, $0, 0x1
/* 3E71C 0013E61C 080083AC */  sw         $3, 0x8($4)
/* 3E720 0013E620 0800E003 */  jr         $31
/* 3E724 0013E624 00000000 */   nop
/* 3E728 0013E628 00000000 */  nop
/* 3E72C 0013E62C 00000000 */  nop
