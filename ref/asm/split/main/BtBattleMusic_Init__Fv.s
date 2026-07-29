.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtBattleMusic_Init__Fv
/* 0B7720 001B7620 E89380AF */  sw          $0, -0x6C18($28)
/* 0B7724 001B7624 EC9380AF */  sw          $0, -0x6C14($28)
/* 0B7728 001B7628 F09380AF */  sw          $0, -0x6C10($28)
/* 0B772C 001B762C 0800E003 */  jr          $31
/* 0B7730 001B7630 00000000 */   nop
/* 0B7734 001B7634 00000000 */  nop
/* 0B7738 001B7638 00000000 */  nop
/* 0B773C 001B763C 00000000 */  nop
