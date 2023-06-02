.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadMapObject__FP9CMapPartsPPUiP14CDataAlloc2_1_
/* 9B890 0019B790 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 9B894 0019B794 6000BF7F */  sq         $31, 0x60($sp)
/* 9B898 0019B798 5000B57F */  sq         $21, 0x50($sp)
/* 9B89C 0019B79C 4000B47F */  sq         $20, 0x40($sp)
/* 9B8A0 0019B7A0 3000B37F */  sq         $19, 0x30($sp)
/* 9B8A4 0019B7A4 2000B27F */  sq         $18, 0x20($sp)
/* 9B8A8 0019B7A8 1000B17F */  sq         $17, 0x10($sp)
/* 9B8AC 0019B7AC 0000B07F */  sq         $16, 0x0($sp)
/* 9B8B0 0019B7B0 28A68070 */  paddub     $20, $4, $0
/* 9B8B4 0019B7B4 289EA070 */  paddub     $19, $5, $0
/* 9B8B8 0019B7B8 2896C070 */  paddub     $18, $6, $0
/* 9B8BC 0019B7BC 7000A427 */  addiu      $4, $sp, 0x70
/* 9B8C0 0019B7C0 01000724 */  addiu      $7, $0, 0x1
/* 9B8C4 0019B7C4 AC9B040C */  jal        LoadMDSFileLOD__FPP9CFrameVu1PPUiP14CDataAlloc2_1_i
/* 9B8C8 0019B7C8 00000000 */   nop
/* 9B8CC 0019B7CC 8000A427 */  addiu      $4, $sp, 0x80
/* 9B8D0 0019B7D0 509F040C */  jal        __ct__10CFrameAttrFv
/* 9B8D4 0019B7D4 00000000 */   nop
/* 9B8D8 0019B7D8 01001024 */  addiu      $16, $0, 0x1
/* 9B8DC 0019B7DC 8C00B0A3 */  sb         $16, 0x8C($sp)
/* 9B8E0 0019B7E0 8800B127 */  addiu      $17, $sp, 0x88
/* 9B8E4 0019B7E4 000020A2 */  sb         $0, 0x0($17)
/* 9B8E8 0019B7E8 40000224 */  addiu      $2, $0, 0x40
/* 9B8EC 0019B7EC D000A2A7 */  sh         $2, 0xD0($sp)
/* 9B8F0 0019B7F0 11000010 */  b          .L0019B838
/* 9B8F4 0019B7F4 00000000 */   nop
.L0019B7F8:
/* 9B8F8 0019B7F8 80101000 */  sll        $2, $16, 2
/* 9B8FC 0019B7FC 21105D00 */  addu       $2, $2, $sp
/* 9B900 0019B800 70005524 */  addiu      $21, $2, 0x70
/* 9B904 0019B804 0000A48E */  lw         $4, 0x0($21)
/* 9B908 0019B808 0A008010 */  beqz       $4, .L0019B834
/* 9B90C 0019B80C 00000000 */   nop
/* 9B910 0019B810 8000A527 */  addiu      $5, $sp, 0x80
/* 9B914 0019B814 01000624 */  addiu      $6, $0, 0x1
/* 9B918 0019B818 44000724 */  addiu      $7, $0, 0x44
/* 9B91C 0019B81C D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 9B920 0019B820 00000000 */   nop
/* 9B924 0019B824 0000A48E */  lw         $4, 0x0($21)
/* 9B928 0019B828 01000524 */  addiu      $5, $0, 0x1
/* 9B92C 0019B82C BC97040C */  jal        SetFrameAttr__FP6CFramei
/* 9B930 0019B830 00000000 */   nop
.L0019B834:
/* 9B934 0019B834 01001026 */  addiu      $16, $16, 0x1
.L0019B838:
/* 9B938 0019B838 0400022A */  slti       $2, $16, 0x4
/* 9B93C 0019B83C EEFF4014 */  bnez       $2, .L0019B7F8
/* 9B940 0019B840 00000000 */   nop
/* 9B944 0019B844 C842023C */  lui        $2, (0x42C80000 >> 16)
/* 9B948 0019B848 8400A2AF */  sw         $2, 0x84($sp)
/* 9B94C 0019B84C 01000624 */  addiu      $6, $0, 0x1
/* 9B950 0019B850 000026A2 */  sb         $6, 0x0($17)
/* 9B954 0019B854 7000A48F */  lw         $4, 0x70($sp)
/* 9B958 0019B858 8000A527 */  addiu      $5, $sp, 0x80
/* 9B95C 0019B85C 283E0070 */  paddub     $7, $0, $0
/* 9B960 0019B860 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 9B964 0019B864 00000000 */   nop
/* 9B968 0019B868 7000A48F */  lw         $4, 0x70($sp)
/* 9B96C 0019B86C 01000524 */  addiu      $5, $0, 0x1
/* 9B970 0019B870 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* 9B974 0019B874 00000000 */   nop
/* 9B978 0019B878 28860070 */  paddub     $16, $0, $0
/* 9B97C 0019B87C 09000010 */  b          .L0019B8A4
/* 9B980 0019B880 00000000 */   nop
.L0019B884:
/* 9B984 0019B884 80101000 */  sll        $2, $16, 2
/* 9B988 0019B888 21105D00 */  addu       $2, $2, $sp
/* 9B98C 0019B88C 28268072 */  paddub     $4, $20, $0
/* 9B990 0019B890 7000458C */  lw         $5, 0x70($2)
/* 9B994 0019B894 28360072 */  paddub     $6, $16, $0
/* 9B998 0019B898 305C050C */  jal        SetFrame__12CObjectFrameFP9CFrameVu1i
/* 9B99C 0019B89C 00000000 */   nop
/* 9B9A0 0019B8A0 01001026 */  addiu      $16, $16, 0x1
.L0019B8A4:
/* 9B9A4 0019B8A4 0400032A */  slti       $3, $16, 0x4
/* 9B9A8 0019B8A8 F6FF6014 */  bnez       $3, .L0019B884
/* 9B9AC 0019B8AC 00000000 */   nop
/* 9B9B0 0019B8B0 1000648E */  lw         $4, 0x10($19)
/* 9B9B4 0019B8B4 08008010 */  beqz       $4, .L0019B8D8
/* 9B9B8 0019B8B8 00000000 */   nop
/* 9B9BC 0019B8BC 282E4072 */  paddub     $5, $18, $0
/* 9B9C0 0019B8C0 0E000624 */  addiu      $6, $0, 0xE
/* 9B9C4 0019B8C4 283E0070 */  paddub     $7, $0, $0
/* 9B9C8 0019B8C8 28460070 */  paddub     $8, $0, $0
/* 9B9CC 0019B8CC AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 9B9D0 0019B8D0 00000000 */   nop
/* 9B9D4 0019B8D4 D40082AE */  sw         $2, 0xD4($20)
.L0019B8D8:
/* 9B9D8 0019B8D8 1400648E */  lw         $4, 0x14($19)
/* 9B9DC 0019B8DC 07008010 */  beqz       $4, .L0019B8FC
/* 9B9E0 0019B8E0 00000000 */   nop
/* 9B9E4 0019B8E4 282E4072 */  paddub     $5, $18, $0
/* 9B9E8 0019B8E8 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 9B9EC 0019B8EC 00000000 */   nop
/* 9B9F0 0019B8F0 D00082AE */  sw         $2, 0xD0($20)
/* 9B9F4 0019B8F4 02000010 */  b          .L0019B900
/* 9B9F8 0019B8F8 00000000 */   nop
.L0019B8FC:
/* 9B9FC 0019B8FC D00080AE */  sw         $0, 0xD0($20)
.L0019B900:
/* 9BA00 0019B900 1800648E */  lw         $4, 0x18($19)
/* 9BA04 0019B904 08008010 */  beqz       $4, .L0019B928
/* 9BA08 0019B908 00000000 */   nop
/* 9BA0C 0019B90C 282E4072 */  paddub     $5, $18, $0
/* 9BA10 0019B910 28360070 */  paddub     $6, $0, $0
/* 9BA14 0019B914 283E0070 */  paddub     $7, $0, $0
/* 9BA18 0019B918 28460070 */  paddub     $8, $0, $0
/* 9BA1C 0019B91C AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 9BA20 0019B920 00000000 */   nop
/* 9BA24 0019B924 D80082AE */  sw         $2, 0xD8($20)
.L0019B928:
/* 9BA28 0019B928 1C00648E */  lw         $4, 0x1C($19)
/* 9BA2C 0019B92C 08008010 */  beqz       $4, .L0019B950
/* 9BA30 0019B930 00000000 */   nop
/* 9BA34 0019B934 282E4072 */  paddub     $5, $18, $0
/* 9BA38 0019B938 28360070 */  paddub     $6, $0, $0
/* 9BA3C 0019B93C 283E0070 */  paddub     $7, $0, $0
/* 9BA40 0019B940 28460070 */  paddub     $8, $0, $0
/* 9BA44 0019B944 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 9BA48 0019B948 00000000 */   nop
/* 9BA4C 0019B94C 040182AE */  sw         $2, 0x104($20)
.L0019B950:
/* 9BA50 0019B950 2000648E */  lw         $4, 0x20($19)
/* 9BA54 0019B954 05008010 */  beqz       $4, .L0019B96C
/* 9BA58 0019B958 00000000 */   nop
/* 9BA5C 0019B95C 282E4072 */  paddub     $5, $18, $0
/* 9BA60 0019B960 DC9B040C */  jal        LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 9BA64 0019B964 00000000 */   nop
/* 9BA68 0019B968 DC0082AE */  sw         $2, 0xDC($20)
.L0019B96C:
/* 9BA6C 0019B96C 6000BF7B */  lq         $31, 0x60($sp)
/* 9BA70 0019B970 5000B57B */  lq         $21, 0x50($sp)
/* 9BA74 0019B974 4000B47B */  lq         $20, 0x40($sp)
/* 9BA78 0019B978 3000B37B */  lq         $19, 0x30($sp)
/* 9BA7C 0019B97C 2000B27B */  lq         $18, 0x20($sp)
/* 9BA80 0019B980 1000B17B */  lq         $17, 0x10($sp)
/* 9BA84 0019B984 0000B07B */  lq         $16, 0x0($sp)
/* 9BA88 0019B988 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 9BA8C 0019B98C 0800E003 */  jr         $31
/* 9BA90 0019B990 00000000 */   nop
/* 9BA94 0019B994 00000000 */  nop
/* 9BA98 0019B998 00000000 */  nop
/* 9BA9C 0019B99C 00000000 */  nop
