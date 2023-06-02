.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetspRGBA__FP6spRGBAiiii
/* 52110 00152010 000085A0 */  sb         $5, 0x0($4)
/* 52114 00152014 010086A0 */  sb         $6, 0x1($4)
/* 52118 00152018 020087A0 */  sb         $7, 0x2($4)
/* 5211C 0015201C 030088A0 */  sb         $8, 0x3($4)
/* 52120 00152020 0800E003 */  jr         $31
/* 52124 00152024 00000000 */   nop
/* 52128 00152028 00000000 */  nop
/* 5212C 0015202C 00000000 */  nop
