.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllBin2__12CMonstorUnitFv
/* D8460 001D8360 283E0070 */  paddub     $7, $0, $0
/* D8464 001D8364 0C000010 */  b          .L001D8398
/* D8468 001D8368 00000000 */   nop
.L001D836C:
/* D846C 001D836C 2C010624 */  addiu      $6, $0, 0x12C
/* D8470 001D8370 80180700 */  sll        $3, $7, 2
/* D8474 001D8374 21286700 */  addu       $5, $3, $7
/* D8478 001D8378 80180500 */  sll        $3, $5, 2
/* D847C 001D837C 2118A300 */  addu       $3, $5, $3
/* D8480 001D8380 00190300 */  sll        $3, $3, 4
/* D8484 001D8384 21186400 */  addu       $3, $3, $4
/* D8488 001D8388 0200013C */  lui        $at, (0x20000 >> 16)
/* D848C 001D838C 21086100 */  addu       $at, $3, $at
/* D8490 001D8390 E0E326AC */  sw         $6, -0x1C20($at)
/* D8494 001D8394 0100E724 */  addiu      $7, $7, 0x1
.L001D8398:
/* D8498 001D8398 1000E328 */  slti       $3, $7, 0x10
/* D849C 001D839C F3FF6014 */  bnez       $3, .L001D836C
/* D84A0 001D83A0 00000000 */   nop
/* D84A4 001D83A4 0800E003 */  jr         $31
/* D84A8 001D83A8 00000000 */   nop
/* D84AC 001D83AC 00000000 */  nop
