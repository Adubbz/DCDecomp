.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __unwinding_cleanup
/* DEF0 0010DDF0 0800E003 */  jr         $31
/* DEF4 0010DDF4 00000000 */   nop
