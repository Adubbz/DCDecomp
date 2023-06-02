.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLocalRot__FPfPf
/* 8B6B0 0018B5B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B6B4 0018B5B4 1000BF7F */  sq         $31, 0x10($sp)
/* 8B6B8 0018B5B8 0000B07F */  sq         $16, 0x0($sp)
/* 8B6BC 0018B5BC 28868070 */  paddub     $16, $4, $0
/* 8B6C0 0018B5C0 0C86040C */  jal        sceVu0CopyVector
/* 8B6C4 0018B5C4 00000000 */   nop
/* 8B6C8 0018B5C8 04000CC6 */  lwc1       $f12, 0x4($16)
/* 8B6CC 0018B5CC 582D060C */  jal        GetLocalRotY__Ff
/* 8B6D0 0018B5D0 00000000 */   nop
/* 8B6D4 0018B5D4 040000E6 */  swc1       $f0, 0x4($16)
/* 8B6D8 0018B5D8 1000BF7B */  lq         $31, 0x10($sp)
/* 8B6DC 0018B5DC 0000B07B */  lq         $16, 0x0($sp)
/* 8B6E0 0018B5E0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8B6E4 0018B5E4 0800E003 */  jr         $31
/* 8B6E8 0018B5E8 00000000 */   nop
/* 8B6EC 0018B5EC 00000000 */  nop
