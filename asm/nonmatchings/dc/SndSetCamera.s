.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetCamera__FP7CCamera
/* 597F0 001596F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 597F4 001596F4 1000BF7F */  sq         $31, 0x10($sp)
/* 597F8 001596F8 0000B07F */  sq         $16, 0x0($sp)
/* 597FC 001596FC 28868070 */  paddub     $16, $4, $0
/* 59800 00159700 D001023C */  lui        $2, %hi(camera_pos)
/* 59804 00159704 10B54524 */  addiu      $5, $2, %lo(camera_pos)
/* 59808 00159708 9C91040C */  jal        GetPos__7CCameraFPf
/* 5980C 0015970C 00000000 */   nop
/* 59810 00159710 28260072 */  paddub     $4, $16, $0
/* 59814 00159714 D001023C */  lui        $2, %hi(camera_dir)
/* 59818 00159718 20B54524 */  addiu      $5, $2, %lo(camera_dir)
/* 5981C 0015971C E890040C */  jal        GetDir__7CCameraFPf
/* 59820 00159720 00000000 */   nop
/* 59824 00159724 1000BF7B */  lq         $31, 0x10($sp)
/* 59828 00159728 0000B07B */  lq         $16, 0x0($sp)
/* 5982C 0015972C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 59830 00159730 0800E003 */  jr         $31
/* 59834 00159734 00000000 */   nop
/* 59838 00159738 00000000 */  nop
/* 5983C 0015973C 00000000 */  nop
