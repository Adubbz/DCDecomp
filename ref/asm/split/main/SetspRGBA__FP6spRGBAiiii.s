.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetspRGBA__FP6spRGBAiiii
/* 052110 00152010 000085A0 */  sb          $5, 0x0($4)
/* 052114 00152014 010086A0 */  sb          $6, 0x1($4)
/* 052118 00152018 020087A0 */  sb          $7, 0x2($4)
/* 05211C 0015201C 030088A0 */  sb          $8, 0x3($4)
/* 052120 00152020 0800E003 */  jr          $31
/* 052124 00152024 00000000 */   nop
/* 052128 00152028 00000000 */  nop
/* 05212C 0015202C 00000000 */  nop
