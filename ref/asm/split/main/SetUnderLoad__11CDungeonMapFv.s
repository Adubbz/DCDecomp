.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetUnderLoad__11CDungeonMapFv
/* 0CA340 001CA240 28360070 */  paddub      $6, $0, $0
/* 0CA344 001CA244 0D000010 */  b           .L001CA27C
/* 0CA348 001CA248 00000000 */   nop
.L001CA24C:
/* 0CA34C 001CA24C 2C000524 */  addiu       $5, $0, 0x2C
/* 0CA350 001CA250 80180600 */  sll         $3, $6, 2
/* 0CA354 001CA254 21186600 */  addu        $3, $3, $6
/* 0CA358 001CA258 80190300 */  sll         $3, $3, 6
/* 0CA35C 001CA25C 21186400 */  addu        $3, $3, $4
/* 0CA360 001CA260 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CA364 001CA264 21086100 */  addu        $1, $3, $1
/* 0CA368 001CA268 809D25AC */  sw          $5, -0x6280($1)
/* 0CA36C 001CA26C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0CA370 001CA270 21086100 */  addu        $1, $3, $1
/* 0CA374 001CA274 849D20AC */  sw          $0, -0x627C($1)
/* 0CA378 001CA278 0100C624 */  addiu       $6, $6, 0x1
.L001CA27C:
/* 0CA37C 001CA27C 1400C328 */  slti        $3, $6, 0x14
/* 0CA380 001CA280 F2FF6014 */  bnez        $3, .L001CA24C
/* 0CA384 001CA284 00000000 */   nop
/* 0CA388 001CA288 0800E003 */  jr          $31
/* 0CA38C 001CA28C 00000000 */   nop
