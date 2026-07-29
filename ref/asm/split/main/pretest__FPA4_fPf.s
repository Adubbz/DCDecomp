.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel pretest__FPA4_fPf
/* 060850 00160750 00008AD8 */  lqc2        $vf10, 0x0($4)
/* 060854 00160754 10008BD8 */  lqc2        $vf11, 0x10($4)
/* 060858 00160758 20008CD8 */  lqc2        $vf12, 0x20($4)
/* 06085C 0016075C 30008DD8 */  lqc2        $vf13, 0x30($4)
/* 060860 00160760 0000AED8 */  lqc2        $vf14, 0x0($5)
/* 060864 00160764 0800E003 */  jr          $31
/* 060868 00160768 00000000 */   nop
/* 06086C 0016076C 00000000 */  nop
