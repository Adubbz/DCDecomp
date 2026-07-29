.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetResLimmitZone__14CDngStatusDataFv
/* 0BF010 001BEF10 00008580 */  lb          $5, 0x0($4)
/* 0BF014 001BEF14 80180500 */  sll         $3, $5, 2
/* 0BF018 001BEF18 21286500 */  addu        $5, $3, $5
/* 0BF01C 001BEF1C 80180500 */  sll         $3, $5, 2
/* 0BF020 001BEF20 2118A300 */  addu        $3, $5, $3
/* 0BF024 001BEF24 21286400 */  addu        $5, $3, $4
/* 0BF028 001BEF28 02008380 */  lb          $3, 0x2($4)
/* 0BF02C 001BEF2C 21186500 */  addu        $3, $3, $5
/* 0BF030 001BEF30 10426580 */  lb          $5, 0x4210($3)
/* 0BF034 001BEF34 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BF038 001BEF38 0400A310 */  beq         $5, $3, .L001BEF4C
/* 0BF03C 001BEF3C 00000000 */   nop
/* 0BF040 001BEF40 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BF044 001BEF44 21088100 */  addu        $1, $4, $1
/* 0BF048 001BEF48 108B25AC */  sw          $5, -0x74F0($1)
.L001BEF4C:
/* 0BF04C 001BEF4C 0800E003 */  jr          $31
/* 0BF050 001BEF50 00000000 */   nop
/* 0BF054 001BEF54 00000000 */  nop
/* 0BF058 001BEF58 00000000 */  nop
/* 0BF05C 001BEF5C 00000000 */  nop
