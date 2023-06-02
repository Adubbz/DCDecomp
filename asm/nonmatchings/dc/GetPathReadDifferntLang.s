.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPathReadDifferntLang__FPc
/* 12BB50 0022BA50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12BB54 0022BA54 1000BF7F */  sq         $31, 0x10($sp)
/* 12BB58 0022BA58 0000B07F */  sq         $16, 0x0($sp)
/* 12BB5C 0022BA5C 28868070 */  paddub     $16, $4, $0
/* 12BB60 0022BA60 7CAE080C */  jal        GetMenuTextureDir__Fv
/* 12BB64 0022BA64 00000000 */   nop
/* 12BB68 0022BA68 28260072 */  paddub     $4, $16, $0
/* 12BB6C 0022BA6C 282E4070 */  paddub     $5, $2, $0
/* 12BB70 0022BA70 5A15040C */  jal        strcpy
/* 12BB74 0022BA74 00000000 */   nop
/* 12BB78 0022BA78 80AE080C */  jal        GetMenuLangFlag__Fv
/* 12BB7C 0022BA7C 00000000 */   nop
/* 12BB80 0022BA80 28264070 */  paddub     $4, $2, $0
/* 12BB84 0022BA84 84AE080C */  jal        GetNowSelectLanguage__Fi
/* 12BB88 0022BA88 00000000 */   nop
/* 12BB8C 0022BA8C 28260072 */  paddub     $4, $16, $0
/* 12BB90 0022BA90 282E4070 */  paddub     $5, $2, $0
/* 12BB94 0022BA94 BC14040C */  jal        strcat
/* 12BB98 0022BA98 00000000 */   nop
/* 12BB9C 0022BA9C 1000BF7B */  lq         $31, 0x10($sp)
/* 12BBA0 0022BAA0 0000B07B */  lq         $16, 0x0($sp)
/* 12BBA4 0022BAA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12BBA8 0022BAA8 0800E003 */  jr         $31
/* 12BBAC 0022BAAC 00000000 */   nop
