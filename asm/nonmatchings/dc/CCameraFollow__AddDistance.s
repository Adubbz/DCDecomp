.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddDistance__13CCameraFollowFf
/* 24C90 00124B90 D00280C4 */  lwc1       $f0, 0x2D0($4)
/* 24C94 00124B94 00000C46 */  add.s      $f0, $f0, $f12
/* 24C98 00124B98 D00280E4 */  swc1       $f0, 0x2D0($4)
/* 24C9C 00124B9C 0800E003 */  jr         $31
/* 24CA0 00124BA0 00000000 */   nop
/* 24CA4 00124BA4 00000000 */  nop
/* 24CA8 00124BA8 00000000 */  nop
/* 24CAC 00124BAC 00000000 */  nop
