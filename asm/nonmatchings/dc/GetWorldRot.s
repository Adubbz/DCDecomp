.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWorldRot__FPfPf
/* 8B5D0 0018B4D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B5D4 0018B4D4 1000BF7F */  sq         $31, 0x10($sp)
/* 8B5D8 0018B4D8 0000B07F */  sq         $16, 0x0($sp)
/* 8B5DC 0018B4DC 28868070 */  paddub     $16, $4, $0
/* 8B5E0 0018B4E0 0C86040C */  jal        sceVu0CopyVector
/* 8B5E4 0018B4E4 00000000 */   nop
/* 8B5E8 0018B4E8 04000CC6 */  lwc1       $f12, 0x4($16)
/* 8B5EC 0018B4EC 202D060C */  jal        GetWorldRotY__Ff
/* 8B5F0 0018B4F0 00000000 */   nop
/* 8B5F4 0018B4F4 040000E6 */  swc1       $f0, 0x4($16)
/* 8B5F8 0018B4F8 1000BF7B */  lq         $31, 0x10($sp)
/* 8B5FC 0018B4FC 0000B07B */  lq         $16, 0x0($sp)
/* 8B600 0018B500 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8B604 0018B504 0800E003 */  jr         $31
/* 8B608 0018B508 00000000 */   nop
/* 8B60C 0018B50C 00000000 */  nop
