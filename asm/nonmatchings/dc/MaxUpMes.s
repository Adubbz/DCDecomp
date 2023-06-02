.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MaxUpMes__Fii
/* 60590 00160490 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 60594 00160494 0000BF7F */  sq         $31, 0x0($sp)
/* 60598 00160498 2600023C */  lui        $2, %hi(_380_2)
/* 6059C 0016049C 90684224 */  addiu      $2, $2, %lo(_380_2)
/* 605A0 001604A0 1000A927 */  addiu      $9, $sp, 0x10
/* 605A4 001604A4 00004278 */  lq         $2, 0x0($2)
/* 605A8 001604A8 0000227D */  sq         $2, 0x0($9)
/* 605AC 001604AC 1000A4AF */  sw         $4, 0x10($sp)
/* 605B0 001604B0 33000424 */  addiu      $4, $0, 0x33
/* 605B4 001604B4 08000624 */  addiu      $6, $0, 0x8
/* 605B8 001604B8 01000724 */  addiu      $7, $0, 0x1
/* 605BC 001604BC 28460070 */  paddub     $8, $0, $0
/* 605C0 001604C0 9481050C */  jal        SetSystemMes__FiiiiPiPi
/* 605C4 001604C4 00000000 */   nop
/* 605C8 001604C8 0000BF7B */  lq         $31, 0x0($sp)
/* 605CC 001604CC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 605D0 001604D0 0800E003 */  jr         $31
/* 605D4 001604D4 00000000 */   nop
/* 605D8 001604D8 00000000 */  nop
/* 605DC 001604DC 00000000 */  nop
