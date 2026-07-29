.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadGetModVersion
/* 020780 00120680 D0FFBD27 */  addiu       $29, $29, -0x30
/* 020784 00120684 2B00023C */  lui         $2, %hi(buffer)
/* 020788 00120688 1000B0FF */  sd          $16, 0x10($29)
/* 02078C 0012068C 12000324 */  addiu       $3, $0, 0x12
/* 020790 00120690 009E5024 */  addiu       $16, $2, %lo(buffer)
/* 020794 00120694 2B00043C */  lui         $4, %hi(padsif)
/* 020798 00120698 2000BFFF */  sd          $31, 0x20($29)
/* 02079C 0012069C 409C8424 */  addiu       $4, $4, %lo(padsif)
/* 0207A0 001206A0 009E43AC */  sw          $3, %lo(buffer)($2)
/* 0207A4 001206A4 01000524 */  addiu       $5, $0, 0x1
/* 0207A8 001206A8 0000A0AF */  sw          $0, 0x0($29)
/* 0207AC 001206AC 2D300000 */  daddu       $6, $0, $0
/* 0207B0 001206B0 2D380002 */  daddu       $7, $16, $0
/* 0207B4 001206B4 80000824 */  addiu       $8, $0, 0x80
/* 0207B8 001206B8 2D480002 */  daddu       $9, $16, $0
/* 0207BC 001206BC 80000A24 */  addiu       $10, $0, 0x80
/* 0207C0 001206C0 2A5D040C */  jal         sceSifCallRpc
/* 0207C4 001206C4 2D580000 */   daddu      $11, $0, $0
/* 0207C8 001206C8 02004304 */  bgezl       $2, .L001206D4
/* 0207CC 001206CC 0C00028E */   lw         $2, 0xC($16)
/* 0207D0 001206D0 2D100000 */  daddu       $2, $0, $0
.L001206D4:
/* 0207D4 001206D4 2000BFDF */  ld          $31, 0x20($29)
/* 0207D8 001206D8 1000B0DF */  ld          $16, 0x10($29)
/* 0207DC 001206DC 0800E003 */  jr          $31
/* 0207E0 001206E0 3000BD27 */   addiu      $29, $29, 0x30
/* 0207E4 001206E4 00000000 */  nop
