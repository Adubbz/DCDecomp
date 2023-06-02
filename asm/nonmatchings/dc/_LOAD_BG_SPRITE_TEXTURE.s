.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_BG_SPRITE_TEXTURE__FP12RS_STACKDATAi
/* 8CB50 0018CA50 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* 8CB54 0018CA54 6000BF7F */  sq         $31, 0x60($sp)
/* 8CB58 0018CA58 5000B57F */  sq         $21, 0x50($sp)
/* 8CB5C 0018CA5C 4000B47F */  sq         $20, 0x40($sp)
/* 8CB60 0018CA60 3000B37F */  sq         $19, 0x30($sp)
/* 8CB64 0018CA64 2000B27F */  sq         $18, 0x20($sp)
/* 8CB68 0018CA68 1000B17F */  sq         $17, 0x10($sp)
/* 8CB6C 0018CA6C 0000B07F */  sq         $16, 0x0($sp)
/* 8CB70 0018CA70 28AE8070 */  paddub     $21, $4, $0
/* 8CB74 0018CA74 28A6A070 */  paddub     $20, $5, $0
/* 8CB78 0018CA78 A830060C */  jal        get_pack_file__Fv
/* 8CB7C 0018CA7C 00000000 */   nop
/* 8CB80 0018CA80 288E4070 */  paddub     $17, $2, $0
/* 8CB84 0018CA84 04002016 */  bnez       $17, .L0018CA98
/* 8CB88 0018CA88 00000000 */   nop
/* 8CB8C 0018CA8C 28160070 */  paddub     $2, $0, $0
/* 8CB90 0018CA90 3F000010 */  b          .L0018CB90
/* 8CB94 0018CA94 00000000 */   nop
.L0018CA98:
/* 8CB98 0018CA98 28860070 */  paddub     $16, $0, $0
/* 8CB9C 0018CA9C 24000010 */  b          .L0018CB30
/* 8CBA0 0018CAA0 00000000 */   nop
.L0018CAA4:
/* 8CBA4 0018CAA4 2826A072 */  paddub     $4, $21, $0
/* 8CBA8 0018CAA8 08009524 */  addiu      $21, $4, 0x8
/* 8CBAC 0018CAAC F428060C */  jal        GetStackString__FP12RS_STACKDATA
/* 8CBB0 0018CAB0 00000000 */   nop
/* 8CBB4 0018CAB4 28262072 */  paddub     $4, $17, $0
/* 8CBB8 0018CAB8 282E4070 */  paddub     $5, $2, $0
/* 8CBBC 0018CABC 3C01A627 */  addiu      $6, $sp, 0x13C
/* 8CBC0 0018CAC0 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 8CBC4 0018CAC4 00000000 */   nop
/* 8CBC8 0018CAC8 28964070 */  paddub     $18, $2, $0
/* 8CBCC 0018CACC 17004012 */  beqz       $18, .L0018CB2C
/* 8CBD0 0018CAD0 00000000 */   nop
/* 8CBD4 0018CAD4 B030060C */  jal        get_buffer__Fv
/* 8CBD8 0018CAD8 00000000 */   nop
/* 8CBDC 0018CADC 3C01A38F */  lw         $3, 0x13C($sp)
/* 8CBE0 0018CAE0 03190300 */  sra        $3, $3, 4
/* 8CBE4 0018CAE4 01006524 */  addiu      $5, $3, 0x1
/* 8CBE8 0018CAE8 28264070 */  paddub     $4, $2, $0
/* 8CBEC 0018CAEC 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 8CBF0 0018CAF0 00000000 */   nop
/* 8CBF4 0018CAF4 289E4070 */  paddub     $19, $2, $0
/* 8CBF8 0018CAF8 3C01A68F */  lw         $6, 0x13C($sp)
/* 8CBFC 0018CAFC 28266072 */  paddub     $4, $19, $0
/* 8CC00 0018CB00 282E4072 */  paddub     $5, $18, $0
/* 8CC04 0018CB04 EC0C040C */  jal        memcpy
/* 8CC08 0018CB08 00000000 */   nop
/* 8CC0C 0018CB0C 2E000324 */  addiu      $3, $0, 0x2E
/* 8CC10 0018CB10 40101000 */  sll        $2, $16, 1
/* 8CC14 0018CB14 21105000 */  addu       $2, $2, $16
/* 8CC18 0018CB18 80100200 */  sll        $2, $2, 2
/* 8CC1C 0018CB1C 21105D00 */  addu       $2, $2, $sp
/* 8CC20 0018CB20 740043AC */  sw         $3, 0x74($2)
/* 8CC24 0018CB24 780040AC */  sw         $0, 0x78($2)
/* 8CC28 0018CB28 700053AC */  sw         $19, 0x70($2)
.L0018CB2C:
/* 8CC2C 0018CB2C 01001026 */  addiu      $16, $16, 0x1
.L0018CB30:
/* 8CC30 0018CB30 2A101402 */  slt        $2, $16, $20
/* 8CC34 0018CB34 DBFF4014 */  bnez       $2, .L0018CAA4
/* 8CC38 0018CB38 00000000 */   nop
/* 8CC3C 0018CB3C 40101000 */  sll        $2, $16, 1
/* 8CC40 0018CB40 21105000 */  addu       $2, $2, $16
/* 8CC44 0018CB44 80100200 */  sll        $2, $2, 2
/* 8CC48 0018CB48 21105D00 */  addu       $2, $2, $sp
/* 8CC4C 0018CB4C 700040AC */  sw         $0, 0x70($2)
/* 8CC50 0018CB50 C701023C */  lui        $2, %hi(TexManager)
/* 8CC54 0018CB54 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CC58 0018CB58 2E000524 */  addiu      $5, $0, 0x2E
/* 8CC5C 0018CB5C C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 8CC60 0018CB60 00000000 */   nop
/* 8CC64 0018CB64 C701023C */  lui        $2, %hi(TexManager)
/* 8CC68 0018CB68 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CC6C 0018CB6C FCCD040C */  jal        CleanUpBuffer__15CTextureManagerFv
/* 8CC70 0018CB70 00000000 */   nop
/* 8CC74 0018CB74 C701023C */  lui        $2, %hi(TexManager)
/* 8CC78 0018CB78 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 8CC7C 0018CB7C 2E000524 */  addiu      $5, $0, 0x2E
/* 8CC80 0018CB80 7000A627 */  addiu      $6, $sp, 0x70
/* 8CC84 0018CB84 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 8CC88 0018CB88 00000000 */   nop
/* 8CC8C 0018CB8C 01000224 */  addiu      $2, $0, 0x1
.L0018CB90:
/* 8CC90 0018CB90 6000BF7B */  lq         $31, 0x60($sp)
/* 8CC94 0018CB94 5000B57B */  lq         $21, 0x50($sp)
/* 8CC98 0018CB98 4000B47B */  lq         $20, 0x40($sp)
/* 8CC9C 0018CB9C 3000B37B */  lq         $19, 0x30($sp)
/* 8CCA0 0018CBA0 2000B27B */  lq         $18, 0x20($sp)
/* 8CCA4 0018CBA4 1000B17B */  lq         $17, 0x10($sp)
/* 8CCA8 0018CBA8 0000B07B */  lq         $16, 0x0($sp)
/* 8CCAC 0018CBAC 4001BD27 */  addiu      $sp, $sp, 0x140
/* 8CCB0 0018CBB0 0800E003 */  jr         $31
/* 8CCB4 0018CBB4 00000000 */   nop
/* 8CCB8 0018CBB8 00000000 */  nop
/* 8CCBC 0018CBBC 00000000 */  nop
