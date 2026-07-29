.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2Close
/* 0154F0 001153F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0154F4 001153F4 0000A4AF */  sw          $4, 0x0($29)
/* 0154F8 001153F8 2D28A003 */  daddu       $5, $29, $0
/* 0154FC 001153FC 1000BFFF */  sd          $31, 0x10($29)
/* 015500 00115400 D451040C */  jal         Deci2Call
/* 015504 00115404 02000424 */   addiu      $4, $0, 0x2
/* 015508 00115408 1000BFDF */  ld          $31, 0x10($29)
/* 01550C 0011540C 0800E003 */  jr          $31
/* 015510 00115410 2000BD27 */   addiu      $29, $29, 0x20
/* 015514 00115414 00000000 */  nop
