.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ExReqSend
/* 0155E0 001154E0 002E0500 */  sll         $5, $5, 24
/* 0155E4 001154E4 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0155E8 001154E8 032E0500 */  sra         $5, $5, 24
/* 0155EC 001154EC 0000A4AF */  sw          $4, 0x0($29)
/* 0155F0 001154F0 0400A5AF */  sw          $5, 0x4($29)
/* 0155F4 001154F4 F9FF0424 */  addiu       $4, $0, -0x7
/* 0155F8 001154F8 1000BFFF */  sd          $31, 0x10($29)
/* 0155FC 001154FC D451040C */  jal         Deci2Call
/* 015600 00115500 2D28A003 */   daddu      $5, $29, $0
/* 015604 00115504 1000BFDF */  ld          $31, 0x10($29)
/* 015608 00115508 0800E003 */  jr          $31
/* 01560C 0011550C 2000BD27 */   addiu      $29, $29, 0x20
