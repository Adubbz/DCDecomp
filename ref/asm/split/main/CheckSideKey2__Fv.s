.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckSideKey2__Fv
/* 0EC270 001EC170 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EC274 001EC174 1000BF7F */  sq          $31, 0x10($29)
/* 0EC278 001EC178 0000B07F */  sq          $16, 0x0($29)
/* 0EC27C 001EC17C CC01023C */  lui         $2, %hi(GamePad)
/* 0EC280 001EC180 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EC284 001EC184 00900534 */  ori         $5, $0, 0x9000
/* 0EC288 001EC188 1CAE040C */  jal         Down__8CGamePadFi
/* 0EC28C 001EC18C 00000000 */   nop
/* 0EC290 001EC190 0E004010 */  beqz        $2, .L001EC1CC
/* 0EC294 001EC194 00000000 */   nop
/* 0EC298 001EC198 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EC29C 001EC19C D20020A4 */  sh          $0, %lo(ShopMenu + 0x2)($1)
/* 0EC2A0 001EC1A0 01000224 */  addiu       $2, $0, 0x1
/* 0EC2A4 001EC1A4 D901013C */  lui         $1, %hi(ShopMenu + 0x10)
/* 0EC2A8 001EC1A8 E00022AC */  sw          $2, %lo(ShopMenu + 0x10)($1)
/* 0EC2AC 001EC1AC D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EC2B0 001EC1B0 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EC2B4 001EC1B4 03004324 */  addiu       $3, $2, 0x3
/* 0EC2B8 001EC1B8 80100300 */  sll         $2, $3, 2
/* 0EC2BC 001EC1BC 21104300 */  addu        $2, $2, $3
/* 0EC2C0 001EC1C0 03004224 */  addiu       $2, $2, 0x3
/* 0EC2C4 001EC1C4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EC2C8 001EC1C8 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EC1CC:
/* 0EC2CC 001EC1CC CC01023C */  lui         $2, %hi(GamePad)
/* 0EC2D0 001EC1D0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EC2D4 001EC1D4 40000524 */  addiu       $5, $0, 0x40
/* 0EC2D8 001EC1D8 1CAE040C */  jal         Down__8CGamePadFi
/* 0EC2DC 001EC1DC 00000000 */   nop
/* 0EC2E0 001EC1E0 49004010 */  beqz        $2, .L001EC308
/* 0EC2E4 001EC1E4 00000000 */   nop
/* 0EC2E8 001EC1E8 01000224 */  addiu       $2, $0, 0x1
/* 0EC2EC 001EC1EC D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0EC2F0 001EC1F0 D60022A4 */  sh          $2, %lo(ShopMenu + 0x6)($1)
/* 0EC2F4 001EC1F4 B894828F */  lw          $2, -0x6B48($28)
/* 0EC2F8 001EC1F8 10004284 */  lh          $2, 0x10($2)
/* 0EC2FC 001EC1FC 51004228 */  slti        $2, $2, 0x51
/* 0EC300 001EC200 04004014 */  bnez        $2, .L001EC214
/* 0EC304 001EC204 00000000 */   nop
/* 0EC308 001EC208 02001024 */  addiu       $16, $0, 0x2
/* 0EC30C 001EC20C 3B000010 */  b           .L001EC2FC
/* 0EC310 001EC210 00000000 */   nop
.L001EC214:
/* 0EC314 001EC214 ECAD070C */  jal         CheckBuyItemFunc2__Fv
/* 0EC318 001EC218 00000000 */   nop
/* 0EC31C 001EC21C 28664070 */  paddub      $12, $2, $0
/* 0EC320 001EC220 01004230 */  andi        $2, $2, 0x1
/* 0EC324 001EC224 06004010 */  beqz        $2, .L001EC240
/* 0EC328 001EC228 00000000 */   nop
/* 0EC32C 001EC22C 02001024 */  addiu       $16, $0, 0x2
/* 0EC330 001EC230 17000424 */  addiu       $4, $0, 0x17
/* 0EC334 001EC234 01000524 */  addiu       $5, $0, 0x1
/* 0EC338 001EC238 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EC33C 001EC23C 00000000 */   nop
.L001EC240:
/* 0EC340 001EC240 02008231 */  andi        $2, $12, 0x2
/* 0EC344 001EC244 04004014 */  bnez        $2, .L001EC258
/* 0EC348 001EC248 00000000 */   nop
/* 0EC34C 001EC24C 04008231 */  andi        $2, $12, 0x4
/* 0EC350 001EC250 23004010 */  beqz        $2, .L001EC2E0
/* 0EC354 001EC254 00000000 */   nop
.L001EC258:
/* 0EC358 001EC258 8494828F */  lw          $2, -0x6B7C($28)
/* 0EC35C 001EC25C 46434E94 */  lhu         $14, 0x4346($2)
/* 0EC360 001EC260 E8AC070C */  jal         BuyMoneyCheck2__Fv
/* 0EC364 001EC264 00000000 */   nop
/* 0EC368 001EC268 286E4070 */  paddub      $13, $2, $0
/* 0EC36C 001EC26C 50AD070C */  jal         SellMoneyCheck2__Fv
/* 0EC370 001EC270 00000000 */   nop
/* 0EC374 001EC274 23104D00 */  subu        $2, $2, $13
/* 0EC378 001EC278 2110C201 */  addu        $2, $14, $2
/* 0EC37C 001EC27C 08004104 */  bgez        $2, .L001EC2A0
/* 0EC380 001EC280 00000000 */   nop
/* 0EC384 001EC284 15000424 */  addiu       $4, $0, 0x15
/* 0EC388 001EC288 01000524 */  addiu       $5, $0, 0x1
/* 0EC38C 001EC28C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EC390 001EC290 00000000 */   nop
/* 0EC394 001EC294 02001024 */  addiu       $16, $0, 0x2
/* 0EC398 001EC298 11000010 */  b           .L001EC2E0
/* 0EC39C 001EC29C 00000000 */   nop
.L001EC2A0:
/* 0EC3A0 001EC2A0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0EC3A4 001EC2A4 2A084100 */  slt         $1, $2, $1
/* 0EC3A8 001EC2A8 08002014 */  bnez        $1, .L001EC2CC
/* 0EC3AC 001EC2AC 00000000 */   nop
/* 0EC3B0 001EC2B0 16000424 */  addiu       $4, $0, 0x16
/* 0EC3B4 001EC2B4 01000524 */  addiu       $5, $0, 0x1
/* 0EC3B8 001EC2B8 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EC3BC 001EC2BC 00000000 */   nop
/* 0EC3C0 001EC2C0 02001024 */  addiu       $16, $0, 0x2
/* 0EC3C4 001EC2C4 06000010 */  b           .L001EC2E0
/* 0EC3C8 001EC2C8 00000000 */   nop
.L001EC2CC:
/* 0EC3CC 001EC2CC 0C000424 */  addiu       $4, $0, 0xC
/* 0EC3D0 001EC2D0 01000524 */  addiu       $5, $0, 0x1
/* 0EC3D4 001EC2D4 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EC3D8 001EC2D8 00000000 */   nop
/* 0EC3DC 001EC2DC 2886A070 */  paddub      $16, $5, $0
.L001EC2E0:
/* 0EC3E0 001EC2E0 08008231 */  andi        $2, $12, 0x8
/* 0EC3E4 001EC2E4 05004010 */  beqz        $2, .L001EC2FC
/* 0EC3E8 001EC2E8 00000000 */   nop
/* 0EC3EC 001EC2EC 0A000424 */  addiu       $4, $0, 0xA
/* 0EC3F0 001EC2F0 01000524 */  addiu       $5, $0, 0x1
/* 0EC3F4 001EC2F4 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EC3F8 001EC2F8 00000000 */   nop
.L001EC2FC:
/* 0EC3FC 001EC2FC 28260072 */  paddub      $4, $16, $0
/* 0EC400 001EC300 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EC404 001EC304 00000000 */   nop
.L001EC308:
/* 0EC408 001EC308 CC01023C */  lui         $2, %hi(GamePad)
/* 0EC40C 001EC30C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EC410 001EC310 00200524 */  addiu       $5, $0, 0x2000
/* 0EC414 001EC314 1CAE040C */  jal         Down__8CGamePadFi
/* 0EC418 001EC318 00000000 */   nop
/* 0EC41C 001EC31C 0B004010 */  beqz        $2, .L001EC34C
/* 0EC420 001EC320 00000000 */   nop
/* 0EC424 001EC324 01000224 */  addiu       $2, $0, 0x1
/* 0EC428 001EC328 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EC42C 001EC32C D20022A4 */  sh          $2, %lo(ShopMenu + 0x2)($1)
/* 0EC430 001EC330 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0EC434 001EC334 F000228C */  lw          $2, %lo(ShopMenu + 0x20)($1)
/* 0EC438 001EC338 03004324 */  addiu       $3, $2, 0x3
/* 0EC43C 001EC33C 80100300 */  sll         $2, $3, 2
/* 0EC440 001EC340 21104300 */  addu        $2, $2, $3
/* 0EC444 001EC344 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EC448 001EC348 E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EC34C:
/* 0EC44C 001EC34C 28160070 */  paddub      $2, $0, $0
/* 0EC450 001EC350 1000BF7B */  lq          $31, 0x10($29)
/* 0EC454 001EC354 0000B07B */  lq          $16, 0x0($29)
/* 0EC458 001EC358 2000BD27 */  addiu       $29, $29, 0x20
/* 0EC45C 001EC35C 0800E003 */  jr          $31
/* 0EC460 001EC360 00000000 */   nop
/* 0EC464 001EC364 00000000 */  nop
/* 0EC468 001EC368 00000000 */  nop
/* 0EC46C 001EC36C 00000000 */  nop
