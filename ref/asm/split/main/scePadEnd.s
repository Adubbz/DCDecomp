.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadEnd
/* 01F810 0011F710 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01F814 0011F714 2B00023C */  lui         $2, %hi(buffer)
/* 01F818 0011F718 1000B0FF */  sd          $16, 0x10($29)
/* 01F81C 0011F71C 0F000324 */  addiu       $3, $0, 0xF
/* 01F820 0011F720 009E5024 */  addiu       $16, $2, %lo(buffer)
/* 01F824 0011F724 2B00043C */  lui         $4, %hi(padsif)
/* 01F828 0011F728 2000BFFF */  sd          $31, 0x20($29)
/* 01F82C 0011F72C 409C8424 */  addiu       $4, $4, %lo(padsif)
/* 01F830 0011F730 009E43AC */  sw          $3, %lo(buffer)($2)
/* 01F834 0011F734 01000524 */  addiu       $5, $0, 0x1
/* 01F838 0011F738 0000A0AF */  sw          $0, 0x0($29)
/* 01F83C 0011F73C 2D300000 */  daddu       $6, $0, $0
/* 01F840 0011F740 2D380002 */  daddu       $7, $16, $0
/* 01F844 0011F744 80000824 */  addiu       $8, $0, 0x80
/* 01F848 0011F748 2D480002 */  daddu       $9, $16, $0
/* 01F84C 0011F74C 80000A24 */  addiu       $10, $0, 0x80
/* 01F850 0011F750 2A5D040C */  jal         sceSifCallRpc
/* 01F854 0011F754 2D580000 */   daddu      $11, $0, $0
/* 01F858 0011F758 03004304 */  bgezl       $2, .L0011F768
/* 01F85C 0011F75C 0C00078E */   lw         $7, 0xC($16)
/* 01F860 0011F760 07000010 */  b           .L0011F780
/* 01F864 0011F764 2D100000 */   daddu      $2, $0, $0
.L0011F768:
/* 01F868 0011F768 01000224 */  addiu       $2, $0, 0x1
/* 01F86C 0011F76C 0400E214 */  bne         $7, $2, .L0011F780
/* 01F870 0011F770 2D10E000 */   daddu      $2, $7, $0
/* 01F874 0011F774 2500023C */  lui         $2, %hi(isInit)
/* 01F878 0011F778 500A40AC */  sw          $0, %lo(isInit)($2)
/* 01F87C 0011F77C 2D10E000 */  daddu       $2, $7, $0
.L0011F780:
/* 01F880 0011F780 2000BFDF */  ld          $31, 0x20($29)
/* 01F884 0011F784 1000B0DF */  ld          $16, 0x10($29)
/* 01F888 0011F788 0800E003 */  jr          $31
/* 01F88C 0011F78C 3000BD27 */   addiu      $29, $29, 0x30
