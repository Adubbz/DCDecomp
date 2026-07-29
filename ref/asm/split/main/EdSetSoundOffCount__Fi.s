.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSetSoundOffCount__Fi
/* 077860 00177760 0B008128 */  slti        $1, $4, 0xB
/* 077864 00177764 02002014 */  bnez        $1, .L00177770
/* 077868 00177768 00000000 */   nop
/* 07786C 0017776C 0A000424 */  addiu       $4, $0, 0xA
.L00177770:
/* 077870 00177770 02008104 */  bgez        $4, .L0017777C
/* 077874 00177774 00000000 */   nop
/* 077878 00177778 28260070 */  paddub      $4, $0, $0
.L0017777C:
/* 07787C 0017777C A09084AF */  sw          $4, -0x6F60($28)
/* 077880 00177780 0800E003 */  jr          $31
/* 077884 00177784 00000000 */   nop
/* 077888 00177788 00000000 */  nop
/* 07788C 0017778C 00000000 */  nop
