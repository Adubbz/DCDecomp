.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Set__14CWeaponElementFPA4_fPffif
/* B7940 001B7840 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B7944 001B7844 1000BF7F */  sq         $31, 0x10($sp)
/* B7948 001B7848 0000B07F */  sq         $16, 0x0($sp)
/* B794C 001B784C 28868070 */  paddub     $16, $4, $0
/* B7950 001B7850 803F023C */  lui        $2, (0x3F800000 >> 16)
/* B7954 001B7854 00008244 */  mtc1       $2, $f0
/* B7958 001B7858 00000000 */  nop
/* B795C 001B785C 40000C46 */  add.s      $f1, $f0, $f12
/* B7960 001B7860 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* B7964 001B7864 02000146 */  mul.s      $f0, $f0, $f1
/* B7968 001B7868 A80580E4 */  swc1       $f0, 0x5A8($4)
/* B796C 001B786C A40587A4 */  sh         $7, 0x5A4($4)
/* B7970 001B7870 A0058DE4 */  swc1       $f13, 0x5A0($4)
/* B7974 001B7874 000085AC */  sw         $5, 0x0($4)
/* B7978 001B7878 04000224 */  addiu      $2, $0, 0x4
/* B797C 001B787C 2300E210 */  beq        $7, $2, .L001B790C
/* B7980 001B7880 00000000 */   nop
/* B7984 001B7884 02000224 */  addiu      $2, $0, 0x2
/* B7988 001B7888 1B00E210 */  beq        $7, $2, .L001B78F8
/* B798C 001B788C 00000000 */   nop
/* B7990 001B7890 1400E010 */  beqz       $7, .L001B78E4
/* B7994 001B7894 00000000 */   nop
/* B7998 001B7898 03000224 */  addiu      $2, $0, 0x3
/* B799C 001B789C 0C00E210 */  beq        $7, $2, .L001B78D0
/* B79A0 001B78A0 00000000 */   nop
/* B79A4 001B78A4 01000224 */  addiu      $2, $0, 0x1
/* B79A8 001B78A8 0300E210 */  beq        $7, $2, .L001B78B8
/* B79AC 001B78AC 00000000 */   nop
/* B79B0 001B78B0 01000010 */  b          .L001B78B8
/* B79B4 001B78B4 00000000 */   nop
.L001B78B8:
/* B79B8 001B78B8 28260072 */  paddub     $4, $16, $0
/* B79BC 001B78BC 282EC070 */  paddub     $5, $6, $0
/* B79C0 001B78C0 20E1060C */  jal        Init_Cold__14CWeaponElementFPf
/* B79C4 001B78C4 00000000 */   nop
/* B79C8 001B78C8 13000010 */  b          .L001B7918
/* B79CC 001B78CC 00000000 */   nop
.L001B78D0:
/* B79D0 001B78D0 282EC070 */  paddub     $5, $6, $0
/* B79D4 001B78D4 A4E3060C */  jal        Init_Wind__14CWeaponElementFPf
/* B79D8 001B78D8 00000000 */   nop
/* B79DC 001B78DC 0E000010 */  b          .L001B7918
/* B79E0 001B78E0 00000000 */   nop
.L001B78E4:
/* B79E4 001B78E4 282EC070 */  paddub     $5, $6, $0
/* B79E8 001B78E8 B0E6060C */  jal        Init_Fire__14CWeaponElementFPf
/* B79EC 001B78EC 00000000 */   nop
/* B79F0 001B78F0 09000010 */  b          .L001B7918
/* B79F4 001B78F4 00000000 */   nop
.L001B78F8:
/* B79F8 001B78F8 282EC070 */  paddub     $5, $6, $0
/* B79FC 001B78FC 3CE9060C */  jal        Init_Thunder__14CWeaponElementFPf
/* B7A00 001B7900 00000000 */   nop
/* B7A04 001B7904 04000010 */  b          .L001B7918
/* B7A08 001B7908 00000000 */   nop
.L001B790C:
/* B7A0C 001B790C 282EC070 */  paddub     $5, $6, $0
/* B7A10 001B7910 A8DE060C */  jal        Init_Holy__14CWeaponElementFPf
/* B7A14 001B7914 00000000 */   nop
.L001B7918:
/* B7A18 001B7918 01000324 */  addiu      $3, $0, 0x1
/* B7A1C 001B791C AC0503A6 */  sh         $3, 0x5AC($16)
/* B7A20 001B7920 1000BF7B */  lq         $31, 0x10($sp)
/* B7A24 001B7924 0000B07B */  lq         $16, 0x0($sp)
/* B7A28 001B7928 2000BD27 */  addiu      $sp, $sp, 0x20
/* B7A2C 001B792C 0800E003 */  jr         $31
/* B7A30 001B7930 00000000 */   nop
/* B7A34 001B7934 00000000 */  nop
/* B7A38 001B7938 00000000 */  nop
/* B7A3C 001B793C 00000000 */  nop
