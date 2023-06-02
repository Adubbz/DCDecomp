.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetAtoraMaxVillage__Fv
/* 12BD40 0022BC40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12BD44 0022BC44 2000BF7F */  sq         $31, 0x20($sp)
/* 12BD48 0022BC48 1000B17F */  sq         $17, 0x10($sp)
/* 12BD4C 0022BC4C 0000B07F */  sq         $16, 0x0($sp)
/* 12BD50 0022BC50 03001024 */  addiu      $16, $0, 0x3
/* 12BD54 0022BC54 04001124 */  addiu      $17, $0, 0x4
/* 12BD58 0022BC58 13000010 */  b          .L0022BCA8
/* 12BD5C 0022BC5C 00000000 */   nop
.L0022BC60:
/* 12BD60 0022BC60 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12BD64 0022BC64 282E2072 */  paddub     $5, $17, $0
/* 12BD68 0022BC68 28360070 */  paddub     $6, $0, $0
/* 12BD6C 0022BC6C 0062050C */  jal        VisitMap__9CSaveDataFii
/* 12BD70 0022BC70 00000000 */   nop
/* 12BD74 0022BC74 08004014 */  bnez       $2, .L0022BC98
/* 12BD78 0022BC78 00000000 */   nop
/* 12BD7C 0022BC7C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12BD80 0022BC80 282E2072 */  paddub     $5, $17, $0
/* 12BD84 0022BC84 28360070 */  paddub     $6, $0, $0
/* 12BD88 0022BC88 1C62050C */  jal        QuestDungeon__9CSaveDataFii
/* 12BD8C 0022BC8C 00000000 */   nop
/* 12BD90 0022BC90 04004010 */  beqz       $2, .L0022BCA4
/* 12BD94 0022BC94 00000000 */   nop
.L0022BC98:
/* 12BD98 0022BC98 03003026 */  addiu      $16, $17, 0x3
/* 12BD9C 0022BC9C 04000010 */  b          .L0022BCB0
/* 12BDA0 0022BCA0 00000000 */   nop
.L0022BCA4:
/* 12BDA4 0022BCA4 FFFF3126 */  addiu      $17, $17, -0x1
.L0022BCA8:
/* 12BDA8 0022BCA8 EDFF2106 */  bgez       $17, .L0022BC60
/* 12BDAC 0022BCAC 00000000 */   nop
.L0022BCB0:
/* 12BDB0 0022BCB0 1C8D848F */  lw         $4, -0x72E4($gp)
/* 12BDB4 0022BCB4 05000524 */  addiu      $5, $0, 0x5
/* 12BDB8 0022BCB8 28360070 */  paddub     $6, $0, $0
/* 12BDBC 0022BCBC 1C62050C */  jal        QuestDungeon__9CSaveDataFii
/* 12BDC0 0022BCC0 00000000 */   nop
/* 12BDC4 0022BCC4 02004010 */  beqz       $2, .L0022BCD0
/* 12BDC8 0022BCC8 00000000 */   nop
/* 12BDCC 0022BCCC 08001024 */  addiu      $16, $0, 0x8
.L0022BCD0:
/* 12BDD0 0022BCD0 0300022A */  slti       $2, $16, 0x3
/* 12BDD4 0022BCD4 04004014 */  bnez       $2, .L0022BCE8
/* 12BDD8 0022BCD8 00000000 */   nop
/* 12BDDC 0022BCDC 0900012A */  slti       $at, $16, 0x9
/* 12BDE0 0022BCE0 02002014 */  bnez       $at, .L0022BCEC
/* 12BDE4 0022BCE4 00000000 */   nop
.L0022BCE8:
/* 12BDE8 0022BCE8 08001024 */  addiu      $16, $0, 0x8
.L0022BCEC:
/* 12BDEC 0022BCEC 28160072 */  paddub     $2, $16, $0
/* 12BDF0 0022BCF0 2000BF7B */  lq         $31, 0x20($sp)
/* 12BDF4 0022BCF4 1000B17B */  lq         $17, 0x10($sp)
/* 12BDF8 0022BCF8 0000B07B */  lq         $16, 0x0($sp)
/* 12BDFC 0022BCFC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 12BE00 0022BD00 0800E003 */  jr         $31
/* 12BE04 0022BD04 00000000 */   nop
/* 12BE08 0022BD08 00000000 */  nop
/* 12BE0C 0022BD0C 00000000 */  nop
