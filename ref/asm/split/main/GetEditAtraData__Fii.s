.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetEditAtraData__Fii
/* 058E80 00158D80 04008004 */  bltz        $4, .L00158D94
/* 058E84 00158D84 00000000 */   nop
/* 058E88 00158D88 06008228 */  slti        $2, $4, 0x6
/* 058E8C 00158D8C 04004014 */  bnez        $2, .L00158DA0
/* 058E90 00158D90 00000000 */   nop
.L00158D94:
/* 058E94 00158D94 28160070 */  paddub      $2, $0, $0
/* 058E98 00158D98 15000010 */  b           .L00158DF0
/* 058E9C 00158D9C 00000000 */   nop
.L00158DA0:
/* 058EA0 00158DA0 0400A004 */  bltz        $5, .L00158DB4
/* 058EA4 00158DA4 00000000 */   nop
/* 058EA8 00158DA8 6400A228 */  slti        $2, $5, 0x64
/* 058EAC 00158DAC 04004014 */  bnez        $2, .L00158DC0
/* 058EB0 00158DB0 00000000 */   nop
.L00158DB4:
/* 058EB4 00158DB4 28160070 */  paddub      $2, $0, $0
/* 058EB8 00158DB8 0D000010 */  b           .L00158DF0
/* 058EBC 00158DBC 00000000 */   nop
.L00158DC0:
/* 058EC0 00158DC0 00110400 */  sll         $2, $4, 4
/* 058EC4 00158DC4 23184400 */  subu        $3, $2, $4
/* 058EC8 00158DC8 80100300 */  sll         $2, $3, 2
/* 058ECC 00158DCC 21106200 */  addu        $2, $3, $2
/* 058ED0 00158DD0 00190200 */  sll         $3, $2, 4
/* 058ED4 00158DD4 2600023C */  lui         $2, %hi(EditElementData)
/* 058ED8 00158DD8 00AF4224 */  addiu       $2, $2, %lo(EditElementData)
/* 058EDC 00158DDC 21184300 */  addu        $3, $2, $3
/* 058EE0 00158DE0 40100500 */  sll         $2, $5, 1
/* 058EE4 00158DE4 21104500 */  addu        $2, $2, $5
/* 058EE8 00158DE8 80100200 */  sll         $2, $2, 2
/* 058EEC 00158DEC 21104300 */  addu        $2, $2, $3
.L00158DF0:
/* 058EF0 00158DF0 0800E003 */  jr          $31
/* 058EF4 00158DF4 00000000 */   nop
/* 058EF8 00158DF8 00000000 */  nop
/* 058EFC 00158DFC 00000000 */  nop
