.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandGRD_IMG__FPPv
/* 75200 00175100 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 75204 00175104 0000BF7F */  sq         $31, 0x0($sp)
/* 75208 00175108 0400828C */  lw         $2, 0x4($4)
/* 7520C 0017510C 0000868C */  lw         $6, 0x0($4)
/* 75210 00175110 01000424 */  addiu      $4, $0, 0x1
/* 75214 00175114 0000458C */  lw         $5, 0x0($2)
/* 75218 00175118 18D4050C */  jal        CommandIMGSub__FiiPc
/* 7521C 0017511C 00000000 */   nop
/* 75220 00175120 0000BF7B */  lq         $31, 0x0($sp)
/* 75224 00175124 1000BD27 */  addiu      $sp, $sp, 0x10
/* 75228 00175128 0800E003 */  jr         $31
/* 7522C 0017512C 00000000 */   nop
