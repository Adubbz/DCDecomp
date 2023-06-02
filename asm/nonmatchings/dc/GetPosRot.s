.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPosRot__FP10CMapObjectPfPf
/* 839F0 001838F0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 839F4 001838F4 3000BF7F */  sq         $31, 0x30($sp)
/* 839F8 001838F8 2000B27F */  sq         $18, 0x20($sp)
/* 839FC 001838FC 1000B17F */  sq         $17, 0x10($sp)
/* 83A00 00183900 0000B07F */  sq         $16, 0x0($sp)
/* 83A04 00183904 28168070 */  paddub     $2, $4, $0
/* 83A08 00183908 2896A070 */  paddub     $18, $5, $0
/* 83A0C 0018390C 288EC070 */  paddub     $17, $6, $0
/* 83A10 00183910 04004014 */  bnez       $2, .L00183924
/* 83A14 00183914 00000000 */   nop
/* 83A18 00183918 28160070 */  paddub     $2, $0, $0
/* 83A1C 0018391C 33000010 */  b          .L001839EC
/* 83A20 00183920 00000000 */   nop
.L00183924:
/* 83A24 00183924 B000508C */  lw         $16, 0xB0($2)
/* 83A28 00183928 04000016 */  bnez       $16, .L0018393C
/* 83A2C 0018392C 00000000 */   nop
/* 83A30 00183930 28160070 */  paddub     $2, $0, $0
/* 83A34 00183934 2D000010 */  b          .L001839EC
/* 83A38 00183938 00000000 */   nop
.L0018393C:
/* 83A3C 0018393C 4000A427 */  addiu      $4, $sp, 0x40
/* 83A40 00183940 10004524 */  addiu      $5, $2, 0x10
/* 83A44 00183944 0C86040C */  jal        sceVu0CopyVector
/* 83A48 00183948 00000000 */   nop
/* 83A4C 0018394C 28260072 */  paddub     $4, $16, $0
/* 83A50 00183950 4000A527 */  addiu      $5, $sp, 0x40
/* 83A54 00183954 B89F040C */  jal        SetPosition__6CFrameFPf
/* 83A58 00183958 00000000 */   nop
/* 83A5C 0018395C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 83A60 00183960 0C0042AE */  sw         $2, 0xC($18)
/* 83A64 00183964 28260072 */  paddub     $4, $16, $0
/* 83A68 00183968 282E4072 */  paddub     $5, $18, $0
/* 83A6C 0018396C 28364072 */  paddub     $6, $18, $0
/* 83A70 00183970 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* 83A74 00183974 00000000 */   nop
/* 83A78 00183978 28260072 */  paddub     $4, $16, $0
/* 83A7C 0018397C 5000A527 */  addiu      $5, $sp, 0x50
/* 83A80 00183980 8CA3040C */  jal        GetRotation__6CFrameFPf
/* 83A84 00183984 00000000 */   nop
/* 83A88 00183988 000020AE */  sw         $0, 0x0($17)
/* 83A8C 0018398C 040021C6 */  lwc1       $f1, 0x4($17)
/* 83A90 00183990 5400A0C7 */  lwc1       $f0, 0x54($sp)
/* 83A94 00183994 00000146 */  add.s      $f0, $f0, $f1
/* 83A98 00183998 040020E6 */  swc1       $f0, 0x4($17)
/* 83A9C 0018399C 080020AE */  sw         $0, 0x8($17)
/* 83AA0 001839A0 040021C6 */  lwc1       $f1, 0x4($17)
/* 83AA4 001839A4 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 83AA8 001839A8 36080046 */  c.le.s     $f1, $f0
/* 83AAC 001839AC 00000000 */  nop
/* 83AB0 001839B0 04000145 */  bc1t       .L001839C4
/* 83AB4 001839B4 00000000 */   nop
/* 83AB8 001839B8 A88180C7 */  lwc1       $f0, -0x7E58($gp)
/* 83ABC 001839BC 01080046 */  sub.s      $f0, $f1, $f0
/* 83AC0 001839C0 040020E6 */  swc1       $f0, 0x4($17)
.L001839C4:
/* 83AC4 001839C4 040021C6 */  lwc1       $f1, 0x4($17)
/* 83AC8 001839C8 108280C7 */  lwc1       $f0, -0x7DF0($gp)
/* 83ACC 001839CC 34080046 */  c.lt.s     $f1, $f0
/* 83AD0 001839D0 00000000 */  nop
/* 83AD4 001839D4 04000045 */  bc1f       .L001839E8
/* 83AD8 001839D8 00000000 */   nop
/* 83ADC 001839DC 148280C7 */  lwc1       $f0, -0x7DEC($gp)
/* 83AE0 001839E0 00080046 */  add.s      $f0, $f1, $f0
/* 83AE4 001839E4 040020E6 */  swc1       $f0, 0x4($17)
.L001839E8:
/* 83AE8 001839E8 01000224 */  addiu      $2, $0, 0x1
.L001839EC:
/* 83AEC 001839EC 3000BF7B */  lq         $31, 0x30($sp)
/* 83AF0 001839F0 2000B27B */  lq         $18, 0x20($sp)
/* 83AF4 001839F4 1000B17B */  lq         $17, 0x10($sp)
/* 83AF8 001839F8 0000B07B */  lq         $16, 0x0($sp)
/* 83AFC 001839FC 6000BD27 */  addiu      $sp, $sp, 0x60
/* 83B00 00183A00 0800E003 */  jr         $31
/* 83B04 00183A04 00000000 */   nop
/* 83B08 00183A08 00000000 */  nop
/* 83B0C 00183A0C 00000000 */  nop