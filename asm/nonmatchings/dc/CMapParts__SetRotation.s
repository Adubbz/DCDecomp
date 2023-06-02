.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__9CMapPartsFfff
/* 9A930 0019A830 60008CE4 */  swc1       $f12, 0x60($4)
/* 9A934 0019A834 64008DE4 */  swc1       $f13, 0x64($4)
/* 9A938 0019A838 68008EE4 */  swc1       $f14, 0x68($4)
/* 9A93C 0019A83C 0800E003 */  jr         $31
/* 9A940 0019A840 00000000 */   nop
/* 9A944 0019A844 00000000 */  nop
/* 9A948 0019A848 00000000 */  nop
/* 9A94C 0019A84C 00000000 */  nop
