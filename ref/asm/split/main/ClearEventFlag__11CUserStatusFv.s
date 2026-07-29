.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClearEventFlag__11CUserStatusFv
/* 0BDC20 001BDB20 282E0070 */  paddub      $5, $0, $0
/* 0BDC24 001BDB24 06000010 */  b           .L001BDB40
/* 0BDC28 001BDB28 00000000 */   nop
.L001BDB2C:
/* 0BDC2C 001BDB2C 2118A400 */  addu        $3, $5, $4
/* 0BDC30 001BDB30 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BDC34 001BDB34 21086100 */  addu        $1, $3, $1
/* 0BDC38 001BDB38 A48A20A0 */  sb          $0, -0x755C($1)
/* 0BDC3C 001BDB3C 0100A524 */  addiu       $5, $5, 0x1
.L001BDB40:
/* 0BDC40 001BDB40 3200A328 */  slti        $3, $5, 0x32
/* 0BDC44 001BDB44 F9FF6014 */  bnez        $3, .L001BDB2C
/* 0BDC48 001BDB48 00000000 */   nop
/* 0BDC4C 001BDB4C 0800E003 */  jr          $31
/* 0BDC50 001BDB50 00000000 */   nop
/* 0BDC54 001BDB54 00000000 */  nop
/* 0BDC58 001BDB58 00000000 */  nop
/* 0BDC5C 001BDB5C 00000000 */  nop
