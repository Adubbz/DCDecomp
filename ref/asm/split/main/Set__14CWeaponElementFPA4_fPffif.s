.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Set__14CWeaponElementFPA4_fPffif
/* 0B7940 001B7840 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0B7944 001B7844 1000BF7F */  sq          $31, 0x10($29)
/* 0B7948 001B7848 0000B07F */  sq          $16, 0x0($29)
/* 0B794C 001B784C 28868070 */  paddub      $16, $4, $0
/* 0B7950 001B7850 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0B7954 001B7854 00008244 */  mtc1        $2, $f0
/* 0B7958 001B7858 00000000 */  nop
/* 0B795C 001B785C 40000C46 */  add.s       $f1, $f0, $f12
/* 0B7960 001B7860 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 0B7964 001B7864 02000146 */  mul.s       $f0, $f0, $f1
/* 0B7968 001B7868 A80580E4 */  swc1        $f0, 0x5A8($4)
/* 0B796C 001B786C A40587A4 */  sh          $7, 0x5A4($4)
/* 0B7970 001B7870 A0058DE4 */  swc1        $f13, 0x5A0($4)
/* 0B7974 001B7874 000085AC */  sw          $5, 0x0($4)
/* 0B7978 001B7878 04000224 */  addiu       $2, $0, 0x4
/* 0B797C 001B787C 2300E210 */  beq         $7, $2, .L001B790C
/* 0B7980 001B7880 00000000 */   nop
/* 0B7984 001B7884 02000224 */  addiu       $2, $0, 0x2
/* 0B7988 001B7888 1B00E210 */  beq         $7, $2, .L001B78F8
/* 0B798C 001B788C 00000000 */   nop
/* 0B7990 001B7890 1400E010 */  beqz        $7, .L001B78E4
/* 0B7994 001B7894 00000000 */   nop
/* 0B7998 001B7898 03000224 */  addiu       $2, $0, 0x3
/* 0B799C 001B789C 0C00E210 */  beq         $7, $2, .L001B78D0
/* 0B79A0 001B78A0 00000000 */   nop
/* 0B79A4 001B78A4 01000224 */  addiu       $2, $0, 0x1
/* 0B79A8 001B78A8 0300E210 */  beq         $7, $2, .L001B78B8
/* 0B79AC 001B78AC 00000000 */   nop
/* 0B79B0 001B78B0 01000010 */  b           .L001B78B8
/* 0B79B4 001B78B4 00000000 */   nop
.L001B78B8:
/* 0B79B8 001B78B8 28260072 */  paddub      $4, $16, $0
/* 0B79BC 001B78BC 282EC070 */  paddub      $5, $6, $0
/* 0B79C0 001B78C0 20E1060C */  jal         Init_Cold__14CWeaponElementFPf
/* 0B79C4 001B78C4 00000000 */   nop
/* 0B79C8 001B78C8 13000010 */  b           .L001B7918
/* 0B79CC 001B78CC 00000000 */   nop
.L001B78D0:
/* 0B79D0 001B78D0 282EC070 */  paddub      $5, $6, $0
/* 0B79D4 001B78D4 A4E3060C */  jal         Init_Wind__14CWeaponElementFPf
/* 0B79D8 001B78D8 00000000 */   nop
/* 0B79DC 001B78DC 0E000010 */  b           .L001B7918
/* 0B79E0 001B78E0 00000000 */   nop
.L001B78E4:
/* 0B79E4 001B78E4 282EC070 */  paddub      $5, $6, $0
/* 0B79E8 001B78E8 B0E6060C */  jal         Init_Fire__14CWeaponElementFPf
/* 0B79EC 001B78EC 00000000 */   nop
/* 0B79F0 001B78F0 09000010 */  b           .L001B7918
/* 0B79F4 001B78F4 00000000 */   nop
.L001B78F8:
/* 0B79F8 001B78F8 282EC070 */  paddub      $5, $6, $0
/* 0B79FC 001B78FC 3CE9060C */  jal         Init_Thunder__14CWeaponElementFPf
/* 0B7A00 001B7900 00000000 */   nop
/* 0B7A04 001B7904 04000010 */  b           .L001B7918
/* 0B7A08 001B7908 00000000 */   nop
.L001B790C:
/* 0B7A0C 001B790C 282EC070 */  paddub      $5, $6, $0
/* 0B7A10 001B7910 A8DE060C */  jal         Init_Holy__14CWeaponElementFPf
/* 0B7A14 001B7914 00000000 */   nop
.L001B7918:
/* 0B7A18 001B7918 01000324 */  addiu       $3, $0, 0x1
/* 0B7A1C 001B791C AC0503A6 */  sh          $3, 0x5AC($16)
/* 0B7A20 001B7920 1000BF7B */  lq          $31, 0x10($29)
/* 0B7A24 001B7924 0000B07B */  lq          $16, 0x0($29)
/* 0B7A28 001B7928 2000BD27 */  addiu       $29, $29, 0x20
/* 0B7A2C 001B792C 0800E003 */  jr          $31
/* 0B7A30 001B7930 00000000 */   nop
/* 0B7A34 001B7934 00000000 */  nop
/* 0B7A38 001B7938 00000000 */  nop
/* 0B7A3C 001B793C 00000000 */  nop
