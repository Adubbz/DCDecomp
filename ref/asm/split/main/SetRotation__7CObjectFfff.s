.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__7CObjectFfff
/* 056EE0 00156DE0 60008CE4 */  swc1        $f12, 0x60($4)
/* 056EE4 00156DE4 64008DE4 */  swc1        $f13, 0x64($4)
/* 056EE8 00156DE8 68008EE4 */  swc1        $f14, 0x68($4)
/* 056EEC 00156DEC 0800E003 */  jr          $31
/* 056EF0 00156DF0 00000000 */   nop
/* 056EF4 00156DF4 00000000 */  nop
/* 056EF8 00156DF8 00000000 */  nop
/* 056EFC 00156DFC 00000000 */  nop
