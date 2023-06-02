.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TexAnimeOn__10CCharacterFi
/* 38180 00138080 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 38184 00138084 0000BF7F */  sq         $31, 0x0($sp)
/* 38188 00138088 DC008424 */  addiu      $4, $4, 0xDC
/* 3818C 0013808C D09E050C */  jal        Enable__13CTextureAnimeFi
/* 38190 00138090 00000000 */   nop
/* 38194 00138094 0000BF7B */  lq         $31, 0x0($sp)
/* 38198 00138098 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3819C 0013809C 0800E003 */  jr         $31
/* 381A0 001380A0 00000000 */   nop
/* 381A4 001380A4 00000000 */  nop
/* 381A8 001380A8 00000000 */  nop
/* 381AC 001380AC 00000000 */  nop
