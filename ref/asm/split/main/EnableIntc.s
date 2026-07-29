.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel EnableIntc
/* 014F08 00114E08 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014F0C 00114E0C 1000BFFF */  sd          $31, 0x10($29)
/* 014F10 00114E10 0000B0FF */  sd          $16, 0x0($29)
/* 014F14 00114E14 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 014F18 00114E18 0100023C */  lui         $2, (0x10000 >> 16)
/* 014F1C 00114E1C 24800202 */  and         $16, $16, $2
/* 014F20 00114E20 08000012 */  beqz        $16, .L00114E44
/* 014F24 00114E24 0100033C */   lui        $3, (0x10000 >> 16)
.L00114E28:
/* 014F28 00114E28 39000042 */  di /* handwritten instruction */
/* 014F2C 00114E2C 0F040000 */  sync.p
/* 014F30 00114E30 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 014F34 00114E34 24104300 */  and         $2, $2, $3
/* 014F38 00114E38 00000000 */  nop
/* 014F3C 00114E3C FAFF4014 */  bnez        $2, .L00114E28
/* 014F40 00114E40 00000000 */   nop
.L00114E44:
/* 014F44 00114E44 1850040C */  jal         _EnableIntc
/* 014F48 00114E48 00000000 */   nop
/* 014F4C 00114E4C 0F000000 */  sync
/* 014F50 00114E50 03000012 */  beqz        $16, .L00114E60
/* 014F54 00114E54 1000BFDF */   ld         $31, 0x10($29)
/* 014F58 00114E58 38000042 */  ei /* handwritten instruction */
/* 014F5C 00114E5C 1000BFDF */  ld          $31, 0x10($29)
.L00114E60:
/* 014F60 00114E60 0000B0DF */  ld          $16, 0x0($29)
/* 014F64 00114E64 0800E003 */  jr          $31
/* 014F68 00114E68 2000BD27 */   addiu      $29, $29, 0x20
/* 014F6C 00114E6C 00000000 */  nop
