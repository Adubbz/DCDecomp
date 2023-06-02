.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRate__9CDispCtrlFv
/* 3E770 0013E670 000080C4 */  lwc1       $f0, 0x0($4)
/* 3E774 0013E674 0800E003 */  jr         $31
/* 3E778 0013E678 00000000 */   nop
/* 3E77C 0013E67C 00000000 */  nop
