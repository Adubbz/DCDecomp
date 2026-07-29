.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TitleLoop__Fv
/* 026520 01DD2220 80FFBD27 */  addiu       $29, $29, -0x80
/* 026524 01DD2224 1000BF7F */  sq          $31, 0x10($29)
/* 026528 01DD2228 0000B07F */  sq          $16, 0x0($29)
/* 02652C 01DD222C 2400023C */  lui         $2, %hi(Vu_prog0f)
/* 026530 01DD2230 00614524 */  addiu       $5, $2, %lo(Vu_prog0f)
/* 026534 01DD2234 D48B848F */  lw          $4, -0x742C($28)
/* 026538 01DD2238 28360070 */  paddub      $6, $0, $0
/* 02653C 01DD223C 5C83040C */  jal         sceVif1PkCall
/* 026540 01DD2240 00000000 */   nop
/* 026544 01DD2244 E501023C */  lui         $2, %hi(FCamera)
/* 026548 01DD2248 F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 02654C 01DD224C 2000A527 */  addiu       $5, $29, 0x20
/* 026550 01DD2250 9C91040C */  jal         GetPos__7CCameraFPf
/* 026554 01DD2254 00000000 */   nop
/* 026558 01DD2258 E501023C */  lui         $2, %hi(FCamera)
/* 02655C 01DD225C F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 026560 01DD2260 01000524 */  addiu       $5, $0, 0x1
/* 026564 01DD2264 F491040C */  jal         Step__13CCameraFollowFi
/* 026568 01DD2268 00000000 */   nop
/* 02656C 01DD226C E501023C */  lui         $2, %hi(FCamera)
/* 026570 01DD2270 F0184424 */  addiu       $4, $2, %lo(FCamera)
/* 026574 01DD2274 3000A527 */  addiu       $5, $29, 0x30
/* 026578 01DD2278 F890040C */  jal         GetCameraMatrix__7CCameraFPA4_f
/* 02657C 01DD227C 00000000 */   nop
/* 026580 01DD2280 3000A427 */  addiu       $4, $29, 0x30
/* 026584 01DD2284 2000A527 */  addiu       $5, $29, 0x20
/* 026588 01DD2288 E8B7040C */  jal         MGSetViewMatrix__FPA4_fPf
/* 02658C 01DD228C 00000000 */   nop
/* 026590 01DD2290 E501023C */  lui         $2, %hi(Cloud__2)
/* 026594 01DD2294 E01B4424 */  addiu       $4, $2, %lo(Cloud__2)
/* 026598 01DD2298 4CE1040C */  jal         Step__10CCharacterFv
/* 02659C 01DD229C 00000000 */   nop
/* 0265A0 01DD22A0 309C848F */  lw          $4, -0x63D0($28)
/* 0265A4 01DD22A4 0F00812C */  sltiu       $1, $4, 0xF
/* 0265A8 01DD22A8 4B022010 */  beqz        $1, .L01DD2BD8_2D83D8
/* 0265AC 01DD22AC 00000000 */   nop
/* 0265B0 01DD22B0 DE01023C */  lui         $2, %hi(LIT_526__4)
/* 0265B4 01DD22B4 500E4324 */  addiu       $3, $2, %lo(LIT_526__4)
/* 0265B8 01DD22B8 80100400 */  sll         $2, $4, 2
/* 0265BC 01DD22BC 21104300 */  addu        $2, $2, $3
/* 0265C0 01DD22C0 0000428C */  lw          $2, 0x0($2)
/* 0265C4 01DD22C4 08004000 */  jr          $2
/* 0265C8 01DD22C8 00000000 */   nop
/* 0265CC 01DD22CC 389C8427 */  addiu       $4, $28, -0x63C8
/* 0265D0 01DD22D0 4054770C */  jal         In__8CScFaderFv
/* 0265D4 01DD22D4 00000000 */   nop
/* 0265D8 01DD22D8 03004010 */  beqz        $2, .L01DD22E8_2D7AE8
/* 0265DC 01DD22DC 00000000 */   nop
/* 0265E0 01DD22E0 02000224 */  addiu       $2, $0, 0x2
/* 0265E4 01DD22E4 309C82AF */  sw          $2, -0x63D0($28)
.L01DD22E8_2D7AE8:
/* 0265E8 01DD22E8 CC01023C */  lui         $2, %hi(GamePad)
/* 0265EC 01DD22EC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0265F0 01DD22F0 00080524 */  addiu       $5, $0, 0x800
/* 0265F4 01DD22F4 1CAE040C */  jal         Down__8CGamePadFi
/* 0265F8 01DD22F8 00000000 */   nop
/* 0265FC 01DD22FC 0A004010 */  beqz        $2, .L01DD2328_2D7B28
/* 026600 01DD2300 00000000 */   nop
/* 026604 01DD2304 609C828F */  lw          $2, -0x63A0($28)
/* 026608 01DD2308 11004128 */  slti        $1, $2, 0x11
/* 02660C 01DD230C 06002014 */  bnez        $1, .L01DD2328_2D7B28
/* 026610 01DD2310 00000000 */   nop
/* 026614 01DD2314 389C8427 */  addiu       $4, $28, -0x63C8
/* 026618 01DD2318 8C54770C */  jal         Skip__8CScFaderFv
/* 02661C 01DD231C 00000000 */   nop
/* 026620 01DD2320 03000224 */  addiu       $2, $0, 0x3
/* 026624 01DD2324 309C82AF */  sw          $2, -0x63D0($28)
.L01DD2328_2D7B28:
/* 026628 01DD2328 609C828F */  lw          $2, -0x63A0($28)
/* 02662C 01DD232C 64004128 */  slti        $1, $2, 0x64
/* 026630 01DD2330 29022010 */  beqz        $1, .L01DD2BD8_2D83D8
/* 026634 01DD2334 00000000 */   nop
/* 026638 01DD2338 01004224 */  addiu       $2, $2, 0x1
/* 02663C 01DD233C 609C82AF */  sw          $2, -0x63A0($28)
/* 026640 01DD2340 25020010 */  b           .L01DD2BD8_2D83D8
/* 026644 01DD2344 00000000 */   nop
/* 026648 01DD2348 389C8427 */  addiu       $4, $28, -0x63C8
/* 02664C 01DD234C 5454770C */  jal         In2__8CScFaderFv
/* 026650 01DD2350 00000000 */   nop
/* 026654 01DD2354 20024010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026658 01DD2358 00000000 */   nop
/* 02665C 01DD235C 04000224 */  addiu       $2, $0, 0x4
/* 026660 01DD2360 309C82AF */  sw          $2, -0x63D0($28)
/* 026664 01DD2364 1C020010 */  b           .L01DD2BD8_2D83D8
/* 026668 01DD2368 00000000 */   nop
/* 02666C 01DD236C 4C9C828F */  lw          $2, -0x63B4($28)
/* 026670 01DD2370 78004128 */  slti        $1, $2, 0x78
/* 026674 01DD2374 05002010 */  beqz        $1, .L01DD238C_2D7B8C
/* 026678 01DD2378 00000000 */   nop
/* 02667C 01DD237C 01004224 */  addiu       $2, $2, 0x1
/* 026680 01DD2380 4C9C82AF */  sw          $2, -0x63B4($28)
/* 026684 01DD2384 03000010 */  b           .L01DD2394_2D7B94
/* 026688 01DD2388 00000000 */   nop
.L01DD238C_2D7B8C:
/* 02668C 01DD238C 03000224 */  addiu       $2, $0, 0x3
/* 026690 01DD2390 309C82AF */  sw          $2, -0x63D0($28)
.L01DD2394_2D7B94:
/* 026694 01DD2394 CC01023C */  lui         $2, %hi(GamePad)
/* 026698 01DD2398 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 02669C 01DD239C 00080524 */  addiu       $5, $0, 0x800
/* 0266A0 01DD23A0 1CAE040C */  jal         Down__8CGamePadFi
/* 0266A4 01DD23A4 00000000 */   nop
/* 0266A8 01DD23A8 0B024010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 0266AC 01DD23AC 00000000 */   nop
/* 0266B0 01DD23B0 03000224 */  addiu       $2, $0, 0x3
/* 0266B4 01DD23B4 309C82AF */  sw          $2, -0x63D0($28)
/* 0266B8 01DD23B8 07020010 */  b           .L01DD2BD8_2D83D8
/* 0266BC 01DD23BC 00000000 */   nop
/* 0266C0 01DD23C0 E601023C */  lui         $2, %hi(CSprite)
/* 0266C4 01DD23C4 70DE4424 */  addiu       $4, $2, %lo(CSprite)
/* 0266C8 01DD23C8 2C53770C */  jal         Se__7CSpriteFv
/* 0266CC 01DD23CC 00000000 */   nop
/* 0266D0 01DD23D0 08004014 */  bnez        $2, .L01DD23F4_2D7BF4
/* 0266D4 01DD23D4 00000000 */   nop
/* 0266D8 01DD23D8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0266DC 01DD23DC 00608244 */  mtc1        $2, $f12
/* 0266E0 01DD23E0 0E000424 */  addiu       $4, $0, 0xE
/* 0266E4 01DD23E4 26000524 */  addiu       $5, $0, 0x26
/* 0266E8 01DD23E8 15000624 */  addiu       $6, $0, 0x15
/* 0266EC 01DD23EC 9054770C */  jal         TiPlayVolSE__Fiiif
/* 0266F0 01DD23F0 00000000 */   nop
.L01DD23F4_2D7BF4:
/* 0266F4 01DD23F4 E601023C */  lui         $2, %hi(CSprite)
/* 0266F8 01DD23F8 70DE4424 */  addiu       $4, $2, %lo(CSprite)
/* 0266FC 01DD23FC 3051770C */  jal         Move__7CSpriteFv
/* 026700 01DD2400 00000000 */   nop
/* 026704 01DD2404 CC01023C */  lui         $2, %hi(GamePad)
/* 026708 01DD2408 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 02670C 01DD240C 00080524 */  addiu       $5, $0, 0x800
/* 026710 01DD2410 1CAE040C */  jal         Down__8CGamePadFi
/* 026714 01DD2414 00000000 */   nop
/* 026718 01DD2418 09004010 */  beqz        $2, .L01DD2440_2D7C40
/* 02671C 01DD241C 00000000 */   nop
/* 026720 01DD2420 E842023C */  lui         $2, (0x42E80000 >> 16)
/* 026724 01DD2424 E501013C */  lui         $1, %hi(Logo + 0x2F0)
/* 026728 01DD2428 803022AC */  sw          $2, %lo(Logo + 0x2F0)($1)
/* 02672C 01DD242C 80000224 */  addiu       $2, $0, 0x80
/* 026730 01DD2430 3C9C82AF */  sw          $2, -0x63C4($28)
/* 026734 01DD2434 2F44023C */  lui         $2, (0x442F0000 >> 16)
/* 026738 01DD2438 E601013C */  lui         $1, %hi(CSprite)
/* 02673C 01DD243C 70DE22AC */  sw          $2, %lo(CSprite)($1)
.L01DD2440_2D7C40:
/* 026740 01DD2440 E601013C */  lui         $1, %hi(CSprite)
/* 026744 01DD2444 70DE21C4 */  lwc1        $f1, %lo(CSprite)($1)
/* 026748 01DD2448 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 02674C 01DD244C 00008244 */  mtc1        $2, $f0
/* 026750 01DD2450 00000000 */  nop
/* 026754 01DD2454 36080046 */  c.le.s      $f1, $f0
/* 026758 01DD2458 00000000 */  nop
/* 02675C 01DD245C DE010145 */  bc1t        .L01DD2BD8_2D83D8
/* 026760 01DD2460 00000000 */   nop
/* 026764 01DD2464 E501013C */  lui         $1, %hi(Logo + 0x2F0)
/* 026768 01DD2468 803021C4 */  lwc1        $f1, %lo(Logo + 0x2F0)($1)
/* 02676C 01DD246C E842023C */  lui         $2, (0x42E80000 >> 16)
/* 026770 01DD2470 00008244 */  mtc1        $2, $f0
/* 026774 01DD2474 00000000 */  nop
/* 026778 01DD2478 34080046 */  c.lt.s      $f1, $f0
/* 02677C 01DD247C 00000000 */  nop
/* 026780 01DD2480 19000045 */  bc1f        .L01DD24E8_2D7CE8
/* 026784 01DD2484 00000000 */   nop
/* 026788 01DD2488 28860070 */  paddub      $16, $0, $0
/* 02678C 01DD248C 09000010 */  b           .L01DD24B4_2D7CB4
/* 026790 01DD2490 00000000 */   nop
.L01DD2494_2D7C94:
/* 026794 01DD2494 B0110224 */  addiu       $2, $0, 0x11B0
/* 026798 01DD2498 18180202 */  mult        $3, $16, $2
/* 02679C 01DD249C E501023C */  lui         $2, %hi(Spark)
/* 0267A0 01DD24A0 403F4224 */  addiu       $2, $2, %lo(Spark)
/* 0267A4 01DD24A4 21204300 */  addu        $4, $2, $3
/* 0267A8 01DD24A8 4CE1040C */  jal         Step__10CCharacterFv
/* 0267AC 01DD24AC 00000000 */   nop
/* 0267B0 01DD24B0 01001026 */  addiu       $16, $16, 0x1
.L01DD24B4_2D7CB4:
/* 0267B4 01DD24B4 0900022A */  slti        $2, $16, 0x9
/* 0267B8 01DD24B8 F6FF4014 */  bnez        $2, .L01DD2494_2D7C94
/* 0267BC 01DD24BC 00000000 */   nop
/* 0267C0 01DD24C0 E501023C */  lui         $2, %hi(Logo)
/* 0267C4 01DD24C4 902D4424 */  addiu       $4, $2, %lo(Logo)
/* 0267C8 01DD24C8 4CE1040C */  jal         Step__10CCharacterFv
/* 0267CC 01DD24CC 00000000 */   nop
/* 0267D0 01DD24D0 E601023C */  lui         $2, %hi(CLogo)
/* 0267D4 01DD24D4 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 0267D8 01DD24D8 C04F770C */  jal         Fade__5CLogoFv
/* 0267DC 01DD24DC 00000000 */   nop
/* 0267E0 01DD24E0 1A000010 */  b           .L01DD254C_2D7D4C
/* 0267E4 01DD24E4 00000000 */   nop
.L01DD24E8_2D7CE8:
/* 0267E8 01DD24E8 3C9C828F */  lw          $2, -0x63C4($28)
/* 0267EC 01DD24EC 80004128 */  slti        $1, $2, 0x80
/* 0267F0 01DD24F0 05002010 */  beqz        $1, .L01DD2508_2D7D08
/* 0267F4 01DD24F4 00000000 */   nop
/* 0267F8 01DD24F8 01004224 */  addiu       $2, $2, 0x1
/* 0267FC 01DD24FC 3C9C82AF */  sw          $2, -0x63C4($28)
/* 026800 01DD2500 0E000010 */  b           .L01DD253C_2D7D3C
/* 026804 01DD2504 00000000 */   nop
.L01DD2508_2D7D08:
/* 026808 01DD2508 409C828F */  lw          $2, -0x63C0($28)
/* 02680C 01DD250C 02004224 */  addiu       $2, $2, 0x2
/* 026810 01DD2510 7F004230 */  andi        $2, $2, 0x7F
/* 026814 01DD2514 409C82AF */  sw          $2, -0x63C0($28)
/* 026818 01DD2518 549C828F */  lw          $2, -0x63AC($28)
/* 02681C 01DD251C 01004224 */  addiu       $2, $2, 0x1
/* 026820 01DD2520 549C82AF */  sw          $2, -0x63AC($28)
/* 026824 01DD2524 549C828F */  lw          $2, -0x63AC($28)
/* 026828 01DD2528 F4014228 */  slti        $2, $2, 0x1F4
/* 02682C 01DD252C 03004014 */  bnez        $2, .L01DD253C_2D7D3C
/* 026830 01DD2530 00000000 */   nop
/* 026834 01DD2534 F4010224 */  addiu       $2, $0, 0x1F4
/* 026838 01DD2538 549C82AF */  sw          $2, -0x63AC($28)
.L01DD253C_2D7D3C:
/* 02683C 01DD253C E601023C */  lui         $2, %hi(CLogo)
/* 026840 01DD2540 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 026844 01DD2544 F450770C */  jal         Move__5CLogoFv
/* 026848 01DD2548 00000000 */   nop
.L01DD254C_2D7D4C:
/* 02684C 01DD254C 3C9C828F */  lw          $2, -0x63C4($28)
/* 026850 01DD2550 80004128 */  slti        $1, $2, 0x80
/* 026854 01DD2554 12002014 */  bnez        $1, .L01DD25A0_2D7DA0
/* 026858 01DD2558 00000000 */   nop
/* 02685C 01DD255C CC01023C */  lui         $2, %hi(GamePad)
/* 026860 01DD2560 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 026864 01DD2564 00080524 */  addiu       $5, $0, 0x800
/* 026868 01DD2568 1CAE040C */  jal         Down__8CGamePadFi
/* 02686C 01DD256C 00000000 */   nop
/* 026870 01DD2570 0B004010 */  beqz        $2, .L01DD25A0_2D7DA0
/* 026874 01DD2574 00000000 */   nop
/* 026878 01DD2578 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02687C 01DD257C 00608244 */  mtc1        $2, $f12
/* 026880 01DD2580 0D000424 */  addiu       $4, $0, 0xD
/* 026884 01DD2584 7A000524 */  addiu       $5, $0, 0x7A
/* 026888 01DD2588 19000624 */  addiu       $6, $0, 0x19
/* 02688C 01DD258C 9054770C */  jal         TiPlayVolSE__Fiiif
/* 026890 01DD2590 00000000 */   nop
/* 026894 01DD2594 04000224 */  addiu       $2, $0, 0x4
/* 026898 01DD2598 309C82AF */  sw          $2, -0x63D0($28)
/* 02689C 01DD259C 509C80AF */  sw          $0, -0x63B0($28)
.L01DD25A0_2D7DA0:
/* 0268A0 01DD25A0 3C9C828F */  lw          $2, -0x63C4($28)
/* 0268A4 01DD25A4 80004128 */  slti        $1, $2, 0x80
/* 0268A8 01DD25A8 8B012014 */  bnez        $1, .L01DD2BD8_2D83D8
/* 0268AC 01DD25AC 00000000 */   nop
/* 0268B0 01DD25B0 509C828F */  lw          $2, -0x63B0($28)
/* 0268B4 01DD25B4 09074128 */  slti        $1, $2, 0x709
/* 0268B8 01DD25B8 08002014 */  bnez        $1, .L01DD25DC_2D7DDC
/* 0268BC 01DD25BC 00000000 */   nop
/* 0268C0 01DD25C0 03000224 */  addiu       $2, $0, 0x3
/* 0268C4 01DD25C4 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0268C8 01DD25C8 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
/* 0268CC 01DD25CC 07000224 */  addiu       $2, $0, 0x7
/* 0268D0 01DD25D0 309C82AF */  sw          $2, -0x63D0($28)
/* 0268D4 01DD25D4 80010010 */  b           .L01DD2BD8_2D83D8
/* 0268D8 01DD25D8 00000000 */   nop
.L01DD25DC_2D7DDC:
/* 0268DC 01DD25DC 01004224 */  addiu       $2, $2, 0x1
/* 0268E0 01DD25E0 509C82AF */  sw          $2, -0x63B0($28)
/* 0268E4 01DD25E4 7C010010 */  b           .L01DD2BD8_2D83D8
/* 0268E8 01DD25E8 00000000 */   nop
/* 0268EC 01DD25EC E601023C */  lui         $2, %hi(CLogo)
/* 0268F0 01DD25F0 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 0268F4 01DD25F4 F450770C */  jal         Move__5CLogoFv
/* 0268F8 01DD25F8 00000000 */   nop
/* 0268FC 01DD25FC E601023C */  lui         $2, %hi(CCursol)
/* 026900 01DD2600 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026904 01DD2604 4853770C */  jal         Move__7CCursolFv
/* 026908 01DD2608 00000000 */   nop
/* 02690C 01DD260C 72014010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026910 01DD2610 00000000 */   nop
/* 026914 01DD2614 CC01023C */  lui         $2, %hi(GamePad)
/* 026918 01DD2618 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 02691C 01DD261C 00100524 */  addiu       $5, $0, 0x1000
/* 026920 01DD2620 1CAE040C */  jal         Down__8CGamePadFi
/* 026924 01DD2624 00000000 */   nop
/* 026928 01DD2628 0E004010 */  beqz        $2, .L01DD2664_2D7E64
/* 02692C 01DD262C 00000000 */   nop
/* 026930 01DD2630 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026934 01DD2634 5CDF228C */  lw          $2, %lo(CCursol + 0x1C)($1)
/* 026938 01DD2638 FFFF4224 */  addiu       $2, $2, -0x1
/* 02693C 01DD263C E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026940 01DD2640 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
/* 026944 01DD2644 509C80AF */  sw          $0, -0x63B0($28)
/* 026948 01DD2648 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02694C 01DD264C 00608244 */  mtc1        $2, $f12
/* 026950 01DD2650 0D000424 */  addiu       $4, $0, 0xD
/* 026954 01DD2654 7A000524 */  addiu       $5, $0, 0x7A
/* 026958 01DD2658 18000624 */  addiu       $6, $0, 0x18
/* 02695C 01DD265C 9054770C */  jal         TiPlayVolSE__Fiiif
/* 026960 01DD2660 00000000 */   nop
.L01DD2664_2D7E64:
/* 026964 01DD2664 CC01023C */  lui         $2, %hi(GamePad)
/* 026968 01DD2668 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 02696C 01DD266C 00400524 */  addiu       $5, $0, 0x4000
/* 026970 01DD2670 1CAE040C */  jal         Down__8CGamePadFi
/* 026974 01DD2674 00000000 */   nop
/* 026978 01DD2678 0E004010 */  beqz        $2, .L01DD26B4_2D7EB4
/* 02697C 01DD267C 00000000 */   nop
/* 026980 01DD2680 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026984 01DD2684 5CDF228C */  lw          $2, %lo(CCursol + 0x1C)($1)
/* 026988 01DD2688 01004224 */  addiu       $2, $2, 0x1
/* 02698C 01DD268C E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026990 01DD2690 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
/* 026994 01DD2694 509C80AF */  sw          $0, -0x63B0($28)
/* 026998 01DD2698 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02699C 01DD269C 00608244 */  mtc1        $2, $f12
/* 0269A0 01DD26A0 0D000424 */  addiu       $4, $0, 0xD
/* 0269A4 01DD26A4 7A000524 */  addiu       $5, $0, 0x7A
/* 0269A8 01DD26A8 18000624 */  addiu       $6, $0, 0x18
/* 0269AC 01DD26AC 9054770C */  jal         TiPlayVolSE__Fiiif
/* 0269B0 01DD26B0 00000000 */   nop
.L01DD26B4_2D7EB4:
/* 0269B4 01DD26B4 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0269B8 01DD26B8 5CDF228C */  lw          $2, %lo(CCursol + 0x1C)($1)
/* 0269BC 01DD26BC 04004104 */  bgez        $2, .L01DD26D0_2D7ED0
/* 0269C0 01DD26C0 00000000 */   nop
/* 0269C4 01DD26C4 02000224 */  addiu       $2, $0, 0x2
/* 0269C8 01DD26C8 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0269CC 01DD26CC 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
.L01DD26D0_2D7ED0:
/* 0269D0 01DD26D0 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0269D4 01DD26D4 5CDF228C */  lw          $2, %lo(CCursol + 0x1C)($1)
/* 0269D8 01DD26D8 03004128 */  slti        $1, $2, 0x3
/* 0269DC 01DD26DC 03002014 */  bnez        $1, .L01DD26EC_2D7EEC
/* 0269E0 01DD26E0 00000000 */   nop
/* 0269E4 01DD26E4 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0269E8 01DD26E8 5CDF20AC */  sw          $0, %lo(CCursol + 0x1C)($1)
.L01DD26EC_2D7EEC:
/* 0269EC 01DD26EC E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 0269F0 01DD26F0 5CDF238C */  lw          $3, %lo(CCursol + 0x1C)($1)
/* 0269F4 01DD26F4 02000224 */  addiu       $2, $0, 0x2
/* 0269F8 01DD26F8 18006210 */  beq         $3, $2, .L01DD275C_2D7F5C
/* 0269FC 01DD26FC 00000000 */   nop
/* 026A00 01DD2700 01000224 */  addiu       $2, $0, 0x1
/* 026A04 01DD2704 0D006210 */  beq         $3, $2, .L01DD273C_2D7F3C
/* 026A08 01DD2708 00000000 */   nop
/* 026A0C 01DD270C 03006010 */  beqz        $3, .L01DD271C_2D7F1C
/* 026A10 01DD2710 00000000 */   nop
/* 026A14 01DD2714 17000010 */  b           .L01DD2774_2D7F74
/* 026A18 01DD2718 00000000 */   nop
.L01DD271C_2D7F1C:
/* 026A1C 01DD271C 9043023C */  lui         $2, (0x43900000 >> 16)
/* 026A20 01DD2720 00608244 */  mtc1        $2, $f12
/* 026A24 01DD2724 E601023C */  lui         $2, %hi(CCursol)
/* 026A28 01DD2728 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026A2C 01DD272C 2C54770C */  jal         Set__7CCursolFf
/* 026A30 01DD2730 00000000 */   nop
/* 026A34 01DD2734 0F000010 */  b           .L01DD2774_2D7F74
/* 026A38 01DD2738 00000000 */   nop
.L01DD273C_2D7F3C:
/* 026A3C 01DD273C 9E43023C */  lui         $2, (0x439E0000 >> 16)
/* 026A40 01DD2740 00608244 */  mtc1        $2, $f12
/* 026A44 01DD2744 E601023C */  lui         $2, %hi(CCursol)
/* 026A48 01DD2748 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026A4C 01DD274C 2C54770C */  jal         Set__7CCursolFf
/* 026A50 01DD2750 00000000 */   nop
/* 026A54 01DD2754 07000010 */  b           .L01DD2774_2D7F74
/* 026A58 01DD2758 00000000 */   nop
.L01DD275C_2D7F5C:
/* 026A5C 01DD275C AE43023C */  lui         $2, (0x43AE0000 >> 16)
/* 026A60 01DD2760 00608244 */  mtc1        $2, $f12
/* 026A64 01DD2764 E601023C */  lui         $2, %hi(CCursol)
/* 026A68 01DD2768 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026A6C 01DD276C 2C54770C */  jal         Set__7CCursolFf
/* 026A70 01DD2770 00000000 */   nop
.L01DD2774_2D7F74:
/* 026A74 01DD2774 CC01023C */  lui         $2, %hi(GamePad)
/* 026A78 01DD2778 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 026A7C 01DD277C 00080524 */  addiu       $5, $0, 0x800
/* 026A80 01DD2780 1CAE040C */  jal         Down__8CGamePadFi
/* 026A84 01DD2784 00000000 */   nop
/* 026A88 01DD2788 08004014 */  bnez        $2, .L01DD27AC_2D7FAC
/* 026A8C 01DD278C 00000000 */   nop
/* 026A90 01DD2790 CC01023C */  lui         $2, %hi(GamePad)
/* 026A94 01DD2794 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 026A98 01DD2798 40000524 */  addiu       $5, $0, 0x40
/* 026A9C 01DD279C 1CAE040C */  jal         Down__8CGamePadFi
/* 026AA0 01DD27A0 00000000 */   nop
/* 026AA4 01DD27A4 0B004010 */  beqz        $2, .L01DD27D4_2D7FD4
/* 026AA8 01DD27A8 00000000 */   nop
.L01DD27AC_2D7FAC:
/* 026AAC 01DD27AC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 026AB0 01DD27B0 00608244 */  mtc1        $2, $f12
/* 026AB4 01DD27B4 0E000424 */  addiu       $4, $0, 0xE
/* 026AB8 01DD27B8 26000524 */  addiu       $5, $0, 0x26
/* 026ABC 01DD27BC 14000624 */  addiu       $6, $0, 0x14
/* 026AC0 01DD27C0 9054770C */  jal         TiPlayVolSE__Fiiif
/* 026AC4 01DD27C4 00000000 */   nop
/* 026AC8 01DD27C8 05000224 */  addiu       $2, $0, 0x5
/* 026ACC 01DD27CC 309C82AF */  sw          $2, -0x63D0($28)
/* 026AD0 01DD27D0 509C80AF */  sw          $0, -0x63B0($28)
.L01DD27D4_2D7FD4:
/* 026AD4 01DD27D4 CC01023C */  lui         $2, %hi(GamePad)
/* 026AD8 01DD27D8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 026ADC 01DD27DC 20000524 */  addiu       $5, $0, 0x20
/* 026AE0 01DD27E0 1CAE040C */  jal         Down__8CGamePadFi
/* 026AE4 01DD27E4 00000000 */   nop
/* 026AE8 01DD27E8 14004010 */  beqz        $2, .L01DD283C_2D803C
/* 026AEC 01DD27EC 00000000 */   nop
/* 026AF0 01DD27F0 489C80AF */  sw          $0, -0x63B8($28)
/* 026AF4 01DD27F4 449C80AF */  sw          $0, -0x63BC($28)
/* 026AF8 01DD27F8 409C80AF */  sw          $0, -0x63C0($28)
/* 026AFC 01DD27FC 3C9C80AF */  sw          $0, -0x63C4($28)
/* 026B00 01DD2800 E601023C */  lui         $2, %hi(CSprite)
/* 026B04 01DD2804 70DE4424 */  addiu       $4, $2, %lo(CSprite)
/* 026B08 01DD2808 1C51770C */  jal         Init__7CSpriteFv
/* 026B0C 01DD280C 00000000 */   nop
/* 026B10 01DD2810 E601023C */  lui         $2, %hi(CLogo)
/* 026B14 01DD2814 E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 026B18 01DD2818 904F770C */  jal         Init__5CLogoFv
/* 026B1C 01DD281C 00000000 */   nop
/* 026B20 01DD2820 E601023C */  lui         $2, %hi(CCursol)
/* 026B24 01DD2824 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026B28 01DD2828 3C53770C */  jal         Init__7CCursolFv
/* 026B2C 01DD282C 00000000 */   nop
/* 026B30 01DD2830 03000224 */  addiu       $2, $0, 0x3
/* 026B34 01DD2834 309C82AF */  sw          $2, -0x63D0($28)
/* 026B38 01DD2838 509C80AF */  sw          $0, -0x63B0($28)
.L01DD283C_2D803C:
/* 026B3C 01DD283C 509C828F */  lw          $2, -0x63B0($28)
/* 026B40 01DD2840 09074128 */  slti        $1, $2, 0x709
/* 026B44 01DD2844 08002014 */  bnez        $1, .L01DD2868_2D8068
/* 026B48 01DD2848 00000000 */   nop
/* 026B4C 01DD284C 03000224 */  addiu       $2, $0, 0x3
/* 026B50 01DD2850 E601013C */  lui         $1, %hi(CCursol + 0x1C)
/* 026B54 01DD2854 5CDF22AC */  sw          $2, %lo(CCursol + 0x1C)($1)
/* 026B58 01DD2858 07000224 */  addiu       $2, $0, 0x7
/* 026B5C 01DD285C 309C82AF */  sw          $2, -0x63D0($28)
/* 026B60 01DD2860 DD000010 */  b           .L01DD2BD8_2D83D8
/* 026B64 01DD2864 00000000 */   nop
.L01DD2868_2D8068:
/* 026B68 01DD2868 01004224 */  addiu       $2, $2, 0x1
/* 026B6C 01DD286C 509C82AF */  sw          $2, -0x63B0($28)
/* 026B70 01DD2870 D9000010 */  b           .L01DD2BD8_2D83D8
/* 026B74 01DD2874 00000000 */   nop
/* 026B78 01DD2878 E601023C */  lui         $2, %hi(CLogo)
/* 026B7C 01DD287C E0DE4424 */  addiu       $4, $2, %lo(CLogo)
/* 026B80 01DD2880 F450770C */  jal         Move__5CLogoFv
/* 026B84 01DD2884 00000000 */   nop
/* 026B88 01DD2888 01000224 */  addiu       $2, $0, 0x1
/* 026B8C 01DD288C 589C82A3 */  sb          $2, -0x63A8($28)
/* 026B90 01DD2890 5C9C828F */  lw          $2, -0x63A4($28)
/* 026B94 01DD2894 01004224 */  addiu       $2, $2, 0x1
/* 026B98 01DD2898 5C9C82AF */  sw          $2, -0x63A4($28)
/* 026B9C 01DD289C 5C9C828F */  lw          $2, -0x63A4($28)
/* 026BA0 01DD28A0 3D004128 */  slti        $1, $2, 0x3D
/* 026BA4 01DD28A4 CC002014 */  bnez        $1, .L01DD2BD8_2D83D8
/* 026BA8 01DD28A8 00000000 */   nop
/* 026BAC 01DD28AC 06000224 */  addiu       $2, $0, 0x6
/* 026BB0 01DD28B0 309C82AF */  sw          $2, -0x63D0($28)
/* 026BB4 01DD28B4 C8000010 */  b           .L01DD2BD8_2D83D8
/* 026BB8 01DD28B8 00000000 */   nop
/* 026BBC 01DD28BC 5C9C828F */  lw          $2, -0x63A4($28)
/* 026BC0 01DD28C0 01004224 */  addiu       $2, $2, 0x1
/* 026BC4 01DD28C4 5C9C82AF */  sw          $2, -0x63A4($28)
/* 026BC8 01DD28C8 389C8427 */  addiu       $4, $28, -0x63C8
/* 026BCC 01DD28CC 6854770C */  jal         Out__8CScFaderFv
/* 026BD0 01DD28D0 00000000 */   nop
/* 026BD4 01DD28D4 C0004010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026BD8 01DD28D8 00000000 */   nop
/* 026BDC 01DD28DC E601023C */  lui         $2, %hi(CCursol)
/* 026BE0 01DD28E0 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026BE4 01DD28E4 3054770C */  jal         GetSelect__7CCursolFv
/* 026BE8 01DD28E8 00000000 */   nop
/* 026BEC 01DD28EC 02000324 */  addiu       $3, $0, 0x2
/* 026BF0 01DD28F0 10004310 */  beq         $2, $3, .L01DD2934_2D8134
/* 026BF4 01DD28F4 00000000 */   nop
/* 026BF8 01DD28F8 01000324 */  addiu       $3, $0, 0x1
/* 026BFC 01DD28FC 09004310 */  beq         $2, $3, .L01DD2924_2D8124
/* 026C00 01DD2900 00000000 */   nop
/* 026C04 01DD2904 03004010 */  beqz        $2, .L01DD2914_2D8114
/* 026C08 01DD2908 00000000 */   nop
/* 026C0C 01DD290C B2000010 */  b           .L01DD2BD8_2D83D8
/* 026C10 01DD2910 00000000 */   nop
.L01DD2914_2D8114:
/* 026C14 01DD2914 08000224 */  addiu       $2, $0, 0x8
/* 026C18 01DD2918 309C82AF */  sw          $2, -0x63D0($28)
/* 026C1C 01DD291C AE000010 */  b           .L01DD2BD8_2D83D8
/* 026C20 01DD2920 00000000 */   nop
.L01DD2924_2D8124:
/* 026C24 01DD2924 0A000224 */  addiu       $2, $0, 0xA
/* 026C28 01DD2928 309C82AF */  sw          $2, -0x63D0($28)
/* 026C2C 01DD292C AA000010 */  b           .L01DD2BD8_2D83D8
/* 026C30 01DD2930 00000000 */   nop
.L01DD2934_2D8134:
/* 026C34 01DD2934 0C000224 */  addiu       $2, $0, 0xC
/* 026C38 01DD2938 309C82AF */  sw          $2, -0x63D0($28)
/* 026C3C 01DD293C A6000010 */  b           .L01DD2BD8_2D83D8
/* 026C40 01DD2940 00000000 */   nop
/* 026C44 01DD2944 389C8427 */  addiu       $4, $28, -0x63C8
/* 026C48 01DD2948 6854770C */  jal         Out__8CScFaderFv
/* 026C4C 01DD294C 00000000 */   nop
/* 026C50 01DD2950 A1004010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026C54 01DD2954 00000000 */   nop
/* 026C58 01DD2958 1469050C */  jal         SndStopAllSe__Fv
/* 026C5C 01DD295C 00000000 */   nop
/* 026C60 01DD2960 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026C64 01DD2964 282E0070 */  paddub      $5, $0, $0
/* 026C68 01DD2968 441A050C */  jal         Stop__6CSoundFi
/* 026C6C 01DD296C 00000000 */   nop
/* 026C70 01DD2970 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026C74 01DD2974 282E0070 */  paddub      $5, $0, $0
/* 026C78 01DD2978 FC0E050C */  jal         StopVoice__6CSoundFi
/* 026C7C 01DD297C 00000000 */   nop
/* 026C80 01DD2980 0E000224 */  addiu       $2, $0, 0xE
/* 026C84 01DD2984 309C82AF */  sw          $2, -0x63D0($28)
/* 026C88 01DD2988 93000010 */  b           .L01DD2BD8_2D83D8
/* 026C8C 01DD298C 00000000 */   nop
/* 026C90 01DD2990 1469050C */  jal         SndStopAllSe__Fv
/* 026C94 01DD2994 00000000 */   nop
/* 026C98 01DD2998 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026C9C 01DD299C 282E0070 */  paddub      $5, $0, $0
/* 026CA0 01DD29A0 441A050C */  jal         Stop__6CSoundFi
/* 026CA4 01DD29A4 00000000 */   nop
/* 026CA8 01DD29A8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026CAC 01DD29AC 282E0070 */  paddub      $5, $0, $0
/* 026CB0 01DD29B0 FC0E050C */  jal         StopVoice__6CSoundFi
/* 026CB4 01DD29B4 00000000 */   nop
/* 026CB8 01DD29B8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026CBC 01DD29BC 282E0070 */  paddub      $5, $0, $0
/* 026CC0 01DD29C0 04000624 */  addiu       $6, $0, 0x4
/* 026CC4 01DD29C4 28000724 */  addiu       $7, $0, 0x28
/* 026CC8 01DD29C8 140F050C */  jal         SetReverb__6CSoundFiii
/* 026CCC 01DD29CC 00000000 */   nop
/* 026CD0 01DD29D0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026CD4 01DD29D4 0F000524 */  addiu       $5, $0, 0xF
/* 026CD8 01DD29D8 00010624 */  addiu       $6, $0, 0x100
/* 026CDC 01DD29DC 581A050C */  jal         SetVol__6CSoundFii
/* 026CE0 01DD29E0 00000000 */   nop
/* 026CE4 01DD29E4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026CE8 01DD29E8 0E000524 */  addiu       $5, $0, 0xE
/* 026CEC 01DD29EC 00010624 */  addiu       $6, $0, 0x100
/* 026CF0 01DD29F0 581A050C */  jal         SetVol__6CSoundFii
/* 026CF4 01DD29F4 00000000 */   nop
/* 026CF8 01DD29F8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026CFC 01DD29FC 0D000524 */  addiu       $5, $0, 0xD
/* 026D00 01DD2A00 00010624 */  addiu       $6, $0, 0x100
/* 026D04 01DD2A04 581A050C */  jal         SetVol__6CSoundFii
/* 026D08 01DD2A08 00000000 */   nop
/* 026D0C 01DD2A0C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026D10 01DD2A10 0C000524 */  addiu       $5, $0, 0xC
/* 026D14 01DD2A14 00010624 */  addiu       $6, $0, 0x100
/* 026D18 01DD2A18 581A050C */  jal         SetVol__6CSoundFii
/* 026D1C 01DD2A1C 00000000 */   nop
/* 026D20 01DD2A20 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026D24 01DD2A24 282E0070 */  paddub      $5, $0, $0
/* 026D28 01DD2A28 28360070 */  paddub      $6, $0, $0
/* 026D2C 01DD2A2C 8814050C */  jal         SQ_Play__6CSoundFii
/* 026D30 01DD2A30 00000000 */   nop
/* 026D34 01DD2A34 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 026D38 01DD2A38 00608244 */  mtc1        $2, $f12
/* 026D3C 01DD2A3C 0F000424 */  addiu       $4, $0, 0xF
/* 026D40 01DD2A40 10000524 */  addiu       $5, $0, 0x10
/* 026D44 01DD2A44 18000624 */  addiu       $6, $0, 0x18
/* 026D48 01DD2A48 9054770C */  jal         TiPlayVolSE__Fiiif
/* 026D4C 01DD2A4C 00000000 */   nop
/* 026D50 01DD2A50 7800A527 */  addiu       $5, $29, 0x78
/* 026D54 01DD2A54 E08A82DF */  ld          $2, -0x7520($28)
/* 026D58 01DD2A58 0000A2FC */  sd          $2, 0x0($5)
/* 026D5C 01DD2A5C 948B848F */  lw          $4, -0x746C($28)
/* 026D60 01DD2A60 98F3080C */  jal         InitOpeningBook__FP1Pi
/* 026D64 01DD2A64 00000000 */   nop
/* 026D68 01DD2A68 09000224 */  addiu       $2, $0, 0x9
/* 026D6C 01DD2A6C 309C82AF */  sw          $2, -0x63D0($28)
/* 026D70 01DD2A70 59000010 */  b           .L01DD2BD8_2D83D8
/* 026D74 01DD2A74 00000000 */   nop
/* 026D78 01DD2A78 C4F3080C */  jal         OpeningBookKey__Fv
/* 026D7C 01DD2A7C 00000000 */   nop
/* 026D80 01DD2A80 55004010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026D84 01DD2A84 00000000 */   nop
/* 026D88 01DD2A88 0E000224 */  addiu       $2, $0, 0xE
/* 026D8C 01DD2A8C 309C82AF */  sw          $2, -0x63D0($28)
/* 026D90 01DD2A90 51000010 */  b           .L01DD2BD8_2D83D8
/* 026D94 01DD2A94 00000000 */   nop
/* 026D98 01DD2A98 28260070 */  paddub      $4, $0, $0
/* 026D9C 01DD2A9C 02000524 */  addiu       $5, $0, 0x2
/* 026DA0 01DD2AA0 28360070 */  paddub      $6, $0, $0
/* 026DA4 01DD2AA4 C47E080C */  jal         InitMenuSave__FiiP1
/* 026DA8 01DD2AA8 00000000 */   nop
/* 026DAC 01DD2AAC 0B000224 */  addiu       $2, $0, 0xB
/* 026DB0 01DD2AB0 309C82AF */  sw          $2, -0x63D0($28)
/* 026DB4 01DD2AB4 48000010 */  b           .L01DD2BD8_2D83D8
/* 026DB8 01DD2AB8 00000000 */   nop
/* 026DBC 01DD2ABC B47F080C */  jal         MenuSaveKey__Fv
/* 026DC0 01DD2AC0 00000000 */   nop
/* 026DC4 01DD2AC4 02000324 */  addiu       $3, $0, 0x2
/* 026DC8 01DD2AC8 16004310 */  beq         $2, $3, .L01DD2B24_2D8324
/* 026DCC 01DD2ACC 00000000 */   nop
/* 026DD0 01DD2AD0 01000324 */  addiu       $3, $0, 0x1
/* 026DD4 01DD2AD4 0A004310 */  beq         $2, $3, .L01DD2B00_2D8300
/* 026DD8 01DD2AD8 00000000 */   nop
/* 026DDC 01DD2ADC 03004010 */  beqz        $2, .L01DD2AEC_2D82EC
/* 026DE0 01DD2AE0 00000000 */   nop
/* 026DE4 01DD2AE4 3C000010 */  b           .L01DD2BD8_2D83D8
/* 026DE8 01DD2AE8 00000000 */   nop
.L01DD2AEC_2D82EC:
/* 026DEC 01DD2AEC 389C8427 */  addiu       $4, $28, -0x63C8
/* 026DF0 01DD2AF0 4054770C */  jal         In__8CScFaderFv
/* 026DF4 01DD2AF4 00000000 */   nop
/* 026DF8 01DD2AF8 37000010 */  b           .L01DD2BD8_2D83D8
/* 026DFC 01DD2AFC 00000000 */   nop
.L01DD2B00_2D8300:
/* 026E00 01DD2B00 1C8D828F */  lw          $2, -0x72E4($28)
/* 026E04 01DD2B04 C801448C */  lw          $4, 0x1C8($2)
/* 026E08 01DD2B08 FFFF0524 */  addiu       $5, $0, -0x1
/* 026E0C 01DD2B0C 4C07050C */  jal         MapJump__Fii
/* 026E10 01DD2B10 00000000 */   nop
/* 026E14 01DD2B14 0E000224 */  addiu       $2, $0, 0xE
/* 026E18 01DD2B18 309C82AF */  sw          $2, -0x63D0($28)
/* 026E1C 01DD2B1C 2E000010 */  b           .L01DD2BD8_2D83D8
/* 026E20 01DD2B20 00000000 */   nop
.L01DD2B24_2D8324:
/* 026E24 01DD2B24 589C80A3 */  sb          $0, -0x63A8($28)
/* 026E28 01DD2B28 389C80AF */  sw          $0, -0x63C8($28)
/* 026E2C 01DD2B2C 01000224 */  addiu       $2, $0, 0x1
/* 026E30 01DD2B30 309C82AF */  sw          $2, -0x63D0($28)
/* 026E34 01DD2B34 28000010 */  b           .L01DD2BD8_2D83D8
/* 026E38 01DD2B38 00000000 */   nop
/* 026E3C 01DD2B3C 28260070 */  paddub      $4, $0, $0
/* 026E40 01DD2B40 02000524 */  addiu       $5, $0, 0x2
/* 026E44 01DD2B44 28360070 */  paddub      $6, $0, $0
/* 026E48 01DD2B48 3479080C */  jal         InitMenuOption__FiiP1
/* 026E4C 01DD2B4C 00000000 */   nop
/* 026E50 01DD2B50 0D000224 */  addiu       $2, $0, 0xD
/* 026E54 01DD2B54 309C82AF */  sw          $2, -0x63D0($28)
/* 026E58 01DD2B58 1F000010 */  b           .L01DD2BD8_2D83D8
/* 026E5C 01DD2B5C 00000000 */   nop
/* 026E60 01DD2B60 389C8427 */  addiu       $4, $28, -0x63C8
/* 026E64 01DD2B64 4054770C */  jal         In__8CScFaderFv
/* 026E68 01DD2B68 00000000 */   nop
/* 026E6C 01DD2B6C 6C7A080C */  jal         MenuOptionKey__Fv
/* 026E70 01DD2B70 00000000 */   nop
/* 026E74 01DD2B74 18004010 */  beqz        $2, .L01DD2BD8_2D83D8
/* 026E78 01DD2B78 00000000 */   nop
/* 026E7C 01DD2B7C 589C80A3 */  sb          $0, -0x63A8($28)
/* 026E80 01DD2B80 389C80AF */  sw          $0, -0x63C8($28)
/* 026E84 01DD2B84 01000224 */  addiu       $2, $0, 0x1
/* 026E88 01DD2B88 309C82AF */  sw          $2, -0x63D0($28)
/* 026E8C 01DD2B8C 12000010 */  b           .L01DD2BD8_2D83D8
/* 026E90 01DD2B90 00000000 */   nop
/* 026E94 01DD2B94 1469050C */  jal         SndStopAllSe__Fv
/* 026E98 01DD2B98 00000000 */   nop
/* 026E9C 01DD2B9C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026EA0 01DD2BA0 282E0070 */  paddub      $5, $0, $0
/* 026EA4 01DD2BA4 441A050C */  jal         Stop__6CSoundFi
/* 026EA8 01DD2BA8 00000000 */   nop
/* 026EAC 01DD2BAC 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026EB0 01DD2BB0 282E0070 */  paddub      $5, $0, $0
/* 026EB4 01DD2BB4 FC0E050C */  jal         StopVoice__6CSoundFi
/* 026EB8 01DD2BB8 00000000 */   nop
/* 026EBC 01DD2BBC E601023C */  lui         $2, %hi(CCursol)
/* 026EC0 01DD2BC0 40DF4424 */  addiu       $4, $2, %lo(CCursol)
/* 026EC4 01DD2BC4 3054770C */  jal         GetSelect__7CCursolFv
/* 026EC8 01DD2BC8 00000000 */   nop
/* 026ECC 01DD2BCC 01004224 */  addiu       $2, $2, 0x1
/* 026ED0 01DD2BD0 07000010 */  b           .L01DD2BF0_2D83F0
/* 026ED4 01DD2BD4 00000000 */   nop
.L01DD2BD8_2D83D8:
/* 026ED8 01DD2BD8 044B770C */  jal         TitleDraw__Fv
/* 026EDC 01DD2BDC 00000000 */   nop
/* 026EE0 01DD2BE0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 026EE4 01DD2BE4 C817050C */  jal         Step__6CSoundFv
/* 026EE8 01DD2BE8 00000000 */   nop
/* 026EEC 01DD2BEC 28160070 */  paddub      $2, $0, $0
.L01DD2BF0_2D83F0:
/* 026EF0 01DD2BF0 1000BF7B */  lq          $31, 0x10($29)
/* 026EF4 01DD2BF4 0000B07B */  lq          $16, 0x0($29)
/* 026EF8 01DD2BF8 8000BD27 */  addiu       $29, $29, 0x80
/* 026EFC 01DD2BFC 0800E003 */  jr          $31
/* 026F00 01DD2C00 00000000 */   nop
/* 026F04 01DD2C04 00000000 */  nop
/* 026F08 01DD2C08 00000000 */  nop
/* 026F0C 01DD2C0C 00000000 */  nop
