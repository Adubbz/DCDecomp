.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RsetUnitAmbientAnime__Fv
/* 0152F0 01DC0FF0 109F80AF */  sw          $0, -0x60F0($28)
/* 0152F4 01DC0FF4 0800E003 */  jr          $31
/* 0152F8 01DC0FF8 00000000 */   nop
/* 0152FC 01DC0FFC 00000000 */  nop
