.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadPortClose
/* 1FA78 0011F978 2D388000 */  daddu      $7, $4, $0
/* 1FA7C 0011F97C 70000324 */  addiu      $3, $0, 0x70
/* 1FA80 0011F980 1C000424 */  addiu      $4, $0, 0x1C
/* 1FA84 0011F984 1818E370 */  mult1      $3, $7, $3
/* 1FA88 0011F988 1820A400 */  mult       $4, $5, $4
/* 1FA8C 0011F98C 2B00023C */  lui        $2, %hi(D_002A9C90)
/* 1FA90 0011F990 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1FA94 0011F994 909C4224 */  addiu      $2, $2, %lo(D_002A9C90)
/* 1FA98 0011F998 2000B1FF */  sd         $17, 0x20($sp)
/* 1FA9C 0011F99C 10004224 */  addiu      $2, $2, 0x10
/* 1FAA0 0011F9A0 3000BFFF */  sd         $31, 0x30($sp)
/* 1FAA4 0011F9A4 21208300 */  addu       $4, $4, $3
/* 1FAA8 0011F9A8 1000B0FF */  sd         $16, 0x10($sp)
/* 1FAAC 0011F9AC 21888200 */  addu       $17, $4, $2
/* 1FAB0 0011F9B0 0000238E */  lw         $3, 0x0($17)
/* 1FAB4 0011F9B4 19006010 */  beqz       $3, .L0011FA1C
/* 1FAB8 0011F9B8 2D100000 */   daddu     $2, $0, $0
/* 1FABC 0011F9BC 2B00023C */  lui        $2, %hi(D_002A9E00)
/* 1FAC0 0011F9C0 0E000324 */  addiu      $3, $0, 0xE
/* 1FAC4 0011F9C4 009E5024 */  addiu      $16, $2, %lo(D_002A9E00)
/* 1FAC8 0011F9C8 009E43AC */  sw         $3, -0x6200($2)
/* 1FACC 0011F9CC 01000624 */  addiu      $6, $0, 0x1
/* 1FAD0 0011F9D0 040007AE */  sw         $7, 0x4($16)
/* 1FAD4 0011F9D4 080005AE */  sw         $5, 0x8($16)
/* 1FAD8 0011F9D8 2B00043C */  lui        $4, %hi(D_002A9C40)
/* 1FADC 0011F9DC 100006AE */  sw         $6, 0x10($16)
/* 1FAE0 0011F9E0 409C8424 */  addiu      $4, $4, %lo(D_002A9C40)
/* 1FAE4 0011F9E4 01000524 */  addiu      $5, $0, 0x1
/* 1FAE8 0011F9E8 2D300000 */  daddu      $6, $0, $0
/* 1FAEC 0011F9EC 0000A0AF */  sw         $0, 0x0($sp)
/* 1FAF0 0011F9F0 2D380002 */  daddu      $7, $16, $0
/* 1FAF4 0011F9F4 80000824 */  addiu      $8, $0, 0x80
/* 1FAF8 0011F9F8 2D480002 */  daddu      $9, $16, $0
/* 1FAFC 0011F9FC 80000A24 */  addiu      $10, $0, 0x80
/* 1FB00 0011FA00 2A5D040C */  jal        sceSifCallRpc
/* 1FB04 0011FA04 2D580000 */   daddu     $11, $0, $0
/* 1FB08 0011FA08 03004304 */  bgezl      $2, .L0011FA18
/* 1FB0C 0011FA0C 000020AE */   sw        $0, 0x0($17)
/* 1FB10 0011FA10 02000010 */  b          .L0011FA1C
/* 1FB14 0011FA14 2D100000 */   daddu     $2, $0, $0
.L0011FA18:
/* 1FB18 0011FA18 0C00028E */  lw         $2, 0xC($16)
.L0011FA1C:
/* 1FB1C 0011FA1C 3000BFDF */  ld         $31, 0x30($sp)
/* 1FB20 0011FA20 2000B1DF */  ld         $17, 0x20($sp)
/* 1FB24 0011FA24 1000B0DF */  ld         $16, 0x10($sp)
/* 1FB28 0011FA28 0800E003 */  jr         $31
/* 1FB2C 0011FA2C 4000BD27 */   addiu     $sp, $sp, 0x40
