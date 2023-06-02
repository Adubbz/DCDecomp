.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStStart
/* BFE0 0010BEE0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BFE4 0010BEE4 2500033C */  lui        $3, (0x2502B8 >> 16)
/* BFE8 0010BEE8 01000224 */  addiu      $2, $0, 0x1
/* BFEC 0010BEEC 2D40A000 */  daddu      $8, $5, $0
/* BFF0 0010BEF0 0000BFFF */  sd         $31, 0x0($sp)
/* BFF4 0010BEF4 2D280000 */  daddu      $5, $0, $0
/* BFF8 0010BEF8 B80262AC */  sw         $2, (0x2502B8 & 0xFFFF)($3)
/* BFFC 0010BEFC 2D300000 */  daddu      $6, $0, $0
/* C000 0010BF00 8430040C */  jal        sceCdStream
/* C004 0010BF04 01000724 */   addiu     $7, $0, 0x1
/* C008 0010BF08 0000BFDF */  ld         $31, 0x0($sp)
/* C00C 0010BF0C 0800E003 */  jr         $31
/* C010 0010BF10 1000BD27 */   addiu     $sp, $sp, 0x10
/* C014 0010BF14 00000000 */  nop
