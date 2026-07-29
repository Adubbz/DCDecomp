.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClearTexAnime__10CCharacterFv
/* 038120 00138020 F0FFBD27 */  addiu       $29, $29, -0x10
/* 038124 00138024 0000BF7F */  sq          $31, 0x0($29)
/* 038128 00138028 DC008424 */  addiu       $4, $4, 0xDC
/* 03812C 0013802C B89E050C */  jal         DisableAll__13CTextureAnimeFv
/* 038130 00138030 00000000 */   nop
/* 038134 00138034 0000BF7B */  lq          $31, 0x0($29)
/* 038138 00138038 1000BD27 */  addiu       $29, $29, 0x10
/* 03813C 0013803C 0800E003 */  jr          $31
/* 038140 00138040 00000000 */   nop
/* 038144 00138044 00000000 */  nop
/* 038148 00138048 00000000 */  nop
/* 03814C 0013804C 00000000 */  nop
