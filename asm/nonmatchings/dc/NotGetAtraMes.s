.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NotGetAtraMes__Fii
/* 60690 00160590 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 60694 00160594 0000BF7F */  sq         $31, 0x0($sp)
/* 60698 00160598 04008004 */  bltz       $4, .L001605AC
/* 6069C 0016059C 00000000 */   nop
/* 606A0 001605A0 06008128 */  slti       $at, $4, 0x6
/* 606A4 001605A4 02002014 */  bnez       $at, .L001605B0
/* 606A8 001605A8 00000000 */   nop
.L001605AC:
/* 606AC 001605AC 01000424 */  addiu      $4, $0, 0x1
.L001605B0:
/* 606B0 001605B0 2600023C */  lui        $2, %hi(_391_3)
/* 606B4 001605B4 B0684224 */  addiu      $2, $2, %lo(_391_3)
/* 606B8 001605B8 1000A827 */  addiu      $8, $sp, 0x10
/* 606BC 001605BC 00004278 */  lq         $2, 0x0($2)
/* 606C0 001605C0 0000027D */  sq         $2, 0x0($8)
/* 606C4 001605C4 32008224 */  addiu      $2, $4, 0x32
/* 606C8 001605C8 1000A2AF */  sw         $2, 0x10($sp)
/* 606CC 001605CC 46000424 */  addiu      $4, $0, 0x46
/* 606D0 001605D0 08000624 */  addiu      $6, $0, 0x8
/* 606D4 001605D4 283E0070 */  paddub     $7, $0, $0
/* 606D8 001605D8 284E0070 */  paddub     $9, $0, $0
/* 606DC 001605DC 9481050C */  jal        SetSystemMes__FiiiiPiPi
/* 606E0 001605E0 00000000 */   nop
/* 606E4 001605E4 0000BF7B */  lq         $31, 0x0($sp)
/* 606E8 001605E8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 606EC 001605EC 0800E003 */  jr         $31
/* 606F0 001605F0 00000000 */   nop
/* 606F4 001605F4 00000000 */  nop
/* 606F8 001605F8 00000000 */  nop
/* 606FC 001605FC 00000000 */  nop
