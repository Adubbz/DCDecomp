.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBLD_IMG__FPPv
/* 75230 00175130 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 75234 00175134 0000BF7F */  sq         $31, 0x0($sp)
/* 75238 00175138 0400828C */  lw         $2, 0x4($4)
/* 7523C 0017513C 0000868C */  lw         $6, 0x0($4)
/* 75240 00175140 02000424 */  addiu      $4, $0, 0x2
/* 75244 00175144 0000458C */  lw         $5, 0x0($2)
/* 75248 00175148 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7524C 0017514C 00000000 */   nop
/* 75250 00175150 0000BF7B */  lq         $31, 0x0($sp)
/* 75254 00175154 1000BD27 */  addiu      $sp, $sp, 0x10
/* 75258 00175158 0800E003 */  jr         $31
/* 7525C 0017515C 00000000 */   nop
