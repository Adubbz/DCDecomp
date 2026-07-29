.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckChar__Fc__3
/* 05FED0 0015FDD0 281E0070 */  paddub      $3, $0, $0
/* 05FED4 0015FDD4 3C260400 */  dsll32      $4, $4, 24
/* 05FED8 0015FDD8 3F260400 */  dsra32      $4, $4, 24
/* 05FEDC 0015FDDC 20000224 */  addiu       $2, $0, 0x20
/* 05FEE0 0015FDE0 02008214 */  bne         $4, $2, .L0015FDEC
/* 05FEE4 0015FDE4 00000000 */   nop
/* 05FEE8 0015FDE8 01000324 */  addiu       $3, $0, 0x1
.L0015FDEC:
/* 05FEEC 0015FDEC 09000224 */  addiu       $2, $0, 0x9
/* 05FEF0 0015FDF0 02008214 */  bne         $4, $2, .L0015FDFC
/* 05FEF4 0015FDF4 00000000 */   nop
/* 05FEF8 0015FDF8 01000324 */  addiu       $3, $0, 0x1
.L0015FDFC:
/* 05FEFC 0015FDFC 0A000224 */  addiu       $2, $0, 0xA
/* 05FF00 0015FE00 02008214 */  bne         $4, $2, .L0015FE0C
/* 05FF04 0015FE04 00000000 */   nop
/* 05FF08 0015FE08 01000324 */  addiu       $3, $0, 0x1
.L0015FE0C:
/* 05FF0C 0015FE0C 0D000224 */  addiu       $2, $0, 0xD
/* 05FF10 0015FE10 02008214 */  bne         $4, $2, .L0015FE1C
/* 05FF14 0015FE14 00000000 */   nop
/* 05FF18 0015FE18 01000324 */  addiu       $3, $0, 0x1
.L0015FE1C:
/* 05FF1C 0015FE1C 2B100300 */  sltu        $2, $0, $3
/* 05FF20 0015FE20 01004238 */  xori        $2, $2, 0x1
/* 05FF24 0015FE24 FF004230 */  andi        $2, $2, 0xFF
/* 05FF28 0015FE28 0800E003 */  jr          $31
/* 05FF2C 0015FE2C 00000000 */   nop
