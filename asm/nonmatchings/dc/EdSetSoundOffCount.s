.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetSoundOffCount__Fi
/* 77860 00177760 0B008128 */  slti       $at, $4, 0xB
/* 77864 00177764 02002014 */  bnez       $at, .L00177770
/* 77868 00177768 00000000 */   nop
/* 7786C 0017776C 0A000424 */  addiu      $4, $0, 0xA
.L00177770:
/* 77870 00177770 02008104 */  bgez       $4, .L0017777C
/* 77874 00177774 00000000 */   nop
/* 77878 00177778 28260070 */  paddub     $4, $0, $0
.L0017777C:
/* 7787C 0017777C A09084AF */  sw         $4, -0x6F60($gp)
/* 77880 00177780 0800E003 */  jr         $31
/* 77884 00177784 00000000 */   nop
/* 77888 00177788 00000000 */  nop
/* 7788C 0017778C 00000000 */  nop
