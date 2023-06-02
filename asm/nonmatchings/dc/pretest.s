.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel pretest__FPA4_fPf
/* 60850 00160750 00008AD8 */  lqc2       $vf10, 0x0($4)
/* 60854 00160754 10008BD8 */  lqc2       $vf11, 0x10($4)
/* 60858 00160758 20008CD8 */  lqc2       $vf12, 0x20($4)
/* 6085C 0016075C 30008DD8 */  lqc2       $vf13, 0x30($4)
/* 60860 00160760 0000AED8 */  lqc2       $vf14, 0x0($5)
/* 60864 00160764 0800E003 */  jr         $31
/* 60868 00160768 00000000 */   nop
/* 6086C 0016076C 00000000 */  nop
