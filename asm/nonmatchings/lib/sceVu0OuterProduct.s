.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVu0OuterProduct
/* 21700 00121600 0000A4D8 */  lqc2       $vf4, 0x0($5)
/* 21704 00121604 0000C5D8 */  lqc2       $vf5, 0x0($6)
/* 21708 00121608 FE22C54B */  vopmula.xyz ACC, $vf4, $vf5
/* 2170C 0012160C AE29C44B */  vopmsub.xyz $vf6, $vf5, $vf4
/* 21710 00121610 AC31264A */  vsub.w     $vf6, $vf6, $vf6
/* 21714 00121614 0800E003 */  jr         $31
/* 21718 00121618 000086F8 */   sqc2      $vf6, 0x0($4)
/* 2171C 0012161C 00000000 */  nop
