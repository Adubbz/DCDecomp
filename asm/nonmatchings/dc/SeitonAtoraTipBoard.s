.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonAtoraTipBoard__Fv
/* 11C370 0021C270 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11C374 0021C274 1000BF7F */  sq         $31, 0x10($sp)
/* 11C378 0021C278 0000B07F */  sq         $16, 0x0($sp)
/* 11C37C 0021C27C 28860070 */  paddub     $16, $0, $0
/* 11C380 0021C280 0F000010 */  b          .L0021C2C0
/* 11C384 0021C284 00000000 */   nop
.L0021C288:
/* 11C388 0021C288 5870080C */  jal        SeitonAtoraTipBoardSub__Fv
/* 11C38C 0021C28C 00000000 */   nop
/* 11C390 0021C290 0E004014 */  bnez       $2, .L0021C2CC
/* 11C394 0021C294 00000000 */   nop
/* 11C398 0021C298 5889838F */  lw         $3, -0x76A8($gp)
/* 11C39C 0021C29C 01006324 */  addiu      $3, $3, 0x1
/* 11C3A0 0021C2A0 588983AF */  sw         $3, -0x76A8($gp)
/* 11C3A4 0021C2A4 5889838F */  lw         $3, -0x76A8($gp)
/* 11C3A8 0021C2A8 03006328 */  slti       $3, $3, 0x3
/* 11C3AC 0021C2AC 03006014 */  bnez       $3, .L0021C2BC
/* 11C3B0 0021C2B0 00000000 */   nop
/* 11C3B4 0021C2B4 01000324 */  addiu      $3, $0, 0x1
/* 11C3B8 0021C2B8 588983AF */  sw         $3, -0x76A8($gp)
.L0021C2BC:
/* 11C3BC 0021C2BC 01001026 */  addiu      $16, $16, 0x1
.L0021C2C0:
/* 11C3C0 0021C2C0 0300032A */  slti       $3, $16, 0x3
/* 11C3C4 0021C2C4 F0FF6014 */  bnez       $3, .L0021C288
/* 11C3C8 0021C2C8 00000000 */   nop
.L0021C2CC:
/* 11C3CC 0021C2CC 1000BF7B */  lq         $31, 0x10($sp)
/* 11C3D0 0021C2D0 0000B07B */  lq         $16, 0x0($sp)
/* 11C3D4 0021C2D4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 11C3D8 0021C2D8 0800E003 */  jr         $31
/* 11C3DC 0021C2DC 00000000 */   nop
