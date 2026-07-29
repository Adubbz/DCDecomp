.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdStStart
/* 00BFE0 0010BEE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00BFE4 0010BEE4 2500033C */  lui         $3, %hi(stm_status)
/* 00BFE8 0010BEE8 01000224 */  addiu       $2, $0, 0x1
/* 00BFEC 0010BEEC 2D40A000 */  daddu       $8, $5, $0
/* 00BFF0 0010BEF0 0000BFFF */  sd          $31, 0x0($29)
/* 00BFF4 0010BEF4 2D280000 */  daddu       $5, $0, $0
/* 00BFF8 0010BEF8 B80262AC */  sw          $2, %lo(stm_status)($3)
/* 00BFFC 0010BEFC 2D300000 */  daddu       $6, $0, $0
/* 00C000 0010BF00 8430040C */  jal         sceCdStream
/* 00C004 0010BF04 01000724 */   addiu      $7, $0, 0x1
/* 00C008 0010BF08 0000BFDF */  ld          $31, 0x0($29)
/* 00C00C 0010BF0C 0800E003 */  jr          $31
/* 00C010 0010BF10 1000BD27 */   addiu      $29, $29, 0x10
/* 00C014 0010BF14 00000000 */  nop
