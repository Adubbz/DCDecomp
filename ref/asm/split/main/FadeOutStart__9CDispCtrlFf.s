.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FadeOutStart__9CDispCtrlFf
/* 03E710 0013E610 04008CE4 */  swc1        $f12, 0x4($4)
/* 03E714 0013E614 000080AC */  sw          $0, 0x0($4)
/* 03E718 0013E618 01000324 */  addiu       $3, $0, 0x1
/* 03E71C 0013E61C 080083AC */  sw          $3, 0x8($4)
/* 03E720 0013E620 0800E003 */  jr          $31
/* 03E724 0013E624 00000000 */   nop
/* 03E728 0013E628 00000000 */  nop
/* 03E72C 0013E62C 00000000 */  nop
