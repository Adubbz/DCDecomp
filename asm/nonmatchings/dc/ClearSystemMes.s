.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearSystemMes__Fv
/* 601D0 001600D0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 601D4 001600D4 0000BF7F */  sq         $31, 0x0($sp)
/* 601D8 001600D8 D001023C */  lui        $2, %hi(SystemMessage)
/* 601DC 001600DC 30B64424 */  addiu      $4, $2, %lo(SystemMessage)
/* 601E0 001600E0 FFFF0524 */  addiu      $5, $0, -0x1
/* 601E4 001600E4 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 601E8 001600E8 00000000 */   nop
/* 601EC 001600EC FFFF0324 */  addiu      $3, $0, -0x1
/* 601F0 001600F0 008783AF */  sw         $3, -0x7900($gp)
/* 601F4 001600F4 6C8E80AF */  sw         $0, -0x7194($gp)
/* 601F8 001600F8 748E80AF */  sw         $0, -0x718C($gp)
/* 601FC 001600FC 708E80AF */  sw         $0, -0x7190($gp)
/* 60200 00160100 0000BF7B */  lq         $31, 0x0($sp)
/* 60204 00160104 1000BD27 */  addiu      $sp, $sp, 0x10
/* 60208 00160108 0800E003 */  jr         $31
/* 6020C 0016010C 00000000 */   nop
