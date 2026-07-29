.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadPortClose
/* 01FA78 0011F978 2D388000 */  daddu       $7, $4, $0
/* 01FA7C 0011F97C 70000324 */  addiu       $3, $0, 0x70
/* 01FA80 0011F980 1C000424 */  addiu       $4, $0, 0x1C
/* 01FA84 0011F984 1818E370 */  mult1       $3, $7, $3
/* 01FA88 0011F988 1820A400 */  mult        $4, $5, $4
/* 01FA8C 0011F98C 2B00023C */  lui         $2, %hi(PadInfo)
/* 01FA90 0011F990 C0FFBD27 */  addiu       $29, $29, -0x40
/* 01FA94 0011F994 909C4224 */  addiu       $2, $2, %lo(PadInfo)
/* 01FA98 0011F998 2000B1FF */  sd          $17, 0x20($29)
/* 01FA9C 0011F99C 10004224 */  addiu       $2, $2, 0x10
/* 01FAA0 0011F9A0 3000BFFF */  sd          $31, 0x30($29)
/* 01FAA4 0011F9A4 21208300 */  addu        $4, $4, $3
/* 01FAA8 0011F9A8 1000B0FF */  sd          $16, 0x10($29)
/* 01FAAC 0011F9AC 21888200 */  addu        $17, $4, $2
/* 01FAB0 0011F9B0 0000238E */  lw          $3, 0x0($17)
/* 01FAB4 0011F9B4 19006010 */  beqz        $3, .L0011FA1C
/* 01FAB8 0011F9B8 2D100000 */   daddu      $2, $0, $0
/* 01FABC 0011F9BC 2B00023C */  lui         $2, %hi(buffer)
/* 01FAC0 0011F9C0 0E000324 */  addiu       $3, $0, 0xE
/* 01FAC4 0011F9C4 009E5024 */  addiu       $16, $2, %lo(buffer)
/* 01FAC8 0011F9C8 009E43AC */  sw          $3, %lo(buffer)($2)
/* 01FACC 0011F9CC 01000624 */  addiu       $6, $0, 0x1
/* 01FAD0 0011F9D0 040007AE */  sw          $7, 0x4($16)
/* 01FAD4 0011F9D4 080005AE */  sw          $5, 0x8($16)
/* 01FAD8 0011F9D8 2B00043C */  lui         $4, %hi(padsif)
/* 01FADC 0011F9DC 100006AE */  sw          $6, 0x10($16)
/* 01FAE0 0011F9E0 409C8424 */  addiu       $4, $4, %lo(padsif)
/* 01FAE4 0011F9E4 01000524 */  addiu       $5, $0, 0x1
/* 01FAE8 0011F9E8 2D300000 */  daddu       $6, $0, $0
/* 01FAEC 0011F9EC 0000A0AF */  sw          $0, 0x0($29)
/* 01FAF0 0011F9F0 2D380002 */  daddu       $7, $16, $0
/* 01FAF4 0011F9F4 80000824 */  addiu       $8, $0, 0x80
/* 01FAF8 0011F9F8 2D480002 */  daddu       $9, $16, $0
/* 01FAFC 0011F9FC 80000A24 */  addiu       $10, $0, 0x80
/* 01FB00 0011FA00 2A5D040C */  jal         sceSifCallRpc
/* 01FB04 0011FA04 2D580000 */   daddu      $11, $0, $0
/* 01FB08 0011FA08 03004304 */  bgezl       $2, .L0011FA18
/* 01FB0C 0011FA0C 000020AE */   sw         $0, 0x0($17)
/* 01FB10 0011FA10 02000010 */  b           .L0011FA1C
/* 01FB14 0011FA14 2D100000 */   daddu      $2, $0, $0
.L0011FA18:
/* 01FB18 0011FA18 0C00028E */  lw          $2, 0xC($16)
.L0011FA1C:
/* 01FB1C 0011FA1C 3000BFDF */  ld          $31, 0x30($29)
/* 01FB20 0011FA20 2000B1DF */  ld          $17, 0x20($29)
/* 01FB24 0011FA24 1000B0DF */  ld          $16, 0x10($29)
/* 01FB28 0011FA28 0800E003 */  jr          $31
/* 01FB2C 0011FA2C 4000BD27 */   addiu      $29, $29, 0x40
