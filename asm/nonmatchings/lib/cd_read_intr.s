.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cd_read_intr
/* 9998 00109898 0020023C */  lui        $2, (0x20000004 >> 16)
/* 999C 0010989C 25308200 */  or         $6, $4, $2
/* 99A0 001098A0 0000C28C */  lw         $2, (0x20000000 & 0xFFFF)($6)
/* 99A4 001098A4 12004018 */  blez       $2, .L001098F0
/* 99A8 001098A8 2500093C */   lui       $9, %hi(sceCdCbfunc_num)
/* 99AC 001098AC 0800C88C */  lw         $8, (0x20000008 & 0xFFFF)($6)
/* 99B0 001098B0 0F004018 */  blez       $2, .L001098F0
/* 99B4 001098B4 2D280000 */   daddu     $5, $0, $0
/* 99B8 001098B8 1000C724 */  addiu      $7, $6, %lo(D_20000010)
/* 99BC 001098BC 2500093C */  lui        $9, %hi(sceCdCbfunc_num)
/* 99C0 001098C0 2110E500 */  addu       $2, $7, $5
/* 99C4 001098C4 00000000 */  nop
.L001098C8:
/* 99C8 001098C8 21200501 */  addu       $4, $8, $5
/* 99CC 001098CC 00004390 */  lbu        $3, 0x0($2)
/* 99D0 001098D0 0100A524 */  addiu      $5, $5, 0x1
/* 99D4 001098D4 000083A0 */  sb         $3, 0x0($4)
/* 99D8 001098D8 0000C28C */  lw         $2, (0x20000000 & 0xFFFF)($6)
/* 99DC 001098DC 2A10A200 */  slt        $2, $5, $2
/* 99E0 001098E0 F9FF4014 */  bnez       $2, .L001098C8
/* 99E4 001098E4 2110E500 */   addu      $2, $7, $5
/* 99E8 001098E8 02000010 */  b          .L001098F4
/* 99EC 001098EC 0400C28C */   lw        $2, (0x20000004 & 0xFFFF)($6)
.L001098F0:
/* 99F0 001098F0 0400C28C */  lw         $2, (0x20000004 & 0xFFFF)($6)
.L001098F4:
/* 99F4 001098F4 0E004018 */  blez       $2, .L00109930
/* 99F8 001098F8 00000000 */   nop
/* 99FC 001098FC 0C00C88C */  lw         $8, (0x2000000C & 0xFFFF)($6)
/* 9A00 00109900 0B004018 */  blez       $2, .L00109930
/* 9A04 00109904 2D280000 */   daddu     $5, $0, $0
/* 9A08 00109908 5000C724 */  addiu      $7, $6, %lo(D_20000050)
/* 9A0C 0010990C 2110E500 */  addu       $2, $7, $5
.L00109910:
/* 9A10 00109910 21200501 */  addu       $4, $8, $5
/* 9A14 00109914 00004390 */  lbu        $3, 0x0($2)
/* 9A18 00109918 0100A524 */  addiu      $5, $5, 0x1
/* 9A1C 0010991C 000083A0 */  sb         $3, 0x0($4)
/* 9A20 00109920 0400C28C */  lw         $2, (0x20000004 & 0xFFFF)($6)
/* 9A24 00109924 2A10A200 */  slt        $2, $5, $2
/* 9A28 00109928 F9FF4014 */  bnez       $2, .L00109910
/* 9A2C 0010992C 2110E500 */   addu      $2, $7, $5
.L00109930:
/* 9A30 00109930 92250408 */  j          cd_callback
/* 9A34 00109934 C0022425 */   addiu     $4, $9, %lo(sceCdCbfunc_num)
