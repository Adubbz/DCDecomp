.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __sfmoreglue
/* 001A80 00101980 C0FFBD27 */  addiu       $29, $29, -0x40
/* 001A84 00101984 58000224 */  addiu       $2, $0, 0x58
/* 001A88 00101988 1000B1FF */  sd          $17, 0x10($29)
/* 001A8C 0010198C 2000B2FF */  sd          $18, 0x20($29)
/* 001A90 00101990 2D88A000 */  daddu       $17, $5, $0
/* 001A94 00101994 18902202 */  mult        $18, $17, $2
/* 001A98 00101998 0000B0FF */  sd          $16, 0x0($29)
/* 001A9C 0010199C 3000BFFF */  sd          $31, 0x30($29)
/* 001AA0 001019A0 A00A040C */  jal         _malloc_r
/* 001AA4 001019A4 0C004526 */   addiu      $5, $18, 0xC
/* 001AA8 001019A8 2D804000 */  daddu       $16, $2, $0
/* 001AAC 001019AC 0A000012 */  beqz        $16, .L001019D8
/* 001AB0 001019B0 2D100000 */   daddu      $2, $0, $0
/* 001AB4 001019B4 0C000226 */  addiu       $2, $16, 0xC
/* 001AB8 001019B8 040011AE */  sw          $17, 0x4($16)
/* 001ABC 001019BC 000000AE */  sw          $0, 0x0($16)
/* 001AC0 001019C0 2D204000 */  daddu       $4, $2, $0
/* 001AC4 001019C4 2D304002 */  daddu       $6, $18, $0
/* 001AC8 001019C8 080002AE */  sw          $2, 0x8($16)
/* 001ACC 001019CC 5A0D040C */  jal         memset
/* 001AD0 001019D0 2D280000 */   daddu      $5, $0, $0
/* 001AD4 001019D4 2D100002 */  daddu       $2, $16, $0
.L001019D8:
/* 001AD8 001019D8 3000BFDF */  ld          $31, 0x30($29)
/* 001ADC 001019DC 2000B2DF */  ld          $18, 0x20($29)
/* 001AE0 001019E0 1000B1DF */  ld          $17, 0x10($29)
/* 001AE4 001019E4 0000B0DF */  ld          $16, 0x0($29)
/* 001AE8 001019E8 0800E003 */  jr          $31
/* 001AEC 001019EC 4000BD27 */   addiu      $29, $29, 0x40
