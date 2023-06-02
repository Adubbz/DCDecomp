.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddHeight__13CCameraFollowFf
/* 24CD0 00124BD0 D40280C4 */  lwc1       $f0, 0x2D4($4)
/* 24CD4 00124BD4 00000C46 */  add.s      $f0, $f0, $f12
/* 24CD8 00124BD8 D40280E4 */  swc1       $f0, 0x2D4($4)
/* 24CDC 00124BDC 0800E003 */  jr         $31
/* 24CE0 00124BE0 00000000 */   nop
/* 24CE4 00124BE4 00000000 */  nop
/* 24CE8 00124BE8 00000000 */  nop
/* 24CEC 00124BEC 00000000 */  nop
