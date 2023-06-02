.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PlaneNormal__FPfPfPfPf
/* 23200 00123100 0000AFD8 */  lqc2       $vf15, 0x0($5)
/* 23204 00123104 0000D0D8 */  lqc2       $vf16, 0x0($6)
/* 23208 00123108 0000F1D8 */  lqc2       $vf17, 0x0($7)
/* 2320C 0012310C AC82EF4B */  vsub.xyzw  $vf10, $vf16, $vf15
/* 23210 00123110 EC8AEF4B */  vsub.xyzw  $vf11, $vf17, $vf15
/* 23214 00123114 FE52CB4B */  vopmula.xyz ACC, $vf10, $vf11
/* 23218 00123118 2E5BCA4B */  vopmsub.xyz $vf12, $vf11, $vf10
/* 2321C 0012311C 00008CF8 */  sqc2       $vf12, 0x0($4)
/* 23220 00123120 0800E003 */  jr         $31
/* 23224 00123124 00000000 */   nop
/* 23228 00123128 00000000 */  nop
/* 2322C 0012312C 00000000 */  nop
