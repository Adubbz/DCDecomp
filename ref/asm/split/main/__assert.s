.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __assert
/* 0002E0 001001E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0002E4 001001E4 2500023C */  lui         $2, %hi(_impure_ptr)
/* 0002E8 001001E8 0000BFFF */  sd          $31, 0x0($29)
/* 0002EC 001001EC 2D40A000 */  daddu       $8, $5, $0
/* 0002F0 001001F0 ECFD438C */  lw          $3, %lo(_impure_ptr)($2)
/* 0002F4 001001F4 2D388000 */  daddu       $7, $4, $0
/* 0002F8 001001F8 2900053C */  lui         $5, %hi(RO_00296780)
/* 0002FC 001001FC 0C00648C */  lw          $4, 0xC($3)
/* 000300 00100200 E006040C */  jal         fiprintf
/* 000304 00100204 8067A524 */   addiu      $5, $5, %lo(RO_00296780)
/* 000308 00100208 0000BFDF */  ld          $31, 0x0($29)
/* 00030C 0010020C 6A000408 */  j           abort
/* 000310 00100210 1000BD27 */   addiu      $29, $29, 0x10
/* 000314 00100214 00000000 */  nop
