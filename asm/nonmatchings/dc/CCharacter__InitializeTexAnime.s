.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* 380F0 00137FF0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 380F4 00137FF4 0000BF7F */  sq         $31, 0x0($sp)
/* 380F8 00137FF8 DC008424 */  addiu      $4, $4, 0xDC
/* 380FC 00137FFC 089E050C */  jal        Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 38100 00138000 00000000 */   nop
/* 38104 00138004 0000BF7B */  lq         $31, 0x0($sp)
/* 38108 00138008 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3810C 0013800C 0800E003 */  jr         $31
/* 38110 00138010 00000000 */   nop
/* 38114 00138014 00000000 */  nop
/* 38118 00138018 00000000 */  nop
/* 3811C 0013801C 00000000 */  nop
