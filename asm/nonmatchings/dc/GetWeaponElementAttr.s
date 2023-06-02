.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWeaponElementAttr__Fi
/* B6AF0 001B69F0 04008004 */  bltz       $4, .L001B6A04
/* B6AF4 001B69F4 00000000 */   nop
/* B6AF8 001B69F8 06008128 */  slti       $at, $4, 0x6
/* B6AFC 001B69FC 02002014 */  bnez       $at, .L001B6A08
/* B6B00 001B6A00 00000000 */   nop
.L001B6A04:
/* B6B04 001B6A04 05000424 */  addiu      $4, $0, 0x5
.L001B6A08:
/* B6B08 001B6A08 80180400 */  sll        $3, $4, 2
/* B6B0C 001B6A0C 2700023C */  lui        $2, %hi(element_tbl)
/* B6B10 001B6A10 B0B14224 */  addiu      $2, $2, %lo(element_tbl)
/* B6B14 001B6A14 21104300 */  addu       $2, $2, $3
/* B6B18 001B6A18 0000428C */  lw         $2, 0x0($2)
/* B6B1C 001B6A1C 0800E003 */  jr         $31
/* B6B20 001B6A20 00000000 */   nop
/* B6B24 001B6A24 00000000 */  nop
/* B6B28 001B6A28 00000000 */  nop
/* B6B2C 001B6A2C 00000000 */  nop
