.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 0380F0 00137FF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0380F4 00137FF4 0000BF7F */  sq          $31, 0x0($29)
/* 0380F8 00137FF8 DC008424 */  addiu       $4, $4, 0xDC
/* 0380FC 00137FFC 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 038100 00138000 00000000 */   nop
/* 038104 00138004 0000BF7B */  lq          $31, 0x0($29)
/* 038108 00138008 1000BD27 */  addiu       $29, $29, 0x10
/* 03810C 0013800C 0800E003 */  jr          $31
/* 038110 00138010 00000000 */   nop
/* 038114 00138014 00000000 */  nop
/* 038118 00138018 00000000 */  nop
/* 03811C 0013801C 00000000 */  nop
