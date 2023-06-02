.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearTexAnime__10CCharacterFv
/* 38120 00138020 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 38124 00138024 0000BF7F */  sq         $31, 0x0($sp)
/* 38128 00138028 DC008424 */  addiu      $4, $4, 0xDC
/* 3812C 0013802C B89E050C */  jal        DisableAll__13CTextureAnimeFv
/* 38130 00138030 00000000 */   nop
/* 38134 00138034 0000BF7B */  lq         $31, 0x0($sp)
/* 38138 00138038 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3813C 0013803C 0800E003 */  jr         $31
/* 38140 00138040 00000000 */   nop
/* 38144 00138044 00000000 */  nop
/* 38148 00138048 00000000 */  nop
/* 3814C 0013804C 00000000 */  nop
