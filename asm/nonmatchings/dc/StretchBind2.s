.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StretchBind2__FPfPfPf
/* 3B4E0 0013B3E0 00008AD8 */  lqc2       $vf10, 0x0($4)
/* 3B4E4 0013B3E4 0000ABD8 */  lqc2       $vf11, 0x0($5)
/* 3B4E8 0013B3E8 0000CCD8 */  lqc2       $vf12, 0x0($6)
/* 3B4EC 0013B3EC 5800E04B */  vmulx.xyzw $vf1, $vf0, $vf0x
/* 3B4F0 0013B3F0 6C53CB4B */  vsub.xyz   $vf13, $vf10, $vf11
/* 3B4F4 0013B3F4 FF02004A */  vnop
/* 3B4F8 0013B3F8 FF02004A */  vnop
/* 3B4FC 0013B3FC FF02004A */  vnop
/* 3B500 0013B400 41090D4B */  vaddy.x    $vf5, $vf1, $vf13y
/* 3B504 0013B404 82090D4B */  vaddz.x    $vf6, $vf1, $vf13z
/* 3B508 0013B408 BE6A0D4B */  vmula.x    ACC, $vf13, $vf13
/* 3B50C 0013B40C BD280D4B */  vmadday.x  ACC, $vf5, $vf13y
/* 3B510 0013B410 CA310D4B */  vmaddz.x   $vf7, $vf6, $vf13z
/* 3B514 0013B414 BE63074A */  vrsqrt     Q, $vf12x, $vf7x
/* 3B518 0013B418 3C68E04B */  vaddax.xyzw ACC, $vf13, $vf0x
/* 3B51C 0013B41C BF03004A */  vwaitq
/* 3B520 0013B420 656EE04B */  vmsubq.xyzw $vf25, $vf13, Q
/* 3B524 0013B424 3C50E04B */  vaddax.xyzw ACC, $vf10, $vf0x
/* 3B528 0013B428 8DCACC4B */  vmsuby.xyz $vf10, $vf25, $vf12y
/* 3B52C 0013B42C 3C58E04B */  vaddax.xyzw ACC, $vf11, $vf0x
/* 3B530 0013B430 CACACC4B */  vmaddz.xyz $vf11, $vf25, $vf12z
/* 3B534 0013B434 00008AF8 */  sqc2       $vf10, 0x0($4)
/* 3B538 0013B438 0000ABF8 */  sqc2       $vf11, 0x0($5)
/* 3B53C 0013B43C 0800E003 */  jr         $31
/* 3B540 0013B440 00000000 */   nop
/* 3B544 0013B444 00000000 */  nop
/* 3B548 0013B448 00000000 */  nop
/* 3B54C 0013B44C 00000000 */  nop
