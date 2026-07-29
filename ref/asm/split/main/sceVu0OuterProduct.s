.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVu0OuterProduct
/* 021700 00121600 0000A4D8 */  lqc2        $vf4, 0x0($5)
/* 021704 00121604 0000C5D8 */  lqc2        $vf5, 0x0($6)
/* 021708 00121608 FE22C54B */  vopmula.xyz $ACC, $vf4, $vf5
/* 02170C 0012160C AE29C44B */  vopmsub.xyz $vf6, $vf5, $vf4
/* 021710 00121610 AC31264A */  vsub.w      $vf6, $vf6, $vf6
/* 021714 00121614 0800E003 */  jr          $31
/* 021718 00121618 000086F8 */   sqc2       $vf6, 0x0($4)
/* 02171C 0012161C 00000000 */  nop
