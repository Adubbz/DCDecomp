.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRequest__14CEditPartsInfoFi
/* 09A240 0019A140 0400A004 */  bltz        $5, .L0019A154
/* 09A244 0019A144 00000000 */   nop
/* 09A248 0019A148 1800A228 */  slti        $2, $5, 0x18
/* 09A24C 0019A14C 04004014 */  bnez        $2, .L0019A160
/* 09A250 0019A150 00000000 */   nop
.L0019A154:
/* 09A254 0019A154 28160070 */  paddub      $2, $0, $0
/* 09A258 0019A158 05000010 */  b           .L0019A170
/* 09A25C 0019A15C 00000000 */   nop
.L0019A160:
/* 09A260 0019A160 80100500 */  sll         $2, $5, 2
/* 09A264 0019A164 21104400 */  addu        $2, $2, $4
/* 09A268 0019A168 0400428C */  lw          $2, 0x4($2)
/* 09A26C 0019A16C 00000000 */  nop
.L0019A170:
/* 09A270 0019A170 0800E003 */  jr          $31
/* 09A274 0019A174 00000000 */   nop
/* 09A278 0019A178 00000000 */  nop
/* 09A27C 0019A17C 00000000 */  nop
