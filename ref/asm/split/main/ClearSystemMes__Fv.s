.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClearSystemMes__Fv
/* 0601D0 001600D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0601D4 001600D4 0000BF7F */  sq          $31, 0x0($29)
/* 0601D8 001600D8 D001023C */  lui         $2, %hi(SystemMessage)
/* 0601DC 001600DC 30B64424 */  addiu       $4, $2, %lo(SystemMessage)
/* 0601E0 001600E0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0601E4 001600E4 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0601E8 001600E8 00000000 */   nop
/* 0601EC 001600EC FFFF0324 */  addiu       $3, $0, -0x1
/* 0601F0 001600F0 008783AF */  sw          $3, -0x7900($28)
/* 0601F4 001600F4 6C8E80AF */  sw          $0, -0x7194($28)
/* 0601F8 001600F8 748E80AF */  sw          $0, -0x718C($28)
/* 0601FC 001600FC 708E80AF */  sw          $0, -0x7190($28)
/* 060200 00160100 0000BF7B */  lq          $31, 0x0($29)
/* 060204 00160104 1000BD27 */  addiu       $29, $29, 0x10
/* 060208 00160108 0800E003 */  jr          $31
/* 06020C 0016010C 00000000 */   nop
