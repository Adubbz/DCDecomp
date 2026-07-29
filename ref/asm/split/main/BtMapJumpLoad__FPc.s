.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtMapJumpLoad__FPc
/* 0B21E0 001B20E0 80FEBD27 */  addiu       $29, $29, -0x180
/* 0B21E4 001B20E4 4000BF7F */  sq          $31, 0x40($29)
/* 0B21E8 001B20E8 3000B37F */  sq          $19, 0x30($29)
/* 0B21EC 001B20EC 2000B27F */  sq          $18, 0x20($29)
/* 0B21F0 001B20F0 1000B17F */  sq          $17, 0x10($29)
/* 0B21F4 001B20F4 0000B07F */  sq          $16, 0x0($29)
/* 0B21F8 001B20F8 289E8070 */  paddub      $19, $4, $0
/* 0B21FC 001B20FC 789C848F */  lw          $4, -0x6388($28)
/* 0B2200 001B2100 00009080 */  lb          $16, 0x0($4)
/* 0B2204 001B2104 02008380 */  lb          $3, 0x2($4)
/* 0B2208 001B2108 0600022A */  slti        $2, $16, 0x6
/* 0B220C 001B210C 11004014 */  bnez        $2, .L001B2154
/* 0B2210 001B2110 00000000 */   nop
/* 0B2214 001B2114 14006228 */  slti        $2, $3, 0x14
/* 0B2218 001B2118 02004014 */  bnez        $2, .L001B2124
/* 0B221C 001B211C 00000000 */   nop
/* 0B2220 001B2120 01001026 */  addiu       $16, $16, 0x1
.L001B2124:
/* 0B2224 001B2124 28006228 */  slti        $2, $3, 0x28
/* 0B2228 001B2128 02004014 */  bnez        $2, .L001B2134
/* 0B222C 001B212C 00000000 */   nop
/* 0B2230 001B2130 01001026 */  addiu       $16, $16, 0x1
.L001B2134:
/* 0B2234 001B2134 3C006228 */  slti        $2, $3, 0x3C
/* 0B2238 001B2138 02004014 */  bnez        $2, .L001B2144
/* 0B223C 001B213C 00000000 */   nop
/* 0B2240 001B2140 01001026 */  addiu       $16, $16, 0x1
.L001B2144:
/* 0B2244 001B2144 50006228 */  slti        $2, $3, 0x50
/* 0B2248 001B2148 02004014 */  bnez        $2, .L001B2154
/* 0B224C 001B214C 00000000 */   nop
/* 0B2250 001B2150 01001026 */  addiu       $16, $16, 0x1
.L001B2154:
/* 0B2254 001B2154 E093828F */  lw          $2, -0x6C20($28)
/* 0B2258 001B2158 37000212 */  beq         $16, $2, .L001B2238
/* 0B225C 001B215C 00000000 */   nop
/* 0B2260 001B2160 F001013C */  lui         $1, %hi(BtSteebMesBuffer + 0x8)
/* 0B2264 001B2164 B86620AC */  sw          $0, %lo(BtSteebMesBuffer + 0x8)($1)
/* 0B2268 001B2168 F001013C */  lui         $1, %hi(BtSteebMesBuffer + 0x8)
/* 0B226C 001B216C B866228C */  lw          $2, %lo(BtSteebMesBuffer + 0x8)($1)
/* 0B2270 001B2170 00190200 */  sll         $3, $2, 4
/* 0B2274 001B2174 F001013C */  lui         $1, %hi(BtSteebMesBuffer)
/* 0B2278 001B2178 B066228C */  lw          $2, %lo(BtSteebMesBuffer)($1)
/* 0B227C 001B217C 21884300 */  addu        $17, $2, $3
/* 0B2280 001B2180 00008380 */  lb          $3, 0x0($4)
/* 0B2284 001B2184 06000224 */  addiu       $2, $0, 0x6
/* 0B2288 001B2188 0A006214 */  bne         $3, $2, .L001B21B4
/* 0B228C 001B218C 00000000 */   nop
/* 0B2290 001B2190 FBFF0626 */  addiu       $6, $16, -0x5
/* 0B2294 001B2194 D000A427 */  addiu       $4, $29, 0xD0
/* 0B2298 001B2198 2A00023C */  lui         $2, %hi(LIT_1353__2)
/* 0B229C 001B219C 60B54524 */  addiu       $5, $2, %lo(LIT_1353__2)
/* 0B22A0 001B21A0 9886878F */  lw          $7, -0x7968($28)
/* 0B22A4 001B21A4 1614040C */  jal         sprintf
/* 0B22A8 001B21A8 00000000 */   nop
/* 0B22AC 001B21AC 08000010 */  b           .L001B21D0
/* 0B22B0 001B21B0 00000000 */   nop
.L001B21B4:
/* 0B22B4 001B21B4 01000626 */  addiu       $6, $16, 0x1
/* 0B22B8 001B21B8 D000A427 */  addiu       $4, $29, 0xD0
/* 0B22BC 001B21BC 2A00023C */  lui         $2, %hi(LIT_1354)
/* 0B22C0 001B21C0 90B54524 */  addiu       $5, $2, %lo(LIT_1354)
/* 0B22C4 001B21C4 9886878F */  lw          $7, -0x7968($28)
/* 0B22C8 001B21C8 1614040C */  jal         sprintf
/* 0B22CC 001B21CC 00000000 */   nop
.L001B21D0:
/* 0B22D0 001B21D0 D000A427 */  addiu       $4, $29, 0xD0
/* 0B22D4 001B21D4 282E2072 */  paddub      $5, $17, $0
/* 0B22D8 001B21D8 7801A627 */  addiu       $6, $29, 0x178
/* 0B22DC 001B21DC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0B22E0 001B21E0 00000000 */   nop
/* 0B22E4 001B21E4 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0B22E8 001B21E8 00000000 */   nop
/* 0B22EC 001B21EC EC01023C */  lui         $2, %hi(DngMesStb)
/* 0B22F0 001B21F0 A0934424 */  addiu       $4, $2, %lo(DngMesStb)
/* 0B22F4 001B21F4 282E2072 */  paddub      $5, $17, $0
/* 0B22F8 001B21F8 8036050C */  jal         SetBuff__6ClsMesFPs
/* 0B22FC 001B21FC 00000000 */   nop
/* 0B2300 001B2200 7801A28F */  lw          $2, 0x178($29)
/* 0B2304 001B2204 83110200 */  sra         $2, $2, 6
/* 0B2308 001B2208 01004224 */  addiu       $2, $2, 0x1
/* 0B230C 001B220C 80110200 */  sll         $2, $2, 6
/* 0B2310 001B2210 03290200 */  sra         $5, $2, 4
/* 0B2314 001B2214 F001023C */  lui         $2, %hi(BtSteebMesBuffer)
/* 0B2318 001B2218 B0664424 */  addiu       $4, $2, %lo(BtSteebMesBuffer)
/* 0B231C 001B221C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0B2320 001B2220 00000000 */   nop
/* 0B2324 001B2224 F001023C */  lui         $2, %hi(BtSteebMesBuffer)
/* 0B2328 001B2228 B0664424 */  addiu       $4, $2, %lo(BtSteebMesBuffer)
/* 0B232C 001B222C 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 0B2330 001B2230 00000000 */   nop
/* 0B2334 001B2234 E09390AF */  sw          $16, -0x6C20($28)
.L001B2238:
/* 0B2338 001B2238 C701023C */  lui         $2, %hi(TexManager)
/* 0B233C 001B223C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B2340 001B2240 2A000524 */  addiu       $5, $0, 0x2A
/* 0B2344 001B2244 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0B2348 001B2248 00000000 */   nop
/* 0B234C 001B224C E001023C */  lui         $2, %hi(MainMonstorUnit)
/* 0B2350 001B2250 D0874424 */  addiu       $4, $2, %lo(MainMonstorUnit)
/* 0B2354 001B2254 282E0070 */  paddub      $5, $0, $0
/* 0B2358 001B2258 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 0B235C 001B225C 00000000 */   nop
/* 0B2360 001B2260 DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 0B2364 001B2264 E04B4224 */  addiu       $2, $2, %lo(MainDungeonMap)
/* 0B2368 001B2268 C89C82AF */  sw          $2, -0x6338($28)
/* 0B236C 001B226C DF01023C */  lui         $2, %hi(DngEventMan)
/* 0B2370 001B2270 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 0B2374 001B2274 D09C82AF */  sw          $2, -0x6330($28)
/* 0B2378 001B2278 D501023C */  lui         $2, %hi(BtCfgCash)
/* 0B237C 001B227C C0654424 */  addiu       $4, $2, %lo(BtCfgCash)
/* 0B2380 001B2280 282E6072 */  paddub      $5, $19, $0
/* 0B2384 001B2284 0815040C */  jal         strcmp
/* 0B2388 001B2288 00000000 */   nop
/* 0B238C 001B228C 07004014 */  bnez        $2, .L001B22AC
/* 0B2390 001B2290 00000000 */   nop
/* 0B2394 001B2294 DC93828F */  lw          $2, -0x6C24($28)
/* 0B2398 001B2298 04004010 */  beqz        $2, .L001B22AC
/* 0B239C 001B229C 00000000 */   nop
/* 0B23A0 001B22A0 28160070 */  paddub      $2, $0, $0
/* 0B23A4 001B22A4 49010010 */  b           .L001B27CC
/* 0B23A8 001B22A8 00000000 */   nop
.L001B22AC:
/* 0B23AC 001B22AC D501023C */  lui         $2, %hi(BtCfgCash)
/* 0B23B0 001B22B0 C0654424 */  addiu       $4, $2, %lo(BtCfgCash)
/* 0B23B4 001B22B4 282E6072 */  paddub      $5, $19, $0
/* 0B23B8 001B22B8 5A15040C */  jal         strcpy
/* 0B23BC 001B22BC 00000000 */   nop
/* 0B23C0 001B22C0 F001013C */  lui         $1, %hi(MapModelBuffer + 0x8)
/* 0B23C4 001B22C4 586620AC */  sw          $0, %lo(MapModelBuffer + 0x8)($1)
/* 0B23C8 001B22C8 948B908F */  lw          $16, -0x746C($28)
/* 0B23CC 001B22CC 149E828F */  lw          $2, -0x61EC($28)
/* 0B23D0 001B22D0 948B82AF */  sw          $2, -0x746C($28)
/* 0B23D4 001B22D4 CC9C928F */  lw          $18, -0x6334($28)
/* 0B23D8 001B22D8 288E0070 */  paddub      $17, $0, $0
/* 0B23DC 001B22DC 12000010 */  b           .L001B2328
/* 0B23E0 001B22E0 00000000 */   nop
.L001B22E4:
/* 0B23E4 001B22E4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0B23E8 001B22E8 18102202 */  mult        $2, $17, $2
/* 0B23EC 001B22EC 21204202 */  addu        $4, $18, $2
/* 0B23F0 001B22F0 A000998C */  lw          $25, 0xA0($4)
/* 0B23F4 001B22F4 C400398F */  lw          $25, 0xC4($25)
/* 0B23F8 001B22F8 09F82003 */  jalr        $25
/* 0B23FC 001B22FC 00000000 */   nop
/* 0B2400 001B2300 80101100 */  sll         $2, $17, 2
/* 0B2404 001B2304 21185200 */  addu        $3, $2, $18
/* 0B2408 001B2308 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B240C 001B230C 21086100 */  addu        $1, $3, $1
/* 0B2410 001B2310 40D420AC */  sw          $0, -0x2BC0($1)
/* 0B2414 001B2314 03000224 */  addiu       $2, $0, 0x3
/* 0B2418 001B2318 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B241C 001B231C 21086100 */  addu        $1, $3, $1
/* 0B2420 001B2320 70D422AC */  sw          $2, -0x2B90($1)
/* 0B2424 001B2324 01003126 */  addiu       $17, $17, 0x1
.L001B2328:
/* 0B2428 001B2328 0C00222A */  slti        $2, $17, 0xC
/* 0B242C 001B232C EDFF4014 */  bnez        $2, .L001B22E4
/* 0B2430 001B2330 00000000 */   nop
/* 0B2434 001B2334 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2438 001B2338 21084102 */  addu        $1, $18, $1
/* 0B243C 001B233C A0D420AC */  sw          $0, -0x2B60($1)
/* 0B2440 001B2340 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2444 001B2344 21084102 */  addu        $1, $18, $1
/* 0B2448 001B2348 A4D420AC */  sw          $0, -0x2B5C($1)
/* 0B244C 001B234C DC01023C */  lui         $2, %hi(MainDungeonMap)
/* 0B2450 001B2350 E04B4424 */  addiu       $4, $2, %lo(MainDungeonMap)
/* 0B2454 001B2354 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B2458 001B2358 50664524 */  addiu       $5, $2, %lo(MapModelBuffer)
/* 0B245C 001B235C 3C30070C */  jal         initSubmap__11CDungeonMapFP14CDataAlloc2_1_
/* 0B2460 001B2360 00000000 */   nop
/* 0B2464 001B2364 28260070 */  paddub      $4, $0, $0
/* 0B2468 001B2368 0C000010 */  b           .L001B239C
/* 0B246C 001B236C 00000000 */   nop
.L001B2370:
/* 0B2470 001B2370 80190400 */  sll         $3, $4, 6
/* 0B2474 001B2374 DF01023C */  lui         $2, %hi(DngEventMan)
/* 0B2478 001B2378 B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 0B247C 001B237C 21184300 */  addu        $3, $2, $3
/* 0B2480 001B2380 000060A0 */  sb          $0, 0x0($3)
/* 0B2484 001B2384 FFFF0224 */  addiu       $2, $0, -0x1
/* 0B2488 001B2388 200062AC */  sw          $2, 0x20($3)
/* 0B248C 001B238C 1C0062AC */  sw          $2, 0x1C($3)
/* 0B2490 001B2390 340060AC */  sw          $0, 0x34($3)
/* 0B2494 001B2394 3C0060AC */  sw          $0, 0x3C($3)
/* 0B2498 001B2398 01008424 */  addiu       $4, $4, 0x1
.L001B239C:
/* 0B249C 001B239C 40008228 */  slti        $2, $4, 0x40
/* 0B24A0 001B23A0 F3FF4014 */  bnez        $2, .L001B2370
/* 0B24A4 001B23A4 00000000 */   nop
/* 0B24A8 001B23A8 28260070 */  paddub      $4, $0, $0
/* 0B24AC 001B23AC 0C000010 */  b           .L001B23E0
/* 0B24B0 001B23B0 00000000 */   nop
.L001B23B4:
/* 0B24B4 001B23B4 80190400 */  sll         $3, $4, 6
/* 0B24B8 001B23B8 DF01023C */  lui         $2, %hi(DngEventMan)
/* 0B24BC 001B23BC B0364224 */  addiu       $2, $2, %lo(DngEventMan)
/* 0B24C0 001B23C0 21184300 */  addu        $3, $2, $3
/* 0B24C4 001B23C4 001060AC */  sw          $0, 0x1000($3)
/* 0B24C8 001B23C8 341060AC */  sw          $0, 0x1034($3)
/* 0B24CC 001B23CC 381060AC */  sw          $0, 0x1038($3)
/* 0B24D0 001B23D0 301060AC */  sw          $0, 0x1030($3)
/* 0B24D4 001B23D4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0B24D8 001B23D8 3C1062AC */  sw          $2, 0x103C($3)
/* 0B24DC 001B23DC 01008424 */  addiu       $4, $4, 0x1
.L001B23E0:
/* 0B24E0 001B23E0 60008228 */  slti        $2, $4, 0x60
/* 0B24E4 001B23E4 F3FF4014 */  bnez        $2, .L001B23B4
/* 0B24E8 001B23E8 00000000 */   nop
/* 0B24EC 001B23EC 5000A427 */  addiu       $4, $29, 0x50
/* 0B24F0 001B23F0 2A00023C */  lui         $2, %hi(LIT_1355)
/* 0B24F4 001B23F4 B8B54524 */  addiu       $5, $2, %lo(LIT_1355)
/* 0B24F8 001B23F8 5A15040C */  jal         strcpy
/* 0B24FC 001B23FC 00000000 */   nop
/* 0B2500 001B2400 5000A427 */  addiu       $4, $29, 0x50
/* 0B2504 001B2404 282E6072 */  paddub      $5, $19, $0
/* 0B2508 001B2408 BC14040C */  jal         strcat
/* 0B250C 001B240C 00000000 */   nop
/* 0B2510 001B2410 5000A427 */  addiu       $4, $29, 0x50
/* 0B2514 001B2414 2A00023C */  lui         $2, %hi(LIT_1356)
/* 0B2518 001B2418 C8B54524 */  addiu       $5, $2, %lo(LIT_1356)
/* 0B251C 001B241C BC14040C */  jal         strcat
/* 0B2520 001B2420 00000000 */   nop
/* 0B2524 001B2424 9000A427 */  addiu       $4, $29, 0x90
/* 0B2528 001B2428 2A00023C */  lui         $2, %hi(LIT_1357)
/* 0B252C 001B242C D0B54524 */  addiu       $5, $2, %lo(LIT_1357)
/* 0B2530 001B2430 5A15040C */  jal         strcpy
/* 0B2534 001B2434 00000000 */   nop
/* 0B2538 001B2438 9000A427 */  addiu       $4, $29, 0x90
/* 0B253C 001B243C 282E6072 */  paddub      $5, $19, $0
/* 0B2540 001B2440 BC14040C */  jal         strcat
/* 0B2544 001B2444 00000000 */   nop
/* 0B2548 001B2448 9000A427 */  addiu       $4, $29, 0x90
/* 0B254C 001B244C 2A00023C */  lui         $2, %hi(LIT_1358)
/* 0B2550 001B2450 D8B54524 */  addiu       $5, $2, %lo(LIT_1358)
/* 0B2554 001B2454 BC14040C */  jal         strcat
/* 0B2558 001B2458 00000000 */   nop
/* 0B255C 001B245C 9000A427 */  addiu       $4, $29, 0x90
/* 0B2560 001B2460 2438070C */  jal         TEIGIAnalyz__FPc
/* 0B2564 001B2464 00000000 */   nop
/* 0B2568 001B2468 7C01A0AF */  sw          $0, 0x17C($29)
/* 0B256C 001B246C 948B858F */  lw          $5, -0x746C($28)
/* 0B2570 001B2470 5000A427 */  addiu       $4, $29, 0x50
/* 0B2574 001B2474 7C01A627 */  addiu       $6, $29, 0x17C
/* 0B2578 001B2478 D8FC040C */  jal         LoadFile__FPcPvPi
/* 0B257C 001B247C 00000000 */   nop
/* 0B2580 001B2480 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0B2584 001B2484 00000000 */   nop
/* 0B2588 001B2488 7C01A58F */  lw          $5, 0x17C($29)
/* 0B258C 001B248C 6100023C */  lui         $2, (0x61A800 >> 16)
/* 0B2590 001B2490 00A84234 */  ori         $2, $2, (0x61A800 & 0xFFFF)
/* 0B2594 001B2494 2A10A200 */  slt         $2, $5, $2
/* 0B2598 001B2498 08004014 */  bnez        $2, .L001B24BC
/* 0B259C 001B249C 00000000 */   nop
/* 0B25A0 001B24A0 2A00023C */  lui         $2, %hi(LIT_1359)
/* 0B25A4 001B24A4 E0B54424 */  addiu       $4, $2, %lo(LIT_1359)
/* 0B25A8 001B24A8 A611040C */  jal         printf
/* 0B25AC 001B24AC 00000000 */   nop
/* 0B25B0 001B24B0 01000424 */  addiu       $4, $0, 0x1
/* 0B25B4 001B24B4 DC05040C */  jal         exit__2
/* 0B25B8 001B24B8 00000000 */   nop
.L001B24BC:
/* 0B25BC 001B24BC 948B848F */  lw          $4, -0x746C($28)
/* 0B25C0 001B24C0 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B25C4 001B24C4 50664524 */  addiu       $5, $2, %lo(MapModelBuffer)
/* 0B25C8 001B24C8 1439070C */  jal         TEIGIImgLoad__FPUiP14CDataAlloc2_1_
/* 0B25CC 001B24CC 00000000 */   nop
/* 0B25D0 001B24D0 948B848F */  lw          $4, -0x746C($28)
/* 0B25D4 001B24D4 282E0070 */  paddub      $5, $0, $0
/* 0B25D8 001B24D8 7C3A070C */  jal         TEIGIMdsLoad__FPUii
/* 0B25DC 001B24DC 00000000 */   nop
/* 0B25E0 001B24E0 1001A427 */  addiu       $4, $29, 0x110
/* 0B25E4 001B24E4 509F040C */  jal         __ct__10CFrameAttrFv
/* 0B25E8 001B24E8 00000000 */   nop
/* 0B25EC 001B24EC 01000224 */  addiu       $2, $0, 0x1
/* 0B25F0 001B24F0 1C01A2A3 */  sb          $2, 0x11C($29)
/* 0B25F4 001B24F4 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 0B25F8 001B24F8 1401A2AF */  sw          $2, 0x114($29)
/* 0B25FC 001B24FC 1801A0A3 */  sb          $0, 0x118($29)
/* 0B2600 001B2500 1B01A0A3 */  sb          $0, 0x11B($29)
/* 0B2604 001B2504 948B848F */  lw          $4, -0x746C($28)
/* 0B2608 001B2508 2A00023C */  lui         $2, %hi(LIT_1360)
/* 0B260C 001B250C 00B64524 */  addiu       $5, $2, %lo(LIT_1360)
/* 0B2610 001B2510 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B2614 001B2514 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B2618 001B2518 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B261C 001B251C 00000000 */   nop
/* 0B2620 001B2520 C89C838F */  lw          $3, -0x6338($28)
/* 0B2624 001B2524 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2628 001B2528 21086100 */  addu        $1, $3, $1
/* 0B262C 001B252C 68BC22AC */  sw          $2, -0x4398($1)
/* 0B2630 001B2530 948B848F */  lw          $4, -0x746C($28)
/* 0B2634 001B2534 2A00023C */  lui         $2, %hi(LIT_1361)
/* 0B2638 001B2538 10B64524 */  addiu       $5, $2, %lo(LIT_1361)
/* 0B263C 001B253C F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B2640 001B2540 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B2644 001B2544 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B2648 001B2548 00000000 */   nop
/* 0B264C 001B254C C89C838F */  lw          $3, -0x6338($28)
/* 0B2650 001B2550 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2654 001B2554 21086100 */  addu        $1, $3, $1
/* 0B2658 001B2558 64BC22AC */  sw          $2, -0x439C($1)
/* 0B265C 001B255C 948B848F */  lw          $4, -0x746C($28)
/* 0B2660 001B2560 2A00023C */  lui         $2, %hi(LIT_1362)
/* 0B2664 001B2564 20B64524 */  addiu       $5, $2, %lo(LIT_1362)
/* 0B2668 001B2568 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B266C 001B256C 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B2670 001B2570 80DB060C */  jal         LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B2674 001B2574 00000000 */   nop
/* 0B2678 001B2578 C89C838F */  lw          $3, -0x6338($28)
/* 0B267C 001B257C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2680 001B2580 21086100 */  addu        $1, $3, $1
/* 0B2684 001B2584 6CBC22AC */  sw          $2, -0x4394($1)
/* 0B2688 001B2588 C89C828F */  lw          $2, -0x6338($28)
/* 0B268C 001B258C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2690 001B2590 21084100 */  addu        $1, $2, $1
/* 0B2694 001B2594 68BC248C */  lw          $4, -0x4398($1)
/* 0B2698 001B2598 1001A527 */  addiu       $5, $29, 0x110
/* 0B269C 001B259C 01000624 */  addiu       $6, $0, 0x1
/* 0B26A0 001B25A0 283E0070 */  paddub      $7, $0, $0
/* 0B26A4 001B25A4 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0B26A8 001B25A8 00000000 */   nop
/* 0B26AC 001B25AC C89C828F */  lw          $2, -0x6338($28)
/* 0B26B0 001B25B0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B26B4 001B25B4 21084100 */  addu        $1, $2, $1
/* 0B26B8 001B25B8 64BC248C */  lw          $4, -0x439C($1)
/* 0B26BC 001B25BC 1001A527 */  addiu       $5, $29, 0x110
/* 0B26C0 001B25C0 01000624 */  addiu       $6, $0, 0x1
/* 0B26C4 001B25C4 283E0070 */  paddub      $7, $0, $0
/* 0B26C8 001B25C8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0B26CC 001B25CC 00000000 */   nop
/* 0B26D0 001B25D0 948B848F */  lw          $4, -0x746C($28)
/* 0B26D4 001B25D4 2A00023C */  lui         $2, %hi(LIT_1363)
/* 0B26D8 001B25D8 30B64524 */  addiu       $5, $2, %lo(LIT_1363)
/* 0B26DC 001B25DC F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B26E0 001B25E0 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B26E4 001B25E4 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B26E8 001B25E8 00000000 */   nop
/* 0B26EC 001B25EC C89C838F */  lw          $3, -0x6338($28)
/* 0B26F0 001B25F0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B26F4 001B25F4 21086100 */  addu        $1, $3, $1
/* 0B26F8 001B25F8 74BC22AC */  sw          $2, -0x438C($1)
/* 0B26FC 001B25FC 948B848F */  lw          $4, -0x746C($28)
/* 0B2700 001B2600 2A00023C */  lui         $2, %hi(LIT_1364)
/* 0B2704 001B2604 40B64524 */  addiu       $5, $2, %lo(LIT_1364)
/* 0B2708 001B2608 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B270C 001B260C 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B2710 001B2610 5CDB060C */  jal         LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B2714 001B2614 00000000 */   nop
/* 0B2718 001B2618 C89C838F */  lw          $3, -0x6338($28)
/* 0B271C 001B261C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2720 001B2620 21086100 */  addu        $1, $3, $1
/* 0B2724 001B2624 70BC22AC */  sw          $2, -0x4390($1)
/* 0B2728 001B2628 948B848F */  lw          $4, -0x746C($28)
/* 0B272C 001B262C 2A00023C */  lui         $2, %hi(LIT_1365)
/* 0B2730 001B2630 50B64524 */  addiu       $5, $2, %lo(LIT_1365)
/* 0B2734 001B2634 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B2738 001B2638 50664624 */  addiu       $6, $2, %lo(MapModelBuffer)
/* 0B273C 001B263C 80DB060C */  jal         LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B2740 001B2640 00000000 */   nop
/* 0B2744 001B2644 C89C838F */  lw          $3, -0x6338($28)
/* 0B2748 001B2648 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B274C 001B264C 21086100 */  addu        $1, $3, $1
/* 0B2750 001B2650 78BC22AC */  sw          $2, -0x4388($1)
/* 0B2754 001B2654 C89C828F */  lw          $2, -0x6338($28)
/* 0B2758 001B2658 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B275C 001B265C 21084100 */  addu        $1, $2, $1
/* 0B2760 001B2660 74BC248C */  lw          $4, -0x438C($1)
/* 0B2764 001B2664 1001A527 */  addiu       $5, $29, 0x110
/* 0B2768 001B2668 01000624 */  addiu       $6, $0, 0x1
/* 0B276C 001B266C 283E0070 */  paddub      $7, $0, $0
/* 0B2770 001B2670 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0B2774 001B2674 00000000 */   nop
/* 0B2778 001B2678 C89C828F */  lw          $2, -0x6338($28)
/* 0B277C 001B267C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0B2780 001B2680 21084100 */  addu        $1, $2, $1
/* 0B2784 001B2684 70BC248C */  lw          $4, -0x4390($1)
/* 0B2788 001B2688 1001A527 */  addiu       $5, $29, 0x110
/* 0B278C 001B268C 01000624 */  addiu       $6, $0, 0x1
/* 0B2790 001B2690 283E0070 */  paddub      $7, $0, $0
/* 0B2794 001B2694 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0B2798 001B2698 00000000 */   nop
/* 0B279C 001B269C EB01023C */  lui         $2, %hi(itemOpenSmall)
/* 0B27A0 001B26A0 505E4424 */  addiu       $4, $2, %lo(itemOpenSmall)
/* 0B27A4 001B26A4 948B858F */  lw          $5, -0x746C($28)
/* 0B27A8 001B26A8 2A00023C */  lui         $2, %hi(LIT_1366)
/* 0B27AC 001B26AC 60B64624 */  addiu       $6, $2, %lo(LIT_1366)
/* 0B27B0 001B26B0 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B27B4 001B26B4 50664724 */  addiu       $7, $2, %lo(MapModelBuffer)
/* 0B27B8 001B26B8 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B27BC 001B26BC 50664824 */  addiu       $8, $2, %lo(MapModelBuffer)
/* 0B27C0 001B26C0 DC01023C */  lui         $2, %hi(itemOpenSmall_info)
/* 0B27C4 001B26C4 10254924 */  addiu       $9, $2, %lo(itemOpenSmall_info)
/* 0B27C8 001B26C8 28560070 */  paddub      $10, $0, $0
/* 0B27CC 001B26CC 8CDA060C */  jal         LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
/* 0B27D0 001B26D0 00000000 */   nop
/* 0B27D4 001B26D4 EB01023C */  lui         $2, %hi(itemOpenBig)
/* 0B27D8 001B26D8 905F4424 */  addiu       $4, $2, %lo(itemOpenBig)
/* 0B27DC 001B26DC 948B858F */  lw          $5, -0x746C($28)
/* 0B27E0 001B26E0 2A00023C */  lui         $2, %hi(LIT_1367)
/* 0B27E4 001B26E4 80B64624 */  addiu       $6, $2, %lo(LIT_1367)
/* 0B27E8 001B26E8 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B27EC 001B26EC 50664724 */  addiu       $7, $2, %lo(MapModelBuffer)
/* 0B27F0 001B26F0 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0B27F4 001B26F4 50664824 */  addiu       $8, $2, %lo(MapModelBuffer)
/* 0B27F8 001B26F8 DC01023C */  lui         $2, %hi(itemOpenBig_info)
/* 0B27FC 001B26FC 30254924 */  addiu       $9, $2, %lo(itemOpenBig_info)
/* 0B2800 001B2700 28560070 */  paddub      $10, $0, $0
/* 0B2804 001B2704 8CDA060C */  jal         LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi
/* 0B2808 001B2708 00000000 */   nop
/* 0B280C 001B270C F001013C */  lui         $1, %hi(MapModelBuffer + 0x8)
/* 0B2810 001B2710 5866248C */  lw          $4, %lo(MapModelBuffer + 0x8)($1)
/* 0B2814 001B2714 00190400 */  sll         $3, $4, 4
/* 0B2818 001B2718 F001013C */  lui         $1, %hi(MapModelBuffer)
/* 0B281C 001B271C 5066228C */  lw          $2, %lo(MapModelBuffer)($1)
/* 0B2820 001B2720 21184300 */  addu        $3, $2, $3
/* 0B2824 001B2724 0A00023C */  lui         $2, (0xA7F80 >> 16)
/* 0B2828 001B2728 807F4534 */  ori         $5, $2, (0xA7F80 & 0xFFFF)
/* 0B282C 001B272C 2310A400 */  subu        $2, $5, $4
/* 0B2830 001B2730 3C100200 */  dsll32      $2, $2, 0
/* 0B2834 001B2734 3F100200 */  dsra32      $2, $2, 0
/* 0B2838 001B2738 F001013C */  lui         $1, %hi(MonstorModelBuffer)
/* 0B283C 001B273C D06623AC */  sw          $3, %lo(MonstorModelBuffer)($1)
/* 0B2840 001B2740 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0xC)
/* 0B2844 001B2744 DC6622AC */  sw          $2, %lo(MonstorModelBuffer + 0xC)($1)
/* 0B2848 001B2748 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0x8)
/* 0B284C 001B274C D86620AC */  sw          $0, %lo(MonstorModelBuffer + 0x8)($1)
/* 0B2850 001B2750 948B90AF */  sw          $16, -0x746C($28)
/* 0B2854 001B2754 2A00023C */  lui         $2, %hi(LIT_1368)
/* 0B2858 001B2758 A0B64424 */  addiu       $4, $2, %lo(LIT_1368)
/* 0B285C 001B275C A611040C */  jal         printf
/* 0B2860 001B2760 00000000 */   nop
/* 0B2864 001B2764 F001013C */  lui         $1, %hi(MapModelBuffer + 0xC)
/* 0B2868 001B2768 5C66278C */  lw          $7, %lo(MapModelBuffer + 0xC)($1)
/* 0B286C 001B276C F001013C */  lui         $1, %hi(MapModelBuffer + 0x8)
/* 0B2870 001B2770 5866268C */  lw          $6, %lo(MapModelBuffer + 0x8)($1)
/* 0B2874 001B2774 00190600 */  sll         $3, $6, 4
/* 0B2878 001B2778 F001013C */  lui         $1, %hi(MapModelBuffer)
/* 0B287C 001B277C 5066228C */  lw          $2, %lo(MapModelBuffer)($1)
/* 0B2880 001B2780 21284300 */  addu        $5, $2, $3
/* 0B2884 001B2784 2A00023C */  lui         $2, %hi(LIT_1369__2)
/* 0B2888 001B2788 B0B64424 */  addiu       $4, $2, %lo(LIT_1369__2)
/* 0B288C 001B278C A611040C */  jal         printf
/* 0B2890 001B2790 00000000 */   nop
/* 0B2894 001B2794 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0xC)
/* 0B2898 001B2798 DC66278C */  lw          $7, %lo(MonstorModelBuffer + 0xC)($1)
/* 0B289C 001B279C F001013C */  lui         $1, %hi(MonstorModelBuffer + 0x8)
/* 0B28A0 001B27A0 D866268C */  lw          $6, %lo(MonstorModelBuffer + 0x8)($1)
/* 0B28A4 001B27A4 00190600 */  sll         $3, $6, 4
/* 0B28A8 001B27A8 F001013C */  lui         $1, %hi(MonstorModelBuffer)
/* 0B28AC 001B27AC D066228C */  lw          $2, %lo(MonstorModelBuffer)($1)
/* 0B28B0 001B27B0 21284300 */  addu        $5, $2, $3
/* 0B28B4 001B27B4 2A00023C */  lui         $2, %hi(LIT_1370)
/* 0B28B8 001B27B8 D0B64424 */  addiu       $4, $2, %lo(LIT_1370)
/* 0B28BC 001B27BC A611040C */  jal         printf
/* 0B28C0 001B27C0 00000000 */   nop
/* 0B28C4 001B27C4 01000224 */  addiu       $2, $0, 0x1
/* 0B28C8 001B27C8 DC9382AF */  sw          $2, -0x6C24($28)
.L001B27CC:
/* 0B28CC 001B27CC 4000BF7B */  lq          $31, 0x40($29)
/* 0B28D0 001B27D0 3000B37B */  lq          $19, 0x30($29)
/* 0B28D4 001B27D4 2000B27B */  lq          $18, 0x20($29)
/* 0B28D8 001B27D8 1000B17B */  lq          $17, 0x10($29)
/* 0B28DC 001B27DC 0000B07B */  lq          $16, 0x0($29)
/* 0B28E0 001B27E0 8001BD27 */  addiu       $29, $29, 0x180
/* 0B28E4 001B27E4 0800E003 */  jr          $31
/* 0B28E8 001B27E8 00000000 */   nop
/* 0B28EC 001B27EC 00000000 */  nop
