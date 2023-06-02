.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraBoardKey__Fv
/* 11CB90 0021CA90 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 11CB94 0021CA94 7000BF7F */  sq         $31, 0x70($sp)
/* 11CB98 0021CA98 6000B67F */  sq         $22, 0x60($sp)
/* 11CB9C 0021CA9C 5000B57F */  sq         $21, 0x50($sp)
/* 11CBA0 0021CAA0 4000B47F */  sq         $20, 0x40($sp)
/* 11CBA4 0021CAA4 3000B37F */  sq         $19, 0x30($sp)
/* 11CBA8 0021CAA8 2000B27F */  sq         $18, 0x20($sp)
/* 11CBAC 0021CAAC 1000B17F */  sq         $17, 0x10($sp)
/* 11CBB0 0021CAB0 0000B07F */  sq         $16, 0x0($sp)
/* 11CBB4 0021CAB4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CBB8 0021CAB8 D480368C */  lw         $22, -0x7F2C($at)
/* 11CBBC 0021CABC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CBC0 0021CAC0 DC802484 */  lh         $4, -0x7F24($at)
/* 11CBC4 0021CAC4 E061080C */  jal        AtraBoardMaxNum__Fi
/* 11CBC8 0021CAC8 00000000 */   nop
/* 11CBCC 0021CACC 28864070 */  paddub     $16, $2, $0
/* 11CBD0 0021CAD0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CBD4 0021CAD4 F080318C */  lw         $17, -0x7F10($at)
/* 11CBD8 0021CAD8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CBDC 0021CADC DE803284 */  lh         $18, -0x7F22($at)
/* 11CBE0 0021CAE0 289E0070 */  paddub     $19, $0, $0
/* 11CBE4 0021CAE4 28A60070 */  paddub     $20, $0, $0
/* 11CBE8 0021CAE8 FFFF1524 */  addiu      $21, $0, -0x1
/* 11CBEC 0021CAEC CC01023C */  lui        $2, %hi(GamePad)
/* 11CBF0 0021CAF0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11CBF4 0021CAF4 00100524 */  addiu      $5, $0, 0x1000
/* 11CBF8 0021CAF8 1CAE040C */  jal        Down__8CGamePadFi
/* 11CBFC 0021CAFC 00000000 */   nop
/* 11CC00 0021CB00 5B004010 */  beqz       $2, .L0021CC70
/* 11CC04 0021CB04 00000000 */   nop
/* 11CC08 0021CB08 01001324 */  addiu      $19, $0, 0x1
/* 11CC0C 0021CB0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC10 0021CB10 F080238C */  lw         $3, -0x7F10($at)
/* 11CC14 0021CB14 0D006014 */  bnez       $3, .L0021CB4C
/* 11CC18 0021CB18 00000000 */   nop
/* 11CC1C 0021CB1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC20 0021CB20 DE802284 */  lh         $2, -0x7F22($at)
/* 11CC24 0021CB24 2A080200 */  slt        $at, $0, $2
/* 11CC28 0021CB28 04002010 */  beqz       $at, .L0021CB3C
/* 11CC2C 0021CB2C 00000000 */   nop
/* 11CC30 0021CB30 FFFF4224 */  addiu      $2, $2, -0x1
/* 11CC34 0021CB34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC38 0021CB38 DE8022A4 */  sh         $2, -0x7F22($at)
.L0021CB3C:
/* 11CC3C 0021CB3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC40 0021CB40 F08020AC */  sw         $0, -0x7F10($at)
/* 11CC44 0021CB44 36010010 */  b          .L0021D020
/* 11CC48 0021CB48 00000000 */   nop
.L0021CB4C:
/* 11CC4C 0021CB4C 04006228 */  slti       $2, $3, 0x4
/* 11CC50 0021CB50 09004014 */  bnez       $2, .L0021CB78
/* 11CC54 0021CB54 00000000 */   nop
/* 11CC58 0021CB58 07006128 */  slti       $at, $3, 0x7
/* 11CC5C 0021CB5C 06002010 */  beqz       $at, .L0021CB78
/* 11CC60 0021CB60 00000000 */   nop
/* 11CC64 0021CB64 FDFF6224 */  addiu      $2, $3, -0x3
/* 11CC68 0021CB68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC6C 0021CB6C F08022AC */  sw         $2, -0x7F10($at)
/* 11CC70 0021CB70 2B010010 */  b          .L0021D020
/* 11CC74 0021CB74 00000000 */   nop
.L0021CB78:
/* 11CC78 0021CB78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC7C 0021CB7C DE802284 */  lh         $2, -0x7F22($at)
/* 11CC80 0021CB80 2A080200 */  slt        $at, $0, $2
/* 11CC84 0021CB84 26012010 */  beqz       $at, .L0021D020
/* 11CC88 0021CB88 00000000 */   nop
/* 11CC8C 0021CB8C FFFF4224 */  addiu      $2, $2, -0x1
/* 11CC90 0021CB90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC94 0021CB94 DE8022A4 */  sh         $2, -0x7F22($at)
/* 11CC98 0021CB98 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CC9C 0021CB9C DE802484 */  lh         $4, -0x7F22($at)
/* 11CCA0 0021CBA0 8000A527 */  addiu      $5, $sp, 0x80
/* 11CCA4 0021CBA4 D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11CCA8 0021CBA8 00000000 */   nop
/* 11CCAC 0021CBAC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CCB0 0021CBB0 F080228C */  lw         $2, -0x7F10($at)
/* 11CCB4 0021CBB4 03004224 */  addiu      $2, $2, 0x3
/* 11CCB8 0021CBB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CCBC 0021CBBC F08022AC */  sw         $2, -0x7F10($at)
/* 11CCC0 0021CBC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CCC4 0021CBC4 F080228C */  lw         $2, -0x7F10($at)
/* 11CCC8 0021CBC8 FFFF4524 */  addiu      $5, $2, -0x1
/* 11CCCC 0021CBCC 8000A427 */  addiu      $4, $sp, 0x80
/* 11CCD0 0021CBD0 03000624 */  addiu      $6, $0, 0x3
/* 11CCD4 0021CBD4 1C63080C */  jal        AtoraBoardGoToPos__FPiii
/* 11CCD8 0021CBD8 00000000 */   nop
/* 11CCDC 0021CBDC 282E4070 */  paddub     $5, $2, $0
/* 11CCE0 0021CBE0 80100200 */  sll        $2, $2, 2
/* 11CCE4 0021CBE4 21105D00 */  addu       $2, $2, $sp
/* 11CCE8 0021CBE8 8000428C */  lw         $2, 0x80($2)
/* 11CCEC 0021CBEC 06004010 */  beqz       $2, .L0021CC08
/* 11CCF0 0021CBF0 00000000 */   nop
/* 11CCF4 0021CBF4 0100A224 */  addiu      $2, $5, 0x1
/* 11CCF8 0021CBF8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CCFC 0021CBFC F08022AC */  sw         $2, -0x7F10($at)
/* 11CD00 0021CC00 07010010 */  b          .L0021D020
/* 11CD04 0021CC04 00000000 */   nop
.L0021CC08:
/* 11CD08 0021CC08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD0C 0021CC0C F080228C */  lw         $2, -0x7F10($at)
/* 11CD10 0021CC10 FDFF4224 */  addiu      $2, $2, -0x3
/* 11CD14 0021CC14 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD18 0021CC18 F08022AC */  sw         $2, -0x7F10($at)
/* 11CD1C 0021CC1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD20 0021CC20 F080228C */  lw         $2, -0x7F10($at)
/* 11CD24 0021CC24 FFFF4524 */  addiu      $5, $2, -0x1
/* 11CD28 0021CC28 28360070 */  paddub     $6, $0, $0
/* 11CD2C 0021CC2C 1C63080C */  jal        AtoraBoardGoToPos__FPiii
/* 11CD30 0021CC30 00000000 */   nop
/* 11CD34 0021CC34 282E4070 */  paddub     $5, $2, $0
/* 11CD38 0021CC38 80100200 */  sll        $2, $2, 2
/* 11CD3C 0021CC3C 21105D00 */  addu       $2, $2, $sp
/* 11CD40 0021CC40 8000428C */  lw         $2, 0x80($2)
/* 11CD44 0021CC44 06004010 */  beqz       $2, .L0021CC60
/* 11CD48 0021CC48 00000000 */   nop
/* 11CD4C 0021CC4C 0100A224 */  addiu      $2, $5, 0x1
/* 11CD50 0021CC50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD54 0021CC54 F08022AC */  sw         $2, -0x7F10($at)
/* 11CD58 0021CC58 F1000010 */  b          .L0021D020
/* 11CD5C 0021CC5C 00000000 */   nop
.L0021CC60:
/* 11CD60 0021CC60 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD64 0021CC64 F08020AC */  sw         $0, -0x7F10($at)
/* 11CD68 0021CC68 ED000010 */  b          .L0021D020
/* 11CD6C 0021CC6C 00000000 */   nop
.L0021CC70:
/* 11CD70 0021CC70 CC01023C */  lui        $2, %hi(GamePad)
/* 11CD74 0021CC74 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11CD78 0021CC78 00400524 */  addiu      $5, $0, 0x4000
/* 11CD7C 0021CC7C 1CAE040C */  jal        Down__8CGamePadFi
/* 11CD80 0021CC80 00000000 */   nop
/* 11CD84 0021CC84 85004010 */  beqz       $2, .L0021CE9C
/* 11CD88 0021CC88 00000000 */   nop
/* 11CD8C 0021CC8C 01001324 */  addiu      $19, $0, 0x1
/* 11CD90 0021CC90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CD94 0021CC94 F080238C */  lw         $3, -0x7F10($at)
/* 11CD98 0021CC98 0C006014 */  bnez       $3, .L0021CCCC
/* 11CD9C 0021CC9C 00000000 */   nop
/* 11CDA0 0021CCA0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CDA4 0021CCA4 DE802384 */  lh         $3, -0x7F22($at)
/* 11CDA8 0021CCA8 FFFF0226 */  addiu      $2, $16, -0x1
/* 11CDAC 0021CCAC 2A086200 */  slt        $at, $3, $2
/* 11CDB0 0021CCB0 DB002010 */  beqz       $at, .L0021D020
/* 11CDB4 0021CCB4 00000000 */   nop
/* 11CDB8 0021CCB8 01006224 */  addiu      $2, $3, 0x1
/* 11CDBC 0021CCBC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CDC0 0021CCC0 DE8022A4 */  sh         $2, -0x7F22($at)
/* 11CDC4 0021CCC4 D6000010 */  b          .L0021D020
/* 11CDC8 0021CCC8 00000000 */   nop
.L0021CCCC:
/* 11CDCC 0021CCCC 04006228 */  slti       $2, $3, 0x4
/* 11CDD0 0021CCD0 2D004014 */  bnez       $2, .L0021CD88
/* 11CDD4 0021CCD4 00000000 */   nop
/* 11CDD8 0021CCD8 07006128 */  slti       $at, $3, 0x7
/* 11CDDC 0021CCDC 2A002010 */  beqz       $at, .L0021CD88
/* 11CDE0 0021CCE0 00000000 */   nop
/* 11CDE4 0021CCE4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CDE8 0021CCE8 DE802384 */  lh         $3, -0x7F22($at)
/* 11CDEC 0021CCEC FFFF0226 */  addiu      $2, $16, -0x1
/* 11CDF0 0021CCF0 2A086200 */  slt        $at, $3, $2
/* 11CDF4 0021CCF4 CA002010 */  beqz       $at, .L0021D020
/* 11CDF8 0021CCF8 00000000 */   nop
/* 11CDFC 0021CCFC 01006224 */  addiu      $2, $3, 0x1
/* 11CE00 0021CD00 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE04 0021CD04 DE8022A4 */  sh         $2, -0x7F22($at)
/* 11CE08 0021CD08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE0C 0021CD0C F080228C */  lw         $2, -0x7F10($at)
/* 11CE10 0021CD10 FDFF4224 */  addiu      $2, $2, -0x3
/* 11CE14 0021CD14 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE18 0021CD18 F08022AC */  sw         $2, -0x7F10($at)
/* 11CE1C 0021CD1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE20 0021CD20 DE802484 */  lh         $4, -0x7F22($at)
/* 11CE24 0021CD24 8000A527 */  addiu      $5, $sp, 0x80
/* 11CE28 0021CD28 D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11CE2C 0021CD2C 00000000 */   nop
/* 11CE30 0021CD30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE34 0021CD34 F080228C */  lw         $2, -0x7F10($at)
/* 11CE38 0021CD38 FFFF4524 */  addiu      $5, $2, -0x1
/* 11CE3C 0021CD3C 8000A427 */  addiu      $4, $sp, 0x80
/* 11CE40 0021CD40 28360070 */  paddub     $6, $0, $0
/* 11CE44 0021CD44 1C63080C */  jal        AtoraBoardGoToPos__FPiii
/* 11CE48 0021CD48 00000000 */   nop
/* 11CE4C 0021CD4C 282E4070 */  paddub     $5, $2, $0
/* 11CE50 0021CD50 80100200 */  sll        $2, $2, 2
/* 11CE54 0021CD54 21105D00 */  addu       $2, $2, $sp
/* 11CE58 0021CD58 8000428C */  lw         $2, 0x80($2)
/* 11CE5C 0021CD5C 06004010 */  beqz       $2, .L0021CD78
/* 11CE60 0021CD60 00000000 */   nop
/* 11CE64 0021CD64 0100A224 */  addiu      $2, $5, 0x1
/* 11CE68 0021CD68 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE6C 0021CD6C F08022AC */  sw         $2, -0x7F10($at)
/* 11CE70 0021CD70 AB000010 */  b          .L0021D020
/* 11CE74 0021CD74 00000000 */   nop
.L0021CD78:
/* 11CE78 0021CD78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE7C 0021CD7C F08020AC */  sw         $0, -0x7F10($at)
/* 11CE80 0021CD80 A7000010 */  b          .L0021D020
/* 11CE84 0021CD84 00000000 */   nop
.L0021CD88:
/* 11CE88 0021CD88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CE8C 0021CD8C DE802484 */  lh         $4, -0x7F22($at)
/* 11CE90 0021CD90 8000A527 */  addiu      $5, $sp, 0x80
/* 11CE94 0021CD94 D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11CE98 0021CD98 00000000 */   nop
/* 11CE9C 0021CD9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CEA0 0021CDA0 F080228C */  lw         $2, -0x7F10($at)
/* 11CEA4 0021CDA4 03004224 */  addiu      $2, $2, 0x3
/* 11CEA8 0021CDA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CEAC 0021CDAC F08022AC */  sw         $2, -0x7F10($at)
/* 11CEB0 0021CDB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CEB4 0021CDB4 F080228C */  lw         $2, -0x7F10($at)
/* 11CEB8 0021CDB8 FFFF4524 */  addiu      $5, $2, -0x1
/* 11CEBC 0021CDBC 8000A427 */  addiu      $4, $sp, 0x80
/* 11CEC0 0021CDC0 03000624 */  addiu      $6, $0, 0x3
/* 11CEC4 0021CDC4 1C63080C */  jal        AtoraBoardGoToPos__FPiii
/* 11CEC8 0021CDC8 00000000 */   nop
/* 11CECC 0021CDCC 282E4070 */  paddub     $5, $2, $0
/* 11CED0 0021CDD0 80100200 */  sll        $2, $2, 2
/* 11CED4 0021CDD4 21105D00 */  addu       $2, $2, $sp
/* 11CED8 0021CDD8 8000428C */  lw         $2, 0x80($2)
/* 11CEDC 0021CDDC 06004010 */  beqz       $2, .L0021CDF8
/* 11CEE0 0021CDE0 00000000 */   nop
/* 11CEE4 0021CDE4 0100A224 */  addiu      $2, $5, 0x1
/* 11CEE8 0021CDE8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CEEC 0021CDEC F08022AC */  sw         $2, -0x7F10($at)
/* 11CEF0 0021CDF0 8B000010 */  b          .L0021D020
/* 11CEF4 0021CDF4 00000000 */   nop
.L0021CDF8:
/* 11CEF8 0021CDF8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CEFC 0021CDFC DE802384 */  lh         $3, -0x7F22($at)
/* 11CF00 0021CE00 FFFF0226 */  addiu      $2, $16, -0x1
/* 11CF04 0021CE04 2A086200 */  slt        $at, $3, $2
/* 11CF08 0021CE08 85002010 */  beqz       $at, .L0021D020
/* 11CF0C 0021CE0C 00000000 */   nop
/* 11CF10 0021CE10 01006224 */  addiu      $2, $3, 0x1
/* 11CF14 0021CE14 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF18 0021CE18 DE8022A4 */  sh         $2, -0x7F22($at)
/* 11CF1C 0021CE1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF20 0021CE20 F080228C */  lw         $2, -0x7F10($at)
/* 11CF24 0021CE24 FDFF4224 */  addiu      $2, $2, -0x3
/* 11CF28 0021CE28 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF2C 0021CE2C F08022AC */  sw         $2, -0x7F10($at)
/* 11CF30 0021CE30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF34 0021CE34 DE802484 */  lh         $4, -0x7F22($at)
/* 11CF38 0021CE38 8000A527 */  addiu      $5, $sp, 0x80
/* 11CF3C 0021CE3C D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11CF40 0021CE40 00000000 */   nop
/* 11CF44 0021CE44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF48 0021CE48 F080228C */  lw         $2, -0x7F10($at)
/* 11CF4C 0021CE4C FFFF4524 */  addiu      $5, $2, -0x1
/* 11CF50 0021CE50 8000A427 */  addiu      $4, $sp, 0x80
/* 11CF54 0021CE54 28360070 */  paddub     $6, $0, $0
/* 11CF58 0021CE58 1C63080C */  jal        AtoraBoardGoToPos__FPiii
/* 11CF5C 0021CE5C 00000000 */   nop
/* 11CF60 0021CE60 282E4070 */  paddub     $5, $2, $0
/* 11CF64 0021CE64 80100200 */  sll        $2, $2, 2
/* 11CF68 0021CE68 21105D00 */  addu       $2, $2, $sp
/* 11CF6C 0021CE6C 8000428C */  lw         $2, 0x80($2)
/* 11CF70 0021CE70 06004010 */  beqz       $2, .L0021CE8C
/* 11CF74 0021CE74 00000000 */   nop
/* 11CF78 0021CE78 0100A224 */  addiu      $2, $5, 0x1
/* 11CF7C 0021CE7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF80 0021CE80 F08022AC */  sw         $2, -0x7F10($at)
/* 11CF84 0021CE84 66000010 */  b          .L0021D020
/* 11CF88 0021CE88 00000000 */   nop
.L0021CE8C:
/* 11CF8C 0021CE8C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CF90 0021CE90 F08020AC */  sw         $0, -0x7F10($at)
/* 11CF94 0021CE94 62000010 */  b          .L0021D020
/* 11CF98 0021CE98 00000000 */   nop
.L0021CE9C:
/* 11CF9C 0021CE9C CC01023C */  lui        $2, %hi(GamePad)
/* 11CFA0 0021CEA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11CFA4 0021CEA4 00800534 */  ori        $5, $0, 0x8000
/* 11CFA8 0021CEA8 1CAE040C */  jal        Down__8CGamePadFi
/* 11CFAC 0021CEAC 00000000 */   nop
/* 11CFB0 0021CEB0 12004010 */  beqz       $2, .L0021CEFC
/* 11CFB4 0021CEB4 00000000 */   nop
/* 11CFB8 0021CEB8 01001324 */  addiu      $19, $0, 0x1
/* 11CFBC 0021CEBC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CFC0 0021CEC0 F080228C */  lw         $2, -0x7F10($at)
/* 11CFC4 0021CEC4 FFFF4224 */  addiu      $2, $2, -0x1
/* 11CFC8 0021CEC8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CFCC 0021CECC F08022AC */  sw         $2, -0x7F10($at)
/* 11CFD0 0021CED0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CFD4 0021CED4 F080238C */  lw         $3, -0x7F10($at)
/* 11CFD8 0021CED8 04006018 */  blez       $3, .L0021CEEC
/* 11CFDC 0021CEDC 00000000 */   nop
/* 11CFE0 0021CEE0 03000224 */  addiu      $2, $0, 0x3
/* 11CFE4 0021CEE4 4E006214 */  bne        $3, $2, .L0021D020
/* 11CFE8 0021CEE8 00000000 */   nop
.L0021CEEC:
/* 11CFEC 0021CEEC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11CFF0 0021CEF0 F08020AC */  sw         $0, -0x7F10($at)
/* 11CFF4 0021CEF4 4A000010 */  b          .L0021D020
/* 11CFF8 0021CEF8 00000000 */   nop
.L0021CEFC:
/* 11CFFC 0021CEFC CC01023C */  lui        $2, %hi(GamePad)
/* 11D000 0021CF00 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11D004 0021CF04 00200524 */  addiu      $5, $0, 0x2000
/* 11D008 0021CF08 1CAE040C */  jal        Down__8CGamePadFi
/* 11D00C 0021CF0C 00000000 */   nop
/* 11D010 0021CF10 43004010 */  beqz       $2, .L0021D020
/* 11D014 0021CF14 00000000 */   nop
/* 11D018 0021CF18 01001324 */  addiu      $19, $0, 0x1
/* 11D01C 0021CF1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D020 0021CF20 DE802484 */  lh         $4, -0x7F22($at)
/* 11D024 0021CF24 1C61080C */  jal        SearchAtoraInfo__Fi
/* 11D028 0021CF28 00000000 */   nop
/* 11D02C 0021CF2C 28864070 */  paddub     $16, $2, $0
/* 11D030 0021CF30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D034 0021CF34 DE802484 */  lh         $4, -0x7F22($at)
/* 11D038 0021CF38 8000A527 */  addiu      $5, $sp, 0x80
/* 11D03C 0021CF3C D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11D040 0021CF40 00000000 */   nop
/* 11D044 0021CF44 28160070 */  paddub     $2, $0, $0
/* 11D048 0021CF48 04000012 */  beqz       $16, .L0021CF5C
/* 11D04C 0021CF4C 00000000 */   nop
/* 11D050 0021CF50 28260072 */  paddub     $4, $16, $0
/* 11D054 0021CF54 8461080C */  jal        AtoraCompOrEvent__FP14EDITPARTS_INFO
/* 11D058 0021CF58 00000000 */   nop
.L0021CF5C:
/* 11D05C 0021CF5C 28260070 */  paddub     $4, $0, $0
/* 11D060 0021CF60 03000012 */  beqz       $16, .L0021CF70
/* 11D064 0021CF64 00000000 */   nop
/* 11D068 0021CF68 04004010 */  beqz       $2, .L0021CF7C
/* 11D06C 0021CF6C 00000000 */   nop
.L0021CF70:
/* 11D070 0021CF70 01000424 */  addiu      $4, $0, 0x1
/* 11D074 0021CF74 17000010 */  b          .L0021CFD4
/* 11D078 0021CF78 00000000 */   nop
.L0021CF7C:
/* 11D07C 0021CF7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D080 0021CF80 F080238C */  lw         $3, -0x7F10($at)
/* 11D084 0021CF84 80100300 */  sll        $2, $3, 2
/* 11D088 0021CF88 21105D00 */  addu       $2, $2, $sp
/* 11D08C 0021CF8C 8000428C */  lw         $2, 0x80($2)
/* 11D090 0021CF90 0F004010 */  beqz       $2, .L0021CFD0
/* 11D094 0021CF94 00000000 */   nop
/* 11D098 0021CF98 01006224 */  addiu      $2, $3, 0x1
/* 11D09C 0021CF9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D0A0 0021CFA0 F08022AC */  sw         $2, -0x7F10($at)
/* 11D0A4 0021CFA4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D0A8 0021CFA8 F080238C */  lw         $3, -0x7F10($at)
/* 11D0AC 0021CFAC 04000224 */  addiu      $2, $0, 0x4
/* 11D0B0 0021CFB0 04006210 */  beq        $3, $2, .L0021CFC4
/* 11D0B4 0021CFB4 00000000 */   nop
/* 11D0B8 0021CFB8 07000224 */  addiu      $2, $0, 0x7
/* 11D0BC 0021CFBC 05006214 */  bne        $3, $2, .L0021CFD4
/* 11D0C0 0021CFC0 00000000 */   nop
.L0021CFC4:
/* 11D0C4 0021CFC4 01000424 */  addiu      $4, $0, 0x1
/* 11D0C8 0021CFC8 02000010 */  b          .L0021CFD4
/* 11D0CC 0021CFCC 00000000 */   nop
.L0021CFD0:
/* 11D0D0 0021CFD0 01000424 */  addiu      $4, $0, 0x1
.L0021CFD4:
/* 11D0D4 0021CFD4 0B008010 */  beqz       $4, .L0021D004
/* 11D0D8 0021CFD8 00000000 */   nop
/* 11D0DC 0021CFDC 01000224 */  addiu      $2, $0, 0x1
/* 11D0E0 0021CFE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D0E4 0021CFE4 D08022AC */  sw         $2, -0x7F30($at)
/* 11D0E8 0021CFE8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D0EC 0021CFEC FC80238C */  lw         $3, -0x7F04($at)
/* 11D0F0 0021CFF0 80100300 */  sll        $2, $3, 2
/* 11D0F4 0021CFF4 21104300 */  addu       $2, $2, $3
/* 11D0F8 0021CFF8 05004224 */  addiu      $2, $2, 0x5
/* 11D0FC 0021CFFC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D100 0021D000 F08022AC */  sw         $2, -0x7F10($at)
.L0021D004:
/* 11D104 0021D004 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D108 0021D008 D080238C */  lw         $3, -0x7F30($at)
/* 11D10C 0021D00C 01000224 */  addiu      $2, $0, 0x1
/* 11D110 0021D010 03006214 */  bne        $3, $2, .L0021D020
/* 11D114 0021D014 00000000 */   nop
/* 11D118 0021D018 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D11C 0021D01C EC8022AC */  sw         $2, -0x7F14($at)
.L0021D020:
/* 11D120 0021D020 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D124 0021D024 D080228C */  lw         $2, -0x7F30($at)
/* 11D128 0021D028 10004014 */  bnez       $2, .L0021D06C
/* 11D12C 0021D02C 00000000 */   nop
/* 11D130 0021D030 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D134 0021D034 DE802484 */  lh         $4, -0x7F22($at)
/* 11D138 0021D038 1C61080C */  jal        SearchAtoraInfo__Fi
/* 11D13C 0021D03C 00000000 */   nop
/* 11D140 0021D040 281E0070 */  paddub     $3, $0, $0
/* 11D144 0021D044 05004010 */  beqz       $2, .L0021D05C
/* 11D148 0021D048 00000000 */   nop
/* 11D14C 0021D04C 28264070 */  paddub     $4, $2, $0
/* 11D150 0021D050 8461080C */  jal        AtoraCompOrEvent__FP14EDITPARTS_INFO
/* 11D154 0021D054 00000000 */   nop
/* 11D158 0021D058 281E4070 */  paddub     $3, $2, $0
.L0021D05C:
/* 11D15C 0021D05C 03006010 */  beqz       $3, .L0021D06C
/* 11D160 0021D060 00000000 */   nop
/* 11D164 0021D064 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D168 0021D068 F08020AC */  sw         $0, -0x7F10($at)
.L0021D06C:
/* 11D16C 0021D06C FC006016 */  bnez       $19, .L0021D460
/* 11D170 0021D070 00000000 */   nop
/* 11D174 0021D074 CC01023C */  lui        $2, %hi(GamePad)
/* 11D178 0021D078 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11D17C 0021D07C 40000524 */  addiu      $5, $0, 0x40
/* 11D180 0021D080 1CAE040C */  jal        Down__8CGamePadFi
/* 11D184 0021D084 00000000 */   nop
/* 11D188 0021D088 E0004010 */  beqz       $2, .L0021D40C
/* 11D18C 0021D08C 00000000 */   nop
/* 11D190 0021D090 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D194 0021D094 DE802484 */  lh         $4, -0x7F22($at)
/* 11D198 0021D098 1C61080C */  jal        SearchAtoraInfo__Fi
/* 11D19C 0021D09C 00000000 */   nop
/* 11D1A0 0021D0A0 28864070 */  paddub     $16, $2, $0
/* 11D1A4 0021D0A4 EE000012 */  beqz       $16, .L0021D460
/* 11D1A8 0021D0A8 00000000 */   nop
/* 11D1AC 0021D0AC 289E0070 */  paddub     $19, $0, $0
/* 11D1B0 0021D0B0 0C00038E */  lw         $3, 0xC($16)
/* 11D1B4 0021D0B4 1800028E */  lw         $2, 0x18($16)
/* 11D1B8 0021D0B8 02006214 */  bne        $3, $2, .L0021D0C4
/* 11D1BC 0021D0BC 00000000 */   nop
/* 11D1C0 0021D0C0 01001324 */  addiu      $19, $0, 0x1
.L0021D0C4:
/* 11D1C4 0021D0C4 28260072 */  paddub     $4, $16, $0
/* 11D1C8 0021D0C8 8461080C */  jal        AtoraCompOrEvent__FP14EDITPARTS_INFO
/* 11D1CC 0021D0CC 00000000 */   nop
/* 11D1D0 0021D0D0 0000048E */  lw         $4, 0x0($16)
/* 11D1D4 0021D0D4 4061080C */  jal        AtoraAllTipGet__Fi
/* 11D1D8 0021D0D8 00000000 */   nop
/* 11D1DC 0021D0DC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D1E0 0021D0E0 D480238C */  lw         $3, -0x7F2C($at)
/* 11D1E4 0021D0E4 01000424 */  addiu      $4, $0, 0x1
/* 11D1E8 0021D0E8 07006414 */  bne        $3, $4, .L0021D108
/* 11D1EC 0021D0EC 00000000 */   nop
/* 11D1F0 0021D0F0 0A000224 */  addiu      $2, $0, 0xA
/* 11D1F4 0021D0F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D1F8 0021D0F8 5C8222AC */  sw         $2, -0x7DA4($at)
/* 11D1FC 0021D0FC 02001524 */  addiu      $21, $0, 0x2
/* 11D200 0021D100 D7000010 */  b          .L0021D460
/* 11D204 0021D104 00000000 */   nop
.L0021D108:
/* 11D208 0021D108 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D20C 0021D10C F080238C */  lw         $3, -0x7F10($at)
/* 11D210 0021D110 33006014 */  bnez       $3, .L0021D1E0
/* 11D214 0021D114 00000000 */   nop
/* 11D218 0021D118 E496838F */  lw         $3, -0x691C($gp)
/* 11D21C 0021D11C 10006384 */  lh         $3, 0x10($3)
/* 11D220 0021D120 2A086000 */  slt        $at, $3, $0
/* 11D224 0021D124 04002014 */  bnez       $at, .L0021D138
/* 11D228 0021D128 00000000 */   nop
/* 11D22C 0021D12C 02001524 */  addiu      $21, $0, 0x2
/* 11D230 0021D130 CB000010 */  b          .L0021D460
/* 11D234 0021D134 00000000 */   nop
.L0021D138:
/* 11D238 0021D138 14006016 */  bnez       $19, .L0021D18C
/* 11D23C 0021D13C 00000000 */   nop
/* 11D240 0021D140 12006104 */  bgez       $3, .L0021D18C
/* 11D244 0021D144 00000000 */   nop
/* 11D248 0021D148 02000324 */  addiu      $3, $0, 0x2
/* 11D24C 0021D14C 0F00C316 */  bne        $22, $3, .L0021D18C
/* 11D250 0021D150 00000000 */   nop
/* 11D254 0021D154 2090858F */  lw         $5, -0x6FE0($gp)
/* 11D258 0021D158 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D25C 0021D15C DC802384 */  lh         $3, -0x7F24($at)
/* 11D260 0021D160 0A00A314 */  bne        $5, $3, .L0021D18C
/* 11D264 0021D164 00000000 */   nop
/* 11D268 0021D168 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D26C 0021D16C DE802284 */  lh         $2, -0x7F22($at)
/* 11D270 0021D170 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D274 0021D174 4E8222A4 */  sh         $2, -0x7DB2($at)
/* 11D278 0021D178 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11D27C 0021D17C 00000000 */   nop
/* 11D280 0021D180 0A000224 */  addiu      $2, $0, 0xA
/* 11D284 0021D184 C3000010 */  b          .L0021D494
/* 11D288 0021D188 00000000 */   nop
.L0021D18C:
/* 11D28C 0021D18C 11004010 */  beqz       $2, .L0021D1D4
/* 11D290 0021D190 00000000 */   nop
/* 11D294 0021D194 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D298 0021D198 DC802384 */  lh         $3, -0x7F24($at)
/* 11D29C 0021D19C 05000224 */  addiu      $2, $0, 0x5
/* 11D2A0 0021D1A0 0C006214 */  bne        $3, $2, .L0021D1D4
/* 11D2A4 0021D1A4 00000000 */   nop
/* 11D2A8 0021D1A8 03000224 */  addiu      $2, $0, 0x3
/* 11D2AC 0021D1AC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D2B0 0021D1B0 5C8222AC */  sw         $2, -0x7DA4($at)
/* 11D2B4 0021D1B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D2B8 0021D1B8 608220AC */  sw         $0, -0x7DA0($at)
/* 11D2BC 0021D1BC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D2C0 0021D1C0 DE802284 */  lh         $2, -0x7F22($at)
/* 11D2C4 0021D1C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D2C8 0021D1C8 4E8222A4 */  sh         $2, -0x7DB2($at)
/* 11D2CC 0021D1CC A4000010 */  b          .L0021D460
/* 11D2D0 0021D1D0 00000000 */   nop
.L0021D1D4:
/* 11D2D4 0021D1D4 02001524 */  addiu      $21, $0, 0x2
/* 11D2D8 0021D1D8 A1000010 */  b          .L0021D460
/* 11D2DC 0021D1DC 00000000 */   nop
.L0021D1E0:
/* 11D2E0 0021D1E0 07004010 */  beqz       $2, .L0021D200
/* 11D2E4 0021D1E4 00000000 */   nop
/* 11D2E8 0021D1E8 02000424 */  addiu      $4, $0, 0x2
/* 11D2EC 0021D1EC BCB3080C */  jal        ComMenuSePlay__Fi
/* 11D2F0 0021D1F0 00000000 */   nop
/* 11D2F4 0021D1F4 28160070 */  paddub     $2, $0, $0
/* 11D2F8 0021D1F8 A6000010 */  b          .L0021D494
/* 11D2FC 0021D1FC 00000000 */   nop
.L0021D200:
/* 11D300 0021D200 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D304 0021D204 DE802484 */  lh         $4, -0x7F22($at)
/* 11D308 0021D208 8000A527 */  addiu      $5, $sp, 0x80
/* 11D30C 0021D20C D862080C */  jal        AtoraBoardEnableMovePos__FiPi
/* 11D310 0021D210 00000000 */   nop
/* 11D314 0021D214 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D318 0021D218 F080228C */  lw         $2, -0x7F10($at)
/* 11D31C 0021D21C FFFF5324 */  addiu      $19, $2, -0x1
/* 11D320 0021D220 E496828F */  lw         $2, -0x691C($gp)
/* 11D324 0021D224 10004724 */  addiu      $7, $2, 0x10
/* 11D328 0021D228 10004284 */  lh         $2, 0x10($2)
/* 11D32C 0021D22C 2F004104 */  bgez       $2, .L0021D2EC
/* 11D330 0021D230 00000000 */   nop
/* 11D334 0021D234 40311300 */  sll        $6, $19, 5
/* 11D338 0021D238 2110D000 */  addu       $2, $6, $16
/* 11D33C 0021D23C 2C004824 */  addiu      $8, $2, 0x2C
/* 11D340 0021D240 2C00428C */  lw         $2, 0x2C($2)
/* 11D344 0021D244 04004014 */  bnez       $2, .L0021D258
/* 11D348 0021D248 00000000 */   nop
/* 11D34C 0021D24C 02001524 */  addiu      $21, $0, 0x2
/* 11D350 0021D250 83000010 */  b          .L0021D460
/* 11D354 0021D254 00000000 */   nop
.L0021D258:
/* 11D358 0021D258 01000424 */  addiu      $4, $0, 0x1
/* 11D35C 0021D25C 282E6072 */  paddub     $5, $19, $0
/* 11D360 0021D260 0B000010 */  b          .L0021D290
/* 11D364 0021D264 00000000 */   nop
.L0021D268:
/* 11D368 0021D268 40110500 */  sll        $2, $5, 5
/* 11D36C 0021D26C 21185000 */  addu       $3, $2, $16
/* 11D370 0021D270 2800628C */  lw         $2, 0x28($3)
/* 11D374 0021D274 05006216 */  bne        $19, $2, .L0021D28C
/* 11D378 0021D278 00000000 */   nop
/* 11D37C 0021D27C 2C00628C */  lw         $2, 0x2C($3)
/* 11D380 0021D280 02004010 */  beqz       $2, .L0021D28C
/* 11D384 0021D284 00000000 */   nop
/* 11D388 0021D288 28260070 */  paddub     $4, $0, $0
.L0021D28C:
/* 11D38C 0021D28C 0100A524 */  addiu      $5, $5, 0x1
.L0021D290:
/* 11D390 0021D290 0600A228 */  slti       $2, $5, 0x6
/* 11D394 0021D294 F4FF4014 */  bnez       $2, .L0021D268
/* 11D398 0021D298 00000000 */   nop
/* 11D39C 0021D29C 10008010 */  beqz       $4, .L0021D2E0
/* 11D3A0 0021D2A0 00000000 */   nop
/* 11D3A4 0021D2A4 2110D000 */  addu       $2, $6, $16
/* 11D3A8 0021D2A8 24004284 */  lh         $2, 0x24($2)
/* 11D3AC 0021D2AC 0000E2A4 */  sh         $2, 0x0($7)
/* 11D3B0 0021D2B0 000000AD */  sw         $0, 0x0($8)
/* 11D3B4 0021D2B4 E496828F */  lw         $2, -0x691C($gp)
/* 11D3B8 0021D2B8 0C0053AC */  sw         $19, 0xC($2)
/* 11D3BC 0021D2BC E496828F */  lw         $2, -0x691C($gp)
/* 11D3C0 0021D2C0 000040AC */  sw         $0, 0x0($2)
/* 11D3C4 0021D2C4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D3C8 0021D2C8 DE802384 */  lh         $3, -0x7F22($at)
/* 11D3CC 0021D2CC E496828F */  lw         $2, -0x691C($gp)
/* 11D3D0 0021D2D0 080043AC */  sw         $3, 0x8($2)
/* 11D3D4 0021D2D4 06001524 */  addiu      $21, $0, 0x6
/* 11D3D8 0021D2D8 61000010 */  b          .L0021D460
/* 11D3DC 0021D2DC 00000000 */   nop
.L0021D2E0:
/* 11D3E0 0021D2E0 02001524 */  addiu      $21, $0, 0x2
/* 11D3E4 0021D2E4 5E000010 */  b          .L0021D460
/* 11D3E8 0021D2E8 00000000 */   nop
.L0021D2EC:
/* 11D3EC 0021D2EC 40111300 */  sll        $2, $19, 5
/* 11D3F0 0021D2F0 21100202 */  addu       $2, $16, $2
/* 11D3F4 0021D2F4 24005624 */  addiu      $22, $2, 0x24
/* 11D3F8 0021D2F8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D3FC 0021D2FC DC802484 */  lh         $4, -0x7F24($at)
/* 11D400 0021D300 0000058E */  lw         $5, 0x0($16)
/* 11D404 0021D304 8063050C */  jal        GetEditAtraPartsData__Fii
/* 11D408 0021D308 00000000 */   nop
/* 11D40C 0021D30C C0181300 */  sll        $3, $19, 3
/* 11D410 0021D310 23187300 */  subu       $3, $3, $19
/* 11D414 0021D314 80180300 */  sll        $3, $3, 2
/* 11D418 0021D318 21104300 */  addu       $2, $2, $3
/* 11D41C 0021D31C 14004424 */  addiu      $4, $2, 0x14
/* 11D420 0021D320 01001324 */  addiu      $19, $0, 0x1
/* 11D424 0021D324 E496828F */  lw         $2, -0x691C($gp)
/* 11D428 0021D328 10004384 */  lh         $3, 0x10($2)
/* 11D42C 0021D32C 0000C28E */  lw         $2, 0x0($22)
/* 11D430 0021D330 02006210 */  beq        $3, $2, .L0021D33C
/* 11D434 0021D334 00000000 */   nop
/* 11D438 0021D338 289E0070 */  paddub     $19, $0, $0
.L0021D33C:
/* 11D43C 0021D33C 0800C28E */  lw         $2, 0x8($22)
/* 11D440 0021D340 02004010 */  beqz       $2, .L0021D34C
/* 11D444 0021D344 00000000 */   nop
/* 11D448 0021D348 289E0070 */  paddub     $19, $0, $0
.L0021D34C:
/* 11D44C 0021D34C 0400C28E */  lw         $2, 0x4($22)
/* 11D450 0021D350 07004004 */  bltz       $2, .L0021D370
/* 11D454 0021D354 00000000 */   nop
/* 11D458 0021D358 40110200 */  sll        $2, $2, 5
/* 11D45C 0021D35C 21105000 */  addu       $2, $2, $16
/* 11D460 0021D360 2C00428C */  lw         $2, 0x2C($2)
/* 11D464 0021D364 02004014 */  bnez       $2, .L0021D370
/* 11D468 0021D368 00000000 */   nop
/* 11D46C 0021D36C 289E0070 */  paddub     $19, $0, $0
.L0021D370:
/* 11D470 0021D370 3862080C */  jal        AtraTipCanDisplay__FP21EDIT_CHIP_ATTACH_DATA
/* 11D474 0021D374 00000000 */   nop
/* 11D478 0021D378 02004014 */  bnez       $2, .L0021D384
/* 11D47C 0021D37C 00000000 */   nop
/* 11D480 0021D380 289E0070 */  paddub     $19, $0, $0
.L0021D384:
/* 11D484 0021D384 1E006012 */  beqz       $19, .L0021D400
/* 11D488 0021D388 00000000 */   nop
/* 11D48C 0021D38C 01000224 */  addiu      $2, $0, 0x1
/* 11D490 0021D390 0800C2AE */  sw         $2, 0x8($22)
/* 11D494 0021D394 04000016 */  bnez       $16, .L0021D3A8
/* 11D498 0021D398 00000000 */   nop
/* 11D49C 0021D39C 28160070 */  paddub     $2, $0, $0
/* 11D4A0 0021D3A0 3C000010 */  b          .L0021D494
/* 11D4A4 0021D3A4 00000000 */   nop
.L0021D3A8:
/* 11D4A8 0021D3A8 0000048E */  lw         $4, 0x0($16)
/* 11D4AC 0021D3AC 4061080C */  jal        AtoraAllTipGet__Fi
/* 11D4B0 0021D3B0 00000000 */   nop
/* 11D4B4 0021D3B4 0D004010 */  beqz       $2, .L0021D3EC
/* 11D4B8 0021D3B8 00000000 */   nop
/* 11D4BC 0021D3BC 0F000424 */  addiu      $4, $0, 0xF
/* 11D4C0 0021D3C0 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11D4C4 0021D3C4 00000000 */   nop
/* 11D4C8 0021D3C8 04000224 */  addiu      $2, $0, 0x4
/* 11D4CC 0021D3CC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D4D0 0021D3D0 5C8222AC */  sw         $2, -0x7DA4($at)
/* 11D4D4 0021D3D4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D4D8 0021D3D8 F08020AC */  sw         $0, -0x7F10($at)
/* 11D4DC 0021D3DC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D4E0 0021D3E0 608220AC */  sw         $0, -0x7DA0($at)
/* 11D4E4 0021D3E4 02000010 */  b          .L0021D3F0
/* 11D4E8 0021D3E8 00000000 */   nop
.L0021D3EC:
/* 11D4EC 0021D3EC 05001524 */  addiu      $21, $0, 0x5
.L0021D3F0:
/* 11D4F0 0021D3F0 1868080C */  jal        AtoraTipInfoInit__Fv
/* 11D4F4 0021D3F4 00000000 */   nop
/* 11D4F8 0021D3F8 19000010 */  b          .L0021D460
/* 11D4FC 0021D3FC 00000000 */   nop
.L0021D400:
/* 11D500 0021D400 02001524 */  addiu      $21, $0, 0x2
/* 11D504 0021D404 16000010 */  b          .L0021D460
/* 11D508 0021D408 00000000 */   nop
.L0021D40C:
/* 11D50C 0021D40C CC01023C */  lui        $2, %hi(GamePad)
/* 11D510 0021D410 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11D514 0021D414 20000524 */  addiu      $5, $0, 0x20
/* 11D518 0021D418 1CAE040C */  jal        Down__8CGamePadFi
/* 11D51C 0021D41C 00000000 */   nop
/* 11D520 0021D420 0F004010 */  beqz       $2, .L0021D460
/* 11D524 0021D424 00000000 */   nop
/* 11D528 0021D428 02001524 */  addiu      $21, $0, 0x2
/* 11D52C 0021D42C E496828F */  lw         $2, -0x691C($gp)
/* 11D530 0021D430 10004284 */  lh         $2, 0x10($2)
/* 11D534 0021D434 08004104 */  bgez       $2, .L0021D458
/* 11D538 0021D438 00000000 */   nop
/* 11D53C 0021D43C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D540 0021D440 DE802284 */  lh         $2, -0x7F22($at)
/* 11D544 0021D444 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D548 0021D448 4E8222A4 */  sh         $2, -0x7DB2($at)
/* 11D54C 0021D44C 64001424 */  addiu      $20, $0, 0x64
/* 11D550 0021D450 03000010 */  b          .L0021D460
/* 11D554 0021D454 00000000 */   nop
.L0021D458:
/* 11D558 0021D458 F075080C */  jal        AtoraMenuTipCancel__Fv
/* 11D55C 0021D45C 00000000 */   nop
.L0021D460:
/* 11D560 0021D460 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D564 0021D464 F080228C */  lw         $2, -0x7F10($at)
/* 11D568 0021D468 05002216 */  bne        $17, $2, .L0021D480
/* 11D56C 0021D46C 00000000 */   nop
/* 11D570 0021D470 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11D574 0021D474 DE802284 */  lh         $2, -0x7F22($at)
/* 11D578 0021D478 02004212 */  beq        $18, $2, .L0021D484
/* 11D57C 0021D47C 00000000 */   nop
.L0021D480:
/* 11D580 0021D480 28AE0070 */  paddub     $21, $0, $0
.L0021D484:
/* 11D584 0021D484 2826A072 */  paddub     $4, $21, $0
/* 11D588 0021D488 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11D58C 0021D48C 00000000 */   nop
/* 11D590 0021D490 28168072 */  paddub     $2, $20, $0
.L0021D494:
/* 11D594 0021D494 7000BF7B */  lq         $31, 0x70($sp)
/* 11D598 0021D498 6000B67B */  lq         $22, 0x60($sp)
/* 11D59C 0021D49C 5000B57B */  lq         $21, 0x50($sp)
/* 11D5A0 0021D4A0 4000B47B */  lq         $20, 0x40($sp)
/* 11D5A4 0021D4A4 3000B37B */  lq         $19, 0x30($sp)
/* 11D5A8 0021D4A8 2000B27B */  lq         $18, 0x20($sp)
/* 11D5AC 0021D4AC 1000B17B */  lq         $17, 0x10($sp)
/* 11D5B0 0021D4B0 0000B07B */  lq         $16, 0x0($sp)
/* 11D5B4 0021D4B4 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 11D5B8 0021D4B8 0800E003 */  jr         $31
/* 11D5BC 0021D4BC 00000000 */   nop