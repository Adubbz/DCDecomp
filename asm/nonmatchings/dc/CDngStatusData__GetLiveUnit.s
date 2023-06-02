.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLiveUnit__14CDngStatusDataFv
/* BDDF0 001BDCF0 28160070 */  paddub     $2, $0, $0
/* BDDF4 001BDCF4 282E0070 */  paddub     $5, $0, $0
/* BDDF8 001BDCF8 08000010 */  b          .L001BDD1C
/* BDDFC 001BDCFC 00000000 */   nop
.L001BDD00:
/* BDE00 001BDD00 40180500 */  sll        $3, $5, 1
/* BDE04 001BDD04 21186400 */  addu       $3, $3, $4
/* BDE08 001BDD08 12006384 */  lh         $3, 0x12($3)
/* BDE0C 001BDD0C 02006018 */  blez       $3, .L001BDD18
/* BDE10 001BDD10 00000000 */   nop
/* BDE14 001BDD14 01004224 */  addiu      $2, $2, 0x1
.L001BDD18:
/* BDE18 001BDD18 0100A524 */  addiu      $5, $5, 0x1
.L001BDD1C:
/* BDE1C 001BDD1C 05008380 */  lb         $3, 0x5($4)
/* BDE20 001BDD20 2A18A300 */  slt        $3, $5, $3
/* BDE24 001BDD24 F6FF6014 */  bnez       $3, .L001BDD00
/* BDE28 001BDD28 00000000 */   nop
/* BDE2C 001BDD2C 0800E003 */  jr         $31
/* BDE30 001BDD30 00000000 */   nop
/* BDE34 001BDD34 00000000 */  nop
/* BDE38 001BDD38 00000000 */  nop
/* BDE3C 001BDD3C 00000000 */  nop
