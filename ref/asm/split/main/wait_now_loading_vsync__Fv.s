.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel wait_now_loading_vsync__Fv
/* 054070 00153F70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 054074 00153F74 0000BF7F */  sq          $31, 0x0($29)
/* 054078 00153F78 E086838F */  lw          $3, -0x7920($28)
/* 05407C 00153F7C 07006014 */  bnez        $3, .L00153F9C
/* 054080 00153F80 00000000 */   nop
/* 054084 00153F84 D44F050C */  jal         clear_now_loading_vsync_end__Fv
/* 054088 00153F88 00000000 */   nop
.L00153F8C:
/* 05408C 00153F8C D84F050C */  jal         check_now_loading_vsync_end__Fv
/* 054090 00153F90 00000000 */   nop
/* 054094 00153F94 FDFF4010 */  beqz        $2, .L00153F8C
/* 054098 00153F98 00000000 */   nop
.L00153F9C:
/* 05409C 00153F9C 0000BF7B */  lq          $31, 0x0($29)
/* 0540A0 00153FA0 1000BD27 */  addiu       $29, $29, 0x10
/* 0540A4 00153FA4 0800E003 */  jr          $31
/* 0540A8 00153FA8 00000000 */   nop
/* 0540AC 00153FAC 00000000 */  nop
