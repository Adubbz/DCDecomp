.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableDmac
/* 014FD8 00114ED8 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014FDC 00114EDC 1000BFFF */  sd          $31, 0x10($29)
/* 014FE0 00114EE0 0000B0FF */  sd          $16, 0x0($29)
/* 014FE4 00114EE4 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 014FE8 00114EE8 0100023C */  lui         $2, (0x10000 >> 16)
/* 014FEC 00114EEC 24800202 */  and         $16, $16, $2
/* 014FF0 00114EF0 08000012 */  beqz        $16, .L00114F14
/* 014FF4 00114EF4 0100033C */   lui        $3, (0x10000 >> 16)
.L00114EF8:
/* 014FF8 00114EF8 39000042 */  di /* handwritten instruction */
/* 014FFC 00114EFC 0F040000 */  sync.p
/* 015000 00114F00 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 015004 00114F04 24104300 */  and         $2, $2, $3
/* 015008 00114F08 00000000 */  nop
/* 01500C 00114F0C FAFF4014 */  bnez        $2, .L00114EF8
/* 015010 00114F10 00000000 */   nop
.L00114F14:
/* 015014 00114F14 2050040C */  jal         _EnableDmac
/* 015018 00114F18 00000000 */   nop
/* 01501C 00114F1C 0F000000 */  sync
/* 015020 00114F20 03000012 */  beqz        $16, .L00114F30
/* 015024 00114F24 1000BFDF */   ld         $31, 0x10($29)
/* 015028 00114F28 38000042 */  ei /* handwritten instruction */
/* 01502C 00114F2C 1000BFDF */  ld          $31, 0x10($29)
.L00114F30:
/* 015030 00114F30 0000B0DF */  ld          $16, 0x0($29)
/* 015034 00114F34 0800E003 */  jr          $31
/* 015038 00114F38 2000BD27 */   addiu      $29, $29, 0x20
/* 01503C 00114F3C 00000000 */  nop
