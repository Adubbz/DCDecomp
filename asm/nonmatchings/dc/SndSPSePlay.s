.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSPSePlay__Fii
/* 5B980 0015B880 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5B984 0015B884 0000BF7F */  sq         $31, 0x0($sp)
/* 5B988 0015B888 2846A070 */  paddub     $8, $5, $0
/* 5B98C 0015B88C 6C6D050C */  jal        GetSPInfo__Fi
/* 5B990 0015B890 00000000 */   nop
/* 5B994 0015B894 15004010 */  beqz       $2, .L0015B8EC
/* 5B998 0015B898 00000000 */   nop
/* 5B99C 0015B89C 04004684 */  lh         $6, 0x4($2)
/* 5B9A0 0015B8A0 0200C104 */  bgez       $6, .L0015B8AC
/* 5B9A4 0015B8A4 00000000 */   nop
/* 5B9A8 0015B8A8 40000824 */  addiu      $8, $0, 0x40
.L0015B8AC:
/* 5B9AC 0015B8AC 08000105 */  bgez       $8, .L0015B8D0
/* 5B9B0 0015B8B0 00000000 */   nop
/* 5B9B4 0015B8B4 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B9B8 0015B8B8 0C000524 */  addiu      $5, $0, 0xC
/* 5B9BC 0015B8BC 283E0070 */  paddub     $7, $0, $0
/* 5B9C0 0015B8C0 F015050C */  jal        SE_Play__6CSoundFiii
/* 5B9C4 0015B8C4 00000000 */   nop
/* 5B9C8 0015B8C8 08000010 */  b          .L0015B8EC
/* 5B9CC 0015B8CC 00000000 */   nop
.L0015B8D0:
/* 5B9D0 0015B8D0 00004680 */  lb         $6, 0x0($2)
/* 5B9D4 0015B8D4 01004780 */  lb         $7, 0x1($2)
/* 5B9D8 0015B8D8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5B9DC 0015B8DC 0C000524 */  addiu      $5, $0, 0xC
/* 5B9E0 0015B8E0 284E0070 */  paddub     $9, $0, $0
/* 5B9E4 0015B8E4 0816050C */  jal        SE_Play__6CSoundFiiiii
/* 5B9E8 0015B8E8 00000000 */   nop
.L0015B8EC:
/* 5B9EC 0015B8EC 0000BF7B */  lq         $31, 0x0($sp)
/* 5B9F0 0015B8F0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5B9F4 0015B8F4 0800E003 */  jr         $31
/* 5B9F8 0015B8F8 00000000 */   nop
/* 5B9FC 0015B8FC 00000000 */  nop
