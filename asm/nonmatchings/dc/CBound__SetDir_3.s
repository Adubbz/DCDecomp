.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDir__6CBoundFPf
/* 3D9A0 0013D8A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3D9A4 0013D8A4 2000BF7F */  sq         $31, 0x20($sp)
/* 3D9A8 0013D8A8 1000B07F */  sq         $16, 0x10($sp)
/* 3D9AC 0013D8AC 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* 3D9B0 0013D8B0 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 3D9B4 0013D8B4 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 3D9B8 0013D8B8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 3D9BC 0013D8BC 28868070 */  paddub     $16, $4, $0
/* 3D9C0 0013D8C0 D0000426 */  addiu      $4, $16, 0xD0
/* 3D9C4 0013D8C4 9285040C */  jal        sceVu0Normalize
/* 3D9C8 0013D8C8 00000000 */   nop
/* 3D9CC 0013D8CC D0000426 */  addiu      $4, $16, 0xD0
/* 3D9D0 0013D8D0 14ED040C */  jal        vuabs__FPf
/* 3D9D4 0013D8D4 00000000 */   nop
/* 3D9D8 0013D8D8 86000046 */  mov.s      $f2, $f0
/* 3D9DC 0013D8DC D40001C6 */  lwc1       $f1, 0xD4($16)
/* 3D9E0 0013D8E0 D40000AE */  sw         $0, 0xD4($16)
/* 3D9E4 0013D8E4 14ED040C */  jal        vuabs__FPf
/* 3D9E8 0013D8E8 00000000 */   nop
/* 3D9EC 0013D8EC D40001E6 */  swc1       $f1, 0xD4($16)
/* 3D9F0 0013D8F0 00A88044 */  mtc1       $0, $f21
/* 3D9F4 0013D8F4 00000000 */  nop
/* 3D9F8 0013D8F8 32A80046 */  c.eq.s     $f21, $f0
/* 3D9FC 0013D8FC 00000000 */  nop
/* 3DA00 0013D900 05000045 */  bc1f       .L0013D918
/* 3DA04 0013D904 00000000 */   nop
/* 3DA08 0013D908 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DA0C 0013D90C 00A08244 */  mtc1       $2, $f20
/* 3DA10 0013D910 06000010 */  b          .L0013D92C
/* 3DA14 0013D914 00000000 */   nop
.L0013D918:
/* 3DA18 0013D918 D80001C6 */  lwc1       $f1, 0xD8($16)
/* 3DA1C 0013D91C 030D0046 */  div.s      $f20, $f1, $f0
/* 3DA20 0013D920 D00001C6 */  lwc1       $f1, 0xD0($16)
/* 3DA24 0013D924 47080046 */  neg.s      $f1, $f1
/* 3DA28 0013D928 430D0046 */  div.s      $f21, $f1, $f0
.L0013D92C:
/* 3DA2C 0013D92C 00088044 */  mtc1       $0, $f1
/* 3DA30 0013D930 00000000 */  nop
/* 3DA34 0013D934 32080246 */  c.eq.s     $f1, $f2
/* 3DA38 0013D938 00000000 */  nop
/* 3DA3C 0013D93C 03000045 */  bc1f       .L0013D94C
/* 3DA40 0013D940 00000000 */   nop
/* 3DA44 0013D944 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3DA48 0013D948 00108244 */  mtc1       $2, $f2
.L0013D94C:
/* 3DA4C 0013D94C 83050246 */  div.s      $f22, $f0, $f2
/* 3DA50 0013D950 D40000C6 */  lwc1       $f0, 0xD4($16)
/* 3DA54 0013D954 C3050246 */  div.s      $f23, $f0, $f2
/* 3DA58 0013D958 80000426 */  addiu      $4, $16, 0x80
/* 3DA5C 0013D95C 2A86040C */  jal        sceVu0UnitMatrix
/* 3DA60 0013D960 00000000 */   nop
/* 3DA64 0013D964 800014E6 */  swc1       $f20, 0x80($16)
/* 3DA68 0013D968 07A80046 */  neg.s      $f0, $f21
/* 3DA6C 0013D96C 02001746 */  mul.s      $f0, $f0, $f23
/* 3DA70 0013D970 840000E6 */  swc1       $f0, 0x84($16)
/* 3DA74 0013D974 02A81646 */  mul.s      $f0, $f21, $f22
/* 3DA78 0013D978 880000E6 */  swc1       $f0, 0x88($16)
/* 3DA7C 0013D97C 8C0000AE */  sw         $0, 0x8C($16)
/* 3DA80 0013D980 900000AE */  sw         $0, 0x90($16)
/* 3DA84 0013D984 07B00046 */  neg.s      $f0, $f22
/* 3DA88 0013D988 940000E6 */  swc1       $f0, 0x94($16)
/* 3DA8C 0013D98C 07B80046 */  neg.s      $f0, $f23
/* 3DA90 0013D990 980000E6 */  swc1       $f0, 0x98($16)
/* 3DA94 0013D994 9C0000AE */  sw         $0, 0x9C($16)
/* 3DA98 0013D998 A00015E6 */  swc1       $f21, 0xA0($16)
/* 3DA9C 0013D99C 02A01746 */  mul.s      $f0, $f20, $f23
/* 3DAA0 0013D9A0 A40000E6 */  swc1       $f0, 0xA4($16)
/* 3DAA4 0013D9A4 07A00046 */  neg.s      $f0, $f20
/* 3DAA8 0013D9A8 02001646 */  mul.s      $f0, $f0, $f22
/* 3DAAC 0013D9AC A80000E6 */  swc1       $f0, 0xA8($16)
/* 3DAB0 0013D9B0 AC0000AE */  sw         $0, 0xAC($16)
/* 3DAB4 0013D9B4 40000426 */  addiu      $4, $16, 0x40
/* 3DAB8 0013D9B8 80000526 */  addiu      $5, $16, 0x80
/* 3DABC 0013D9BC A085040C */  jal        sceVu0TransposeMatrix
/* 3DAC0 0013D9C0 00000000 */   nop
/* 3DAC4 0013D9C4 2000BF7B */  lq         $31, 0x20($sp)
/* 3DAC8 0013D9C8 1000B07B */  lq         $16, 0x10($sp)
/* 3DACC 0013D9CC 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* 3DAD0 0013D9D0 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 3DAD4 0013D9D4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 3DAD8 0013D9D8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 3DADC 0013D9DC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 3DAE0 0013D9E0 0800E003 */  jr         $31
/* 3DAE4 0013D9E4 00000000 */   nop
/* 3DAE8 0013D9E8 00000000 */  nop
/* 3DAEC 0013D9EC 00000000 */  nop
