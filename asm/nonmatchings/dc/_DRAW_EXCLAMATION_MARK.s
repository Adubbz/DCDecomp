.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DRAW_EXCLAMATION_MARK__FP12RS_STACKDATAi
/* 8BED0 0018BDD0 01000224 */  addiu      $2, $0, 0x1
/* 8BED4 0018BDD4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8BED8 0018BDD8 A8D422AC */  sw         $2, -0x2B58($at)
/* 8BEDC 0018BDDC 0800E003 */  jr         $31
/* 8BEE0 0018BDE0 00000000 */   nop
/* 8BEE4 0018BDE4 00000000 */  nop
/* 8BEE8 0018BDE8 00000000 */  nop
/* 8BEEC 0018BDEC 00000000 */  nop
