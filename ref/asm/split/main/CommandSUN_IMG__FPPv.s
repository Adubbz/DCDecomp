.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandSUN_IMG__FPPv
/* 0752C0 001751C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0752C4 001751C4 0000BF7F */  sq          $31, 0x0($29)
/* 0752C8 001751C8 0400828C */  lw          $2, 0x4($4)
/* 0752CC 001751CC 0000868C */  lw          $6, 0x0($4)
/* 0752D0 001751D0 07000424 */  addiu       $4, $0, 0x7
/* 0752D4 001751D4 0000458C */  lw          $5, 0x0($2)
/* 0752D8 001751D8 18D4050C */  jal         CommandIMGSub__FiiPc
/* 0752DC 001751DC 00000000 */   nop
/* 0752E0 001751E0 0000BF7B */  lq          $31, 0x0($29)
/* 0752E4 001751E4 1000BD27 */  addiu       $29, $29, 0x10
/* 0752E8 001751E8 0800E003 */  jr          $31
/* 0752EC 001751EC 00000000 */   nop
