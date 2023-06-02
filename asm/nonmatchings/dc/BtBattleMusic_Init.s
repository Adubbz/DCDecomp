.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtBattleMusic_Init__Fv
/* B7720 001B7620 E89380AF */  sw         $0, -0x6C18($gp)
/* B7724 001B7624 EC9380AF */  sw         $0, -0x6C14($gp)
/* B7728 001B7628 F09380AF */  sw         $0, -0x6C10($gp)
/* B772C 001B762C 0800E003 */  jr         $31
/* B7730 001B7630 00000000 */   nop
/* B7734 001B7634 00000000 */  nop
/* B7738 001B7638 00000000 */  nop
/* B773C 001B763C 00000000 */  nop
