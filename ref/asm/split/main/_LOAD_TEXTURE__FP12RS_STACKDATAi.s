.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_TEXTURE__FP12RS_STACKDATAi
/* 08CCC0 0018CBC0 B0FEBD27 */  addiu       $29, $29, -0x150
/* 08CCC4 0018CBC4 7000BF7F */  sq          $31, 0x70($29)
/* 08CCC8 0018CBC8 6000B67F */  sq          $22, 0x60($29)
/* 08CCCC 0018CBCC 5000B57F */  sq          $21, 0x50($29)
/* 08CCD0 0018CBD0 4000B47F */  sq          $20, 0x40($29)
/* 08CCD4 0018CBD4 3000B37F */  sq          $19, 0x30($29)
/* 08CCD8 0018CBD8 2000B27F */  sq          $18, 0x20($29)
/* 08CCDC 0018CBDC 1000B17F */  sq          $17, 0x10($29)
/* 08CCE0 0018CBE0 0000B07F */  sq          $16, 0x0($29)
/* 08CCE4 0018CBE4 28AEA070 */  paddub      $21, $5, $0
/* 08CCE8 0018CBE8 08009624 */  addiu       $22, $4, 0x8
/* 08CCEC 0018CBEC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08CCF0 0018CBF0 00000000 */   nop
/* 08CCF4 0018CBF4 2D005024 */  addiu       $16, $2, 0x2D
/* 08CCF8 0018CBF8 3200012A */  slti        $1, $16, 0x32
/* 08CCFC 0018CBFC 04002010 */  beqz        $1, .L0018CC10
/* 08CD00 0018CC00 00000000 */   nop
/* 08CD04 0018CC04 2D00012A */  slti        $1, $16, 0x2D
/* 08CD08 0018CC08 04002010 */  beqz        $1, .L0018CC1C
/* 08CD0C 0018CC0C 00000000 */   nop
.L0018CC10:
/* 08CD10 0018CC10 28160070 */  paddub      $2, $0, $0
/* 08CD14 0018CC14 47000010 */  b           .L0018CD34
/* 08CD18 0018CC18 00000000 */   nop
.L0018CC1C:
/* 08CD1C 0018CC1C A830060C */  jal         get_pack_file__Fv
/* 08CD20 0018CC20 00000000 */   nop
/* 08CD24 0018CC24 28964070 */  paddub      $18, $2, $0
/* 08CD28 0018CC28 04004016 */  bnez        $18, .L0018CC3C
/* 08CD2C 0018CC2C 00000000 */   nop
/* 08CD30 0018CC30 28160070 */  paddub      $2, $0, $0
/* 08CD34 0018CC34 3F000010 */  b           .L0018CD34
/* 08CD38 0018CC38 00000000 */   nop
.L0018CC3C:
/* 08CD3C 0018CC3C 288E0070 */  paddub      $17, $0, $0
/* 08CD40 0018CC40 23000010 */  b           .L0018CCD0
/* 08CD44 0018CC44 00000000 */   nop
.L0018CC48:
/* 08CD48 0018CC48 2826C072 */  paddub      $4, $22, $0
/* 08CD4C 0018CC4C 08009624 */  addiu       $22, $4, 0x8
/* 08CD50 0018CC50 F428060C */  jal         GetStackString__FP12RS_STACKDATA
/* 08CD54 0018CC54 00000000 */   nop
/* 08CD58 0018CC58 28264072 */  paddub      $4, $18, $0
/* 08CD5C 0018CC5C 282E4070 */  paddub      $5, $2, $0
/* 08CD60 0018CC60 4C01A627 */  addiu       $6, $29, 0x14C
/* 08CD64 0018CC64 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 08CD68 0018CC68 00000000 */   nop
/* 08CD6C 0018CC6C 289E4070 */  paddub      $19, $2, $0
/* 08CD70 0018CC70 16006012 */  beqz        $19, .L0018CCCC
/* 08CD74 0018CC74 00000000 */   nop
/* 08CD78 0018CC78 B030060C */  jal         get_buffer__Fv
/* 08CD7C 0018CC7C 00000000 */   nop
/* 08CD80 0018CC80 4C01A38F */  lw          $3, 0x14C($29)
/* 08CD84 0018CC84 03190300 */  sra         $3, $3, 4
/* 08CD88 0018CC88 01006524 */  addiu       $5, $3, 0x1
/* 08CD8C 0018CC8C 28264070 */  paddub      $4, $2, $0
/* 08CD90 0018CC90 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 08CD94 0018CC94 00000000 */   nop
/* 08CD98 0018CC98 28A64070 */  paddub      $20, $2, $0
/* 08CD9C 0018CC9C 4C01A68F */  lw          $6, 0x14C($29)
/* 08CDA0 0018CCA0 28268072 */  paddub      $4, $20, $0
/* 08CDA4 0018CCA4 282E6072 */  paddub      $5, $19, $0
/* 08CDA8 0018CCA8 EC0C040C */  jal         memcpy
/* 08CDAC 0018CCAC 00000000 */   nop
/* 08CDB0 0018CCB0 40101100 */  sll         $2, $17, 1
/* 08CDB4 0018CCB4 21105100 */  addu        $2, $2, $17
/* 08CDB8 0018CCB8 80100200 */  sll         $2, $2, 2
/* 08CDBC 0018CCBC 21105D00 */  addu        $2, $2, $29
/* 08CDC0 0018CCC0 840050AC */  sw          $16, 0x84($2)
/* 08CDC4 0018CCC4 880040AC */  sw          $0, 0x88($2)
/* 08CDC8 0018CCC8 800054AC */  sw          $20, 0x80($2)
.L0018CCCC:
/* 08CDCC 0018CCCC 01003126 */  addiu       $17, $17, 0x1
.L0018CCD0:
/* 08CDD0 0018CCD0 FFFFA226 */  addiu       $2, $21, -0x1
/* 08CDD4 0018CCD4 2A102202 */  slt         $2, $17, $2
/* 08CDD8 0018CCD8 DBFF4014 */  bnez        $2, .L0018CC48
/* 08CDDC 0018CCDC 00000000 */   nop
/* 08CDE0 0018CCE0 40101100 */  sll         $2, $17, 1
/* 08CDE4 0018CCE4 21105100 */  addu        $2, $2, $17
/* 08CDE8 0018CCE8 80100200 */  sll         $2, $2, 2
/* 08CDEC 0018CCEC 21105D00 */  addu        $2, $2, $29
/* 08CDF0 0018CCF0 800040AC */  sw          $0, 0x80($2)
/* 08CDF4 0018CCF4 C701023C */  lui         $2, %hi(TexManager)
/* 08CDF8 0018CCF8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CDFC 0018CCFC 282E0072 */  paddub      $5, $16, $0
/* 08CE00 0018CD00 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 08CE04 0018CD04 00000000 */   nop
/* 08CE08 0018CD08 C701023C */  lui         $2, %hi(TexManager)
/* 08CE0C 0018CD0C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CE10 0018CD10 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 08CE14 0018CD14 00000000 */   nop
/* 08CE18 0018CD18 C701023C */  lui         $2, %hi(TexManager)
/* 08CE1C 0018CD1C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08CE20 0018CD20 282E0072 */  paddub      $5, $16, $0
/* 08CE24 0018CD24 8000A627 */  addiu       $6, $29, 0x80
/* 08CE28 0018CD28 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 08CE2C 0018CD2C 00000000 */   nop
/* 08CE30 0018CD30 01000224 */  addiu       $2, $0, 0x1
.L0018CD34:
/* 08CE34 0018CD34 7000BF7B */  lq          $31, 0x70($29)
/* 08CE38 0018CD38 6000B67B */  lq          $22, 0x60($29)
/* 08CE3C 0018CD3C 5000B57B */  lq          $21, 0x50($29)
/* 08CE40 0018CD40 4000B47B */  lq          $20, 0x40($29)
/* 08CE44 0018CD44 3000B37B */  lq          $19, 0x30($29)
/* 08CE48 0018CD48 2000B27B */  lq          $18, 0x20($29)
/* 08CE4C 0018CD4C 1000B17B */  lq          $17, 0x10($29)
/* 08CE50 0018CD50 0000B07B */  lq          $16, 0x0($29)
/* 08CE54 0018CD54 5001BD27 */  addiu       $29, $29, 0x150
/* 08CE58 0018CD58 0800E003 */  jr          $31
/* 08CE5C 0018CD5C 00000000 */   nop
