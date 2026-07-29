.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTempTexture__FiPc
/* 0002F0 01DABFF0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0002F4 01DABFF4 1000BF7F */  sq          $31, 0x10($29)
/* 0002F8 01DABFF8 0000B07F */  sq          $16, 0x0($29)
/* 0002FC 01DABFFC 28868070 */  paddub      $16, $4, $0
/* 000300 01DAC000 DC01023C */  lui         $2, %hi(LIT_665__4)
/* 000304 01DAC004 30274224 */  addiu       $2, $2, %lo(LIT_665__4)
/* 000308 01DAC008 2000A427 */  addiu       $4, $29, 0x20
/* 00030C 01DAC00C 00004378 */  lq          $3, 0x0($2)
/* 000310 01DAC010 100042DC */  ld          $2, 0x10($2)
/* 000314 01DAC014 0000837C */  sq          $3, 0x0($4)
/* 000318 01DAC018 100082FC */  sd          $2, 0x10($4)
/* 00031C 01DAC01C 2400B0AF */  sw          $16, 0x24($29)
/* 000320 01DAC020 2000A5AF */  sw          $5, 0x20($29)
/* 000324 01DAC024 C701023C */  lui         $2, %hi(TexManager)
/* 000328 01DAC028 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00032C 01DAC02C 282E0072 */  paddub      $5, $16, $0
/* 000330 01DAC030 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 000334 01DAC034 00000000 */   nop
/* 000338 01DAC038 C701023C */  lui         $2, %hi(TexManager)
/* 00033C 01DAC03C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 000340 01DAC040 282E0072 */  paddub      $5, $16, $0
/* 000344 01DAC044 2000A627 */  addiu       $6, $29, 0x20
/* 000348 01DAC048 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 00034C 01DAC04C 00000000 */   nop
/* 000350 01DAC050 1000BF7B */  lq          $31, 0x10($29)
/* 000354 01DAC054 0000B07B */  lq          $16, 0x0($29)
/* 000358 01DAC058 4000BD27 */  addiu       $29, $29, 0x40
/* 00035C 01DAC05C 0800E003 */  jr          $31
/* 000360 01DAC060 00000000 */   nop
/* 000364 01DAC064 00000000 */  nop
/* 000368 01DAC068 00000000 */  nop
/* 00036C 01DAC06C 00000000 */  nop
