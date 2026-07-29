.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TexAnimeOn__10CCharacterFi
/* 038180 00138080 F0FFBD27 */  addiu       $29, $29, -0x10
/* 038184 00138084 0000BF7F */  sq          $31, 0x0($29)
/* 038188 00138088 DC008424 */  addiu       $4, $4, 0xDC
/* 03818C 0013808C D09E050C */  jal         Enable__13CTextureAnimeFi
/* 038190 00138090 00000000 */   nop
/* 038194 00138094 0000BF7B */  lq          $31, 0x0($29)
/* 038198 00138098 1000BD27 */  addiu       $29, $29, 0x10
/* 03819C 0013809C 0800E003 */  jr          $31
/* 0381A0 001380A0 00000000 */   nop
/* 0381A4 001380A4 00000000 */  nop
/* 0381A8 001380A8 00000000 */  nop
/* 0381AC 001380AC 00000000 */  nop
