.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandSUN_IMG__FPPv
/* 752C0 001751C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 752C4 001751C4 0000BF7F */  sq         $31, 0x0($sp)
/* 752C8 001751C8 0400828C */  lw         $2, 0x4($4)
/* 752CC 001751CC 0000868C */  lw         $6, 0x0($4)
/* 752D0 001751D0 07000424 */  addiu      $4, $0, 0x7
/* 752D4 001751D4 0000458C */  lw         $5, 0x0($2)
/* 752D8 001751D8 18D4050C */  jal        CommandIMGSub__FiiPc
/* 752DC 001751DC 00000000 */   nop
/* 752E0 001751E0 0000BF7B */  lq         $31, 0x0($sp)
/* 752E4 001751E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 752E8 001751E8 0800E003 */  jr         $31
/* 752EC 001751EC 00000000 */   nop
