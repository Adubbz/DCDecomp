.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNextPos__7CCameraFP6CFramefff
/* 243D0 001242D0 80028CE4 */  swc1       $f12, 0x280($4)
/* 243D4 001242D4 84028DE4 */  swc1       $f13, 0x284($4)
/* 243D8 001242D8 88028EE4 */  swc1       $f14, 0x288($4)
/* 243DC 001242DC 0800E003 */  jr         $31
/* 243E0 001242E0 00000000 */   nop
/* 243E4 001242E4 00000000 */  nop
/* 243E8 001242E8 00000000 */  nop
/* 243EC 001242EC 00000000 */  nop
