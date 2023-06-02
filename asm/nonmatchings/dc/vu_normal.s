.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel vu_normal__FPfPfPfPf
/* 24E20 00124D20 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 24E24 00124D24 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 24E28 00124D28 0000F1D8 */  lqc2       $vf17, 0x0($7)
/* 24E2C 00124D2C AC82EF4B */  vsub.xyzw  $vf10, $vf16, $vf15
/* 24E30 00124D30 EC8AEF4B */  vsub.xyzw  $vf11, $vf17, $vf15
/* 24E34 00124D34 FE52CB4B */  vopmula.xyz ACC, $vf10, $vf11
/* 24E38 00124D38 2E5BCA4B */  vopmsub.xyz $vf12, $vf11, $vf10
/* 24E3C 00124D3C 00008CF8 */  sqc2       $vf12, 0x0($4)
/* 24E40 00124D40 0800E003 */  jr         $31
/* 24E44 00124D44 00000000 */   nop
/* 24E48 00124D48 00000000 */  nop
/* 24E4C 00124D4C 00000000 */  nop
