.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TexAnimeOff__10CCharacterFi
/* 381B0 001380B0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 381B4 001380B4 0000BF7F */  sq         $31, 0x0($sp)
/* 381B8 001380B8 DC008424 */  addiu      $4, $4, 0xDC
/* 381BC 001380BC E09E050C */  jal        Disable__13CTextureAnimeFi
/* 381C0 001380C0 00000000 */   nop
/* 381C4 001380C4 0000BF7B */  lq         $31, 0x0($sp)
/* 381C8 001380C8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 381CC 001380CC 0800E003 */  jr         $31
/* 381D0 001380D0 00000000 */   nop
/* 381D4 001380D4 00000000 */  nop
/* 381D8 001380D8 00000000 */  nop
/* 381DC 001380DC 00000000 */  nop
