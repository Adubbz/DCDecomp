.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_SPRITE_TEXTURE__FP12RS_STACKDATAi
/* 8C9E0 0018C8E0 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* 8C9E4 0018C8E4 6000BF7F */  sq         $31, 0x60($sp)
/* 8C9E8 0018C8E8 5000B57F */  sq         $21, 0x50($sp)
/* 8C9EC 0018C8EC 4000B47F */  sq         $20, 0x40($sp)
/* 8C9F0 0018C8F0 3000B37F */  sq         $19, 0x30($sp)
/* 8C9F4 0018C8F4 2000B27F */  sq         $18, 0x20($sp)
/* 8C9F8 0018C8F8 1000B17F */  sq         $17, 0x10($sp)
/* 8C9FC 0018C8FC 0000B07F */  sq         $16, 0x0($sp)
/* 8CA00 0018C900 28AE8070 */  paddub     $21, $4, $0
/* 8CA04 0018C904 28A6A070 */  paddub     $20, $5, $0
/* 8CA08 0018C908 A830060C */  jal        get_pack_file__Fv
/* 8CA0C 0018C90C 00000000 */   nop
/* 8CA10 0018C910 288E4070 */  paddub     $17, $2, $0
/* 8CA14 0018C914 04002016 */  bnez       $17, .L0018C928
/* 8CA18 0018C918 00000000 */   nop
/* 8CA1C 0018C91C 28160070 */  paddub     $2, $0, $0
/* 8CA20 0018C920 3F000010 */  b          .L0018CA20
/* 8CA24 0018C924 00000000 */   nop
.L0018C928:
/* 8CA28 0018C928 28860070 */  paddub     $16, $0, $0
/* 8CA2C 0018C92C 24000010 */  b          .L0018C9C0
/* 8CA30 0018C930 00000000 */   nop
.L0018C934:
/* 8CA34 0018C934 2826A072 */  paddub     $4, $21, $0
/* 8CA38 0018C938 08009524 */  addiu      $21, $4, 0x8
/* 8CA3C 0018C93C F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8CA40 0018C940 00000000 */   nop
/* 8CA44 0018C944 28262072 */  paddub     $4, $17, $0
/* 8CA48 0018C948 282E4070 */  paddub     $5, $2, $0
/* 8CA4C 0018C94C 3C01A627 */  addiu      $6, $sp, 0x13C
/* 8CA50 0018C950 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 8CA54 0018C954 00000000 */   nop
/* 8CA58 0018C958 28964070 */  paddub     $18, $2, $0
/* 8CA5C 0018C95C 17004012 */  beqz       $18, .L0018C9BC
/* 8CA60 0018C960 00000000 */   nop
/* 8CA64 0018C964 B030060C */  jal        get_buffer__Fv
/* 8CA68 0018C968 00000000 */   nop
/* 8CA6C 0018C96C 3C01A38F */  lw         $3, 0x13C($sp)
/* 8CA70 0018C970 03190300 */  sra        $3, $3, 4
/* 8CA74 0018C974 01006524 */  addiu      $5, $3, 0x1
/* 8CA78 0018C978 28264070 */  paddub     $4, $2, $0
/* 8CA7C 0018C97C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 8CA80 0018C980 00000000 */   nop
/* 8CA84 0018C984 289E4070 */  paddub     $19, $2, $0
/* 8CA88 0018C988 3C01A68F */  lw         $6, 0x13C($sp)
/* 8CA8C 0018C98C 28266072 */  paddub     $4, $19, $0
/* 8CA90 0018C990 282E4072 */  paddub     $5, $18, $0
/* 8CA94 0018C994 EC0C040C */  jal        memcpy
/* 8CA98 0018C998 00000000 */   nop
/* 8CA9C 0018C99C 2D000324 */  addiu      $3, $0, 0x2D
/* 8CAA0 0018C9A0 40101000 */  sll        $2, $16, 1
/* 8CAA4 0018C9A4 21105000 */  addu       $2, $2, $16
/* 8CAA8 0018C9A8 80100200 */  sll        $2, $2, 2
/* 8CAAC 0018C9AC 21105D00 */  addu       $2, $2, $sp
/* 8CAB0 0018C9B0 740043AC */  sw         $3, 0x74($2)
/* 8CAB4 0018C9B4 780040AC */  sw         $0, 0x78($2)
/* 8CAB8 0018C9B8 700053AC */  sw         $19, 0x70($2)
.L0018C9BC:
/* 8CABC 0018C9BC 01001026 */  addiu      $16, $16, 0x1
.L0018C9C0:
/* 8CAC0 0018C9C0 2A101402 */  slt        $2, $16, $20
/* 8CAC4 0018C9C4 DBFF4014 */  bnez       $2, .L0018C934
/* 8CAC8 0018C9C8 00000000 */   nop
/* 8CACC 0018C9CC 40101000 */  sll        $2, $16, 1
/* 8CAD0 0018C9D0 21105000 */  addu       $2, $2, $16
/* 8CAD4 0018C9D4 80100200 */  sll        $2, $2, 2
/* 8CAD8 0018C9D8 21105D00 */  addu       $2, $2, $sp
/* 8CADC 0018C9DC 700040AC */  sw         $0, 0x70($2)
/* 8CAE0 0018C9E0 C701023C */  lui        $2, %hi(TexManager)
/* 8CAE4 0018C9E4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CAE8 0018C9E8 2D000524 */  addiu      $5, $0, 0x2D
/* 8CAEC 0018C9EC C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 8CAF0 0018C9F0 00000000 */   nop
/* 8CAF4 0018C9F4 C701023C */  lui        $2, %hi(TexManager)
/* 8CAF8 0018C9F8 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CAFC 0018C9FC FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* 8CB00 0018CA00 00000000 */   nop
/* 8CB04 0018CA04 C701023C */  lui        $2, %hi(TexManager)
/* 8CB08 0018CA08 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CB0C 0018CA0C 2D000524 */  addiu      $5, $0, 0x2D
/* 8CB10 0018CA10 7000A627 */  addiu      $6, $sp, 0x70
/* 8CB14 0018CA14 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 8CB18 0018CA18 00000000 */   nop
/* 8CB1C 0018CA1C 01000224 */  addiu      $2, $0, 0x1
.L0018CA20:
/* 8CB20 0018CA20 6000BF7B */  lq         $31, 0x60($sp)
/* 8CB24 0018CA24 5000B57B */  lq         $21, 0x50($sp)
/* 8CB28 0018CA28 4000B47B */  lq         $20, 0x40($sp)
/* 8CB2C 0018CA2C 3000B37B */  lq         $19, 0x30($sp)
/* 8CB30 0018CA30 2000B27B */  lq         $18, 0x20($sp)
/* 8CB34 0018CA34 1000B17B */  lq         $17, 0x10($sp)
/* 8CB38 0018CA38 0000B07B */  lq         $16, 0x0($sp)
/* 8CB3C 0018CA3C 4001BD27 */  addiu      $sp, $sp, 0x140
/* 8CB40 0018CA40 0800E003 */  jr         $31
/* 8CB44 0018CA44 00000000 */   nop
/* 8CB48 0018CA48 00000000 */  nop
/* 8CB4C 0018CA4C 00000000 */  nop
