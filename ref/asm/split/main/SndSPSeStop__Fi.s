.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSPSeStop__Fi
/* 05BA00 0015B900 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05BA04 0015B904 0000BF7F */  sq          $31, 0x0($29)
/* 05BA08 0015B908 6C6D050C */  jal         GetSPInfo__Fi
/* 05BA0C 0015B90C 00000000 */   nop
/* 05BA10 0015B910 08004010 */  beqz        $2, .L0015B934
/* 05BA14 0015B914 00000000 */   nop
/* 05BA18 0015B918 00004680 */  lb          $6, 0x0($2)
/* 05BA1C 0015B91C 01004780 */  lb          $7, 0x1($2)
/* 05BA20 0015B920 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05BA24 0015B924 0C000524 */  addiu       $5, $0, 0xC
/* 05BA28 0015B928 28460070 */  paddub      $8, $0, $0
/* 05BA2C 0015B92C BC16050C */  jal         SE_Stop__6CSoundFiiii
/* 05BA30 0015B930 00000000 */   nop
.L0015B934:
/* 05BA34 0015B934 0000BF7B */  lq          $31, 0x0($29)
/* 05BA38 0015B938 1000BD27 */  addiu       $29, $29, 0x10
/* 05BA3C 0015B93C 0800E003 */  jr          $31
/* 05BA40 0015B940 00000000 */   nop
/* 05BA44 0015B944 00000000 */  nop
/* 05BA48 0015B948 00000000 */  nop
/* 05BA4C 0015B94C 00000000 */  nop
