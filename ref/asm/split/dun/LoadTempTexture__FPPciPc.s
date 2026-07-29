.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadTempTexture__FPPciPc
/* 0001D0 01DABED0 40FFBD27 */  addiu       $29, $29, -0xC0
/* 0001D4 01DABED4 5000BF7F */  sq          $31, 0x50($29)
/* 0001D8 01DABED8 4000B47F */  sq          $20, 0x40($29)
/* 0001DC 01DABEDC 3000B37F */  sq          $19, 0x30($29)
/* 0001E0 01DABEE0 2000B27F */  sq          $18, 0x20($29)
/* 0001E4 01DABEE4 1000B17F */  sq          $17, 0x10($29)
/* 0001E8 01DABEE8 0000B07F */  sq          $16, 0x0($29)
/* 0001EC 01DABEEC 28A68070 */  paddub      $20, $4, $0
/* 0001F0 01DABEF0 289EA070 */  paddub      $19, $5, $0
/* 0001F4 01DABEF4 2896C070 */  paddub      $18, $6, $0
/* 0001F8 01DABEF8 DC01023C */  lui         $2, %hi(LIT_656__7)
/* 0001FC 01DABEFC D0264524 */  addiu       $5, $2, %lo(LIT_656__7)
/* 000200 01DABF00 6000A427 */  addiu       $4, $29, 0x60
/* 000204 01DABF04 05000324 */  addiu       $3, $0, 0x5
.L01DABF08_2E7508:
/* 000208 01DABF08 0000A278 */  lq          $2, 0x0($5)
/* 00020C 01DABF0C 1000A524 */  addiu       $5, $5, 0x10
/* 000210 01DABF10 FFFF6324 */  addiu       $3, $3, -0x1
/* 000214 01DABF14 0000827C */  sq          $2, 0x0($4)
/* 000218 01DABF18 10008424 */  addiu       $4, $4, 0x10
/* 00021C 01DABF1C FAFF601C */  bgtz        $3, .L01DABF08_2E7508
/* 000220 01DABF20 00000000 */   nop
/* 000224 01DABF24 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 000228 01DABF28 000082E4 */  swc1        $f2, 0x0($4)
/* 00022C 01DABF2C 28860070 */  paddub      $16, $0, $0
/* 000230 01DABF30 288E0070 */  paddub      $17, $0, $0
/* 000234 01DABF34 14000010 */  b           .L01DABF88_2E7588
/* 000238 01DABF38 00000000 */   nop
.L01DABF3C_2E753C:
/* 00023C 01DABF3C 282E4072 */  paddub      $5, $18, $0
/* 000240 01DABF40 BC00A627 */  addiu       $6, $29, 0xBC
/* 000244 01DABF44 D8FC040C */  jal         LoadFile__FPcPvPi
/* 000248 01DABF48 00000000 */   nop
/* 00024C 01DABF4C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 000250 01DABF50 00000000 */   nop
/* 000254 01DABF54 BC00A38F */  lw          $3, 0xBC($29)
/* 000258 01DABF58 21882302 */  addu        $17, $17, $3
/* 00025C 01DABF5C 40101000 */  sll         $2, $16, 1
/* 000260 01DABF60 21105000 */  addu        $2, $2, $16
/* 000264 01DABF64 80100200 */  sll         $2, $2, 2
/* 000268 01DABF68 21105D00 */  addu        $2, $2, $29
/* 00026C 01DABF6C 640053AC */  sw          $19, 0x64($2)
/* 000270 01DABF70 600052AC */  sw          $18, 0x60($2)
/* 000274 01DABF74 83110300 */  sra         $2, $3, 6
/* 000278 01DABF78 01004224 */  addiu       $2, $2, 0x1
/* 00027C 01DABF7C 80110200 */  sll         $2, $2, 6
/* 000280 01DABF80 21904202 */  addu        $18, $18, $2
/* 000284 01DABF84 01001026 */  addiu       $16, $16, 0x1
.L01DABF88_2E7588:
/* 000288 01DABF88 80101000 */  sll         $2, $16, 2
/* 00028C 01DABF8C 21108202 */  addu        $2, $20, $2
/* 000290 01DABF90 0000448C */  lw          $4, 0x0($2)
/* 000294 01DABF94 E9FF8014 */  bnez        $4, .L01DABF3C_2E753C
/* 000298 01DABF98 00000000 */   nop
/* 00029C 01DABF9C C701023C */  lui         $2, %hi(TexManager)
/* 0002A0 01DABFA0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0002A4 01DABFA4 282E6072 */  paddub      $5, $19, $0
/* 0002A8 01DABFA8 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0002AC 01DABFAC 00000000 */   nop
/* 0002B0 01DABFB0 C701023C */  lui         $2, %hi(TexManager)
/* 0002B4 01DABFB4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0002B8 01DABFB8 282E6072 */  paddub      $5, $19, $0
/* 0002BC 01DABFBC 6000A627 */  addiu       $6, $29, 0x60
/* 0002C0 01DABFC0 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0002C4 01DABFC4 00000000 */   nop
/* 0002C8 01DABFC8 28162072 */  paddub      $2, $17, $0
/* 0002CC 01DABFCC 5000BF7B */  lq          $31, 0x50($29)
/* 0002D0 01DABFD0 4000B47B */  lq          $20, 0x40($29)
/* 0002D4 01DABFD4 3000B37B */  lq          $19, 0x30($29)
/* 0002D8 01DABFD8 2000B27B */  lq          $18, 0x20($29)
/* 0002DC 01DABFDC 1000B17B */  lq          $17, 0x10($29)
/* 0002E0 01DABFE0 0000B07B */  lq          $16, 0x0($29)
/* 0002E4 01DABFE4 C000BD27 */  addiu       $29, $29, 0xC0
/* 0002E8 01DABFE8 0800E003 */  jr          $31
/* 0002EC 01DABFEC 00000000 */   nop
