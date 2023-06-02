.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearEventFlag__11CUserStatusFv
/* BDC20 001BDB20 282E0070 */  paddub     $5, $0, $0
/* BDC24 001BDB24 06000010 */  b          .L001BDB40
/* BDC28 001BDB28 00000000 */   nop
.L001BDB2C:
/* BDC2C 001BDB2C 2118A400 */  addu       $3, $5, $4
/* BDC30 001BDB30 0100013C */  lui        $at, (0x10000 >> 16)
/* BDC34 001BDB34 21086100 */  addu       $at, $3, $at
/* BDC38 001BDB38 A48A20A0 */  sb         $0, -0x755C($at)
/* BDC3C 001BDB3C 0100A524 */  addiu      $5, $5, 0x1
.L001BDB40:
/* BDC40 001BDB40 3200A328 */  slti       $3, $5, 0x32
/* BDC44 001BDB44 F9FF6014 */  bnez       $3, .L001BDB2C
/* BDC48 001BDB48 00000000 */   nop
/* BDC4C 001BDB4C 0800E003 */  jr         $31
/* BDC50 001BDB50 00000000 */   nop
/* BDC54 001BDB54 00000000 */  nop
/* BDC58 001BDB58 00000000 */  nop
/* BDC5C 001BDB5C 00000000 */  nop
