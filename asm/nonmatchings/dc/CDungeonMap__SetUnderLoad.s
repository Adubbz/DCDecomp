.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetUnderLoad__11CDungeonMapFv
/* CA340 001CA240 28360070 */  paddub     $6, $0, $0
/* CA344 001CA244 0D000010 */  b          .L001CA27C
/* CA348 001CA248 00000000 */   nop
.L001CA24C:
/* CA34C 001CA24C 2C000524 */  addiu      $5, $0, 0x2C
/* CA350 001CA250 80180600 */  sll        $3, $6, 2
/* CA354 001CA254 21186600 */  addu       $3, $3, $6
/* CA358 001CA258 80190300 */  sll        $3, $3, 6
/* CA35C 001CA25C 21186400 */  addu       $3, $3, $4
/* CA360 001CA260 0100013C */  lui        $at, (0x10000 >> 16)
/* CA364 001CA264 21086100 */  addu       $at, $3, $at
/* CA368 001CA268 809D25AC */  sw         $5, -0x6280($at)
/* CA36C 001CA26C 0100013C */  lui        $at, (0x10000 >> 16)
/* CA370 001CA270 21086100 */  addu       $at, $3, $at
/* CA374 001CA274 849D20AC */  sw         $0, -0x627C($at)
/* CA378 001CA278 0100C624 */  addiu      $6, $6, 0x1
.L001CA27C:
/* CA37C 001CA27C 1400C328 */  slti       $3, $6, 0x14
/* CA380 001CA280 F2FF6014 */  bnez       $3, .L001CA24C
/* CA384 001CA284 00000000 */   nop
/* CA388 001CA288 0800E003 */  jr         $31
/* CA38C 001CA28C 00000000 */   nop
