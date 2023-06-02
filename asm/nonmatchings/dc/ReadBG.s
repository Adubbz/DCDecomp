.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReadBG__Fv
/* 3EDE0 0013ECE0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3EDE4 0013ECE4 1000BF7F */  sq         $31, 0x10($sp)
/* 3EDE8 0013ECE8 0000B07F */  sq         $16, 0x0($sp)
/* 3EDEC 0013ECEC 84B0040C */  jal        MGGetVSyncCount__Fv
/* 3EDF0 0013ECF0 00000000 */   nop
/* 3EDF4 0013ECF4 048D838F */  lw         $3, -0x72FC($gp)
/* 3EDF8 0013ECF8 46006210 */  beq        $3, $2, .L0013EE14
/* 3EDFC 0013ECFC 00000000 */   nop
/* 3EE00 0013ED00 048D82AF */  sw         $2, -0x72FC($gp)
/* 3EE04 0013ED04 088D838F */  lw         $3, -0x72F8($gp)
/* 3EE08 0013ED08 01006324 */  addiu      $3, $3, 0x1
/* 3EE0C 0013ED0C 088D83AF */  sw         $3, -0x72F8($gp)
/* 3EE10 0013ED10 2C00A0A3 */  sb         $0, 0x2C($sp)
/* 3EE14 0013ED14 01000324 */  addiu      $3, $0, 0x1
/* 3EE18 0013ED18 2D00A3A3 */  sb         $3, 0x2D($sp)
/* 3EE1C 0013ED1C 2E00A0A3 */  sb         $0, 0x2E($sp)
/* 3EE20 0013ED20 CC01033C */  lui        $3, %hi(bg_read_info)
/* 3EE24 0013ED24 C0B07024 */  addiu      $16, $3, %lo(bg_read_info)
/* 3EE28 0013ED28 28260070 */  paddub     $4, $0, $0
/* 3EE2C 0013ED2C 11000010 */  b          .L0013ED74
/* 3EE30 0013ED30 00000000 */   nop
.L0013ED34:
/* 3EE34 0013ED34 0000038E */  lw         $3, 0x0($16)
/* 3EE38 0013ED38 0C006010 */  beqz       $3, .L0013ED6C
/* 3EE3C 0013ED3C 00000000 */   nop
/* 3EE40 0013ED40 0400058E */  lw         $5, 0x4($16)
/* 3EE44 0013ED44 0400A010 */  beqz       $5, .L0013ED58
/* 3EE48 0013ED48 00000000 */   nop
/* 3EE4C 0013ED4C 0800038E */  lw         $3, 0x8($16)
/* 3EE50 0013ED50 0B006010 */  beqz       $3, .L0013ED80
/* 3EE54 0013ED54 00000000 */   nop
.L0013ED58:
/* 3EE58 0013ED58 0400A014 */  bnez       $5, .L0013ED6C
/* 3EE5C 0013ED5C 00000000 */   nop
/* 3EE60 0013ED60 0800038E */  lw         $3, 0x8($16)
/* 3EE64 0013ED64 06006010 */  beqz       $3, .L0013ED80
/* 3EE68 0013ED68 00000000 */   nop
.L0013ED6C:
/* 3EE6C 0013ED6C 01008424 */  addiu      $4, $4, 0x1
/* 3EE70 0013ED70 9C001026 */  addiu      $16, $16, 0x9C
.L0013ED74:
/* 3EE74 0013ED74 20008328 */  slti       $3, $4, 0x20
/* 3EE78 0013ED78 EEFF6014 */  bnez       $3, .L0013ED34
/* 3EE7C 0013ED7C 00000000 */   nop
.L0013ED80:
/* 3EE80 0013ED80 20000324 */  addiu      $3, $0, 0x20
/* 3EE84 0013ED84 23008310 */  beq        $4, $3, .L0013EE14
/* 3EE88 0013ED88 00000000 */   nop
/* 3EE8C 0013ED8C 0400038E */  lw         $3, 0x4($16)
/* 3EE90 0013ED90 0B006014 */  bnez       $3, .L0013EDC0
/* 3EE94 0013ED94 00000000 */   nop
/* 3EE98 0013ED98 088D80AF */  sw         $0, -0x72F8($gp)
/* 3EE9C 0013ED9C 9400048E */  lw         $4, 0x94($16)
/* 3EEA0 0013EDA0 9800058E */  lw         $5, 0x98($16)
/* 3EEA4 0013EDA4 8C00068E */  lw         $6, 0x8C($16)
/* 3EEA8 0013EDA8 2C00A727 */  addiu      $7, $sp, 0x2C
/* 3EEAC 0013EDAC 3029040C */  jal        sceCdRead
/* 3EEB0 0013EDB0 00000000 */   nop
/* 3EEB4 0013EDB4 040002AE */  sw         $2, 0x4($16)
/* 3EEB8 0013EDB8 16000010 */  b          .L0013EE14
/* 3EEBC 0013EDBC 00000000 */   nop
.L0013EDC0:
/* 3EEC0 0013EDC0 14006010 */  beqz       $3, .L0013EE14
/* 3EEC4 0013EDC4 00000000 */   nop
/* 3EEC8 0013EDC8 01000424 */  addiu      $4, $0, 0x1
/* 3EECC 0013EDCC 662B040C */  jal        sceCdSync
/* 3EED0 0013EDD0 00000000 */   nop
/* 3EED4 0013EDD4 0F004014 */  bnez       $2, .L0013EE14
/* 3EED8 0013EDD8 00000000 */   nop
/* 3EEDC 0013EDDC BE2D040C */  jal        sceCdGetError
/* 3EEE0 0013EDE0 00000000 */   nop
/* 3EEE4 0013EDE4 09004010 */  beqz       $2, .L0013EE0C
/* 3EEE8 0013EDE8 00000000 */   nop
/* 3EEEC 0013EDEC 2A00023C */  lui        $2, %hi(_284)
/* 3EEF0 0013EDF0 B8904424 */  addiu      $4, $2, %lo(_284)
/* 3EEF4 0013EDF4 0C000526 */  addiu      $5, $16, 0xC
/* 3EEF8 0013EDF8 A611040C */  jal        printf
/* 3EEFC 0013EDFC 00000000 */   nop
/* 3EF00 0013EE00 040000AE */  sw         $0, 0x4($16)
/* 3EF04 0013EE04 03000010 */  b          .L0013EE14
/* 3EF08 0013EE08 00000000 */   nop
.L0013EE0C:
/* 3EF0C 0013EE0C 01000324 */  addiu      $3, $0, 0x1
/* 3EF10 0013EE10 080003AE */  sw         $3, 0x8($16)
.L0013EE14:
/* 3EF14 0013EE14 1000BF7B */  lq         $31, 0x10($sp)
/* 3EF18 0013EE18 0000B07B */  lq         $16, 0x0($sp)
/* 3EF1C 0013EE1C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 3EF20 0013EE20 0800E003 */  jr         $31
/* 3EF24 0013EE24 00000000 */   nop
/* 3EF28 0013EE28 00000000 */  nop
/* 3EF2C 0013EE2C 00000000 */  nop
