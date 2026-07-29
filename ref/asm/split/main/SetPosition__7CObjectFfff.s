.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetPosition__7CObjectFfff
/* 056DD0 00156CD0 10008CE4 */  swc1        $f12, 0x10($4)
/* 056DD4 00156CD4 14008DE4 */  swc1        $f13, 0x14($4)
/* 056DD8 00156CD8 18008EE4 */  swc1        $f14, 0x18($4)
/* 056DDC 00156CDC 0800E003 */  jr          $31
/* 056DE0 00156CE0 00000000 */   nop
/* 056DE4 00156CE4 00000000 */  nop
/* 056DE8 00156CE8 00000000 */  nop
/* 056DEC 00156CEC 00000000 */  nop
