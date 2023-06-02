.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MemCheckInit__Fv
/* 428A0 001427A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 428A4 001427A4 0000BF7F */  sq         $31, 0x0($sp)
/* 428A8 001427A8 6496040C */  jal        InitializeDataBuffer__Fv
/* 428AC 001427AC 00000000 */   nop
/* 428B0 001427B0 2B00023C */  lui        $2, %hi(TextureData)
/* 428B4 001427B4 30B04424 */  addiu      $4, $2, %lo(TextureData)
/* 428B8 001427B8 0100023C */  lui        $2, (0x186A0 >> 16)
/* 428BC 001427BC A0864534 */  ori        $5, $2, (0x186A0 & 0xFFFF)
/* 428C0 001427C0 A496040C */  jal        SetDataBuffer__FP14CDataAlloc2_1_i
/* 428C4 001427C4 00000000 */   nop
/* 428C8 001427C8 10270424 */  addiu      $4, $0, 0x2710
/* 428CC 001427CC 0100023C */  lui        $2, (0x186A0 >> 16)
/* 428D0 001427D0 A0864534 */  ori        $5, $2, (0x186A0 & 0xFFFF)
/* 428D4 001427D4 B896040C */  jal        SetPacketReadBuffer__Fii
/* 428D8 001427D8 00000000 */   nop
/* 428DC 001427DC C701023C */  lui        $2, %hi(TexManager)
/* 428E0 001427E0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 428E4 001427E4 E03F0524 */  addiu      $5, $0, 0x3FE0
/* 428E8 001427E8 F0C3040C */  jal        Initialize__15CTextureManagerFi
/* 428EC 001427EC 00000000 */   nop
/* 428F0 001427F0 C701023C */  lui        $2, %hi(TexManager)
/* 428F4 001427F4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 428F8 001427F8 2500023C */  lui        $2, %hi(texdata$1006)
/* 428FC 001427FC D01F4524 */  addiu      $5, $2, %lo(texdata$1006)
/* 42900 00142800 98D0040C */  jal        EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
/* 42904 00142804 00000000 */   nop
/* 42908 00142808 C701023C */  lui        $2, %hi(TexManager)
/* 4290C 0014280C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 42910 00142810 FFFF0524 */  addiu      $5, $0, -0x1
/* 42914 00142814 948B868F */  lw         $6, -0x746C($gp)
/* 42918 00142818 4CCF040C */  jal        LoadTextureBlock__15CTextureManagerFiPUi
/* 4291C 0014281C 00000000 */   nop
/* 42920 00142820 00608044 */  mtc1       $0, $f12
/* 42924 00142824 00000000 */  nop
/* 42928 00142828 C6630046 */  mov.s      $f15, $f12
/* 4292C 0014282C 46630046 */  mov.s      $f13, $f12
/* 42930 00142830 86630046 */  mov.s      $f14, $f12
/* 42934 00142834 24B8040C */  jal        MGSetBGColor__Fffff
/* 42938 00142838 00000000 */   nop
/* 4293C 0014283C E077040C */  jal        sceMcInit
/* 42940 00142840 00000000 */   nop
/* 42944 00142844 05004010 */  beqz       $2, .L0014285C
/* 42948 00142848 00000000 */   nop
/* 4294C 0014284C 2A00023C */  lui        $2, %hi(_1011)
/* 42950 00142850 90954424 */  addiu      $4, $2, %lo(_1011)
/* 42954 00142854 A611040C */  jal        printf
/* 42958 00142858 00000000 */   nop
.L0014285C:
/* 4295C 0014285C 888D80AF */  sw         $0, -0x7278($gp)
/* 42960 00142860 02000324 */  addiu      $3, $0, 0x2
/* 42964 00142864 8C8D83AF */  sw         $3, -0x7274($gp)
/* 42968 00142868 908D80AF */  sw         $0, -0x7270($gp)
/* 4296C 0014286C 948D80AF */  sw         $0, -0x726C($gp)
/* 42970 00142870 0000BF7B */  lq         $31, 0x0($sp)
/* 42974 00142874 1000BD27 */  addiu      $sp, $sp, 0x10
/* 42978 00142878 0800E003 */  jr         $31
/* 4297C 0014287C 00000000 */   nop
