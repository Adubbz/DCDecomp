.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFontLRTumeW__Fiii
/* 13C980 0023C880 28160070 */  paddub     $2, $0, $0
/* 13C984 0023C884 A200C328 */  slti       $3, $6, 0xA2
/* 13C988 0023C888 0A006014 */  bnez       $3, .L0023C8B4
/* 13C98C 0023C88C 00000000 */   nop
/* 13C990 0023C890 0001C128 */  slti       $at, $6, 0x100
/* 13C994 0023C894 07002010 */  beqz       $at, .L0023C8B4
/* 13C998 0023C898 00000000 */   nop
/* 13C99C 0023C89C 40280600 */  sll        $5, $6, 1
/* 13C9A0 0023C8A0 2900033C */  lui        $3, %hi(_1351_4 + 0x25C)
/* 13C9A4 0023C8A4 AC5D6324 */  addiu      $3, $3, %lo(_1351_4 + 0x25C)
/* 13C9A8 0023C8A8 21186500 */  addu       $3, $3, $5
/* 13C9AC 0023C8AC 00006380 */  lb         $3, 0x0($3)
/* 13C9B0 0023C8B0 21104300 */  addu       $2, $2, $3
.L0023C8B4:
/* 13C9B4 0023C8B4 FFFF8324 */  addiu      $3, $4, -0x1
/* 13C9B8 0023C8B8 0D006004 */  bltz       $3, .L0023C8F0
/* 13C9BC 0023C8BC 00000000 */   nop
/* 13C9C0 0023C8C0 A200C328 */  slti       $3, $6, 0xA2
/* 13C9C4 0023C8C4 0A006014 */  bnez       $3, .L0023C8F0
/* 13C9C8 0023C8C8 00000000 */   nop
/* 13C9CC 0023C8CC 0001C128 */  slti       $at, $6, 0x100
/* 13C9D0 0023C8D0 07002010 */  beqz       $at, .L0023C8F0
/* 13C9D4 0023C8D4 00000000 */   nop
/* 13C9D8 0023C8D8 40200600 */  sll        $4, $6, 1
/* 13C9DC 0023C8DC 2900033C */  lui        $3, %hi(_1351_4 + 0x25D)
/* 13C9E0 0023C8E0 AD5D6324 */  addiu      $3, $3, %lo(_1351_4 + 0x25D)
/* 13C9E4 0023C8E4 21186400 */  addu       $3, $3, $4
/* 13C9E8 0023C8E8 00006380 */  lb         $3, 0x0($3)
/* 13C9EC 0023C8EC 21104300 */  addu       $2, $2, $3
.L0023C8F0:
/* 13C9F0 0023C8F0 0800E003 */  jr         $31
/* 13C9F4 0023C8F4 00000000 */   nop
/* 13C9F8 0023C8F8 00000000 */  nop
/* 13C9FC 0023C8FC 00000000 */  nop
