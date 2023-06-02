.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowSelectLanguage__Fi
/* 12BB10 0022BA10 04008004 */  bltz       $4, .L0022BA24
/* 12BB14 0022BA14 00000000 */   nop
/* 12BB18 0022BA18 07008228 */  slti       $2, $4, 0x7
/* 12BB1C 0022BA1C 02004014 */  bnez       $2, .L0022BA28
/* 12BB20 0022BA20 00000000 */   nop
.L0022BA24:
/* 12BB24 0022BA24 28260070 */  paddub     $4, $0, $0
.L0022BA28:
/* 12BB28 0022BA28 80180400 */  sll        $3, $4, 2
/* 12BB2C 0022BA2C 2900023C */  lui        $2, %hi(ComMenuContryName)
/* 12BB30 0022BA30 70444224 */  addiu      $2, $2, %lo(ComMenuContryName)
/* 12BB34 0022BA34 21104300 */  addu       $2, $2, $3
/* 12BB38 0022BA38 0000428C */  lw         $2, 0x0($2)
/* 12BB3C 0022BA3C 0800E003 */  jr         $31
/* 12BB40 0022BA40 00000000 */   nop
/* 12BB44 0022BA44 00000000 */  nop
/* 12BB48 0022BA48 00000000 */  nop
/* 12BB4C 0022BA4C 00000000 */  nop
