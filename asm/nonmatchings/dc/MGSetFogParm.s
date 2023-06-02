.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetFogParm__FffUcUcUcff
/* 2E110 0012E010 C701013C */  lui        $at, (0x1C75850 >> 16)
/* 2E114 0012E014 50582EE4 */  swc1       $f14, (0x1C75850 & 0xFFFF)($at)
/* 2E118 0012E018 C701013C */  lui        $at, (0x1C75854 >> 16)
/* 2E11C 0012E01C 54582FE4 */  swc1       $f15, (0x1C75854 & 0xFFFF)($at)
/* 2E120 0012E020 81700F46 */  sub.s      $f2, $f14, $f15
/* 2E124 0012E024 00680C46 */  add.s      $f0, $f13, $f12
/* 2E128 0012E028 02100046 */  mul.s      $f0, $f2, $f0
/* 2E12C 0012E02C C1680C46 */  sub.s      $f3, $f13, $f12
/* 2E130 0012E030 43000346 */  div.s      $f1, $f0, $f3
/* 2E134 0012E034 00700F46 */  add.s      $f0, $f14, $f15
/* 2E138 0012E038 40000146 */  add.s      $f1, $f0, $f1
/* 2E13C 0012E03C 0040033C */  lui        $3, (0x40000000 >> 16)
/* 2E140 0012E040 00008344 */  mtc1       $3, $f0
/* 2E144 0012E044 00000000 */  nop
/* 2E148 0012E048 03080046 */  div.s      $f0, $f1, $f0
/* 2E14C 0012E04C C701013C */  lui        $at, (0x1C75848 >> 16)
/* 2E150 0012E050 485820E4 */  swc1       $f0, (0x1C75848 & 0xFFFF)($at)
/* 2E154 0012E054 07680046 */  neg.s      $f0, $f13
/* 2E158 0012E058 02000C46 */  mul.s      $f0, $f0, $f12
/* 2E15C 0012E05C 02000246 */  mul.s      $f0, $f0, $f2
/* 2E160 0012E060 03000346 */  div.s      $f0, $f0, $f3
/* 2E164 0012E064 C701013C */  lui        $at, (0x1C7584C >> 16)
/* 2E168 0012E068 4C5820E4 */  swc1       $f0, (0x1C7584C & 0xFFFF)($at)
/* 2E16C 0012E06C C701013C */  lui        $at, (0x1C75858 >> 16)
/* 2E170 0012E070 585824A0 */  sb         $4, (0x1C75858 & 0xFFFF)($at)
/* 2E174 0012E074 C701013C */  lui        $at, (0x1C75859 >> 16)
/* 2E178 0012E078 595825A0 */  sb         $5, (0x1C75859 & 0xFFFF)($at)
/* 2E17C 0012E07C C701013C */  lui        $at, (0x1C7585A >> 16)
/* 2E180 0012E080 5A5826A0 */  sb         $6, (0x1C7585A & 0xFFFF)($at)
/* 2E184 0012E084 0800E003 */  jr         $31
/* 2E188 0012E088 00000000 */   nop
/* 2E18C 0012E08C 00000000 */  nop
