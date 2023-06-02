.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __errno
/* 1860 00101760 2500033C */  lui        $3, (0x250000 >> 16)
/* 1864 00101764 0800E003 */  jr         $31
/* 1868 00101768 ECFD628C */   lw        $2, -0x214($3)
/* 186C 0010176C 00000000 */  nop
