.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetDistance__7CObjectFR7CObject
/* 056CB0 00156BB0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 056CB4 00156BB4 1000BF7F */  sq          $31, 0x10($29)
/* 056CB8 00156BB8 0000B07F */  sq          $16, 0x0($29)
/* 056CBC 00156BBC 28868070 */  paddub      $16, $4, $0
/* 056CC0 00156BC0 3000A427 */  addiu       $4, $29, 0x30
/* 056CC4 00156BC4 1000A524 */  addiu       $5, $5, 0x10
/* 056CC8 00156BC8 0C86040C */  jal         sceVu0CopyVector
/* 056CCC 00156BCC 00000000 */   nop
/* 056CD0 00156BD0 2000A427 */  addiu       $4, $29, 0x20
/* 056CD4 00156BD4 10000526 */  addiu       $5, $16, 0x10
/* 056CD8 00156BD8 0C86040C */  jal         sceVu0CopyVector
/* 056CDC 00156BDC 00000000 */   nop
/* 056CE0 00156BE0 2000A427 */  addiu       $4, $29, 0x20
/* 056CE4 00156BE4 3000A527 */  addiu       $5, $29, 0x30
/* 056CE8 00156BE8 648D040C */  jal         DistVector__FPfPf
/* 056CEC 00156BEC 00000000 */   nop
/* 056CF0 00156BF0 1000BF7B */  lq          $31, 0x10($29)
/* 056CF4 00156BF4 0000B07B */  lq          $16, 0x0($29)
/* 056CF8 00156BF8 4000BD27 */  addiu       $29, $29, 0x40
/* 056CFC 00156BFC 0800E003 */  jr          $31
/* 056D00 00156C00 00000000 */   nop
/* 056D04 00156C04 00000000 */  nop
/* 056D08 00156C08 00000000 */  nop
/* 056D0C 00156C0C 00000000 */  nop
