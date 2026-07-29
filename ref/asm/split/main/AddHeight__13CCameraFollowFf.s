.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddHeight__13CCameraFollowFf
/* 024CD0 00124BD0 D40280C4 */  lwc1        $f0, 0x2D4($4)
/* 024CD4 00124BD4 00000C46 */  add.s       $f0, $f0, $f12
/* 024CD8 00124BD8 D40280E4 */  swc1        $f0, 0x2D4($4)
/* 024CDC 00124BDC 0800E003 */  jr          $31
/* 024CE0 00124BE0 00000000 */   nop
/* 024CE4 00124BE4 00000000 */  nop
/* 024CE8 00124BE8 00000000 */  nop
/* 024CEC 00124BEC 00000000 */  nop
