.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitItemShop2__FPiii
/* 0EE1F0 001EE0F0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EE1F4 001EE0F4 1000BF7F */  sq          $31, 0x10($29)
/* 0EE1F8 001EE0F8 0000B07F */  sq          $16, 0x0($29)
/* 0EE1FC 001EE0FC 2886A070 */  paddub      $16, $5, $0
/* 0EE200 001EE100 549E070C */  jal         ShopMenuInit__FPiii
/* 0EE204 001EE104 00000000 */   nop
/* 0EE208 001EE108 FCB6070C */  jal         ItemShopMemoryAlloc__Fv
/* 0EE20C 001EE10C 00000000 */   nop
/* 0EE210 001EE110 28260072 */  paddub      $4, $16, $0
/* 0EE214 001EE114 A8B7070C */  jal         ItemShopGoodInitialize__Fi
/* 0EE218 001EE118 00000000 */   nop
/* 0EE21C 001EE11C 40B7070C */  jal         ItemPosInfoInit__Fv
/* 0EE220 001EE120 00000000 */   nop
/* 0EE224 001EE124 F49B070C */  jal         InitAllHaveData__Fv
/* 0EE228 001EE128 00000000 */   nop
/* 0EE22C 001EE12C B894828F */  lw          $2, -0x6B48($28)
/* 0EE230 001EE130 000040AC */  sw          $0, 0x0($2)
/* 0EE234 001EE134 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE238 001EE138 E40020AC */  sw          $0, %lo(ShopMenu + 0x14)($1)
/* 0EE23C 001EE13C D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EE240 001EE140 D20020A4 */  sh          $0, %lo(ShopMenu + 0x2)($1)
/* 0EE244 001EE144 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE248 001EE148 460220A0 */  sb          $0, %lo(ShopMenu + 0x176)($1)
/* 0EE24C 001EE14C E442023C */  lui         $2, (0x42E40000 >> 16)
/* 0EE250 001EE150 00088244 */  mtc1        $2, $f1
/* 0EE254 001EE154 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE258 001EE158 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EE25C 001EE15C 06004004 */  bltz        $2, .L001EE178
/* 0EE260 001EE160 00000000 */   nop
/* 0EE264 001EE164 00008244 */  mtc1        $2, $f0
/* 0EE268 001EE168 00000000 */  nop
/* 0EE26C 001EE16C 20008046 */  cvt.s.w     $f0, $f0
/* 0EE270 001EE170 08000010 */  b           .L001EE194
/* 0EE274 001EE174 00000000 */   nop
.L001EE178:
/* 0EE278 001EE178 42180200 */  srl         $3, $2, 1
/* 0EE27C 001EE17C 01004230 */  andi        $2, $2, 0x1
/* 0EE280 001EE180 25186200 */  or          $3, $3, $2
/* 0EE284 001EE184 00008344 */  mtc1        $3, $f0
/* 0EE288 001EE188 00000000 */  nop
/* 0EE28C 001EE18C 20008046 */  cvt.s.w     $f0, $f0
/* 0EE290 001EE190 00000046 */  add.s       $f0, $f0, $f0
.L001EE194:
/* 0EE294 001EE194 42080046 */  mul.s       $f1, $f1, $f0
/* 0EE298 001EE198 C040023C */  lui         $2, (0x40C00000 >> 16)
/* 0EE29C 001EE19C 00008244 */  mtc1        $2, $f0
/* 0EE2A0 001EE1A0 00000000 */  nop
/* 0EE2A4 001EE1A4 43080046 */  div.s       $f1, $f1, $f0
/* 0EE2A8 001EE1A8 0E43023C */  lui         $2, (0x430E0000 >> 16)
/* 0EE2AC 001EE1AC 00008244 */  mtc1        $2, $f0
/* 0EE2B0 001EE1B0 00000000 */  nop
/* 0EE2B4 001EE1B4 00000146 */  add.s       $f0, $f0, $f1
/* 0EE2B8 001EE1B8 D901013C */  lui         $1, %hi(ShopMenu + 0x170)
/* 0EE2BC 001EE1BC 400220E4 */  swc1        $f0, %lo(ShopMenu + 0x170)($1)
/* 0EE2C0 001EE1C0 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EE2C4 001EE1C4 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0EE2C8 001EE1C8 80100300 */  sll         $2, $3, 2
/* 0EE2CC 001EE1CC 21104300 */  addu        $2, $2, $3
/* 0EE2D0 001EE1D0 C0180200 */  sll         $3, $2, 3
/* 0EE2D4 001EE1D4 7E000224 */  addiu       $2, $0, 0x7E
/* 0EE2D8 001EE1D8 23104300 */  subu        $2, $2, $3
/* 0EE2DC 001EE1DC 00008244 */  mtc1        $2, $f0
/* 0EE2E0 001EE1E0 00000000 */  nop
/* 0EE2E4 001EE1E4 20008046 */  cvt.s.w     $f0, $f0
/* 0EE2E8 001EE1E8 D901013C */  lui         $1, %hi(ShopMenu + 0x16C)
/* 0EE2EC 001EE1EC 3C0220E4 */  swc1        $f0, %lo(ShopMenu + 0x16C)($1)
/* 0EE2F0 001EE1F0 AC42023C */  lui         $2, (0x42AC0000 >> 16)
/* 0EE2F4 001EE1F4 D901013C */  lui         $1, %hi(ShopMenu + 0x178)
/* 0EE2F8 001EE1F8 480222AC */  sw          $2, %lo(ShopMenu + 0x178)($1)
/* 0EE2FC 001EE1FC 1843023C */  lui         $2, (0x43180000 >> 16)
/* 0EE300 001EE200 D901013C */  lui         $1, %hi(ShopMenu + 0x17C)
/* 0EE304 001EE204 4C0222AC */  sw          $2, %lo(ShopMenu + 0x17C)($1)
/* 0EE308 001EE208 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EE30C 001EE20C E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EE310 001EE210 05000224 */  addiu       $2, $0, 0x5
/* 0EE314 001EE214 1A006200 */  div         $0, $3, $2
/* 0EE318 001EE218 00000000 */  nop
/* 0EE31C 001EE21C 00000000 */  nop
/* 0EE320 001EE220 10180000 */  mfhi        $3
/* 0EE324 001EE224 80100300 */  sll         $2, $3, 2
/* 0EE328 001EE228 21104300 */  addu        $2, $2, $3
/* 0EE32C 001EE22C C0100200 */  sll         $2, $2, 3
/* 0EE330 001EE230 54014224 */  addiu       $2, $2, 0x154
/* 0EE334 001EE234 00008244 */  mtc1        $2, $f0
/* 0EE338 001EE238 00000000 */  nop
/* 0EE33C 001EE23C 20008046 */  cvt.s.w     $f0, $f0
/* 0EE340 001EE240 D901013C */  lui         $1, %hi(ShopMenu + 0x178)
/* 0EE344 001EE244 480220E4 */  swc1        $f0, %lo(ShopMenu + 0x178)($1)
/* 0EE348 001EE248 F042023C */  lui         $2, (0x42F00000 >> 16)
/* 0EE34C 001EE24C D901013C */  lui         $1, %hi(ShopMenu + 0x17C)
/* 0EE350 001EE250 4C0222AC */  sw          $2, %lo(ShopMenu + 0x17C)($1)
/* 0EE354 001EE254 A8948427 */  addiu       $4, $28, -0x6B58
/* 0EE358 001EE258 AC948527 */  addiu       $5, $28, -0x6B54
/* 0EE35C 001EE25C B4948627 */  addiu       $6, $28, -0x6B4C
/* 0EE360 001EE260 B0948727 */  addiu       $7, $28, -0x6B50
/* 0EE364 001EE264 C4B8080C */  jal         GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
/* 0EE368 001EE268 00000000 */   nop
/* 0EE36C 001EE26C 1000BF7B */  lq          $31, 0x10($29)
/* 0EE370 001EE270 0000B07B */  lq          $16, 0x0($29)
/* 0EE374 001EE274 2000BD27 */  addiu       $29, $29, 0x20
/* 0EE378 001EE278 0800E003 */  jr          $31
/* 0EE37C 001EE27C 00000000 */   nop
