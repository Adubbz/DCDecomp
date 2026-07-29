.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __negdf2
/* 0106E0 001105E0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0106E4 001105E4 2000A4FF */  sd          $4, 0x20($29)
/* 0106E8 001105E8 2D28A003 */  daddu       $5, $29, $0
/* 0106EC 001105EC 3000BFFF */  sd          $31, 0x30($29)
/* 0106F0 001105F0 B63E040C */  jal         __unpack_d
/* 0106F4 001105F4 2000A427 */   addiu      $4, $29, 0x20
/* 0106F8 001105F8 0400A28F */  lw          $2, 0x4($29)
/* 0106FC 001105FC 2D20A003 */  daddu       $4, $29, $0
/* 010700 00110600 0100422C */  sltiu       $2, $2, 0x1
/* 010704 00110604 6A3E040C */  jal         __pack_d
/* 010708 00110608 0400A2AF */   sw         $2, 0x4($29)
/* 01070C 0011060C 3000BFDF */  ld          $31, 0x30($29)
/* 010710 00110610 0800E003 */  jr          $31
/* 010714 00110614 4000BD27 */   addiu      $29, $29, 0x40
