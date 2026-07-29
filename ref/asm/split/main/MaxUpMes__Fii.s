.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MaxUpMes__Fii
/* 060590 00160490 E0FFBD27 */  addiu       $29, $29, -0x20
/* 060594 00160494 0000BF7F */  sq          $31, 0x0($29)
/* 060598 00160498 2600023C */  lui         $2, %hi(LIT_380__2)
/* 06059C 0016049C 90684224 */  addiu       $2, $2, %lo(LIT_380__2)
/* 0605A0 001604A0 1000A927 */  addiu       $9, $29, 0x10
/* 0605A4 001604A4 00004278 */  lq          $2, 0x0($2)
/* 0605A8 001604A8 0000227D */  sq          $2, 0x0($9)
/* 0605AC 001604AC 1000A4AF */  sw          $4, 0x10($29)
/* 0605B0 001604B0 33000424 */  addiu       $4, $0, 0x33
/* 0605B4 001604B4 08000624 */  addiu       $6, $0, 0x8
/* 0605B8 001604B8 01000724 */  addiu       $7, $0, 0x1
/* 0605BC 001604BC 28460070 */  paddub      $8, $0, $0
/* 0605C0 001604C0 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 0605C4 001604C4 00000000 */   nop
/* 0605C8 001604C8 0000BF7B */  lq          $31, 0x0($29)
/* 0605CC 001604CC 2000BD27 */  addiu       $29, $29, 0x20
/* 0605D0 001604D0 0800E003 */  jr          $31
/* 0605D4 001604D4 00000000 */   nop
/* 0605D8 001604D8 00000000 */  nop
/* 0605DC 001604DC 00000000 */  nop
