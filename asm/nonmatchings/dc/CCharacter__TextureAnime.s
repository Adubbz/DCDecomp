.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TextureAnime__10CCharacterFi
/* 38150 00138050 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 38154 00138054 0000BF7F */  sq         $31, 0x0($sp)
/* 38158 00138058 DC008424 */  addiu      $4, $4, 0xDC
/* 3815C 0013805C 5C9C050C */  jal        TexAnime__13CTextureAnimeFi
/* 38160 00138060 00000000 */   nop
/* 38164 00138064 0000BF7B */  lq         $31, 0x0($sp)
/* 38168 00138068 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3816C 0013806C 0800E003 */  jr         $31
/* 38170 00138070 00000000 */   nop
/* 38174 00138074 00000000 */  nop
/* 38178 00138078 00000000 */  nop
/* 3817C 0013807C 00000000 */  nop
