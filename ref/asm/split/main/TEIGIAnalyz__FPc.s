.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel TEIGIAnalyz__FPc
/* 0CE190 001CE090 80FFBD27 */  addiu       $29, $29, -0x80
/* 0CE194 001CE094 7000BF7F */  sq          $31, 0x70($29)
/* 0CE198 001CE098 6000B67F */  sq          $22, 0x60($29)
/* 0CE19C 001CE09C 5000B57F */  sq          $21, 0x50($29)
/* 0CE1A0 001CE0A0 4000B47F */  sq          $20, 0x40($29)
/* 0CE1A4 001CE0A4 3000B37F */  sq          $19, 0x30($29)
/* 0CE1A8 001CE0A8 2000B27F */  sq          $18, 0x20($29)
/* 0CE1AC 001CE0AC 1000B17F */  sq          $17, 0x10($29)
/* 0CE1B0 001CE0B0 0000B07F */  sq          $16, 0x0($29)
/* 0CE1B4 001CE0B4 28868070 */  paddub      $16, $4, $0
/* 0CE1B8 001CE0B8 0C9480AF */  sw          $0, -0x6BF4($28)
/* 0CE1BC 001CE0BC 7E000224 */  addiu       $2, $0, 0x7E
/* 0CE1C0 001CE0C0 089482AF */  sw          $2, -0x6BF8($28)
/* 0CE1C4 001CE0C4 BE11040C */  jal         rand
/* 0CE1C8 001CE0C8 00000000 */   nop
/* 0CE1CC 001CE0CC 00008244 */  mtc1        $2, $f0
/* 0CE1D0 001CE0D0 00000000 */  nop
/* 0CE1D4 001CE0D4 60008046 */  cvt.s.w     $f1, $f0
/* 0CE1D8 001CE0D8 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 0CE1DC 001CE0DC 00008244 */  mtc1        $2, $f0
/* 0CE1E0 001CE0E0 00000000 */  nop
/* 0CE1E4 001CE0E4 42000146 */  mul.s       $f1, $f0, $f1
/* 0CE1E8 001CE0E8 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 0CE1EC 001CE0EC 00008244 */  mtc1        $2, $f0
/* 0CE1F0 001CE0F0 00000000 */  nop
/* 0CE1F4 001CE0F4 030B0046 */  div.s       $f12, $f1, $f0
/* 0CE1F8 001CE0F8 2C44040C */  jal         fptosi
/* 0CE1FC 001CE0FC 00000000 */   nop
/* 0CE200 001CE100 809C82AF */  sw          $2, -0x6380($28)
/* 0CE204 001CE104 809C828F */  lw          $2, -0x6380($28)
/* 0CE208 001CE108 04004004 */  bltz        $2, .L001CE11C
/* 0CE20C 001CE10C 00000000 */   nop
/* 0CE210 001CE110 05004228 */  slti        $2, $2, 0x5
/* 0CE214 001CE114 02004014 */  bnez        $2, .L001CE120
/* 0CE218 001CE118 00000000 */   nop
.L001CE11C:
/* 0CE21C 001CE11C 809C80AF */  sw          $0, -0x6380($28)
.L001CE120:
/* 0CE220 001CE120 A49D838F */  lw          $3, -0x625C($28)
/* 0CE224 001CE124 02000224 */  addiu       $2, $0, 0x2
/* 0CE228 001CE128 07006214 */  bne         $3, $2, .L001CE148
/* 0CE22C 001CE12C 00000000 */   nop
/* 0CE230 001CE130 789C828F */  lw          $2, -0x6388($28)
/* 0CE234 001CE134 02004380 */  lb          $3, 0x2($2)
/* 0CE238 001CE138 08000224 */  addiu       $2, $0, 0x8
/* 0CE23C 001CE13C 02006214 */  bne         $3, $2, .L001CE148
/* 0CE240 001CE140 00000000 */   nop
/* 0CE244 001CE144 809C80AF */  sw          $0, -0x6380($28)
.L001CE148:
/* 0CE248 001CE148 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0CE24C 001CE14C 50664424 */  addiu       $4, $2, %lo(MapModelBuffer)
/* 0CE250 001CE150 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 0CE254 001CE154 00000000 */   nop
/* 0CE258 001CE158 F001013C */  lui         $1, %hi(MapModelBuffer + 0x8)
/* 0CE25C 001CE15C 5866228C */  lw          $2, %lo(MapModelBuffer + 0x8)($1)
/* 0CE260 001CE160 00190200 */  sll         $3, $2, 4
/* 0CE264 001CE164 F001013C */  lui         $1, %hi(MapModelBuffer)
/* 0CE268 001CE168 5066228C */  lw          $2, %lo(MapModelBuffer)($1)
/* 0CE26C 001CE16C 21A04300 */  addu        $20, $2, $3
/* 0CE270 001CE170 28260072 */  paddub      $4, $16, $0
/* 0CE274 001CE174 282E8072 */  paddub      $5, $20, $0
/* 0CE278 001CE178 10948627 */  addiu       $6, $28, -0x6BF0
/* 0CE27C 001CE17C D8FC040C */  jal         LoadFile__FPcPvPi
/* 0CE280 001CE180 00000000 */   nop
/* 0CE284 001CE184 A4004010 */  beqz        $2, .L001CE418
/* 0CE288 001CE188 00000000 */   nop
/* 0CE28C 001CE18C DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0CE290 001CE190 00000000 */   nop
/* 0CE294 001CE194 1094828F */  lw          $2, -0x6BF0($28)
/* 0CE298 001CE198 03110200 */  sra         $2, $2, 4
/* 0CE29C 001CE19C 01004524 */  addiu       $5, $2, 0x1
/* 0CE2A0 001CE1A0 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0CE2A4 001CE1A4 50664424 */  addiu       $4, $2, %lo(MapModelBuffer)
/* 0CE2A8 001CE1A8 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0CE2AC 001CE1AC 00000000 */   nop
/* 0CE2B0 001CE1B0 F001023C */  lui         $2, %hi(MapModelBuffer)
/* 0CE2B4 001CE1B4 50664424 */  addiu       $4, $2, %lo(MapModelBuffer)
/* 0CE2B8 001CE1B8 609E040C */  jal         Align64__14CDataAlloc2_1_Fv
/* 0CE2BC 001CE1BC 00000000 */   nop
/* 0CE2C0 001CE1C0 28260070 */  paddub      $4, $0, $0
/* 0CE2C4 001CE1C4 0E000010 */  b           .L001CE200
/* 0CE2C8 001CE1C8 00000000 */   nop
.L001CE1CC:
/* 0CE2CC 001CE1CC 21308402 */  addu        $6, $20, $4
/* 0CE2D0 001CE1D0 0000C380 */  lb          $3, 0x0($6)
/* 0CE2D4 001CE1D4 0D000224 */  addiu       $2, $0, 0xD
/* 0CE2D8 001CE1D8 08006214 */  bne         $3, $2, .L001CE1FC
/* 0CE2DC 001CE1DC 00000000 */   nop
/* 0CE2E0 001CE1E0 0100C524 */  addiu       $5, $6, 0x1
/* 0CE2E4 001CE1E4 0100C380 */  lb          $3, 0x1($6)
/* 0CE2E8 001CE1E8 0A000224 */  addiu       $2, $0, 0xA
/* 0CE2EC 001CE1EC 03006214 */  bne         $3, $2, .L001CE1FC
/* 0CE2F0 001CE1F0 00000000 */   nop
/* 0CE2F4 001CE1F4 0000A0A0 */  sb          $0, 0x0($5)
/* 0CE2F8 001CE1F8 0000C0A0 */  sb          $0, 0x0($6)
.L001CE1FC:
/* 0CE2FC 001CE1FC 01008424 */  addiu       $4, $4, 0x1
.L001CE200:
/* 0CE300 001CE200 1094828F */  lw          $2, -0x6BF0($28)
/* 0CE304 001CE204 2A108200 */  slt         $2, $4, $2
/* 0CE308 001CE208 F0FF4014 */  bnez        $2, .L001CE1CC
/* 0CE30C 001CE20C 00000000 */   nop
/* 0CE310 001CE210 28860070 */  paddub      $16, $0, $0
/* 0CE314 001CE214 72000010 */  b           .L001CE3E0
/* 0CE318 001CE218 00000000 */   nop
.L001CE21C:
/* 0CE31C 001CE21C 28268072 */  paddub      $4, $20, $0
/* 0CE320 001CE220 282E0072 */  paddub      $5, $16, $0
/* 0CE324 001CE224 4436070C */  jal         skipSpace__FPci__2
/* 0CE328 001CE228 00000000 */   nop
/* 0CE32C 001CE22C 28864070 */  paddub      $16, $2, $0
/* 0CE330 001CE230 288E0070 */  paddub      $17, $0, $0
/* 0CE334 001CE234 28960070 */  paddub      $18, $0, $0
/* 0CE338 001CE238 53000010 */  b           .L001CE388
/* 0CE33C 001CE23C 00000000 */   nop
.L001CE240:
/* 0CE340 001CE240 A015040C */  jal         strlen
/* 0CE344 001CE244 00000000 */   nop
/* 0CE348 001CE248 289E4070 */  paddub      $19, $2, $0
/* 0CE34C 001CE24C 21209002 */  addu        $4, $20, $16
/* 0CE350 001CE250 0000A58E */  lw          $5, 0x0($21)
/* 0CE354 001CE254 28366072 */  paddub      $6, $19, $0
/* 0CE358 001CE258 C60C040C */  jal         memcmp
/* 0CE35C 001CE25C 00000000 */   nop
/* 0CE360 001CE260 48004014 */  bnez        $2, .L001CE384
/* 0CE364 001CE264 00000000 */   nop
/* 0CE368 001CE268 F5FF2226 */  addiu       $2, $17, -0xB
/* 0CE36C 001CE26C 0200412C */  sltiu       $1, $2, 0x2
/* 0CE370 001CE270 16002010 */  beqz        $1, .L001CE2CC
/* 0CE374 001CE274 00000000 */   nop
/* 0CE378 001CE278 21281302 */  addu        $5, $16, $19
/* 0CE37C 001CE27C 28268072 */  paddub      $4, $20, $0
/* 0CE380 001CE280 4436070C */  jal         skipSpace__FPci__2
/* 0CE384 001CE284 00000000 */   nop
/* 0CE388 001CE288 28864070 */  paddub      $16, $2, $0
/* 0CE38C 001CE28C 2800023C */  lui         $2, %hi(TEIGI_ARG_TABLE)
/* 0CE390 001CE290 70A54224 */  addiu       $2, $2, %lo(TEIGI_ARG_TABLE)
/* 0CE394 001CE294 21105600 */  addu        $2, $2, $22
/* 0CE398 001CE298 0000428C */  lw          $2, 0x0($2)
/* 0CE39C 001CE29C 000040C4 */  lwc1        $f0, 0x0($2)
/* 0CE3A0 001CE2A0 20008046 */  cvt.s.w     $f0, $f0
/* 0CE3A4 001CE2A4 0C94838F */  lw          $3, -0x6BF4($28)
/* 0CE3A8 001CE2A8 C0100300 */  sll         $2, $3, 3
/* 0CE3AC 001CE2AC 21104300 */  addu        $2, $2, $3
/* 0CE3B0 001CE2B0 00190200 */  sll         $3, $2, 4
/* 0CE3B4 001CE2B4 D701023C */  lui         $2, %hi(argValBuff__2)
/* 0CE3B8 001CE2B8 20B64224 */  addiu       $2, $2, %lo(argValBuff__2)
/* 0CE3BC 001CE2BC 21104300 */  addu        $2, $2, $3
/* 0CE3C0 001CE2C0 000040E4 */  swc1        $f0, 0x0($2)
/* 0CE3C4 001CE2C4 1F000010 */  b           .L001CE344
/* 0CE3C8 001CE2C8 00000000 */   nop
.L001CE2CC:
/* 0CE3CC 001CE2CC 21281302 */  addu        $5, $16, $19
/* 0CE3D0 001CE2D0 28268072 */  paddub      $4, $20, $0
/* 0CE3D4 001CE2D4 4436070C */  jal         skipSpace__FPci__2
/* 0CE3D8 001CE2D8 00000000 */   nop
/* 0CE3DC 001CE2DC 28864070 */  paddub      $16, $2, $0
/* 0CE3E0 001CE2E0 2800023C */  lui         $2, %hi(TEIGI_ARG_TABLE)
/* 0CE3E4 001CE2E4 70A54224 */  addiu       $2, $2, %lo(TEIGI_ARG_TABLE)
/* 0CE3E8 001CE2E8 21105600 */  addu        $2, $2, $22
/* 0CE3EC 001CE2EC 28268072 */  paddub      $4, $20, $0
/* 0CE3F0 001CE2F0 282E0072 */  paddub      $5, $16, $0
/* 0CE3F4 001CE2F4 0000468C */  lw          $6, 0x0($2)
/* 0CE3F8 001CE2F8 8836070C */  jal         checkArg__FPciPi__2
/* 0CE3FC 001CE2FC 00000000 */   nop
/* 0CE400 001CE300 28864070 */  paddub      $16, $2, $0
/* 0CE404 001CE304 FFFF0224 */  addiu       $2, $0, -0x1
/* 0CE408 001CE308 09000216 */  bne         $16, $2, .L001CE330
/* 0CE40C 001CE30C 00000000 */   nop
/* 0CE410 001CE310 2A00023C */  lui         $2, %hi(LIT_762)
/* 0CE414 001CE314 20C24424 */  addiu       $4, $2, %lo(LIT_762)
/* 0CE418 001CE318 0000A58E */  lw          $5, 0x0($21)
/* 0CE41C 001CE31C A611040C */  jal         printf
/* 0CE420 001CE320 00000000 */   nop
/* 0CE424 001CE324 FFFF0424 */  addiu       $4, $0, -0x1
/* 0CE428 001CE328 DC05040C */  jal         exit__2
/* 0CE42C 001CE32C 00000000 */   nop
.L001CE330:
/* 0CE430 001CE330 28268072 */  paddub      $4, $20, $0
/* 0CE434 001CE334 282E0072 */  paddub      $5, $16, $0
/* 0CE438 001CE338 4436070C */  jal         skipSpace__FPci__2
/* 0CE43C 001CE33C 00000000 */   nop
/* 0CE440 001CE340 28864070 */  paddub      $16, $2, $0
.L001CE344:
/* 0CE444 001CE344 0C94828F */  lw          $2, -0x6BF4($28)
/* 0CE448 001CE348 01004224 */  addiu       $2, $2, 0x1
/* 0CE44C 001CE34C 0C9482AF */  sw          $2, -0x6BF4($28)
/* 0CE450 001CE350 0C94828F */  lw          $2, -0x6BF4($28)
/* 0CE454 001CE354 80024228 */  slti        $2, $2, 0x280
/* 0CE458 001CE358 07004014 */  bnez        $2, .L001CE378
/* 0CE45C 001CE35C 00000000 */   nop
/* 0CE460 001CE360 2A00023C */  lui         $2, %hi(LIT_763)
/* 0CE464 001CE364 30C24424 */  addiu       $4, $2, %lo(LIT_763)
/* 0CE468 001CE368 A611040C */  jal         printf
/* 0CE46C 001CE36C 00000000 */   nop
.L001CE370:
/* 0CE470 001CE370 FFFF0010 */  b           .L001CE370
/* 0CE474 001CE374 00000000 */   nop
.L001CE378:
/* 0CE478 001CE378 01001224 */  addiu       $18, $0, 0x1
/* 0CE47C 001CE37C 09000010 */  b           .L001CE3A4
/* 0CE480 001CE380 00000000 */   nop
.L001CE384:
/* 0CE484 001CE384 01003126 */  addiu       $17, $17, 0x1
.L001CE388:
/* 0CE488 001CE388 80B01100 */  sll         $22, $17, 2
/* 0CE48C 001CE38C 2800023C */  lui         $2, %hi(TEIGI_TABLE)
/* 0CE490 001CE390 D0A44224 */  addiu       $2, $2, %lo(TEIGI_TABLE)
/* 0CE494 001CE394 21A85600 */  addu        $21, $2, $22
/* 0CE498 001CE398 0000A48E */  lw          $4, 0x0($21)
/* 0CE49C 001CE39C A8FF8014 */  bnez        $4, .L001CE240
/* 0CE4A0 001CE3A0 00000000 */   nop
.L001CE3A4:
/* 0CE4A4 001CE3A4 09004016 */  bnez        $18, .L001CE3CC
/* 0CE4A8 001CE3A8 00000000 */   nop
/* 0CE4AC 001CE3AC 21289002 */  addu        $5, $20, $16
/* 0CE4B0 001CE3B0 2A00023C */  lui         $2, %hi(LIT_764)
/* 0CE4B4 001CE3B4 50C24424 */  addiu       $4, $2, %lo(LIT_764)
/* 0CE4B8 001CE3B8 A611040C */  jal         printf
/* 0CE4BC 001CE3BC 00000000 */   nop
/* 0CE4C0 001CE3C0 FFFF0424 */  addiu       $4, $0, -0x1
/* 0CE4C4 001CE3C4 DC05040C */  jal         exit__2
/* 0CE4C8 001CE3C8 00000000 */   nop
.L001CE3CC:
/* 0CE4CC 001CE3CC 28268072 */  paddub      $4, $20, $0
/* 0CE4D0 001CE3D0 282E0072 */  paddub      $5, $16, $0
/* 0CE4D4 001CE3D4 4436070C */  jal         skipSpace__FPci__2
/* 0CE4D8 001CE3D8 00000000 */   nop
/* 0CE4DC 001CE3DC 28864070 */  paddub      $16, $2, $0
.L001CE3E0:
/* 0CE4E0 001CE3E0 1094828F */  lw          $2, -0x6BF0($28)
/* 0CE4E4 001CE3E4 2A180202 */  slt         $3, $16, $2
/* 0CE4E8 001CE3E8 8CFF6014 */  bnez        $3, .L001CE21C
/* 0CE4EC 001CE3EC 00000000 */   nop
/* 0CE4F0 001CE3F0 0894848F */  lw          $4, -0x6BF8($28)
/* 0CE4F4 001CE3F4 7E000324 */  addiu       $3, $0, 0x7E
/* 0CE4F8 001CE3F8 07008310 */  beq         $4, $3, .L001CE418
/* 0CE4FC 001CE3FC 00000000 */   nop
/* 0CE500 001CE400 2A00023C */  lui         $2, %hi(LIT_765)
/* 0CE504 001CE404 70C24424 */  addiu       $4, $2, %lo(LIT_765)
/* 0CE508 001CE408 A611040C */  jal         printf
/* 0CE50C 001CE40C 00000000 */   nop
.L001CE410:
/* 0CE510 001CE410 FFFF0010 */  b           .L001CE410
/* 0CE514 001CE414 00000000 */   nop
.L001CE418:
/* 0CE518 001CE418 7000BF7B */  lq          $31, 0x70($29)
/* 0CE51C 001CE41C 6000B67B */  lq          $22, 0x60($29)
/* 0CE520 001CE420 5000B57B */  lq          $21, 0x50($29)
/* 0CE524 001CE424 4000B47B */  lq          $20, 0x40($29)
/* 0CE528 001CE428 3000B37B */  lq          $19, 0x30($29)
/* 0CE52C 001CE42C 2000B27B */  lq          $18, 0x20($29)
/* 0CE530 001CE430 1000B17B */  lq          $17, 0x10($29)
/* 0CE534 001CE434 0000B07B */  lq          $16, 0x0($29)
/* 0CE538 001CE438 8000BD27 */  addiu       $29, $29, 0x80
/* 0CE53C 001CE43C 0800E003 */  jr          $31
/* 0CE540 001CE440 00000000 */   nop
/* 0CE544 001CE444 00000000 */  nop
/* 0CE548 001CE448 00000000 */  nop
/* 0CE54C 001CE44C 00000000 */  nop
