.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandWATER_IMG__FPPv
/* 752F0 001751F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 752F4 001751F4 0000BF7F */  sq         $31, 0x0($sp)
/* 752F8 001751F8 0400828C */  lw         $2, 0x4($4)
/* 752FC 001751FC 0000868C */  lw         $6, 0x0($4)
/* 75300 00175200 15000424 */  addiu      $4, $0, 0x15
/* 75304 00175204 0000458C */  lw         $5, 0x0($2)
/* 75308 00175208 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7530C 0017520C 00000000 */   nop
/* 75310 00175210 0000BF7B */  lq         $31, 0x0($sp)
/* 75314 00175214 1000BD27 */  addiu      $sp, $sp, 0x10
/* 75318 00175218 0800E003 */  jr         $31
/* 7531C 0017521C 00000000 */   nop
