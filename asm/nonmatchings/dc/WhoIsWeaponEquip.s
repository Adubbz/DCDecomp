.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WhoIsWeaponEquip__Fi
/* 131F90 00231E90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 131F94 00231E94 0000BF7F */  sq         $31, 0x0($sp)
/* 131F98 00231E98 7443070C */  jal        GetCommonItemInfo__Fi
/* 131F9C 00231E9C 00000000 */   nop
/* 131FA0 00231EA0 04004014 */  bnez       $2, .L00231EB4
/* 131FA4 00231EA4 00000000 */   nop
/* 131FA8 00231EA8 FFFF0224 */  addiu      $2, $0, -0x1
/* 131FAC 00231EAC 11000010 */  b          .L00231EF4
/* 131FB0 00231EB0 00000000 */   nop
.L00231EB4:
/* 131FB4 00231EB4 00004480 */  lb         $4, 0x0($2)
/* 131FB8 00231EB8 02000324 */  addiu      $3, $0, 0x2
/* 131FBC 00231EBC 04008310 */  beq        $4, $3, .L00231ED0
/* 131FC0 00231EC0 00000000 */   nop
/* 131FC4 00231EC4 FFFF0224 */  addiu      $2, $0, -0x1
/* 131FC8 00231EC8 0A000010 */  b          .L00231EF4
/* 131FCC 00231ECC 00000000 */   nop
.L00231ED0:
/* 131FD0 00231ED0 02004484 */  lh         $4, 0x2($2)
/* 131FD4 00231ED4 6443070C */  jal        GetWeaponDataInfo__Fi
/* 131FD8 00231ED8 00000000 */   nop
/* 131FDC 00231EDC 04004010 */  beqz       $2, .L00231EF0
/* 131FE0 00231EE0 00000000 */   nop
/* 131FE4 00231EE4 0A004280 */  lb         $2, 0xA($2)
/* 131FE8 00231EE8 02000010 */  b          .L00231EF4
/* 131FEC 00231EEC 00000000 */   nop
.L00231EF0:
/* 131FF0 00231EF0 FFFF0224 */  addiu      $2, $0, -0x1
.L00231EF4:
/* 131FF4 00231EF4 0000BF7B */  lq         $31, 0x0($sp)
/* 131FF8 00231EF8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 131FFC 00231EFC 0800E003 */  jr         $31
/* 132000 00231F00 00000000 */   nop
/* 132004 00231F04 00000000 */  nop
/* 132008 00231F08 00000000 */  nop
/* 13200C 00231F0C 00000000 */  nop
