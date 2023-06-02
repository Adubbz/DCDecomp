.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LinerInterpolation__Ffff
/* 4C700 0014C600 01680C46 */  sub.s      $f0, $f13, $f12
/* 4C704 0014C604 02700046 */  mul.s      $f0, $f14, $f0
/* 4C708 0014C608 00600046 */  add.s      $f0, $f12, $f0
/* 4C70C 0014C60C 0800E003 */  jr         $31
/* 4C710 0014C610 00000000 */   nop
/* 4C714 0014C614 00000000 */  nop
/* 4C718 0014C618 00000000 */  nop
/* 4C71C 0014C61C 00000000 */  nop
