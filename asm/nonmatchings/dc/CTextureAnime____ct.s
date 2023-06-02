.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CTextureAnimeFv
/* 43720 00143620 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 43724 00143624 0000BF7F */  sq         $31, 0x0($sp)
/* 43728 00143628 282E0070 */  paddub     $5, $0, $0
/* 4372C 0014362C 28360070 */  paddub     $6, $0, $0
/* 43730 00143630 1C9E050C */  jal        __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 43734 00143634 00000000 */   nop
/* 43738 00143638 0000BF7B */  lq         $31, 0x0($sp)
/* 4373C 0014363C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 43740 00143640 0800E003 */  jr         $31
/* 43744 00143644 00000000 */   nop
/* 43748 00143648 00000000 */  nop
/* 4374C 0014364C 00000000 */  nop
