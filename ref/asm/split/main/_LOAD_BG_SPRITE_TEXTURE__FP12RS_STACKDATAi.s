.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_BG_SPRITE_TEXTURE__FP12RS_STACKDATAi
/* 08CB50 0018CA50 C0FEBD27 */  addiu       $29, $29, -0x140
/* 08CB54 0018CA54 6000BF7F */  sq          $31, 0x60($29)
/* 08CB58 0018CA58 5000B57F */  sq          $21, 0x50($29)
/* 08CB5C 0018CA5C 4000B47F */  sq          $20, 0x40($29)
/* 08CB60 0018CA60 3000B37F */  sq          $19, 0x30($29)
/* 08CB64 0018CA64 2000B27F */  sq          $18, 0x20($29)
/* 08CB68 0018CA68 1000B17F */  sq          $17, 0x10($29)
/* 08CB6C 0018CA6C 0000B07F */  sq          $16, 0x0($29)
/* 08CB70 0018CA70 28AE8070 */  paddub      $21, $4, $0
/* 08CB74 0018CA74 28A6A070 */  paddub      $20, $5, $0
/* 08CB78 0018CA78 A830060C */  jal         get_pack_file__Fv
/* 08CB7C 0018CA7C 00000000 */   nop
/* 08CB80 0018CA80 288E4070 */  paddub      $17, $2, $0
/* 08CB84 0018CA84 04002016 */  bnez        $17, .L0018CA98
/* 08CB88 0018CA88 00000000 */   nop
/* 08CB8C 0018CA8C 28160070 */  paddub      $2, $0, $0
/* 08CB90 0018CA90 3F000010 */  b           .L0018CB90
/* 08CB94 0018CA94 00000000 */   nop
.L0018CA98:
/* 08CB98 0018CA98 28860070 */  paddub      $16, $0, $0
/* 08CB9C 0018CA9C 24000010 */  b           .L0018CB30
/* 08CBA0 0018CAA0 00000000 */   nop
.L0018CAA4:
/* 08CBA4 0018CAA4 2826A072 */  paddub      $4, $21, $0
/* 08CBA8 0018CAA8 08009524 */  addiu       $21, $4, 0x8
/* 08CBAC 0018CAAC F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08CBB0 0018CAB0 00000000 */   nop
/* 08CBB4 0018CAB4 28262072 */  paddub      $4, $17, $0
/* 08CBB8 0018CAB8 282E4070 */  paddub      $5, $2, $0
/* 08CBBC 0018CABC 3C01A627 */  addiu       $6, $29, 0x13C
/* 08CBC0 0018CAC0 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 08CBC4 0018CAC4 00000000 */   nop
/* 08CBC8 0018CAC8 28964070 */  paddub      $18, $2, $0
/* 08CBCC 0018CACC 17004012 */  beqz        $18, .L0018CB2C
/* 08CBD0 0018CAD0 00000000 */   nop
/* 08CBD4 0018CAD4 B030060C */  jal         get_buffer__Fv
/* 08CBD8 0018CAD8 00000000 */   nop
/* 08CBDC 0018CADC 3C01A38F */  lw          $3, 0x13C($29)
/* 08CBE0 0018CAE0 03190300 */  sra         $3, $3, 4
/* 08CBE4 0018CAE4 01006524 */  addiu       $5, $3, 0x1
/* 08CBE8 0018CAE8 28264070 */  paddub      $4, $2, $0
/* 08CBEC 0018CAEC 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 08CBF0 0018CAF0 00000000 */   nop
/* 08CBF4 0018CAF4 289E4070 */  paddub      $19, $2, $0
/* 08CBF8 0018CAF8 3C01A68F */  lw          $6, 0x13C($29)
/* 08CBFC 0018CAFC 28266072 */  paddub      $4, $19, $0
/* 08CC00 0018CB00 282E4072 */  paddub      $5, $18, $0
/* 08CC04 0018CB04 EC0C040C */  jal         memcpy
/* 08CC08 0018CB08 00000000 */   nop
/* 08CC0C 0018CB0C 2E000324 */  addiu       $3, $0, 0x2E
/* 08CC10 0018CB10 40101000 */  sll         $2, $16, 1
/* 08CC14 0018CB14 21105000 */  addu        $2, $2, $16
/* 08CC18 0018CB18 80100200 */  sll         $2, $2, 2
/* 08CC1C 0018CB1C 21105D00 */  addu        $2, $2, $29
/* 08CC20 0018CB20 740043AC */  sw          $3, 0x74($2)
/* 08CC24 0018CB24 780040AC */  sw          $0, 0x78($2)
/* 08CC28 0018CB28 700053AC */  sw          $19, 0x70($2)
.L0018CB2C:
/* 08CC2C 0018CB2C 01001026 */  addiu       $16, $16, 0x1
.L0018CB30:
/* 08CC30 0018CB30 2A101402 */  slt         $2, $16, $20
/* 08CC34 0018CB34 DBFF4014 */  bnez        $2, .L0018CAA4
/* 08CC38 0018CB38 00000000 */   nop
/* 08CC3C 0018CB3C 40101000 */  sll         $2, $16, 1
/* 08CC40 0018CB40 21105000 */  addu        $2, $2, $16
/* 08CC44 0018CB44 80100200 */  sll         $2, $2, 2
/* 08CC48 0018CB48 21105D00 */  addu        $2, $2, $29
/* 08CC4C 0018CB4C 700040AC */  sw          $0, 0x70($2)
/* 08CC50 0018CB50 C701023C */  lui         $2, %hi(TexManager)
/* 08CC54 0018CB54 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CC58 0018CB58 2E000524 */  addiu       $5, $0, 0x2E
/* 08CC5C 0018CB5C C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 08CC60 0018CB60 00000000 */   nop
/* 08CC64 0018CB64 C701023C */  lui         $2, %hi(TexManager)
/* 08CC68 0018CB68 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CC6C 0018CB6C FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 08CC70 0018CB70 00000000 */   nop
/* 08CC74 0018CB74 C701023C */  lui         $2, %hi(TexManager)
/* 08CC78 0018CB78 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CC7C 0018CB7C 2E000524 */  addiu       $5, $0, 0x2E
/* 08CC80 0018CB80 7000A627 */  addiu       $6, $29, 0x70
/* 08CC84 0018CB84 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 08CC88 0018CB88 00000000 */   nop
/* 08CC8C 0018CB8C 01000224 */  addiu       $2, $0, 0x1
.L0018CB90:
/* 08CC90 0018CB90 6000BF7B */  lq          $31, 0x60($29)
/* 08CC94 0018CB94 5000B57B */  lq          $21, 0x50($29)
/* 08CC98 0018CB98 4000B47B */  lq          $20, 0x40($29)
/* 08CC9C 0018CB9C 3000B37B */  lq          $19, 0x30($29)
/* 08CCA0 0018CBA0 2000B27B */  lq          $18, 0x20($29)
/* 08CCA4 0018CBA4 1000B17B */  lq          $17, 0x10($29)
/* 08CCA8 0018CBA8 0000B07B */  lq          $16, 0x0($29)
/* 08CCAC 0018CBAC 4001BD27 */  addiu       $29, $29, 0x140
/* 08CCB0 0018CBB0 0800E003 */  jr          $31
/* 08CCB4 0018CBB4 00000000 */   nop
/* 08CCB8 0018CBB8 00000000 */  nop
/* 08CCBC 0018CBBC 00000000 */  nop
