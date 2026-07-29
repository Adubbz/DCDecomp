.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel sceSifGetNextRequest
/* 017A00 00117900 0C00858C */  lw          $5, 0xC($4)
/* 017A04 00117904 0100033C */  lui         $3, (0x10000 >> 16)
.L00117908:
/* 017A08 00117908 39000042 */  di /* handwritten instruction */
/* 017A0C 0011790C 0F040000 */  sync.p
/* 017A10 00117910 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 017A14 00117914 24104300 */  and         $2, $2, $3
/* 017A18 00117918 00000000 */  nop
/* 017A1C 0011791C FAFF4014 */  bnez        $2, .L00117908
/* 017A20 00117920 00000000 */   nop
/* 017A24 00117924 0300A054 */  bnel        $5, $0, .L00117934
/* 017A28 00117928 3C00A38C */   lw         $3, 0x3C($5)
/* 017A2C 0011792C 04000010 */  b           .L00117940
/* 017A30 00117930 040080AC */   sw         $0, 0x4($4)
.L00117934:
/* 017A34 00117934 01000224 */  addiu       $2, $0, 0x1
/* 017A38 00117938 040082AC */  sw          $2, 0x4($4)
/* 017A3C 0011793C 0C0083AC */  sw          $3, 0xC($4)
.L00117940:
/* 017A40 00117940 38000042 */  ei /* handwritten instruction */
/* 017A44 00117944 0800E003 */  jr          $31
/* 017A48 00117948 2D10A000 */   daddu      $2, $5, $0
/* 017A4C 0011794C 00000000 */  nop
