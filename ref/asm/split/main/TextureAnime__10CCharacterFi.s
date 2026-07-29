.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TextureAnime__10CCharacterFi
/* 038150 00138050 F0FFBD27 */  addiu       $29, $29, -0x10
/* 038154 00138054 0000BF7F */  sq          $31, 0x0($29)
/* 038158 00138058 DC008424 */  addiu       $4, $4, 0xDC
/* 03815C 0013805C 5C9C050C */  jal         TexAnime__13CTextureAnimeFi
/* 038160 00138060 00000000 */   nop
/* 038164 00138064 0000BF7B */  lq          $31, 0x0($29)
/* 038168 00138068 1000BD27 */  addiu       $29, $29, 0x10
/* 03816C 0013806C 0800E003 */  jr          $31
/* 038170 00138070 00000000 */   nop
/* 038174 00138074 00000000 */  nop
/* 038178 00138078 00000000 */  nop
/* 03817C 0013807C 00000000 */  nop
