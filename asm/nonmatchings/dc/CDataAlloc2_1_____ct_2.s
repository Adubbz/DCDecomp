.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__14CDataAlloc2_1_Fv
/* 43920 00143820 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 43924 00143824 0000BF7F */  sq         $31, 0x0($sp)
/* 43928 00143828 FFFF0524 */  addiu      $5, $0, -0x1
/* 4392C 0014382C D09E040C */  jal        __ct__14CDataAlloc2_1_Fi
/* 43930 00143830 00000000 */   nop
/* 43934 00143834 0000BF7B */  lq         $31, 0x0($sp)
/* 43938 00143838 1000BD27 */  addiu      $sp, $sp, 0x10
/* 4393C 0014383C 0800E003 */  jr         $31
/* 43940 00143840 00000000 */   nop
/* 43944 00143844 00000000 */  nop
/* 43948 00143848 00000000 */  nop
/* 4394C 0014384C 00000000 */  nop
