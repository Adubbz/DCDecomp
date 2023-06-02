.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandFIRE_IMG__FPPv
/* 75320 00175220 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 75324 00175224 0000BF7F */  sq         $31, 0x0($sp)
/* 75328 00175228 0400828C */  lw         $2, 0x4($4)
/* 7532C 0017522C 0000868C */  lw         $6, 0x0($4)
/* 75330 00175230 18000424 */  addiu      $4, $0, 0x18
/* 75334 00175234 0000458C */  lw         $5, 0x0($2)
/* 75338 00175238 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7533C 0017523C 00000000 */   nop
/* 75340 00175240 0000BF7B */  lq         $31, 0x0($sp)
/* 75344 00175244 1000BD27 */  addiu      $sp, $sp, 0x10
/* 75348 00175248 0800E003 */  jr         $31
/* 7534C 0017524C 00000000 */   nop
