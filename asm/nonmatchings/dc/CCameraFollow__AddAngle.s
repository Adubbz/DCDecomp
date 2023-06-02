.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddAngle__13CCameraFollowFf
/* 24C50 00124B50 D80280C4 */  lwc1       $f0, 0x2D8($4)
/* 24C54 00124B54 00000C46 */  add.s      $f0, $f0, $f12
/* 24C58 00124B58 D80280E4 */  swc1       $f0, 0x2D8($4)
/* 24C5C 00124B5C 0800E003 */  jr         $31
/* 24C60 00124B60 00000000 */   nop
/* 24C64 00124B64 00000000 */  nop
/* 24C68 00124B68 00000000 */  nop
/* 24C6C 00124B6C 00000000 */  nop
