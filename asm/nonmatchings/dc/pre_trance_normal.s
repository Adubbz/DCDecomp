.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel pre_trance_normal__FPA4_f
/* 2A400 0012A300 00008AD8 */  lqc2       $vf10, 0x0($4)
/* 2A404 0012A304 10008BD8 */  lqc2       $vf11, 0x10($4)
/* 2A408 0012A308 20008CD8 */  lqc2       $vf12, 0x20($4)
/* 2A40C 0012A30C 30008DD8 */  lqc2       $vf13, 0x30($4)
/* 2A410 0012A310 0800E003 */  jr         $31
/* 2A414 0012A314 00000000 */   nop
/* 2A418 0012A318 00000000 */  nop
/* 2A41C 0012A31C 00000000 */  nop
