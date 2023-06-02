.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRequest__14CEditPartsInfoFi
/* 9A240 0019A140 0400A004 */  bltz       $5, .L0019A154
/* 9A244 0019A144 00000000 */   nop
/* 9A248 0019A148 1800A228 */  slti       $2, $5, 0x18
/* 9A24C 0019A14C 04004014 */  bnez       $2, .L0019A160
/* 9A250 0019A150 00000000 */   nop
.L0019A154:
/* 9A254 0019A154 28160070 */  paddub     $2, $0, $0
/* 9A258 0019A158 05000010 */  b          .L0019A170
/* 9A25C 0019A15C 00000000 */   nop
.L0019A160:
/* 9A260 0019A160 80100500 */  sll        $2, $5, 2
/* 9A264 0019A164 21104400 */  addu       $2, $2, $4
/* 9A268 0019A168 0400428C */  lw         $2, 0x4($2)
/* 9A26C 0019A16C 00000000 */  nop
.L0019A170:
/* 9A270 0019A170 0800E003 */  jr         $31
/* 9A274 0019A174 00000000 */   nop
/* 9A278 0019A178 00000000 */  nop
/* 9A27C 0019A17C 00000000 */  nop
