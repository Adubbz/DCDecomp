.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _localeconv_r
/* 26D8 001025D8 2900023C */  lui        $2, %hi(lconv)
/* 26DC 001025DC 0800E003 */  jr         $31
/* 26E0 001025E0 20694224 */   addiu     $2, $2, %lo(lconv)
/* 26E4 001025E4 00000000 */  nop
