.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPos__7CCameraFPf
/* 024770 00124670 F0FFBD27 */  addiu       $29, $29, -0x10
/* 024774 00124674 0000BF7F */  sq          $31, 0x0($29)
/* 024778 00124678 28168070 */  paddub      $2, $4, $0
/* 02477C 0012467C 2826A070 */  paddub      $4, $5, $0
/* 024780 00124680 60024524 */  addiu       $5, $2, 0x260
/* 024784 00124684 0C86040C */  jal         sceVu0CopyVector
/* 024788 00124688 00000000 */   nop
/* 02478C 0012468C 0000BF7B */  lq          $31, 0x0($29)
/* 024790 00124690 1000BD27 */  addiu       $29, $29, 0x10
/* 024794 00124694 0800E003 */  jr          $31
/* 024798 00124698 00000000 */   nop
/* 02479C 0012469C 00000000 */  nop
