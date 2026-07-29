.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InchikiShadow__Fv
/* 0161E0 01DC1EE0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0161E4 01DC1EE4 0000BF7F */  sq          $31, 0x0($29)
/* 0161E8 01DC1EE8 DE01013C */  lui         $1, %hi(CScript__2 + 0x308)
/* 0161EC 01DC1EEC 081E2390 */  lbu         $3, %lo(CScript__2 + 0x308)($1)
/* 0161F0 01DC1EF0 25006010 */  beqz        $3, .L01DC1F88_2C7788
/* 0161F4 01DC1EF4 00000000 */   nop
/* 0161F8 01DC1EF8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6F6C)
/* 0161FC 01DC1EFC 3CF7248C */  lw          $4, %lo(MainMonstorUnit + 0x6F6C)($1)
/* 016200 01DC1F00 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 016204 01DC1F04 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 016208 01DC1F08 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01620C 01DC1F0C 00000000 */   nop
/* 016210 01DC1F10 28264070 */  paddub      $4, $2, $0
/* 016214 01DC1F14 0A008010 */  beqz        $4, .L01DC1F40_2C7740
/* 016218 01DC1F18 00000000 */   nop
/* 01621C 01DC1F1C 1000A527 */  addiu       $5, $29, 0x10
/* 016220 01DC1F20 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 016224 01DC1F24 00000000 */   nop
/* 016228 01DC1F28 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 01622C 01DC1F2C 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016230 01DC1F30 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 016234 01DC1F34 28260070 */  paddub      $4, $0, $0
/* 016238 01DC1F38 D808770C */  jal         DrawShadow__Fifff
/* 01623C 01DC1F3C 00000000 */   nop
.L01DC1F40_2C7740:
/* 016240 01DC1F40 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6F6C)
/* 016244 01DC1F44 3CF7248C */  lw          $4, %lo(MainMonstorUnit + 0x6F6C)($1)
/* 016248 01DC1F48 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 01624C 01DC1F4C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 016250 01DC1F50 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016254 01DC1F54 00000000 */   nop
/* 016258 01DC1F58 28264070 */  paddub      $4, $2, $0
/* 01625C 01DC1F5C 0A008010 */  beqz        $4, .L01DC1F88_2C7788
/* 016260 01DC1F60 00000000 */   nop
/* 016264 01DC1F64 1000A527 */  addiu       $5, $29, 0x10
/* 016268 01DC1F68 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01626C 01DC1F6C 00000000 */   nop
/* 016270 01DC1F70 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 016274 01DC1F74 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016278 01DC1F78 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 01627C 01DC1F7C 01000424 */  addiu       $4, $0, 0x1
/* 016280 01DC1F80 D808770C */  jal         DrawShadow__Fifff
/* 016284 01DC1F84 00000000 */   nop
.L01DC1F88_2C7788:
/* 016288 01DC1F88 DE01013C */  lui         $1, %hi(CScript__2 + 0x33C)
/* 01628C 01DC1F8C 3C1E2390 */  lbu         $3, %lo(CScript__2 + 0x33C)($1)
/* 016290 01DC1F90 25006010 */  beqz        $3, .L01DC2028_2C7828
/* 016294 01DC1F94 00000000 */   nop
/* 016298 01DC1F98 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x811C)
/* 01629C 01DC1F9C EC08248C */  lw          $4, %lo(MainMonstorUnit + 0x811C)($1)
/* 0162A0 01DC1FA0 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 0162A4 01DC1FA4 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 0162A8 01DC1FA8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0162AC 01DC1FAC 00000000 */   nop
/* 0162B0 01DC1FB0 28264070 */  paddub      $4, $2, $0
/* 0162B4 01DC1FB4 0A008010 */  beqz        $4, .L01DC1FE0_2C77E0
/* 0162B8 01DC1FB8 00000000 */   nop
/* 0162BC 01DC1FBC 1000A527 */  addiu       $5, $29, 0x10
/* 0162C0 01DC1FC0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0162C4 01DC1FC4 00000000 */   nop
/* 0162C8 01DC1FC8 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0162CC 01DC1FCC 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 0162D0 01DC1FD0 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 0162D4 01DC1FD4 02000424 */  addiu       $4, $0, 0x2
/* 0162D8 01DC1FD8 D808770C */  jal         DrawShadow__Fifff
/* 0162DC 01DC1FDC 00000000 */   nop
.L01DC1FE0_2C77E0:
/* 0162E0 01DC1FE0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x811C)
/* 0162E4 01DC1FE4 EC08248C */  lw          $4, %lo(MainMonstorUnit + 0x811C)($1)
/* 0162E8 01DC1FE8 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 0162EC 01DC1FEC 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 0162F0 01DC1FF0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0162F4 01DC1FF4 00000000 */   nop
/* 0162F8 01DC1FF8 28264070 */  paddub      $4, $2, $0
/* 0162FC 01DC1FFC 0A008010 */  beqz        $4, .L01DC2028_2C7828
/* 016300 01DC2000 00000000 */   nop
/* 016304 01DC2004 1000A527 */  addiu       $5, $29, 0x10
/* 016308 01DC2008 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01630C 01DC200C 00000000 */   nop
/* 016310 01DC2010 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 016314 01DC2014 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016318 01DC2018 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 01631C 01DC201C 03000424 */  addiu       $4, $0, 0x3
/* 016320 01DC2020 D808770C */  jal         DrawShadow__Fifff
/* 016324 01DC2024 00000000 */   nop
.L01DC2028_2C7828:
/* 016328 01DC2028 DE01013C */  lui         $1, %hi(CScript__2 + 0x370)
/* 01632C 01DC202C 701E2390 */  lbu         $3, %lo(CScript__2 + 0x370)($1)
/* 016330 01DC2030 25006010 */  beqz        $3, .L01DC20C8_2C78C8
/* 016334 01DC2034 00000000 */   nop
/* 016338 01DC2038 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x92CC)
/* 01633C 01DC203C 9C1A248C */  lw          $4, %lo(MainMonstorUnit + 0x92CC)($1)
/* 016340 01DC2040 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 016344 01DC2044 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 016348 01DC2048 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01634C 01DC204C 00000000 */   nop
/* 016350 01DC2050 28264070 */  paddub      $4, $2, $0
/* 016354 01DC2054 0A008010 */  beqz        $4, .L01DC2080_2C7880
/* 016358 01DC2058 00000000 */   nop
/* 01635C 01DC205C 1000A527 */  addiu       $5, $29, 0x10
/* 016360 01DC2060 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 016364 01DC2064 00000000 */   nop
/* 016368 01DC2068 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 01636C 01DC206C 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016370 01DC2070 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 016374 01DC2074 04000424 */  addiu       $4, $0, 0x4
/* 016378 01DC2078 D808770C */  jal         DrawShadow__Fifff
/* 01637C 01DC207C 00000000 */   nop
.L01DC2080_2C7880:
/* 016380 01DC2080 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x92CC)
/* 016384 01DC2084 9C1A248C */  lw          $4, %lo(MainMonstorUnit + 0x92CC)($1)
/* 016388 01DC2088 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 01638C 01DC208C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 016390 01DC2090 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016394 01DC2094 00000000 */   nop
/* 016398 01DC2098 28264070 */  paddub      $4, $2, $0
/* 01639C 01DC209C 0A008010 */  beqz        $4, .L01DC20C8_2C78C8
/* 0163A0 01DC20A0 00000000 */   nop
/* 0163A4 01DC20A4 1000A527 */  addiu       $5, $29, 0x10
/* 0163A8 01DC20A8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0163AC 01DC20AC 00000000 */   nop
/* 0163B0 01DC20B0 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0163B4 01DC20B4 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 0163B8 01DC20B8 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 0163BC 01DC20BC 05000424 */  addiu       $4, $0, 0x5
/* 0163C0 01DC20C0 D808770C */  jal         DrawShadow__Fifff
/* 0163C4 01DC20C4 00000000 */   nop
.L01DC20C8_2C78C8:
/* 0163C8 01DC20C8 DE01013C */  lui         $1, %hi(CScript__2 + 0x3A4)
/* 0163CC 01DC20CC A41E2390 */  lbu         $3, %lo(CScript__2 + 0x3A4)($1)
/* 0163D0 01DC20D0 25006010 */  beqz        $3, .L01DC2168_2C7968
/* 0163D4 01DC20D4 00000000 */   nop
/* 0163D8 01DC20D8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA47C)
/* 0163DC 01DC20DC 4C2C248C */  lw          $4, %lo(MainMonstorUnit + 0xA47C)($1)
/* 0163E0 01DC20E0 DE01023C */  lui         $2, %hi(LIT_1642)
/* 0163E4 01DC20E4 70F94524 */  addiu       $5, $2, %lo(LIT_1642)
/* 0163E8 01DC20E8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0163EC 01DC20EC 00000000 */   nop
/* 0163F0 01DC20F0 28264070 */  paddub      $4, $2, $0
/* 0163F4 01DC20F4 0A008010 */  beqz        $4, .L01DC2120_2C7920
/* 0163F8 01DC20F8 00000000 */   nop
/* 0163FC 01DC20FC 1000A527 */  addiu       $5, $29, 0x10
/* 016400 01DC2100 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 016404 01DC2104 00000000 */   nop
/* 016408 01DC2108 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 01640C 01DC210C 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016410 01DC2110 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 016414 01DC2114 04000424 */  addiu       $4, $0, 0x4
/* 016418 01DC2118 D808770C */  jal         DrawShadow__Fifff
/* 01641C 01DC211C 00000000 */   nop
.L01DC2120_2C7920:
/* 016420 01DC2120 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xA47C)
/* 016424 01DC2124 4C2C248C */  lw          $4, %lo(MainMonstorUnit + 0xA47C)($1)
/* 016428 01DC2128 DE01023C */  lui         $2, %hi(LIT_1643__2)
/* 01642C 01DC212C 78F94524 */  addiu       $5, $2, %lo(LIT_1643__2)
/* 016430 01DC2130 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016434 01DC2134 00000000 */   nop
/* 016438 01DC2138 28264070 */  paddub      $4, $2, $0
/* 01643C 01DC213C 0A008010 */  beqz        $4, .L01DC2168_2C7968
/* 016440 01DC2140 00000000 */   nop
/* 016444 01DC2144 1000A527 */  addiu       $5, $29, 0x10
/* 016448 01DC2148 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01644C 01DC214C 00000000 */   nop
/* 016450 01DC2150 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 016454 01DC2154 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016458 01DC2158 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 01645C 01DC215C 05000424 */  addiu       $4, $0, 0x5
/* 016460 01DC2160 D808770C */  jal         DrawShadow__Fifff
/* 016464 01DC2164 00000000 */   nop
.L01DC2168_2C7968:
/* 016468 01DC2168 DE01013C */  lui         $1, %hi(CScript__2 + 0x3D8)
/* 01646C 01DC216C D81E2390 */  lbu         $3, %lo(CScript__2 + 0x3D8)($1)
/* 016470 01DC2170 25006010 */  beqz        $3, .L01DC2208_2C7A08
/* 016474 01DC2174 00000000 */   nop
/* 016478 01DC2178 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB62C)
/* 01647C 01DC217C FC3D248C */  lw          $4, %lo(MainMonstorUnit + 0xB62C)($1)
/* 016480 01DC2180 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 016484 01DC2184 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 016488 01DC2188 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01648C 01DC218C 00000000 */   nop
/* 016490 01DC2190 28264070 */  paddub      $4, $2, $0
/* 016494 01DC2194 0A008010 */  beqz        $4, .L01DC21C0_2C79C0
/* 016498 01DC2198 00000000 */   nop
/* 01649C 01DC219C 1000A527 */  addiu       $5, $29, 0x10
/* 0164A0 01DC21A0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0164A4 01DC21A4 00000000 */   nop
/* 0164A8 01DC21A8 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0164AC 01DC21AC 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 0164B0 01DC21B0 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 0164B4 01DC21B4 04000424 */  addiu       $4, $0, 0x4
/* 0164B8 01DC21B8 D808770C */  jal         DrawShadow__Fifff
/* 0164BC 01DC21BC 00000000 */   nop
.L01DC21C0_2C79C0:
/* 0164C0 01DC21C0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xB62C)
/* 0164C4 01DC21C4 FC3D248C */  lw          $4, %lo(MainMonstorUnit + 0xB62C)($1)
/* 0164C8 01DC21C8 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 0164CC 01DC21CC 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 0164D0 01DC21D0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0164D4 01DC21D4 00000000 */   nop
/* 0164D8 01DC21D8 28264070 */  paddub      $4, $2, $0
/* 0164DC 01DC21DC 0A008010 */  beqz        $4, .L01DC2208_2C7A08
/* 0164E0 01DC21E0 00000000 */   nop
/* 0164E4 01DC21E4 1000A527 */  addiu       $5, $29, 0x10
/* 0164E8 01DC21E8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0164EC 01DC21EC 00000000 */   nop
/* 0164F0 01DC21F0 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0164F4 01DC21F4 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 0164F8 01DC21F8 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 0164FC 01DC21FC 05000424 */  addiu       $4, $0, 0x5
/* 016500 01DC2200 D808770C */  jal         DrawShadow__Fifff
/* 016504 01DC2204 00000000 */   nop
.L01DC2208_2C7A08:
/* 016508 01DC2208 DE01013C */  lui         $1, %hi(CScript__2 + 0x40C)
/* 01650C 01DC220C 0C1F2390 */  lbu         $3, %lo(CScript__2 + 0x40C)($1)
/* 016510 01DC2210 25006010 */  beqz        $3, .L01DC22A8_2C7AA8
/* 016514 01DC2214 00000000 */   nop
/* 016518 01DC2218 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xC7DC)
/* 01651C 01DC221C AC4F248C */  lw          $4, %lo(MainMonstorUnit + 0xC7DC)($1)
/* 016520 01DC2220 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 016524 01DC2224 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 016528 01DC2228 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01652C 01DC222C 00000000 */   nop
/* 016530 01DC2230 28264070 */  paddub      $4, $2, $0
/* 016534 01DC2234 0A008010 */  beqz        $4, .L01DC2260_2C7A60
/* 016538 01DC2238 00000000 */   nop
/* 01653C 01DC223C 1000A527 */  addiu       $5, $29, 0x10
/* 016540 01DC2240 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 016544 01DC2244 00000000 */   nop
/* 016548 01DC2248 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 01654C 01DC224C 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016550 01DC2250 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 016554 01DC2254 06000424 */  addiu       $4, $0, 0x6
/* 016558 01DC2258 D808770C */  jal         DrawShadow__Fifff
/* 01655C 01DC225C 00000000 */   nop
.L01DC2260_2C7A60:
/* 016560 01DC2260 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xC7DC)
/* 016564 01DC2264 AC4F248C */  lw          $4, %lo(MainMonstorUnit + 0xC7DC)($1)
/* 016568 01DC2268 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 01656C 01DC226C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 016570 01DC2270 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016574 01DC2274 00000000 */   nop
/* 016578 01DC2278 28264070 */  paddub      $4, $2, $0
/* 01657C 01DC227C 0A008010 */  beqz        $4, .L01DC22A8_2C7AA8
/* 016580 01DC2280 00000000 */   nop
/* 016584 01DC2284 1000A527 */  addiu       $5, $29, 0x10
/* 016588 01DC2288 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01658C 01DC228C 00000000 */   nop
/* 016590 01DC2290 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 016594 01DC2294 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016598 01DC2298 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 01659C 01DC229C 07000424 */  addiu       $4, $0, 0x7
/* 0165A0 01DC22A0 D808770C */  jal         DrawShadow__Fifff
/* 0165A4 01DC22A4 00000000 */   nop
.L01DC22A8_2C7AA8:
/* 0165A8 01DC22A8 DE01013C */  lui         $1, %hi(CScript__2 + 0x440)
/* 0165AC 01DC22AC 401F2390 */  lbu         $3, %lo(CScript__2 + 0x440)($1)
/* 0165B0 01DC22B0 25006010 */  beqz        $3, .L01DC2348_2C7B48
/* 0165B4 01DC22B4 00000000 */   nop
/* 0165B8 01DC22B8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xD98C)
/* 0165BC 01DC22BC 5C61248C */  lw          $4, %lo(MainMonstorUnit + 0xD98C)($1)
/* 0165C0 01DC22C0 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 0165C4 01DC22C4 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 0165C8 01DC22C8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0165CC 01DC22CC 00000000 */   nop
/* 0165D0 01DC22D0 28264070 */  paddub      $4, $2, $0
/* 0165D4 01DC22D4 0A008010 */  beqz        $4, .L01DC2300_2C7B00
/* 0165D8 01DC22D8 00000000 */   nop
/* 0165DC 01DC22DC 1000A527 */  addiu       $5, $29, 0x10
/* 0165E0 01DC22E0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0165E4 01DC22E4 00000000 */   nop
/* 0165E8 01DC22E8 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0165EC 01DC22EC 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 0165F0 01DC22F0 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 0165F4 01DC22F4 06000424 */  addiu       $4, $0, 0x6
/* 0165F8 01DC22F8 D808770C */  jal         DrawShadow__Fifff
/* 0165FC 01DC22FC 00000000 */   nop
.L01DC2300_2C7B00:
/* 016600 01DC2300 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xD98C)
/* 016604 01DC2304 5C61248C */  lw          $4, %lo(MainMonstorUnit + 0xD98C)($1)
/* 016608 01DC2308 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 01660C 01DC230C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 016610 01DC2310 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016614 01DC2314 00000000 */   nop
/* 016618 01DC2318 28264070 */  paddub      $4, $2, $0
/* 01661C 01DC231C 0A008010 */  beqz        $4, .L01DC2348_2C7B48
/* 016620 01DC2320 00000000 */   nop
/* 016624 01DC2324 1000A527 */  addiu       $5, $29, 0x10
/* 016628 01DC2328 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01662C 01DC232C 00000000 */   nop
/* 016630 01DC2330 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 016634 01DC2334 4400ADC7 */  lwc1        $f13, 0x44($29)
/* 016638 01DC2338 4800AEC7 */  lwc1        $f14, 0x48($29)
/* 01663C 01DC233C 07000424 */  addiu       $4, $0, 0x7
/* 016640 01DC2340 D808770C */  jal         DrawShadow__Fifff
/* 016644 01DC2344 00000000 */   nop
.L01DC2348_2C7B48:
/* 016648 01DC2348 0000BF7B */  lq          $31, 0x0($29)
/* 01664C 01DC234C 5000BD27 */  addiu       $29, $29, 0x50
/* 016650 01DC2350 0800E003 */  jr          $31
/* 016654 01DC2354 00000000 */   nop
/* 016658 01DC2358 00000000 */  nop
/* 01665C 01DC235C 00000000 */  nop
