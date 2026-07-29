.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetCamera__FPfPf
/* 059840 00159740 E0FFBD27 */  addiu       $29, $29, -0x20
/* 059844 00159744 1000BF7F */  sq          $31, 0x10($29)
/* 059848 00159748 0000B07F */  sq          $16, 0x0($29)
/* 05984C 0015974C 281E8070 */  paddub      $3, $4, $0
/* 059850 00159750 2886A070 */  paddub      $16, $5, $0
/* 059854 00159754 D001023C */  lui         $2, %hi(camera_pos)
/* 059858 00159758 10B54424 */  addiu       $4, $2, %lo(camera_pos)
/* 05985C 0015975C 282E6070 */  paddub      $5, $3, $0
/* 059860 00159760 0C86040C */  jal         sceVu0CopyVector
/* 059864 00159764 00000000 */   nop
/* 059868 00159768 D001023C */  lui         $2, %hi(camera_dir)
/* 05986C 0015976C 20B54424 */  addiu       $4, $2, %lo(camera_dir)
/* 059870 00159770 282E0072 */  paddub      $5, $16, $0
/* 059874 00159774 0C86040C */  jal         sceVu0CopyVector
/* 059878 00159778 00000000 */   nop
/* 05987C 0015977C 1000BF7B */  lq          $31, 0x10($29)
/* 059880 00159780 0000B07B */  lq          $16, 0x0($29)
/* 059884 00159784 2000BD27 */  addiu       $29, $29, 0x20
/* 059888 00159788 0800E003 */  jr          $31
/* 05988C 0015978C 00000000 */   nop
