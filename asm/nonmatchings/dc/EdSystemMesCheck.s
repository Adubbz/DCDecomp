.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSystemMesCheck__Fv
/* 73740 00173640 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73744 00173644 0000BF7F */  sq         $31, 0x0($sp)
/* 73748 00173648 4480050C */  jal        SystemMesCheck__Fv
/* 7374C 0017364C 00000000 */   nop
/* 73750 00173650 0000BF7B */  lq         $31, 0x0($sp)
/* 73754 00173654 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73758 00173658 0800E003 */  jr         $31
/* 7375C 0017365C 00000000 */   nop
