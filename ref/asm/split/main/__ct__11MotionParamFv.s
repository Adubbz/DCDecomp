.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__11MotionParamFv
/* 043710 00143610 28168070 */  paddub      $2, $4, $0
/* 043714 00143614 0800E003 */  jr          $31
/* 043718 00143618 00000000 */   nop
/* 04371C 0014361C 00000000 */  nop
