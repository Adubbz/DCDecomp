.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel check_now_loading_vsync_end__Fv
/* 54060 00153F60 E88D828F */  lw         $2, -0x7218($gp)
/* 54064 00153F64 0800E003 */  jr         $31
/* 54068 00153F68 00000000 */   nop
/* 5406C 00153F6C 00000000 */  nop
