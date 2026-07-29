.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionPlay_Ozumond_H__Fi
/* 0123C0 01DBE0C0 90FFBD27 */  addiu       $29, $29, -0x70
/* 0123C4 01DBE0C4 3000BF7F */  sq          $31, 0x30($29)
/* 0123C8 01DBE0C8 2000B27F */  sq          $18, 0x20($29)
/* 0123CC 01DBE0CC 1000B17F */  sq          $17, 0x10($29)
/* 0123D0 01DBE0D0 0000B07F */  sq          $16, 0x0($29)
/* 0123D4 01DBE0D4 28968070 */  paddub      $18, $4, $0
/* 0123D8 01DBE0D8 049D828F */  lw          $2, -0x62FC($28)
/* 0123DC 01DBE0DC 16005080 */  lb          $16, 0x16($2)
/* 0123E0 01DBE0E0 04005184 */  lh          $17, 0x4($2)
/* 0123E4 01DBE0E4 08000424 */  addiu       $4, $0, 0x8
/* 0123E8 01DBE0E8 4CC6060C */  jal         StatusErrCheck__Fi
/* 0123EC 01DBE0EC 00000000 */   nop
/* 0123F0 01DBE0F0 02004010 */  beqz        $2, .L01DBE0FC_2F96FC
/* 0123F4 01DBE0F4 00000000 */   nop
/* 0123F8 01DBE0F8 40881100 */  sll         $17, $17, 1
.L01DBE0FC_2F96FC:
/* 0123FC 01DBE0FC DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 012400 01DBE100 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 012404 01DBE104 0B000324 */  addiu       $3, $0, 0xB
/* 012408 01DBE108 9C008314 */  bne         $4, $3, .L01DBE37C_2F997C
/* 01240C 01DBE10C 00000000 */   nop
/* 012410 01DBE110 CC01023C */  lui         $2, %hi(GamePad)
/* 012414 01DBE114 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 012418 01DBE118 9C9C858F */  lw          $5, -0x6364($28)
/* 01241C 01DBE11C 04AE040C */  jal         On__8CGamePadFi
/* 012420 01DBE120 00000000 */   nop
/* 012424 01DBE124 06004014 */  bnez        $2, .L01DBE140_2F9740
/* 012428 01DBE128 00000000 */   nop
/* 01242C 01DBE12C 01000324 */  addiu       $3, $0, 0x1
/* 012430 01DBE130 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 012434 01DBE134 984423AC */  sw          $3, %lo(BtActStatus + 0x18)($1)
/* 012438 01DBE138 0A000324 */  addiu       $3, $0, 0xA
/* 01243C 01DBE13C C49E83AF */  sw          $3, -0x613C($28)
.L01DBE140_2F9740:
/* 012440 01DBE140 0B000324 */  addiu       $3, $0, 0xB
/* 012444 01DBE144 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012448 01DBE148 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 01244C 01DBE14C C49E838F */  lw          $3, -0x613C($28)
/* 012450 01DBE150 01006324 */  addiu       $3, $3, 0x1
/* 012454 01DBE154 C49E83AF */  sw          $3, -0x613C($28)
/* 012458 01DBE158 C49E838F */  lw          $3, -0x613C($28)
/* 01245C 01DBE15C 0A006328 */  slti        $3, $3, 0xA
/* 012460 01DBE160 75006014 */  bnez        $3, .L01DBE338_2F9938
/* 012464 01DBE164 00000000 */   nop
/* 012468 01DBE168 C49E80AF */  sw          $0, -0x613C($28)
/* 01246C 01DBE16C 99010424 */  addiu       $4, $0, 0x199
/* 012470 01DBE170 05000524 */  addiu       $5, $0, 0x5
/* 012474 01DBE174 28360070 */  paddub      $6, $0, $0
/* 012478 01DBE178 C86B050C */  jal         SndSeSeqPlayStop__Fiii
/* 01247C 01DBE17C 00000000 */   nop
/* 012480 01DBE180 0E004016 */  bnez        $18, .L01DBE1BC_2F97BC
/* 012484 01DBE184 00000000 */   nop
/* 012488 01DBE188 009D828F */  lw          $2, -0x6300($28)
/* 01248C 01DBE18C BC00448C */  lw          $4, 0xBC($2)
/* 012490 01DBE190 DC01023C */  lui         $2, %hi(LIT_4408)
/* 012494 01DBE194 982F4524 */  addiu       $5, $2, %lo(LIT_4408)
/* 012498 01DBE198 4000A627 */  addiu       $6, $29, 0x40
/* 01249C 01DBE19C CCDB060C */  jal         getFramePos__FP9CFrameVu1PcPf
/* 0124A0 01DBE1A0 00000000 */   nop
/* 0124A4 01DBE1A4 00608044 */  mtc1        $0, $f12
/* 0124A8 01DBE1A8 5000A427 */  addiu       $4, $29, 0x50
/* 0124AC 01DBE1AC 6850070C */  jal         getCharacterVector__FPff
/* 0124B0 01DBE1B0 00000000 */   nop
/* 0124B4 01DBE1B4 13000010 */  b           .L01DBE204_2F9804
/* 0124B8 01DBE1B8 00000000 */   nop
.L01DBE1BC_2F97BC:
/* 0124BC 01DBE1BC 6040023C */  lui         $2, (0x40600000 >> 16)
/* 0124C0 01DBE1C0 00608244 */  mtc1        $2, $f12
/* 0124C4 01DBE1C4 5000A427 */  addiu       $4, $29, 0x50
/* 0124C8 01DBE1C8 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 0124CC 01DBE1CC B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 0124D0 01DBE1D0 4050070C */  jal         setShotVector__FPffff
/* 0124D4 01DBE1D4 00000000 */   nop
/* 0124D8 01DBE1D8 4000A427 */  addiu       $4, $29, 0x40
/* 0124DC 01DBE1DC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0124E0 01DBE1E0 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0124E4 01DBE1E4 0C86040C */  jal         sceVu0CopyVector
/* 0124E8 01DBE1E8 00000000 */   nop
/* 0124EC 01DBE1EC 4400A1C7 */  lwc1        $f1, 0x44($29)
/* 0124F0 01DBE1F0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0124F4 01DBE1F4 00008244 */  mtc1        $2, $f0
/* 0124F8 01DBE1F8 00000000 */  nop
/* 0124FC 01DBE1FC 00080046 */  add.s       $f0, $f1, $f0
/* 012500 01DBE200 4400A0E7 */  swc1        $f0, 0x44($29)
.L01DBE204_2F9804:
/* 012504 01DBE204 6000A427 */  addiu       $4, $29, 0x60
/* 012508 01DBE208 5000A527 */  addiu       $5, $29, 0x50
/* 01250C 01DBE20C 0C86040C */  jal         sceVu0CopyVector
/* 012510 01DBE210 00000000 */   nop
/* 012514 01DBE214 5000A1C7 */  lwc1        $f1, 0x50($29)
/* 012518 01DBE218 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 01251C 01DBE21C 00080046 */  add.s       $f0, $f1, $f0
/* 012520 01DBE220 5000A0E7 */  swc1        $f0, 0x50($29)
/* 012524 01DBE224 5400A1C7 */  lwc1        $f1, 0x54($29)
/* 012528 01DBE228 4400A0C7 */  lwc1        $f0, 0x44($29)
/* 01252C 01DBE22C 00080046 */  add.s       $f0, $f1, $f0
/* 012530 01DBE230 5400A0E7 */  swc1        $f0, 0x54($29)
/* 012534 01DBE234 5800A1C7 */  lwc1        $f1, 0x58($29)
/* 012538 01DBE238 4800A0C7 */  lwc1        $f0, 0x48($29)
/* 01253C 01DBE23C 00080046 */  add.s       $f0, $f1, $f0
/* 012540 01DBE240 5800A0E7 */  swc1        $f0, 0x58($29)
/* 012544 01DBE244 989D828F */  lw          $2, -0x6268($28)
/* 012548 01DBE248 0E004010 */  beqz        $2, .L01DBE284_2F9884
/* 01254C 01DBE24C 00000000 */   nop
/* 012550 01DBE250 FC9C848F */  lw          $4, -0x6304($28)
/* 012554 01DBE254 4000A527 */  addiu       $5, $29, 0x40
/* 012558 01DBE258 DC01023C */  lui         $2, %hi(BtActStatus + 0x80)
/* 01255C 01DBE25C 00454624 */  addiu       $6, $2, %lo(BtActStatus + 0x80)
/* 012560 01DBE260 05000724 */  addiu       $7, $0, 0x5
/* 012564 01DBE264 28460072 */  paddub      $8, $16, $0
/* 012568 01DBE268 284E0070 */  paddub      $9, $0, $0
/* 01256C 01DBE26C 28560070 */  paddub      $10, $0, $0
/* 012570 01DBE270 FFFF0B24 */  addiu       $11, $0, -0x1
/* 012574 01DBE274 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 012578 01DBE278 00000000 */   nop
/* 01257C 01DBE27C 0B000010 */  b           .L01DBE2AC_2F98AC
/* 012580 01DBE280 00000000 */   nop
.L01DBE284_2F9884:
/* 012584 01DBE284 FC9C848F */  lw          $4, -0x6304($28)
/* 012588 01DBE288 4000A527 */  addiu       $5, $29, 0x40
/* 01258C 01DBE28C 5000A627 */  addiu       $6, $29, 0x50
/* 012590 01DBE290 05000724 */  addiu       $7, $0, 0x5
/* 012594 01DBE294 28460072 */  paddub      $8, $16, $0
/* 012598 01DBE298 284E0070 */  paddub      $9, $0, $0
/* 01259C 01DBE29C 28560070 */  paddub      $10, $0, $0
/* 0125A0 01DBE2A0 FFFF0B24 */  addiu       $11, $0, -0x1
/* 0125A4 01DBE2A4 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0125A8 01DBE2A8 00000000 */   nop
.L01DBE2AC_2F98AC:
/* 0125AC 01DBE2AC FFFF0324 */  addiu       $3, $0, -0x1
/* 0125B0 01DBE2B0 17004310 */  beq         $2, $3, .L01DBE310_2F9910
/* 0125B4 01DBE2B4 00000000 */   nop
/* 0125B8 01DBE2B8 049D828F */  lw          $2, -0x62FC($28)
/* 0125BC 01DBE2BC FC9C848F */  lw          $4, -0x6304($28)
/* 0125C0 01DBE2C0 1C004524 */  addiu       $5, $2, 0x1C
/* 0125C4 01DBE2C4 F0B8060C */  jal         SetVsMonster__12CSHOT_EFFECTFPc
/* 0125C8 01DBE2C8 00000000 */   nop
/* 0125CC 01DBE2CC 049D828F */  lw          $2, -0x62FC($28)
/* 0125D0 01DBE2D0 EE004584 */  lh          $5, 0xEE($2)
/* 0125D4 01DBE2D4 FC9C848F */  lw          $4, -0x6304($28)
/* 0125D8 01DBE2D8 E0B8060C */  jal         SetWepStatus__12CSHOT_EFFECTFi
/* 0125DC 01DBE2DC 00000000 */   nop
/* 0125E0 01DBE2E0 049D828F */  lw          $2, -0x62FC($28)
/* 0125E4 01DBE2E4 16004480 */  lb          $4, 0x16($2)
/* 0125E8 01DBE2E8 7CDA060C */  jal         GetWeaponElementAttr__Fi
/* 0125EC 01DBE2EC 00000000 */   nop
/* 0125F0 01DBE2F0 FC9C848F */  lw          $4, -0x6304($28)
/* 0125F4 01DBE2F4 282E4070 */  paddub      $5, $2, $0
/* 0125F8 01DBE2F8 D4B8060C */  jal         SetAttribute__12CSHOT_EFFECTFi
/* 0125FC 01DBE2FC 00000000 */   nop
/* 012600 01DBE300 FC9C848F */  lw          $4, -0x6304($28)
/* 012604 01DBE304 282E2072 */  paddub      $5, $17, $0
/* 012608 01DBE308 C4B8060C */  jal         SetDmg__12CSHOT_EFFECTFi
/* 01260C 01DBE30C 00000000 */   nop
.L01DBE310_2F9910:
/* 012610 01DBE310 01000224 */  addiu       $2, $0, 0x1
/* 012614 01DBE314 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 012618 01DBE318 984422AC */  sw          $2, %lo(BtActStatus + 0x18)($1)
/* 01261C 01DBE31C DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 012620 01DBE320 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 012624 01DBE324 0040023C */  lui         $2, (0x40000000 >> 16)
/* 012628 01DBE328 00608244 */  mtc1        $2, $f12
/* 01262C 01DBE32C 28260070 */  paddub      $4, $0, $0
/* 012630 01DBE330 CCE6760C */  jal         SwordDmgCheck1__Ffi
/* 012634 01DBE334 00000000 */   nop
.L01DBE338_2F9938:
/* 012638 01DBE338 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 01263C 01DBE33C 9844248C */  lw          $4, %lo(BtActStatus + 0x18)($1)
/* 012640 01DBE340 01000324 */  addiu       $3, $0, 0x1
/* 012644 01DBE344 0D008314 */  bne         $4, $3, .L01DBE37C_2F997C
/* 012648 01DBE348 00000000 */   nop
/* 01264C 01DBE34C DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 012650 01DBE350 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 012654 01DBE354 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012658 01DBE358 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 01265C 01DBE35C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 012660 01DBE360 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 012664 01DBE364 989D838F */  lw          $3, -0x6268($28)
/* 012668 01DBE368 04006010 */  beqz        $3, .L01DBE37C_2F997C
/* 01266C 01DBE36C 00000000 */   nop
/* 012670 01DBE370 12000324 */  addiu       $3, $0, 0x12
/* 012674 01DBE374 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 012678 01DBE378 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBE37C_2F997C:
/* 01267C 01DBE37C 3000BF7B */  lq          $31, 0x30($29)
/* 012680 01DBE380 2000B27B */  lq          $18, 0x20($29)
/* 012684 01DBE384 1000B17B */  lq          $17, 0x10($29)
/* 012688 01DBE388 0000B07B */  lq          $16, 0x0($29)
/* 01268C 01DBE38C 7000BD27 */  addiu       $29, $29, 0x70
/* 012690 01DBE390 0800E003 */  jr          $31
/* 012694 01DBE394 00000000 */   nop
/* 012698 01DBE398 00000000 */  nop
/* 01269C 01DBE39C 00000000 */  nop
