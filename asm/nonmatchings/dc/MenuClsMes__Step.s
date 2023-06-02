.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__10MenuClsMesFv
/* 10BA60 0020B960 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10BA64 0020B964 1000BF7F */  sq         $31, 0x10($sp)
/* 10BA68 0020B968 0000B07F */  sq         $16, 0x0($sp)
/* 10BA6C 0020B96C 28868070 */  paddub     $16, $4, $0
/* 10BA70 0020B970 1C00838C */  lw         $3, 0x1C($4)
/* 10BA74 0020B974 15006010 */  beqz       $3, .L0020B9CC
/* 10BA78 0020B978 00000000 */   nop
/* 10BA7C 0020B97C 00000482 */  lb         $4, 0x0($16)
/* 10BA80 0020B980 02000324 */  addiu      $3, $0, 0x2
/* 10BA84 0020B984 08008310 */  beq        $4, $3, .L0020B9A8
/* 10BA88 0020B988 00000000 */   nop
/* 10BA8C 0020B98C 01000324 */  addiu      $3, $0, 0x1
/* 10BA90 0020B990 05008310 */  beq        $4, $3, .L0020B9A8
/* 10BA94 0020B994 00000000 */   nop
/* 10BA98 0020B998 0C008010 */  beqz       $4, .L0020B9CC
/* 10BA9C 0020B99C 00000000 */   nop
/* 10BAA0 0020B9A0 0A000010 */  b          .L0020B9CC
/* 10BAA4 0020B9A4 00000000 */   nop
.L0020B9A8:
/* 10BAA8 0020B9A8 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* 10BAAC 0020B9AC 00000000 */   nop
/* 10BAB0 0020B9B0 28260072 */  paddub     $4, $16, $0
/* 10BAB4 0020B9B4 282E4070 */  paddub     $5, $2, $0
/* 10BAB8 0020B9B8 FC2D080C */  jal        NowWeaponStatus__10MenuClsMesFP11WEAPON_HAVE
/* 10BABC 0020B9BC 00000000 */   nop
/* 10BAC0 0020B9C0 1C00048E */  lw         $4, 0x1C($16)
/* 10BAC4 0020B9C4 6437050C */  jal        Step__6ClsMesFv
/* 10BAC8 0020B9C8 00000000 */   nop
.L0020B9CC:
/* 10BACC 0020B9CC 1000BF7B */  lq         $31, 0x10($sp)
/* 10BAD0 0020B9D0 0000B07B */  lq         $16, 0x0($sp)
/* 10BAD4 0020B9D4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10BAD8 0020B9D8 0800E003 */  jr         $31
/* 10BADC 0020B9DC 00000000 */   nop
