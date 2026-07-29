.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__12CSHOT_EFFECTFv
/* 0AE540 001AE440 000080AC */  sw          $0, 0x0($4)
/* 0AE544 001AE444 28360070 */  paddub      $6, $0, $0
/* 0AE548 001AE448 14000010 */  b           .L001AE49C
/* 0AE54C 001AE44C 00000000 */   nop
.L001AE450:
/* 0AE550 001AE450 40180600 */  sll         $3, $6, 1
/* 0AE554 001AE454 21186400 */  addu        $3, $3, $4
/* 0AE558 001AE458 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE55C 001AE45C 21086100 */  addu        $1, $3, $1
/* 0AE560 001AE460 00A020A4 */  sh          $0, -0x6000($1)
/* 0AE564 001AE464 FFFF0524 */  addiu       $5, $0, -0x1
/* 0AE568 001AE468 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE56C 001AE46C 21086100 */  addu        $1, $3, $1
/* 0AE570 001AE470 50A025A4 */  sh          $5, -0x5FB0($1)
/* 0AE574 001AE474 80180600 */  sll         $3, $6, 2
/* 0AE578 001AE478 21186400 */  addu        $3, $3, $4
/* 0AE57C 001AE47C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE580 001AE480 21086100 */  addu        $1, $3, $1
/* 0AE584 001AE484 70A025AC */  sw          $5, -0x5F90($1)
/* 0AE588 001AE488 04000324 */  addiu       $3, $0, 0x4
/* 0AE58C 001AE48C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE590 001AE490 21088100 */  addu        $1, $4, $1
/* 0AE594 001AE494 4CA123AC */  sw          $3, -0x5EB4($1)
/* 0AE598 001AE498 0100C624 */  addiu       $6, $6, 0x1
.L001AE49C:
/* 0AE59C 001AE49C 0800C328 */  slti        $3, $6, 0x8
/* 0AE5A0 001AE4A0 EBFF6014 */  bnez        $3, .L001AE450
/* 0AE5A4 001AE4A4 00000000 */   nop
/* 0AE5A8 001AE4A8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0AE5AC 001AE4AC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0AE5B0 001AE4B0 21088100 */  addu        $1, $4, $1
/* 0AE5B4 001AE4B4 50A123AC */  sw          $3, -0x5EB0($1)
/* 0AE5B8 001AE4B8 0800E003 */  jr          $31
/* 0AE5BC 001AE4BC 00000000 */   nop
