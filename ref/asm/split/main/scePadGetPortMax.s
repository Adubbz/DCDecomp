.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadGetPortMax
/* 0206B0 001205B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0206B4 001205B4 2B00023C */  lui         $2, %hi(buffer)
/* 0206B8 001205B8 1000B0FF */  sd          $16, 0x10($29)
/* 0206BC 001205BC 0C000324 */  addiu       $3, $0, 0xC
/* 0206C0 001205C0 009E5024 */  addiu       $16, $2, %lo(buffer)
/* 0206C4 001205C4 2B00043C */  lui         $4, %hi(padsif)
/* 0206C8 001205C8 2000BFFF */  sd          $31, 0x20($29)
/* 0206CC 001205CC 409C8424 */  addiu       $4, $4, %lo(padsif)
/* 0206D0 001205D0 009E43AC */  sw          $3, %lo(buffer)($2)
/* 0206D4 001205D4 01000524 */  addiu       $5, $0, 0x1
/* 0206D8 001205D8 0000A0AF */  sw          $0, 0x0($29)
/* 0206DC 001205DC 2D300000 */  daddu       $6, $0, $0
/* 0206E0 001205E0 2D380002 */  daddu       $7, $16, $0
/* 0206E4 001205E4 80000824 */  addiu       $8, $0, 0x80
/* 0206E8 001205E8 2D480002 */  daddu       $9, $16, $0
/* 0206EC 001205EC 80000A24 */  addiu       $10, $0, 0x80
/* 0206F0 001205F0 2A5D040C */  jal         sceSifCallRpc
/* 0206F4 001205F4 2D580000 */   daddu      $11, $0, $0
/* 0206F8 001205F8 02004304 */  bgezl       $2, .L00120604
/* 0206FC 001205FC 0C00028E */   lw         $2, 0xC($16)
/* 020700 00120600 2D100000 */  daddu       $2, $0, $0
.L00120604:
/* 020704 00120604 2000BFDF */  ld          $31, 0x20($29)
/* 020708 00120608 1000B0DF */  ld          $16, 0x10($29)
/* 02070C 0012060C 0800E003 */  jr          $31
/* 020710 00120610 3000BD27 */   addiu      $29, $29, 0x30
/* 020714 00120614 00000000 */  nop
