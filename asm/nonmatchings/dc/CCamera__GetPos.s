.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPos__7CCameraFPf
/* 24770 00124670 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 24774 00124674 0000BF7F */  sq         $31, 0x0($sp)
/* 24778 00124678 28168070 */  paddub     $2, $4, $0
/* 2477C 0012467C 2826A070 */  paddub     $4, $5, $0
/* 24780 00124680 60024524 */  addiu      $5, $2, 0x260
/* 24784 00124684 0C86040C */  jal        sceVu0CopyVector
/* 24788 00124688 00000000 */   nop
/* 2478C 0012468C 0000BF7B */  lq         $31, 0x0($sp)
/* 24790 00124690 1000BD27 */  addiu      $sp, $sp, 0x10
/* 24794 00124694 0800E003 */  jr         $31
/* 24798 00124698 00000000 */   nop
/* 2479C 0012469C 00000000 */  nop
