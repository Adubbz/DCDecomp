.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __negsf2
/* 0112D8 001111D8 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0112DC 001111DC 2000BFFF */  sd          $31, 0x20($29)
/* 0112E0 001111E0 1000A427 */  addiu       $4, $29, 0x10
/* 0112E4 001111E4 1000ACE7 */  swc1        $f12, 0x10($29)
/* 0112E8 001111E8 EC41040C */  jal         __unpack_f
/* 0112EC 001111EC 2D28A003 */   daddu      $5, $29, $0
/* 0112F0 001111F0 0400A28F */  lw          $2, 0x4($29)
/* 0112F4 001111F4 2D20A003 */  daddu       $4, $29, $0
/* 0112F8 001111F8 0100422C */  sltiu       $2, $2, 0x1
/* 0112FC 001111FC A841040C */  jal         __pack_f
/* 011300 00111200 0400A2AF */   sw         $2, 0x4($29)
/* 011304 00111204 2000BFDF */  ld          $31, 0x20($29)
/* 011308 00111208 0800E003 */  jr          $31
/* 01130C 0011120C 3000BD27 */   addiu      $29, $29, 0x30
