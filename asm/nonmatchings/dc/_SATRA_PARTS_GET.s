.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SATRA_PARTS_GET__FP12RS_STACKDATAi
/* 958D0 001957D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 958D4 001957D4 2000BF7F */  sq         $31, 0x20($sp)
/* 958D8 001957D8 1000B17F */  sq         $17, 0x10($sp)
/* 958DC 001957DC 0000B07F */  sq         $16, 0x0($sp)
/* 958E0 001957E0 08009124 */  addiu      $17, $4, 0x8
/* 958E4 001957E4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 958E8 001957E8 00000000 */   nop
/* 958EC 001957EC FFFF5024 */  addiu      $16, $2, -0x1
/* 958F0 001957F0 28262072 */  paddub     $4, $17, $0
/* 958F4 001957F4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 958F8 001957F8 00000000 */   nop
/* 958FC 001957FC 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95900 00195800 282E0072 */  paddub     $5, $16, $0
/* 95904 00195804 28364070 */  paddub     $6, $2, $0
/* 95908 00195808 9861050C */  jal        AtraPartsGet__9CSaveDataFii
/* 9590C 0019580C 00000000 */   nop
/* 95910 00195810 2000BF7B */  lq         $31, 0x20($sp)
/* 95914 00195814 1000B17B */  lq         $17, 0x10($sp)
/* 95918 00195818 0000B07B */  lq         $16, 0x0($sp)
/* 9591C 0019581C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 95920 00195820 0800E003 */  jr         $31
/* 95924 00195824 00000000 */   nop
/* 95928 00195828 00000000 */  nop
/* 9592C 0019582C 00000000 */  nop
