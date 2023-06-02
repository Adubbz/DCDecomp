.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel localeconv
/* 2718 00102618 2500023C */  lui        $2, (0x250000 >> 16)
/* 271C 0010261C F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2720 00102620 ECFD448C */  lw         $4, -0x214($2)
/* 2724 00102624 0000BFFF */  sd         $31, 0x0($sp)
/* 2728 00102628 7609040C */  jal        _localeconv_r
/* 272C 0010262C 00000000 */   nop
/* 2730 00102630 0000BFDF */  ld         $31, 0x0($sp)
/* 2734 00102634 0800E003 */  jr         $31
/* 2738 00102638 1000BD27 */   addiu     $sp, $sp, 0x10
/* 273C 0010263C 00000000 */  nop
