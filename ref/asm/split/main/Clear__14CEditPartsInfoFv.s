.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Clear__14CEditPartsInfoFv
/* 09A380 0019A280 282E0070 */  paddub      $5, $0, $0
/* 09A384 0019A284 09000010 */  b           .L0019A2AC
/* 09A388 0019A288 00000000 */   nop
.L0019A28C:
/* 09A38C 0019A28C C0180500 */  sll         $3, $5, 3
/* 09A390 0019A290 23186500 */  subu        $3, $3, $5
/* 09A394 0019A294 80180300 */  sll         $3, $3, 2
/* 09A398 0019A298 21186500 */  addu        $3, $3, $5
/* 09A39C 0019A29C C0180300 */  sll         $3, $3, 3
/* 09A3A0 0019A2A0 21186400 */  addu        $3, $3, $4
/* 09A3A4 0019A2A4 700060AC */  sw          $0, 0x70($3)
/* 09A3A8 0019A2A8 0100A524 */  addiu       $5, $5, 0x1
.L0019A2AC:
/* 09A3AC 0019A2AC 1800A328 */  slti        $3, $5, 0x18
/* 09A3B0 0019A2B0 F6FF6014 */  bnez        $3, .L0019A28C
/* 09A3B4 0019A2B4 00000000 */   nop
/* 09A3B8 0019A2B8 0800E003 */  jr          $31
/* 09A3BC 0019A2BC 00000000 */   nop
