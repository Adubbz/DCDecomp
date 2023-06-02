.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetOffset__9CEditAreaFPf
/* 70250 00170150 100080C4 */  lwc1       $f0, 0x10($4)
/* 70254 00170154 0000A0E4 */  swc1       $f0, 0x0($5)
/* 70258 00170158 140080C4 */  lwc1       $f0, 0x14($4)
/* 7025C 0017015C 0400A0E4 */  swc1       $f0, 0x4($5)
/* 70260 00170160 180080C4 */  lwc1       $f0, 0x18($4)
/* 70264 00170164 0800A0E4 */  swc1       $f0, 0x8($5)
/* 70268 00170168 0800E003 */  jr         $31
/* 7026C 0017016C 00000000 */   nop
