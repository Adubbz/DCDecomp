.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetFogParm__FffUcUcUcff
/* 02E110 0012E010 C701013C */  lui         $1, %hi(mgRenderInfo + 0x330)
/* 02E114 0012E014 50582EE4 */  swc1        $f14, %lo(mgRenderInfo + 0x330)($1)
/* 02E118 0012E018 C701013C */  lui         $1, %hi(mgRenderInfo + 0x334)
/* 02E11C 0012E01C 54582FE4 */  swc1        $f15, %lo(mgRenderInfo + 0x334)($1)
/* 02E120 0012E020 81700F46 */  sub.s       $f2, $f14, $f15
/* 02E124 0012E024 00680C46 */  add.s       $f0, $f13, $f12
/* 02E128 0012E028 02100046 */  mul.s       $f0, $f2, $f0
/* 02E12C 0012E02C C1680C46 */  sub.s       $f3, $f13, $f12
/* 02E130 0012E030 43000346 */  div.s       $f1, $f0, $f3
/* 02E134 0012E034 00700F46 */  add.s       $f0, $f14, $f15
/* 02E138 0012E038 40000146 */  add.s       $f1, $f0, $f1
/* 02E13C 0012E03C 0040033C */  lui         $3, (0x40000000 >> 16)
/* 02E140 0012E040 00008344 */  mtc1        $3, $f0
/* 02E144 0012E044 00000000 */  nop
/* 02E148 0012E048 03080046 */  div.s       $f0, $f1, $f0
/* 02E14C 0012E04C C701013C */  lui         $1, %hi(mgRenderInfo + 0x328)
/* 02E150 0012E050 485820E4 */  swc1        $f0, %lo(mgRenderInfo + 0x328)($1)
/* 02E154 0012E054 07680046 */  neg.s       $f0, $f13
/* 02E158 0012E058 02000C46 */  mul.s       $f0, $f0, $f12
/* 02E15C 0012E05C 02000246 */  mul.s       $f0, $f0, $f2
/* 02E160 0012E060 03000346 */  div.s       $f0, $f0, $f3
/* 02E164 0012E064 C701013C */  lui         $1, %hi(mgRenderInfo + 0x32C)
/* 02E168 0012E068 4C5820E4 */  swc1        $f0, %lo(mgRenderInfo + 0x32C)($1)
/* 02E16C 0012E06C C701013C */  lui         $1, %hi(mgRenderInfo + 0x338)
/* 02E170 0012E070 585824A0 */  sb          $4, %lo(mgRenderInfo + 0x338)($1)
/* 02E174 0012E074 C701013C */  lui         $1, %hi(mgRenderInfo + 0x339)
/* 02E178 0012E078 595825A0 */  sb          $5, %lo(mgRenderInfo + 0x339)($1)
/* 02E17C 0012E07C C701013C */  lui         $1, %hi(mgRenderInfo + 0x33A)
/* 02E180 0012E080 5A5826A0 */  sb          $6, %lo(mgRenderInfo + 0x33A)($1)
/* 02E184 0012E084 0800E003 */  jr          $31
/* 02E188 0012E088 00000000 */   nop
/* 02E18C 0012E08C 00000000 */  nop
