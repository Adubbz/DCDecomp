.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 067970 00167870 E0FFBD27 */  addiu       $29, $29, -0x20
/* 067974 00167874 1000BF7F */  sq          $31, 0x10($29)
/* 067978 00167878 0000B07F */  sq          $16, 0x0($29)
/* 06797C 0016787C 28868070 */  paddub      $16, $4, $0
/* 067980 00167880 089E050C */  jal         Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 067984 00167884 00000000 */   nop
/* 067988 00167888 28160072 */  paddub      $2, $16, $0
/* 06798C 0016788C 1000BF7B */  lq          $31, 0x10($29)
/* 067990 00167890 0000B07B */  lq          $16, 0x0($29)
/* 067994 00167894 2000BD27 */  addiu       $29, $29, 0x20
/* 067998 00167898 0800E003 */  jr          $31
/* 06799C 0016789C 00000000 */   nop
