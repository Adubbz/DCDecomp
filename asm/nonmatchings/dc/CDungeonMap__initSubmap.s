.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel initSubmap__11CDungeonMapFP14CDataAlloc2_1_
/* CC1F0 001CC0F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CC1F4 001CC0F4 3000BF7F */  sq         $31, 0x30($sp)
/* CC1F8 001CC0F8 2000B27F */  sq         $18, 0x20($sp)
/* CC1FC 001CC0FC 1000B17F */  sq         $17, 0x10($sp)
/* CC200 001CC100 0000B07F */  sq         $16, 0x0($sp)
/* CC204 001CC104 288E8070 */  paddub     $17, $4, $0
/* CC208 001CC108 283EA070 */  paddub     $7, $5, $0
/* CC20C 001CC10C 28860070 */  paddub     $16, $0, $0
/* CC210 001CC110 05000010 */  b          .L001CC128
/* CC214 001CC114 00000000 */   nop
.L001CC118:
/* CC218 001CC118 80101000 */  sll        $2, $16, 2
/* CC21C 001CC11C 21105100 */  addu       $2, $2, $17
/* CC220 001CC120 780440AC */  sw         $0, 0x478($2)
/* CC224 001CC124 01001026 */  addiu      $16, $16, 0x1
.L001CC128:
/* CC228 001CC128 0600022A */  slti       $2, $16, 0x6
/* CC22C 001CC12C FAFF4014 */  bnez       $2, .L001CC118
/* CC230 001CC130 00000000 */   nop
/* CC234 001CC134 28860070 */  paddub     $16, $0, $0
/* CC238 001CC138 05000010 */  b          .L001CC150
/* CC23C 001CC13C 00000000 */   nop
.L001CC140:
/* CC240 001CC140 80101000 */  sll        $2, $16, 2
/* CC244 001CC144 21105100 */  addu       $2, $2, $17
/* CC248 001CC148 6C0440AC */  sw         $0, 0x46C($2)
/* CC24C 001CC14C 01001026 */  addiu      $16, $16, 0x1
.L001CC150:
/* CC250 001CC150 0300022A */  slti       $2, $16, 0x3
/* CC254 001CC154 FAFF4014 */  bnez       $2, .L001CC140
/* CC258 001CC158 00000000 */   nop
/* CC25C 001CC15C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC260 001CC160 21082102 */  addu       $at, $17, $at
/* CC264 001CC164 64BC20AC */  sw         $0, -0x439C($at)
/* CC268 001CC168 0100013C */  lui        $at, (0x10000 >> 16)
/* CC26C 001CC16C 21082102 */  addu       $at, $17, $at
/* CC270 001CC170 68BC20AC */  sw         $0, -0x4398($at)
/* CC274 001CC174 0100013C */  lui        $at, (0x10000 >> 16)
/* CC278 001CC178 21082102 */  addu       $at, $17, $at
/* CC27C 001CC17C 6CBC20AC */  sw         $0, -0x4394($at)
/* CC280 001CC180 0100013C */  lui        $at, (0x10000 >> 16)
/* CC284 001CC184 21082102 */  addu       $at, $17, $at
/* CC288 001CC188 70BC20AC */  sw         $0, -0x4390($at)
/* CC28C 001CC18C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC290 001CC190 21082102 */  addu       $at, $17, $at
/* CC294 001CC194 74BC20AC */  sw         $0, -0x438C($at)
/* CC298 001CC198 0100013C */  lui        $at, (0x10000 >> 16)
/* CC29C 001CC19C 21082102 */  addu       $at, $17, $at
/* CC2A0 001CC1A0 78BC20AC */  sw         $0, -0x4388($at)
/* CC2A4 001CC1A4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC2A8 001CC1A8 21082102 */  addu       $at, $17, $at
/* CC2AC 001CC1AC 7CBC20AC */  sw         $0, -0x4384($at)
/* CC2B0 001CC1B0 28860070 */  paddub     $16, $0, $0
/* CC2B4 001CC1B4 07000010 */  b          .L001CC1D4
/* CC2B8 001CC1B8 00000000 */   nop
.L001CC1BC:
/* CC2BC 001CC1BC 80111000 */  sll        $2, $16, 6
/* CC2C0 001CC1C0 21105100 */  addu       $2, $2, $17
/* CC2C4 001CC1C4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC2C8 001CC1C8 21084100 */  addu       $at, $2, $at
/* CC2CC 001CC1CC 60B620AC */  sw         $0, -0x49A0($at)
/* CC2D0 001CC1D0 01001026 */  addiu      $16, $16, 0x1
.L001CC1D4:
/* CC2D4 001CC1D4 1800022A */  slti       $2, $16, 0x18
/* CC2D8 001CC1D8 F8FF4014 */  bnez       $2, .L001CC1BC
/* CC2DC 001CC1DC 00000000 */   nop
/* CC2E0 001CC1E0 28860070 */  paddub     $16, $0, $0
/* CC2E4 001CC1E4 07000010 */  b          .L001CC204
/* CC2E8 001CC1E8 00000000 */   nop
.L001CC1EC:
/* CC2EC 001CC1EC 40111000 */  sll        $2, $16, 5
/* CC2F0 001CC1F0 21105100 */  addu       $2, $2, $17
/* CC2F4 001CC1F4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC2F8 001CC1F8 21084100 */  addu       $at, $2, $at
/* CC2FC 001CC1FC 94BC20AC */  sw         $0, -0x436C($at)
/* CC300 001CC200 01001026 */  addiu      $16, $16, 0x1
.L001CC204:
/* CC304 001CC204 0100013C */  lui        $at, (0x10000 >> 16)
/* CC308 001CC208 21082102 */  addu       $at, $17, $at
/* CC30C 001CC20C 80BD228C */  lw         $2, -0x4280($at)
/* CC310 001CC210 2A100202 */  slt        $2, $16, $2
/* CC314 001CC214 F5FF4014 */  bnez       $2, .L001CC1EC
/* CC318 001CC218 00000000 */   nop
/* CC31C 001CC21C B40320AE */  sw         $0, 0x3B4($17)
/* CC320 001CC220 B80320AE */  sw         $0, 0x3B8($17)
/* CC324 001CC224 600420AE */  sw         $0, 0x460($17)
/* CC328 001CC228 90002426 */  addiu      $4, $17, 0x90
/* CC32C 001CC22C 20000524 */  addiu      $5, $0, 0x20
/* CC330 001CC230 2836A070 */  paddub     $6, $5, $0
/* CC334 001CC234 0485050C */  jal        SetSize__6CWaterFiiP14CDataAlloc2_1_
/* CC338 001CC238 00000000 */   nop
/* CC33C 001CC23C 28860070 */  paddub     $16, $0, $0
/* CC340 001CC240 0B000010 */  b          .L001CC270
/* CC344 001CC244 00000000 */   nop
.L001CC248:
/* CC348 001CC248 C0101000 */  sll        $2, $16, 3
/* CC34C 001CC24C 23105000 */  subu       $2, $2, $16
/* CC350 001CC250 80100200 */  sll        $2, $2, 2
/* CC354 001CC254 21105000 */  addu       $2, $2, $16
/* CC358 001CC258 00110200 */  sll        $2, $2, 4
/* CC35C 001CC25C 21102202 */  addu       $2, $17, $2
/* CC360 001CC260 90044424 */  addiu      $4, $2, 0x490
/* CC364 001CC264 E806070C */  jal        initalize__13CDungeonPartsFv
/* CC368 001CC268 00000000 */   nop
/* CC36C 001CC26C 01001026 */  addiu      $16, $16, 0x1
.L001CC270:
/* CC370 001CC270 4800032A */  slti       $3, $16, 0x48
/* CC374 001CC274 F4FF6014 */  bnez       $3, .L001CC248
/* CC378 001CC278 00000000 */   nop
/* CC37C 001CC27C 28860070 */  paddub     $16, $0, $0
/* CC380 001CC280 14000010 */  b          .L001CC2D4
/* CC384 001CC284 00000000 */   nop
.L001CC288:
/* CC388 001CC288 FFFF0324 */  addiu      $3, $0, -0x1
/* CC38C 001CC28C 00211000 */  sll        $4, $16, 4
/* CC390 001CC290 21209100 */  addu       $4, $4, $17
/* CC394 001CC294 0100013C */  lui        $at, (0x10000 >> 16)
/* CC398 001CC298 21088100 */  addu       $at, $4, $at
/* CC39C 001CC29C 509C23AC */  sw         $3, -0x63B0($at)
/* CC3A0 001CC2A0 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* CC3A4 001CC2A4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC3A8 001CC2A8 21088100 */  addu       $at, $4, $at
/* CC3AC 001CC2AC 589C23AC */  sw         $3, -0x63A8($at)
/* CC3B0 001CC2B0 80181000 */  sll        $3, $16, 2
/* CC3B4 001CC2B4 21187100 */  addu       $3, $3, $17
/* CC3B8 001CC2B8 0100013C */  lui        $at, (0x10000 >> 16)
/* CC3BC 001CC2BC 21086100 */  addu       $at, $3, $at
/* CC3C0 001CC2C0 108720AC */  sw         $0, -0x78F0($at)
/* CC3C4 001CC2C4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC3C8 001CC2C8 21088100 */  addu       $at, $4, $at
/* CC3CC 001CC2CC 5C9C20AC */  sw         $0, -0x63A4($at)
/* CC3D0 001CC2D0 01001026 */  addiu      $16, $16, 0x1
.L001CC2D4:
/* CC3D4 001CC2D4 9001032A */  slti       $3, $16, 0x190
/* CC3D8 001CC2D8 EBFF6014 */  bnez       $3, .L001CC288
/* CC3DC 001CC2DC 00000000 */   nop
/* CC3E0 001CC2E0 28860070 */  paddub     $16, $0, $0
/* CC3E4 001CC2E4 05000010 */  b          .L001CC2FC
/* CC3E8 001CC2E8 00000000 */   nop
.L001CC2EC:
/* CC3EC 001CC2EC 80181000 */  sll        $3, $16, 2
/* CC3F0 001CC2F0 21187100 */  addu       $3, $3, $17
/* CC3F4 001CC2F4 080060AC */  sw         $0, 0x8($3)
/* CC3F8 001CC2F8 01001026 */  addiu      $16, $16, 0x1
.L001CC2FC:
/* CC3FC 001CC2FC 1000032A */  slti       $3, $16, 0x10
/* CC400 001CC300 FAFF6014 */  bnez       $3, .L001CC2EC
/* CC404 001CC304 00000000 */   nop
/* CC408 001CC308 28860070 */  paddub     $16, $0, $0
/* CC40C 001CC30C 12000010 */  b          .L001CC358
/* CC410 001CC310 00000000 */   nop
.L001CC314:
/* CC414 001CC314 30130224 */  addiu      $2, $0, 0x1330
/* CC418 001CC318 18900202 */  mult       $18, $16, $2
/* CC41C 001CC31C 21103202 */  addu       $2, $17, $18
/* CC420 001CC320 F83D4424 */  addiu      $4, $2, 0x3DF8
/* CC424 001CC324 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CC428 001CC328 A000998C */  lw         $25, 0xA0($4)
/* CC42C 001CC32C C400398F */  lw         $25, 0xC4($25)
/* CC430 001CC330 09F82003 */  jalr       $25
/* CC434 001CC334 00000000 */   nop
/* CC438 001CC338 21185102 */  addu       $3, $18, $17
/* CC43C 001CC33C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC440 001CC340 21086100 */  addu       $at, $3, $at
/* CC444 001CC344 C4CF20AC */  sw         $0, -0x303C($at)
/* CC448 001CC348 0100013C */  lui        $at, (0x10000 >> 16)
/* CC44C 001CC34C 21086100 */  addu       $at, $3, $at
/* CC450 001CC350 10D120AC */  sw         $0, -0x2EF0($at)
/* CC454 001CC354 01001026 */  addiu      $16, $16, 0x1
.L001CC358:
/* CC458 001CC358 0400032A */  slti       $3, $16, 0x4
/* CC45C 001CC35C EDFF6014 */  bnez       $3, .L001CC314
/* CC460 001CC360 00000000 */   nop
/* CC464 001CC364 282E0070 */  paddub     $5, $0, $0
/* CC468 001CC368 0D000010 */  b          .L001CC3A0
/* CC46C 001CC36C 00000000 */   nop
.L001CC370:
/* CC470 001CC370 FFFF0424 */  addiu      $4, $0, -0x1
/* CC474 001CC374 80180500 */  sll        $3, $5, 2
/* CC478 001CC378 21186500 */  addu       $3, $3, $5
/* CC47C 001CC37C 00190300 */  sll        $3, $3, 4
/* CC480 001CC380 21187100 */  addu       $3, $3, $17
/* CC484 001CC384 0100013C */  lui        $at, (0x10000 >> 16)
/* CC488 001CC388 21086100 */  addu       $at, $3, $at
/* CC48C 001CC38C 588D24AC */  sw         $4, -0x72A8($at)
/* CC490 001CC390 0100013C */  lui        $at, (0x10000 >> 16)
/* CC494 001CC394 21086100 */  addu       $at, $3, $at
/* CC498 001CC398 7C8D20AC */  sw         $0, -0x7284($at)
/* CC49C 001CC39C 0100A524 */  addiu      $5, $5, 0x1
.L001CC3A0:
/* CC4A0 001CC3A0 3000A328 */  slti       $3, $5, 0x30
/* CC4A4 001CC3A4 F2FF6014 */  bnez       $3, .L001CC370
/* CC4A8 001CC3A8 00000000 */   nop
/* CC4AC 001CC3AC 282E0070 */  paddub     $5, $0, $0
/* CC4B0 001CC3B0 0D000010 */  b          .L001CC3E8
/* CC4B4 001CC3B4 00000000 */   nop
.L001CC3B8:
/* CC4B8 001CC3B8 80190500 */  sll        $3, $5, 6
/* CC4BC 001CC3BC 21187100 */  addu       $3, $3, $17
/* CC4C0 001CC3C0 0100013C */  lui        $at, (0x10000 >> 16)
/* CC4C4 001CC3C4 21086100 */  addu       $at, $3, $at
/* CC4C8 001CC3C8 60B620AC */  sw         $0, -0x49A0($at)
/* CC4CC 001CC3CC 0100013C */  lui        $at, (0x10000 >> 16)
/* CC4D0 001CC3D0 21086100 */  addu       $at, $3, $at
/* CC4D4 001CC3D4 8CB620AC */  sw         $0, -0x4974($at)
/* CC4D8 001CC3D8 0100013C */  lui        $at, (0x10000 >> 16)
/* CC4DC 001CC3DC 21086100 */  addu       $at, $3, $at
/* CC4E0 001CC3E0 90B620AC */  sw         $0, -0x4970($at)
/* CC4E4 001CC3E4 0100A524 */  addiu      $5, $5, 0x1
.L001CC3E8:
/* CC4E8 001CC3E8 1800A328 */  slti       $3, $5, 0x18
/* CC4EC 001CC3EC F2FF6014 */  bnez       $3, .L001CC3B8
/* CC4F0 001CC3F0 00000000 */   nop
/* CC4F4 001CC3F4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC4F8 001CC3F8 21082102 */  addu       $at, $17, $at
/* CC4FC 001CC3FC 60BC20AC */  sw         $0, -0x43A0($at)
/* CC500 001CC400 282E0070 */  paddub     $5, $0, $0
/* CC504 001CC404 07000010 */  b          .L001CC424
/* CC508 001CC408 00000000 */   nop
.L001CC40C:
/* CC50C 001CC40C 40190500 */  sll        $3, $5, 5
/* CC510 001CC410 21187100 */  addu       $3, $3, $17
/* CC514 001CC414 0100013C */  lui        $at, (0x10000 >> 16)
/* CC518 001CC418 21086100 */  addu       $at, $3, $at
/* CC51C 001CC41C 94BC20AC */  sw         $0, -0x436C($at)
/* CC520 001CC420 0100A524 */  addiu      $5, $5, 0x1
.L001CC424:
/* CC524 001CC424 0800A328 */  slti       $3, $5, 0x8
/* CC528 001CC428 F8FF6014 */  bnez       $3, .L001CC40C
/* CC52C 001CC42C 00000000 */   nop
/* CC530 001CC430 0100013C */  lui        $at, (0x10000 >> 16)
/* CC534 001CC434 21082102 */  addu       $at, $17, $at
/* CC538 001CC438 80BD20AC */  sw         $0, -0x4280($at)
/* CC53C 001CC43C 282E0070 */  paddub     $5, $0, $0
/* CC540 001CC440 09000010 */  b          .L001CC468
/* CC544 001CC444 00000000 */   nop
.L001CC448:
/* CC548 001CC448 40180500 */  sll        $3, $5, 1
/* CC54C 001CC44C 21186500 */  addu       $3, $3, $5
/* CC550 001CC450 C0180300 */  sll        $3, $3, 3
/* CC554 001CC454 21187100 */  addu       $3, $3, $17
/* CC558 001CC458 0100013C */  lui        $at, (0x10000 >> 16)
/* CC55C 001CC45C 21086100 */  addu       $at, $3, $at
/* CC560 001CC460 9CBD20AC */  sw         $0, -0x4264($at)
/* CC564 001CC464 0100A524 */  addiu      $5, $5, 0x1
.L001CC468:
/* CC568 001CC468 0400A328 */  slti       $3, $5, 0x4
/* CC56C 001CC46C F6FF6014 */  bnez       $3, .L001CC448
/* CC570 001CC470 00000000 */   nop
/* CC574 001CC474 3000BF7B */  lq         $31, 0x30($sp)
/* CC578 001CC478 2000B27B */  lq         $18, 0x20($sp)
/* CC57C 001CC47C 1000B17B */  lq         $17, 0x10($sp)
/* CC580 001CC480 0000B07B */  lq         $16, 0x0($sp)
/* CC584 001CC484 4000BD27 */  addiu      $sp, $sp, 0x40
/* CC588 001CC488 0800E003 */  jr         $31
/* CC58C 001CC48C 00000000 */   nop
