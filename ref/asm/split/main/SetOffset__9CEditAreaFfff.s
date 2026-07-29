.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetOffset__9CEditAreaFfff
/* 070230 00170130 10008CE4 */  swc1        $f12, 0x10($4)
/* 070234 00170134 14008DE4 */  swc1        $f13, 0x14($4)
/* 070238 00170138 18008EE4 */  swc1        $f14, 0x18($4)
/* 07023C 0017013C 0800E003 */  jr          $31
/* 070240 00170140 00000000 */   nop
/* 070244 00170144 00000000 */  nop
/* 070248 00170148 00000000 */  nop
/* 07024C 0017014C 00000000 */  nop
