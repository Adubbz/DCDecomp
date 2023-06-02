.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckChar__Fc_3
/* 5FED0 0015FDD0 281E0070 */  paddub     $3, $0, $0
/* 5FED4 0015FDD4 3C260400 */  dsll32     $4, $4, 24
/* 5FED8 0015FDD8 3F260400 */  dsra32     $4, $4, 24
/* 5FEDC 0015FDDC 20000224 */  addiu      $2, $0, 0x20
/* 5FEE0 0015FDE0 02008214 */  bne        $4, $2, .L0015FDEC
/* 5FEE4 0015FDE4 00000000 */   nop
/* 5FEE8 0015FDE8 01000324 */  addiu      $3, $0, 0x1
.L0015FDEC:
/* 5FEEC 0015FDEC 09000224 */  addiu      $2, $0, 0x9
/* 5FEF0 0015FDF0 02008214 */  bne        $4, $2, .L0015FDFC
/* 5FEF4 0015FDF4 00000000 */   nop
/* 5FEF8 0015FDF8 01000324 */  addiu      $3, $0, 0x1
.L0015FDFC:
/* 5FEFC 0015FDFC 0A000224 */  addiu      $2, $0, 0xA
/* 5FF00 0015FE00 02008214 */  bne        $4, $2, .L0015FE0C
/* 5FF04 0015FE04 00000000 */   nop
/* 5FF08 0015FE08 01000324 */  addiu      $3, $0, 0x1
.L0015FE0C:
/* 5FF0C 0015FE0C 0D000224 */  addiu      $2, $0, 0xD
/* 5FF10 0015FE10 02008214 */  bne        $4, $2, .L0015FE1C
/* 5FF14 0015FE14 00000000 */   nop
/* 5FF18 0015FE18 01000324 */  addiu      $3, $0, 0x1
.L0015FE1C:
/* 5FF1C 0015FE1C 2B100300 */  sltu       $2, $0, $3
/* 5FF20 0015FE20 01004238 */  xori       $2, $2, 0x1
/* 5FF24 0015FE24 FF004230 */  andi       $2, $2, 0xFF
/* 5FF28 0015FE28 0800E003 */  jr         $31
/* 5FF2C 0015FE2C 00000000 */   nop
