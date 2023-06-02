.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckSideKey2__Fv
/* EC270 001EC170 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* EC274 001EC174 1000BF7F */  sq         $31, 0x10($sp)
/* EC278 001EC178 0000B07F */  sq         $16, 0x0($sp)
/* EC27C 001EC17C CC01023C */  lui        $2, %hi(GamePad)
/* EC280 001EC180 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EC284 001EC184 00900534 */  ori        $5, $0, 0x9000
/* EC288 001EC188 1CAE040C */  jal        Down__8CGamePadFi
/* EC28C 001EC18C 00000000 */   nop
/* EC290 001EC190 0E004010 */  beqz       $2, .L001EC1CC
/* EC294 001EC194 00000000 */   nop
/* EC298 001EC198 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EC29C 001EC19C D20020A4 */  sh         $0, (0x1D900D2 & 0xFFFF)($at)
/* EC2A0 001EC1A0 01000224 */  addiu      $2, $0, 0x1
/* EC2A4 001EC1A4 D901013C */  lui        $at, (0x1D900E0 >> 16)
/* EC2A8 001EC1A8 E00022AC */  sw         $2, (0x1D900E0 & 0xFFFF)($at)
/* EC2AC 001EC1AC D901013C */  lui        $at, (0x1D90246 >> 16)
/* EC2B0 001EC1B0 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EC2B4 001EC1B4 03004324 */  addiu      $3, $2, 0x3
/* EC2B8 001EC1B8 80100300 */  sll        $2, $3, 2
/* EC2BC 001EC1BC 21104300 */  addu       $2, $2, $3
/* EC2C0 001EC1C0 03004224 */  addiu      $2, $2, 0x3
/* EC2C4 001EC1C4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EC2C8 001EC1C8 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EC1CC:
/* EC2CC 001EC1CC CC01023C */  lui        $2, %hi(GamePad)
/* EC2D0 001EC1D0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EC2D4 001EC1D4 40000524 */  addiu      $5, $0, 0x40
/* EC2D8 001EC1D8 1CAE040C */  jal        Down__8CGamePadFi
/* EC2DC 001EC1DC 00000000 */   nop
/* EC2E0 001EC1E0 49004010 */  beqz       $2, .L001EC308
/* EC2E4 001EC1E4 00000000 */   nop
/* EC2E8 001EC1E8 01000224 */  addiu      $2, $0, 0x1
/* EC2EC 001EC1EC D901013C */  lui        $at, (0x1D900D6 >> 16)
/* EC2F0 001EC1F0 D60022A4 */  sh         $2, (0x1D900D6 & 0xFFFF)($at)
/* EC2F4 001EC1F4 B894828F */  lw         $2, -0x6B48($gp)
/* EC2F8 001EC1F8 10004284 */  lh         $2, 0x10($2)
/* EC2FC 001EC1FC 51004228 */  slti       $2, $2, 0x51
/* EC300 001EC200 04004014 */  bnez       $2, .L001EC214
/* EC304 001EC204 00000000 */   nop
/* EC308 001EC208 02001024 */  addiu      $16, $0, 0x2
/* EC30C 001EC20C 3B000010 */  b          .L001EC2FC
/* EC310 001EC210 00000000 */   nop
.L001EC214:
/* EC314 001EC214 ECAD070C */  jal        CheckBuyItemFunc2__Fv
/* EC318 001EC218 00000000 */   nop
/* EC31C 001EC21C 28664070 */  paddub     $12, $2, $0
/* EC320 001EC220 01004230 */  andi       $2, $2, 0x1
/* EC324 001EC224 06004010 */  beqz       $2, .L001EC240
/* EC328 001EC228 00000000 */   nop
/* EC32C 001EC22C 02001024 */  addiu      $16, $0, 0x2
/* EC330 001EC230 17000424 */  addiu      $4, $0, 0x17
/* EC334 001EC234 01000524 */  addiu      $5, $0, 0x1
/* EC338 001EC238 749C070C */  jal        SetItemShopTalkMode__Fii
/* EC33C 001EC23C 00000000 */   nop
.L001EC240:
/* EC340 001EC240 02008231 */  andi       $2, $12, 0x2
/* EC344 001EC244 04004014 */  bnez       $2, .L001EC258
/* EC348 001EC248 00000000 */   nop
/* EC34C 001EC24C 04008231 */  andi       $2, $12, 0x4
/* EC350 001EC250 23004010 */  beqz       $2, .L001EC2E0
/* EC354 001EC254 00000000 */   nop
.L001EC258:
/* EC358 001EC258 8494828F */  lw         $2, -0x6B7C($gp)
/* EC35C 001EC25C 46434E94 */  lhu        $14, 0x4346($2)
/* EC360 001EC260 E8AC070C */  jal        BuyMoneyCheck2__Fv
/* EC364 001EC264 00000000 */   nop
/* EC368 001EC268 286E4070 */  paddub     $13, $2, $0
/* EC36C 001EC26C 50AD070C */  jal        SellMoneyCheck2__Fv
/* EC370 001EC270 00000000 */   nop
/* EC374 001EC274 23104D00 */  subu       $2, $2, $13
/* EC378 001EC278 2110C201 */  addu       $2, $14, $2
/* EC37C 001EC27C 08004104 */  bgez       $2, .L001EC2A0
/* EC380 001EC280 00000000 */   nop
/* EC384 001EC284 15000424 */  addiu      $4, $0, 0x15
/* EC388 001EC288 01000524 */  addiu      $5, $0, 0x1
/* EC38C 001EC28C 749C070C */  jal        SetItemShopTalkMode__Fii
/* EC390 001EC290 00000000 */   nop
/* EC394 001EC294 02001024 */  addiu      $16, $0, 0x2
/* EC398 001EC298 11000010 */  b          .L001EC2E0
/* EC39C 001EC29C 00000000 */   nop
.L001EC2A0:
/* EC3A0 001EC2A0 0100013C */  lui        $at, (0x10000 >> 16)
/* EC3A4 001EC2A4 2A084100 */  slt        $at, $2, $at
/* EC3A8 001EC2A8 08002014 */  bnez       $at, .L001EC2CC
/* EC3AC 001EC2AC 00000000 */   nop
/* EC3B0 001EC2B0 16000424 */  addiu      $4, $0, 0x16
/* EC3B4 001EC2B4 01000524 */  addiu      $5, $0, 0x1
/* EC3B8 001EC2B8 749C070C */  jal        SetItemShopTalkMode__Fii
/* EC3BC 001EC2BC 00000000 */   nop
/* EC3C0 001EC2C0 02001024 */  addiu      $16, $0, 0x2
/* EC3C4 001EC2C4 06000010 */  b          .L001EC2E0
/* EC3C8 001EC2C8 00000000 */   nop
.L001EC2CC:
/* EC3CC 001EC2CC 0C000424 */  addiu      $4, $0, 0xC
/* EC3D0 001EC2D0 01000524 */  addiu      $5, $0, 0x1
/* EC3D4 001EC2D4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EC3D8 001EC2D8 00000000 */   nop
/* EC3DC 001EC2DC 2886A070 */  paddub     $16, $5, $0
.L001EC2E0:
/* EC3E0 001EC2E0 08008231 */  andi       $2, $12, 0x8
/* EC3E4 001EC2E4 05004010 */  beqz       $2, .L001EC2FC
/* EC3E8 001EC2E8 00000000 */   nop
/* EC3EC 001EC2EC 0A000424 */  addiu      $4, $0, 0xA
/* EC3F0 001EC2F0 01000524 */  addiu      $5, $0, 0x1
/* EC3F4 001EC2F4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EC3F8 001EC2F8 00000000 */   nop
.L001EC2FC:
/* EC3FC 001EC2FC 28260072 */  paddub     $4, $16, $0
/* EC400 001EC300 BCB3080C */  jal        ComMenuSePlay__Fi
/* EC404 001EC304 00000000 */   nop
.L001EC308:
/* EC408 001EC308 CC01023C */  lui        $2, %hi(GamePad)
/* EC40C 001EC30C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EC410 001EC310 00200524 */  addiu      $5, $0, 0x2000
/* EC414 001EC314 1CAE040C */  jal        Down__8CGamePadFi
/* EC418 001EC318 00000000 */   nop
/* EC41C 001EC31C 0B004010 */  beqz       $2, .L001EC34C
/* EC420 001EC320 00000000 */   nop
/* EC424 001EC324 01000224 */  addiu      $2, $0, 0x1
/* EC428 001EC328 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EC42C 001EC32C D20022A4 */  sh         $2, (0x1D900D2 & 0xFFFF)($at)
/* EC430 001EC330 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* EC434 001EC334 F000228C */  lw         $2, (0x1D900F0 & 0xFFFF)($at)
/* EC438 001EC338 03004324 */  addiu      $3, $2, 0x3
/* EC43C 001EC33C 80100300 */  sll        $2, $3, 2
/* EC440 001EC340 21104300 */  addu       $2, $2, $3
/* EC444 001EC344 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EC448 001EC348 E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EC34C:
/* EC44C 001EC34C 28160070 */  paddub     $2, $0, $0
/* EC450 001EC350 1000BF7B */  lq         $31, 0x10($sp)
/* EC454 001EC354 0000B07B */  lq         $16, 0x0($sp)
/* EC458 001EC358 2000BD27 */  addiu      $sp, $sp, 0x20
/* EC45C 001EC35C 0800E003 */  jr         $31
/* EC460 001EC360 00000000 */   nop
/* EC464 001EC364 00000000 */  nop
/* EC468 001EC368 00000000 */  nop
/* EC46C 001EC36C 00000000 */  nop
