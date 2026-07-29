.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PlayAmbient__Ff
/* 077820 00177720 F0FFBD27 */  addiu       $29, $29, -0x10
/* 077824 00177724 0000BF7F */  sq          $31, 0x0($29)
/* 077828 00177728 6090838F */  lw          $3, -0x6FA0($28)
/* 07782C 0017772C 4400638C */  lw          $3, 0x44($3)
/* 077830 00177730 03006014 */  bnez        $3, .L00177740
/* 077834 00177734 00000000 */   nop
/* 077838 00177738 74C5050C */  jal         EdAmbientPlay__Ff
/* 07783C 0017773C 00000000 */   nop
.L00177740:
/* 077840 00177740 0000BF7B */  lq          $31, 0x0($29)
/* 077844 00177744 1000BD27 */  addiu       $29, $29, 0x10
/* 077848 00177748 0800E003 */  jr          $31
/* 07784C 0017774C 00000000 */   nop
