.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13CTextureAnimeFP13CTexAnimeDatai
/* 67970 00167870 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 67974 00167874 1000BF7F */  sq         $31, 0x10($sp)
/* 67978 00167878 0000B07F */  sq         $16, 0x0($sp)
/* 6797C 0016787C 28868070 */  paddub     $16, $4, $0
/* 67980 00167880 089E050C */  jal        Initialize__13CTextureAnimeFP13CTexAnimeDatai
/* 67984 00167884 00000000 */   nop
/* 67988 00167888 28160072 */  paddub     $2, $16, $0
/* 6798C 0016788C 1000BF7B */  lq         $31, 0x10($sp)
/* 67990 00167890 0000B07B */  lq         $16, 0x0($sp)
/* 67994 00167894 2000BD27 */  addiu      $sp, $sp, 0x20
/* 67998 00167898 0800E003 */  jr         $31
/* 6799C 0016789C 00000000 */   nop
