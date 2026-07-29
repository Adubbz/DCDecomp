.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DRAW_EXCLAMATION_MARK__FP12RS_STACKDATAi
/* 08BED0 0018BDD0 01000224 */  addiu       $2, $0, 0x1
/* 08BED4 0018BDD4 D401013C */  lui         $1, %hi(EdEventInfo + 0x2D8)
/* 08BED8 0018BDD8 A8D422AC */  sw          $2, %lo(EdEventInfo + 0x2D8)($1)
/* 08BEDC 0018BDDC 0800E003 */  jr          $31
/* 08BEE0 0018BDE0 00000000 */   nop
/* 08BEE4 0018BDE4 00000000 */  nop
/* 08BEE8 0018BDE8 00000000 */  nop
/* 08BEEC 0018BDEC 00000000 */  nop
