.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSPSeStop__Fi
/* 5BA00 0015B900 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5BA04 0015B904 0000BF7F */  sq         $31, 0x0($sp)
/* 5BA08 0015B908 6C6D050C */  jal        GetSPInfo__Fi
/* 5BA0C 0015B90C 00000000 */   nop
/* 5BA10 0015B910 08004010 */  beqz       $2, .L0015B934
/* 5BA14 0015B914 00000000 */   nop
/* 5BA18 0015B918 00004680 */  lb         $6, 0x0($2)
/* 5BA1C 0015B91C 01004780 */  lb         $7, 0x1($2)
/* 5BA20 0015B920 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5BA24 0015B924 0C000524 */  addiu      $5, $0, 0xC
/* 5BA28 0015B928 28460070 */  paddub     $8, $0, $0
/* 5BA2C 0015B92C BC16050C */  jal        SE_Stop__6CSoundFiiii
/* 5BA30 0015B930 00000000 */   nop
.L0015B934:
/* 5BA34 0015B934 0000BF7B */  lq         $31, 0x0($sp)
/* 5BA38 0015B938 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5BA3C 0015B93C 0800E003 */  jr         $31
/* 5BA40 0015B940 00000000 */   nop
/* 5BA44 0015B944 00000000 */  nop
/* 5BA48 0015B948 00000000 */  nop
/* 5BA4C 0015B94C 00000000 */  nop
