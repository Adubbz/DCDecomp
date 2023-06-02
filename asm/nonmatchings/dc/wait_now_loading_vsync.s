.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel wait_now_loading_vsync__Fv
/* 54070 00153F70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 54074 00153F74 0000BF7F */  sq         $31, 0x0($sp)
/* 54078 00153F78 E086838F */  lw         $3, -0x7920($gp)
/* 5407C 00153F7C 07006014 */  bnez       $3, .L00153F9C
/* 54080 00153F80 00000000 */   nop
/* 54084 00153F84 D44F050C */  jal        clear_now_loading_vsync_end__Fv
/* 54088 00153F88 00000000 */   nop
.L00153F8C:
/* 5408C 00153F8C D84F050C */  jal        check_now_loading_vsync_end__Fv
/* 54090 00153F90 00000000 */   nop
/* 54094 00153F94 FDFF4010 */  beqz       $2, .L00153F8C
/* 54098 00153F98 00000000 */   nop
.L00153F9C:
/* 5409C 00153F9C 0000BF7B */  lq         $31, 0x0($sp)
/* 540A0 00153FA0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 540A4 00153FA4 0800E003 */  jr         $31
/* 540A8 00153FA8 00000000 */   nop
/* 540AC 00153FAC 00000000 */  nop
