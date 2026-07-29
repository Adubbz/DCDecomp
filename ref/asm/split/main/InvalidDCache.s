.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel InvalidDCache
/* 014E10 00114D10 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014E14 00114D14 2D308000 */  daddu       $6, $4, $0
/* 014E18 00114D18 1000BFFF */  sd          $31, 0x10($29)
/* 014E1C 00114D1C 0000B0FF */  sd          $16, 0x0($29)
/* 014E20 00114D20 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 014E24 00114D24 0100023C */  lui         $2, (0x10000 >> 16)
/* 014E28 00114D28 24800202 */  and         $16, $16, $2
/* 014E2C 00114D2C 09000012 */  beqz        $16, .L00114D54
/* 014E30 00114D30 0100033C */   lui        $3, (0x10000 >> 16)
/* 014E34 00114D34 00000000 */  nop
.L00114D38:
/* 014E38 00114D38 39000042 */  di /* handwritten instruction */
/* 014E3C 00114D3C 0F040000 */  sync.p
/* 014E40 00114D40 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 014E44 00114D44 24104300 */  and         $2, $2, $3
/* 014E48 00114D48 00000000 */  nop
/* 014E4C 00114D4C FAFF4014 */  bnez        $2, .L00114D38
/* 014E50 00114D50 00000000 */   nop
.L00114D54:
/* 014E54 00114D54 FFFF043C */  lui         $4, (0xFFFFFFC0 >> 16)
/* 014E58 00114D58 C0FF8434 */  ori         $4, $4, (0xFFFFFFC0 & 0xFFFF)
/* 014E5C 00114D5C 2428A400 */  and         $5, $5, $4
/* 014E60 00114D60 1A53040C */  jal         _sceIDC
/* 014E64 00114D64 2420C400 */   and        $4, $6, $4
/* 014E68 00114D68 03000012 */  beqz        $16, .L00114D78
/* 014E6C 00114D6C 1000BFDF */   ld         $31, 0x10($29)
/* 014E70 00114D70 38000042 */  ei /* handwritten instruction */
/* 014E74 00114D74 1000BFDF */  ld          $31, 0x10($29)
.L00114D78:
/* 014E78 00114D78 0000B0DF */  ld          $16, 0x0($29)
/* 014E7C 00114D7C 0800E003 */  jr          $31
/* 014E80 00114D80 2000BD27 */   addiu      $29, $29, 0x20
/* 014E84 00114D84 00000000 */  nop
