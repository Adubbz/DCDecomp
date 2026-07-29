.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDead__14CDngStatusDataFv
/* 0BEFF0 001BEEF0 46438394 */  lhu         $3, 0x4346($4)
/* 0BEFF4 001BEEF4 42180300 */  srl         $3, $3, 1
/* 0BEFF8 001BEEF8 464383A4 */  sh          $3, 0x4346($4)
/* 0BEFFC 001BEEFC 0800E003 */  jr          $31
/* 0BF000 001BEF00 00000000 */   nop
/* 0BF004 001BEF04 00000000 */  nop
/* 0BF008 001BEF08 00000000 */  nop
/* 0BF00C 001BEF0C 00000000 */  nop
