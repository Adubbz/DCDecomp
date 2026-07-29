.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ClothFloor__10CCharacterFi
/* 039070 00138F70 283E0070 */  paddub      $7, $0, $0
/* 039074 00138F74 09000010 */  b           .L00138F9C
/* 039078 00138F78 00000000 */   nop
.L00138F7C:
/* 03907C 00138F7C 80300700 */  sll         $6, $7, 2
/* 039080 00138F80 740C838C */  lw          $3, 0xC74($4)
/* 039084 00138F84 21186600 */  addu        $3, $3, $6
/* 039088 00138F88 0000638C */  lw          $3, 0x0($3)
/* 03908C 00138F8C 02006010 */  beqz        $3, .L00138F98
/* 039090 00138F90 00000000 */   nop
/* 039094 00138F94 480065AC */  sw          $5, 0x48($3)
.L00138F98:
/* 039098 00138F98 0100E724 */  addiu       $7, $7, 0x1
.L00138F9C:
/* 03909C 00138F9C 0400E328 */  slti        $3, $7, 0x4
/* 0390A0 00138FA0 F6FF6014 */  bnez        $3, .L00138F7C
/* 0390A4 00138FA4 00000000 */   nop
/* 0390A8 00138FA8 0800E003 */  jr          $31
/* 0390AC 00138FAC 00000000 */   nop
