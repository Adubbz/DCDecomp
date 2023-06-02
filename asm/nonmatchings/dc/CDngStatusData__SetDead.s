.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDead__14CDngStatusDataFv
/* BEFF0 001BEEF0 46438394 */  lhu        $3, 0x4346($4)
/* BEFF4 001BEEF4 42180300 */  srl        $3, $3, 1
/* BEFF8 001BEEF8 464383A4 */  sh         $3, 0x4346($4)
/* BEFFC 001BEEFC 0800E003 */  jr         $31
/* BF000 001BEF00 00000000 */   nop
/* BF004 001BEF04 00000000 */  nop
/* BF008 001BEF08 00000000 */  nop
/* BF00C 001BEF0C 00000000 */  nop
