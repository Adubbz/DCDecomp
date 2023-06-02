.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel scePadGetPortMax
/* 206B0 001205B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 206B4 001205B4 2B00023C */  lui        $2, %hi(D_002A9E00)
/* 206B8 001205B8 1000B0FF */  sd         $16, 0x10($sp)
/* 206BC 001205BC 0C000324 */  addiu      $3, $0, 0xC
/* 206C0 001205C0 009E5024 */  addiu      $16, $2, %lo(D_002A9E00)
/* 206C4 001205C4 2B00043C */  lui        $4, %hi(D_002A9C40)
/* 206C8 001205C8 2000BFFF */  sd         $31, 0x20($sp)
/* 206CC 001205CC 409C8424 */  addiu      $4, $4, %lo(D_002A9C40)
/* 206D0 001205D0 009E43AC */  sw         $3, -0x6200($2)
/* 206D4 001205D4 01000524 */  addiu      $5, $0, 0x1
/* 206D8 001205D8 0000A0AF */  sw         $0, 0x0($sp)
/* 206DC 001205DC 2D300000 */  daddu      $6, $0, $0
/* 206E0 001205E0 2D380002 */  daddu      $7, $16, $0
/* 206E4 001205E4 80000824 */  addiu      $8, $0, 0x80
/* 206E8 001205E8 2D480002 */  daddu      $9, $16, $0
/* 206EC 001205EC 80000A24 */  addiu      $10, $0, 0x80
/* 206F0 001205F0 2A5D040C */  jal        sceSifCallRpc
/* 206F4 001205F4 2D580000 */   daddu     $11, $0, $0
/* 206F8 001205F8 02004304 */  bgezl      $2, .L00120604
/* 206FC 001205FC 0C00028E */   lw        $2, 0xC($16)
/* 20700 00120600 2D100000 */  daddu      $2, $0, $0
.L00120604:
/* 20704 00120604 2000BFDF */  ld         $31, 0x20($sp)
/* 20708 00120608 1000B0DF */  ld         $16, 0x10($sp)
/* 2070C 0012060C 0800E003 */  jr         $31
/* 20710 00120610 3000BD27 */   addiu     $sp, $sp, 0x30
/* 20714 00120614 00000000 */  nop
