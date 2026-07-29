.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__7CCursolFf
/* 0293B0 01DD50B0 04008CE4 */  swc1        $f12, 0x4($4)
/* 0293B4 01DD50B4 0800E003 */  jr          $31
/* 0293B8 01DD50B8 00000000 */   nop
/* 0293BC 01DD50BC 00000000 */  nop
