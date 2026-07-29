.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TexAnimeOff__10CCharacterFi
/* 0381B0 001380B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0381B4 001380B4 0000BF7F */  sq          $31, 0x0($29)
/* 0381B8 001380B8 DC008424 */  addiu       $4, $4, 0xDC
/* 0381BC 001380BC E09E050C */  jal         Disable__13CTextureAnimeFi
/* 0381C0 001380C0 00000000 */   nop
/* 0381C4 001380C4 0000BF7B */  lq          $31, 0x0($29)
/* 0381C8 001380C8 1000BD27 */  addiu       $29, $29, 0x10
/* 0381CC 001380CC 0800E003 */  jr          $31
/* 0381D0 001380D0 00000000 */   nop
/* 0381D4 001380D4 00000000 */  nop
/* 0381D8 001380D8 00000000 */  nop
/* 0381DC 001380DC 00000000 */  nop
