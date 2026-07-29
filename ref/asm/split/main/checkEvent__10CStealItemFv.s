.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel checkEvent__10CStealItemFv
/* 0D7AE0 001D79E0 28360070 */  paddub      $6, $0, $0
/* 0D7AE4 001D79E4 10000010 */  b           .L001D7A28
/* 0D7AE8 001D79E8 00000000 */   nop
.L001D79EC:
/* 0D7AEC 001D79EC 80100600 */  sll         $2, $6, 2
/* 0D7AF0 001D79F0 21284400 */  addu        $5, $2, $4
/* 0D7AF4 001D79F4 D000A824 */  addiu       $8, $5, 0xD0
/* 0D7AF8 001D79F8 D000A78C */  lw          $7, 0xD0($5)
/* 0D7AFC 001D79FC FFFF0324 */  addiu       $3, $0, -0x1
/* 0D7B00 001D7A00 0800E310 */  beq         $7, $3, .L001D7A24
/* 0D7B04 001D7A04 00000000 */   nop
/* 0D7B08 001D7A08 02000224 */  addiu       $2, $0, 0x2
/* 0D7B0C 001D7A0C 0500E214 */  bne         $7, $2, .L001D7A24
/* 0D7B10 001D7A10 00000000 */   nop
/* 0D7B14 001D7A14 000003AD */  sw          $3, 0x0($8)
/* 0D7B18 001D7A18 3401A28C */  lw          $2, 0x134($5)
/* 0D7B1C 001D7A1C 06000010 */  b           .L001D7A38
/* 0D7B20 001D7A20 00000000 */   nop
.L001D7A24:
/* 0D7B24 001D7A24 0100C624 */  addiu       $6, $6, 0x1
.L001D7A28:
/* 0D7B28 001D7A28 0800C228 */  slti        $2, $6, 0x8
/* 0D7B2C 001D7A2C EFFF4014 */  bnez        $2, .L001D79EC
/* 0D7B30 001D7A30 00000000 */   nop
/* 0D7B34 001D7A34 FFFF0224 */  addiu       $2, $0, -0x1
.L001D7A38:
/* 0D7B38 001D7A38 0800E003 */  jr          $31
/* 0D7B3C 001D7A3C 00000000 */   nop
