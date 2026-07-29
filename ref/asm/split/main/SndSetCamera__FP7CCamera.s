.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetCamera__FP7CCamera
/* 0597F0 001596F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0597F4 001596F4 1000BF7F */  sq          $31, 0x10($29)
/* 0597F8 001596F8 0000B07F */  sq          $16, 0x0($29)
/* 0597FC 001596FC 28868070 */  paddub      $16, $4, $0
/* 059800 00159700 D001023C */  lui         $2, %hi(camera_pos)
/* 059804 00159704 10B54524 */  addiu       $5, $2, %lo(camera_pos)
/* 059808 00159708 9C91040C */  jal         GetPos__7CCameraFPf
/* 05980C 0015970C 00000000 */   nop
/* 059810 00159710 28260072 */  paddub      $4, $16, $0
/* 059814 00159714 D001023C */  lui         $2, %hi(camera_dir)
/* 059818 00159718 20B54524 */  addiu       $5, $2, %lo(camera_dir)
/* 05981C 0015971C E890040C */  jal         GetDir__7CCameraFPf
/* 059820 00159720 00000000 */   nop
/* 059824 00159724 1000BF7B */  lq          $31, 0x10($29)
/* 059828 00159728 0000B07B */  lq          $16, 0x0($29)
/* 05982C 0015972C 2000BD27 */  addiu       $29, $29, 0x20
/* 059830 00159730 0800E003 */  jr          $31
/* 059834 00159734 00000000 */   nop
/* 059838 00159738 00000000 */  nop
/* 05983C 0015973C 00000000 */  nop
