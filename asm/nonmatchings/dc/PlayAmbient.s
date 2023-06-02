.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PlayAmbient__Ff
/* 77820 00177720 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77824 00177724 0000BF7F */  sq         $31, 0x0($sp)
/* 77828 00177728 6090838F */  lw         $3, -0x6FA0($gp)
/* 7782C 0017772C 4400638C */  lw         $3, 0x44($3)
/* 77830 00177730 03006014 */  bnez       $3, .L00177740
/* 77834 00177734 00000000 */   nop
/* 77838 00177738 74C5050C */  jal        EdAmbientPlay__Ff
/* 7783C 0017773C 00000000 */   nop
.L00177740:
/* 77840 00177740 0000BF7B */  lq         $31, 0x0($sp)
/* 77844 00177744 1000BD27 */  addiu      $sp, $sp, 0x10
/* 77848 00177748 0800E003 */  jr         $31
/* 7784C 0017774C 00000000 */   nop
