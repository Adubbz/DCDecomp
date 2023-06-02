.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DELETE_ROBO_PARTS__FP12RS_STACKDATAi
/* 90970 00190870 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 90974 00190874 0000BF7F */  sq         $31, 0x0($sp)
/* 90978 00190878 3CFB050C */  jal        EdDeleteE05RoboParts__Fv
/* 9097C 0019087C 00000000 */   nop
/* 90980 00190880 01000224 */  addiu      $2, $0, 0x1
/* 90984 00190884 0000BF7B */  lq         $31, 0x0($sp)
/* 90988 00190888 1000BD27 */  addiu      $sp, $sp, 0x10
/* 9098C 0019088C 0800E003 */  jr         $31
/* 90990 00190890 00000000 */   nop
/* 90994 00190894 00000000 */  nop
/* 90998 00190898 00000000 */  nop
/* 9099C 0019089C 00000000 */  nop
