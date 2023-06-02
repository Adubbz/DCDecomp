.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetCamera__FPfPf
/* 59840 00159740 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 59844 00159744 1000BF7F */  sq         $31, 0x10($sp)
/* 59848 00159748 0000B07F */  sq         $16, 0x0($sp)
/* 5984C 0015974C 281E8070 */  paddub     $3, $4, $0
/* 59850 00159750 2886A070 */  paddub     $16, $5, $0
/* 59854 00159754 D001023C */  lui        $2, %hi(camera_pos)
/* 59858 00159758 10B54424 */  addiu      $4, $2, %lo(camera_pos)
/* 5985C 0015975C 282E6070 */  paddub     $5, $3, $0
/* 59860 00159760 0C86040C */  jal        sceVu0CopyVector
/* 59864 00159764 00000000 */   nop
/* 59868 00159768 D001023C */  lui        $2, %hi(camera_dir)
/* 5986C 0015976C 20B54424 */  addiu      $4, $2, %lo(camera_dir)
/* 59870 00159770 282E0072 */  paddub     $5, $16, $0
/* 59874 00159774 0C86040C */  jal        sceVu0CopyVector
/* 59878 00159778 00000000 */   nop
/* 5987C 0015977C 1000BF7B */  lq         $31, 0x10($sp)
/* 59880 00159780 0000B07B */  lq         $16, 0x0($sp)
/* 59884 00159784 2000BD27 */  addiu      $sp, $sp, 0x20
/* 59888 00159788 0800E003 */  jr         $31
/* 5988C 0015978C 00000000 */   nop
