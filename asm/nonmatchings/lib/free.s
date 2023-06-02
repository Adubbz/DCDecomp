.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel free
/* 2918 00102818 2D288000 */  daddu      $5, $4, $0
/* 291C 0010281C 2500023C */  lui        $2, (0x250000 >> 16)
/* 2920 00102820 FC060408 */  j          _free_r
/* 2924 00102824 ECFD448C */   lw        $4, -0x214($2)
