.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadInit2
/* 01F770 0011F670 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01F774 0011F674 2B00023C */  lui         $2, %hi(PadInfo)
/* 01F778 0011F678 909C4224 */  addiu       $2, $2, %lo(PadInfo)
/* 01F77C 0011F67C 2000BFFF */  sd          $31, 0x20($29)
/* 01F780 0011F680 1000B0FF */  sd          $16, 0x10($29)
/* 01F784 0011F684 2B00043C */  lui         $4, %hi(buffer)
/* 01F788 0011F688 84004224 */  addiu       $2, $2, 0x84
/* 01F78C 0011F68C 03000324 */  addiu       $3, $0, 0x3
.L0011F690:
/* 01F790 0011F690 8CFF40AC */  sw          $0, -0x74($2)
/* 01F794 0011F694 FFFF6324 */  addiu       $3, $3, -0x1
/* 01F798 0011F698 94FF40AC */  sw          $0, -0x6C($2)
/* 01F79C 0011F69C 90FF40AC */  sw          $0, -0x70($2)
/* 01F7A0 0011F6A0 FCFF40AC */  sw          $0, -0x4($2)
/* 01F7A4 0011F6A4 040040AC */  sw          $0, 0x4($2)
/* 01F7A8 0011F6A8 000040AC */  sw          $0, 0x0($2)
/* 01F7AC 0011F6AC F8FF6104 */  bgez        $3, .L0011F690
/* 01F7B0 0011F6B0 1C004224 */   addiu      $2, $2, 0x1C
/* 01F7B4 0011F6B4 10000224 */  addiu       $2, $0, 0x10
/* 01F7B8 0011F6B8 009E9024 */  addiu       $16, $4, %lo(buffer)
/* 01F7BC 0011F6BC 009E82AC */  sw          $2, %lo(buffer)($4)
/* 01F7C0 0011F6C0 01000524 */  addiu       $5, $0, 0x1
/* 01F7C4 0011F6C4 2B00043C */  lui         $4, %hi(padsif)
/* 01F7C8 0011F6C8 100000AE */  sw          $0, 0x10($16)
/* 01F7CC 0011F6CC 409C8424 */  addiu       $4, $4, %lo(padsif)
/* 01F7D0 0011F6D0 0000A0AF */  sw          $0, 0x0($29)
/* 01F7D4 0011F6D4 2D300000 */  daddu       $6, $0, $0
/* 01F7D8 0011F6D8 2D380002 */  daddu       $7, $16, $0
/* 01F7DC 0011F6DC 80000824 */  addiu       $8, $0, 0x80
/* 01F7E0 0011F6E0 2D480002 */  daddu       $9, $16, $0
/* 01F7E4 0011F6E4 80000A24 */  addiu       $10, $0, 0x80
/* 01F7E8 0011F6E8 2A5D040C */  jal         sceSifCallRpc
/* 01F7EC 0011F6EC 2D580000 */   daddu      $11, $0, $0
/* 01F7F0 0011F6F0 02004304 */  bgezl       $2, .L0011F6FC
/* 01F7F4 0011F6F4 0C00028E */   lw         $2, 0xC($16)
/* 01F7F8 0011F6F8 2D100000 */  daddu       $2, $0, $0
.L0011F6FC:
/* 01F7FC 0011F6FC 2000BFDF */  ld          $31, 0x20($29)
/* 01F800 0011F700 1000B0DF */  ld          $16, 0x10($29)
/* 01F804 0011F704 0800E003 */  jr          $31
/* 01F808 0011F708 3000BD27 */   addiu      $29, $29, 0x30
/* 01F80C 0011F70C 00000000 */  nop
