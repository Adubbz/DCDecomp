.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionShotRuby__FP10CCharacterifi
/* 011280 01DBCF80 90FFBD27 */  addiu       $29, $29, -0x70
/* 011284 01DBCF84 5000BF7F */  sq          $31, 0x50($29)
/* 011288 01DBCF88 4000B47F */  sq          $20, 0x40($29)
/* 01128C 01DBCF8C 3000B37F */  sq          $19, 0x30($29)
/* 011290 01DBCF90 2000B27F */  sq          $18, 0x20($29)
/* 011294 01DBCF94 1000B17F */  sq          $17, 0x10($29)
/* 011298 01DBCF98 0000B07F */  sq          $16, 0x0($29)
/* 01129C 01DBCF9C 28A68070 */  paddub      $20, $4, $0
/* 0112A0 01DBCFA0 289EA070 */  paddub      $19, $5, $0
/* 0112A4 01DBCFA4 2896C070 */  paddub      $18, $6, $0
/* 0112A8 01DBCFA8 049D868F */  lw          $6, -0x62FC($28)
/* 0112AC 01DBCFAC 1600D080 */  lb          $16, 0x16($6)
/* 0112B0 01DBCFB0 0400C284 */  lh          $2, 0x4($6)
/* 0112B4 01DBCFB4 43180200 */  sra         $3, $2, 1
/* 0112B8 01DBCFB8 0A00C284 */  lh          $2, 0xA($6)
/* 0112BC 01DBCFBC 43100200 */  sra         $2, $2, 1
/* 0112C0 01DBCFC0 21886200 */  addu        $17, $3, $2
/* 0112C4 01DBCFC4 00009144 */  mtc1        $17, $f0
/* 0112C8 01DBCFC8 00000000 */  nop
/* 0112CC 01DBCFCC 20008046 */  cvt.s.w     $f0, $f0
/* 0112D0 01DBCFD0 02030C46 */  mul.s       $f12, $f0, $f12
/* 0112D4 01DBCFD4 2C44040C */  jal         fptosi
/* 0112D8 01DBCFD8 00000000 */   nop
/* 0112DC 01DBCFDC 288E4070 */  paddub      $17, $2, $0
/* 0112E0 01DBCFE0 08000424 */  addiu       $4, $0, 0x8
/* 0112E4 01DBCFE4 4CC6060C */  jal         StatusErrCheck__Fi
/* 0112E8 01DBCFE8 00000000 */   nop
/* 0112EC 01DBCFEC 02004010 */  beqz        $2, .L01DBCFF8_2F85F8
/* 0112F0 01DBCFF0 00000000 */   nop
/* 0112F4 01DBCFF4 40881100 */  sll         $17, $17, 1
.L01DBCFF8_2F85F8:
/* 0112F8 01DBCFF8 28004012 */  beqz        $18, .L01DBD09C_2F869C
/* 0112FC 01DBCFFC 00000000 */   nop
/* 011300 01DBD000 FC9C848F */  lw          $4, -0x6304($28)
/* 011304 01DBD004 F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 011308 01DBD008 B0684524 */  addiu       $5, $2, %lo(ruby_effect_pos)
/* 01130C 01DBD00C F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 011310 01DBD010 C0684624 */  addiu       $6, $2, %lo(ruby_effect_vec)
/* 011314 01DBD014 03000724 */  addiu       $7, $0, 0x3
/* 011318 01DBD018 28460072 */  paddub      $8, $16, $0
/* 01131C 01DBD01C 284E0070 */  paddub      $9, $0, $0
/* 011320 01DBD020 28560070 */  paddub      $10, $0, $0
/* 011324 01DBD024 01000B24 */  addiu       $11, $0, 0x1
/* 011328 01DBD028 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 01132C 01DBD02C 00000000 */   nop
/* 011330 01DBD030 FFFF0324 */  addiu       $3, $0, -0x1
/* 011334 01DBD034 17004310 */  beq         $2, $3, .L01DBD094_2F8694
/* 011338 01DBD038 00000000 */   nop
/* 01133C 01DBD03C 049D828F */  lw          $2, -0x62FC($28)
/* 011340 01DBD040 EE004584 */  lh          $5, 0xEE($2)
/* 011344 01DBD044 FC9C848F */  lw          $4, -0x6304($28)
/* 011348 01DBD048 E0B8060C */  jal         SetWepStatus__12CSHOT_EFFECTFi
/* 01134C 01DBD04C 00000000 */   nop
/* 011350 01DBD050 049D828F */  lw          $2, -0x62FC($28)
/* 011354 01DBD054 FC9C848F */  lw          $4, -0x6304($28)
/* 011358 01DBD058 1C004524 */  addiu       $5, $2, 0x1C
/* 01135C 01DBD05C F0B8060C */  jal         SetVsMonster__12CSHOT_EFFECTFPc
/* 011360 01DBD060 00000000 */   nop
/* 011364 01DBD064 FC9C848F */  lw          $4, -0x6304($28)
/* 011368 01DBD068 282E2072 */  paddub      $5, $17, $0
/* 01136C 01DBD06C C4B8060C */  jal         SetDmg__12CSHOT_EFFECTFi
/* 011370 01DBD070 00000000 */   nop
/* 011374 01DBD074 0040023C */  lui         $2, (0x40000000 >> 16)
/* 011378 01DBD078 00608244 */  mtc1        $2, $f12
/* 01137C 01DBD07C FC9C848F */  lw          $4, -0x6304($28)
/* 011380 01DBD080 94B8060C */  jal         SetRandomRate__12CSHOT_EFFECTFf
/* 011384 01DBD084 00000000 */   nop
/* 011388 01DBD088 FC9C848F */  lw          $4, -0x6304($28)
/* 01138C 01DBD08C 84B8060C */  jal         SetNoSound__12CSHOT_EFFECTFv
/* 011390 01DBD090 00000000 */   nop
.L01DBD094_2F8694:
/* 011394 01DBD094 A4000010 */  b           .L01DBD328_2F8928
/* 011398 01DBD098 00000000 */   nop
.L01DBD09C_2F869C:
/* 01139C 01DBD09C 58006016 */  bnez        $19, .L01DBD200_2F8800
/* 0113A0 01DBD0A0 00000000 */   nop
/* 0113A4 01DBD0A4 BC00848E */  lw          $4, 0xBC($20)
/* 0113A8 01DBD0A8 DC01023C */  lui         $2, %hi(LIT_4980)
/* 0113AC 01DBD0AC E0304524 */  addiu       $5, $2, %lo(LIT_4980)
/* 0113B0 01DBD0B0 F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 0113B4 01DBD0B4 B0684624 */  addiu       $6, $2, %lo(ruby_effect_pos)
/* 0113B8 01DBD0B8 CCDB060C */  jal         getFramePos__FP9CFrameVu1PcPf
/* 0113BC 01DBD0BC 00000000 */   nop
/* 0113C0 01DBD0C0 989D828F */  lw          $2, -0x6268($28)
/* 0113C4 01DBD0C4 29004014 */  bnez        $2, .L01DBD16C_2F876C
/* 0113C8 01DBD0C8 00000000 */   nop
/* 0113CC 01DBD0CC 00608044 */  mtc1        $0, $f12
/* 0113D0 01DBD0D0 F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 0113D4 01DBD0D4 C0684424 */  addiu       $4, $2, %lo(ruby_effect_vec)
/* 0113D8 01DBD0D8 6850070C */  jal         getCharacterVector__FPff
/* 0113DC 01DBD0DC 00000000 */   nop
/* 0113E0 01DBD0E0 F001013C */  lui         $1, %hi(ruby_effect_vec)
/* 0113E4 01DBD0E4 C06821C4 */  lwc1        $f1, %lo(ruby_effect_vec)($1)
/* 0113E8 01DBD0E8 F001013C */  lui         $1, %hi(ruby_effect_pos)
/* 0113EC 01DBD0EC B06820C4 */  lwc1        $f0, %lo(ruby_effect_pos)($1)
/* 0113F0 01DBD0F0 00080046 */  add.s       $f0, $f1, $f0
/* 0113F4 01DBD0F4 F001013C */  lui         $1, %hi(ruby_effect_vec)
/* 0113F8 01DBD0F8 C06820E4 */  swc1        $f0, %lo(ruby_effect_vec)($1)
/* 0113FC 01DBD0FC F001013C */  lui         $1, %hi(ruby_effect_vec + 0x4)
/* 011400 01DBD100 C46821C4 */  lwc1        $f1, %lo(ruby_effect_vec + 0x4)($1)
/* 011404 01DBD104 F001013C */  lui         $1, %hi(ruby_effect_pos + 0x4)
/* 011408 01DBD108 B46820C4 */  lwc1        $f0, %lo(ruby_effect_pos + 0x4)($1)
/* 01140C 01DBD10C 00080046 */  add.s       $f0, $f1, $f0
/* 011410 01DBD110 F001013C */  lui         $1, %hi(ruby_effect_vec + 0x4)
/* 011414 01DBD114 C46820E4 */  swc1        $f0, %lo(ruby_effect_vec + 0x4)($1)
/* 011418 01DBD118 F001013C */  lui         $1, %hi(ruby_effect_vec + 0x8)
/* 01141C 01DBD11C C86821C4 */  lwc1        $f1, %lo(ruby_effect_vec + 0x8)($1)
/* 011420 01DBD120 F001013C */  lui         $1, %hi(ruby_effect_pos + 0x8)
/* 011424 01DBD124 B86820C4 */  lwc1        $f0, %lo(ruby_effect_pos + 0x8)($1)
/* 011428 01DBD128 00080046 */  add.s       $f0, $f1, $f0
/* 01142C 01DBD12C F001013C */  lui         $1, %hi(ruby_effect_vec + 0x8)
/* 011430 01DBD130 C86820E4 */  swc1        $f0, %lo(ruby_effect_vec + 0x8)($1)
/* 011434 01DBD134 FC9C848F */  lw          $4, -0x6304($28)
/* 011438 01DBD138 F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 01143C 01DBD13C B0684524 */  addiu       $5, $2, %lo(ruby_effect_pos)
/* 011440 01DBD140 F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 011444 01DBD144 C0684624 */  addiu       $6, $2, %lo(ruby_effect_vec)
/* 011448 01DBD148 03000724 */  addiu       $7, $0, 0x3
/* 01144C 01DBD14C 28460072 */  paddub      $8, $16, $0
/* 011450 01DBD150 284E0070 */  paddub      $9, $0, $0
/* 011454 01DBD154 28560070 */  paddub      $10, $0, $0
/* 011458 01DBD158 01000B24 */  addiu       $11, $0, 0x1
/* 01145C 01DBD15C 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 011460 01DBD160 00000000 */   nop
/* 011464 01DBD164 13000010 */  b           .L01DBD1B4_2F87B4
/* 011468 01DBD168 00000000 */   nop
.L01DBD16C_2F876C:
/* 01146C 01DBD16C F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 011470 01DBD170 C0684424 */  addiu       $4, $2, %lo(ruby_effect_vec)
/* 011474 01DBD174 DC01023C */  lui         $2, %hi(BtActStatus + 0x80)
/* 011478 01DBD178 00454524 */  addiu       $5, $2, %lo(BtActStatus + 0x80)
/* 01147C 01DBD17C 0C86040C */  jal         sceVu0CopyVector
/* 011480 01DBD180 00000000 */   nop
/* 011484 01DBD184 FC9C848F */  lw          $4, -0x6304($28)
/* 011488 01DBD188 F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 01148C 01DBD18C B0684524 */  addiu       $5, $2, %lo(ruby_effect_pos)
/* 011490 01DBD190 F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 011494 01DBD194 C0684624 */  addiu       $6, $2, %lo(ruby_effect_vec)
/* 011498 01DBD198 03000724 */  addiu       $7, $0, 0x3
/* 01149C 01DBD19C 28460072 */  paddub      $8, $16, $0
/* 0114A0 01DBD1A0 284E0070 */  paddub      $9, $0, $0
/* 0114A4 01DBD1A4 28560070 */  paddub      $10, $0, $0
/* 0114A8 01DBD1A8 01000B24 */  addiu       $11, $0, 0x1
/* 0114AC 01DBD1AC 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0114B0 01DBD1B0 00000000 */   nop
.L01DBD1B4_2F87B4:
/* 0114B4 01DBD1B4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0114B8 01DBD1B8 5B004310 */  beq         $2, $3, .L01DBD328_2F8928
/* 0114BC 01DBD1BC 00000000 */   nop
/* 0114C0 01DBD1C0 049D828F */  lw          $2, -0x62FC($28)
/* 0114C4 01DBD1C4 EE004584 */  lh          $5, 0xEE($2)
/* 0114C8 01DBD1C8 FC9C848F */  lw          $4, -0x6304($28)
/* 0114CC 01DBD1CC E0B8060C */  jal         SetWepStatus__12CSHOT_EFFECTFi
/* 0114D0 01DBD1D0 00000000 */   nop
/* 0114D4 01DBD1D4 049D828F */  lw          $2, -0x62FC($28)
/* 0114D8 01DBD1D8 FC9C848F */  lw          $4, -0x6304($28)
/* 0114DC 01DBD1DC 1C004524 */  addiu       $5, $2, 0x1C
/* 0114E0 01DBD1E0 F0B8060C */  jal         SetVsMonster__12CSHOT_EFFECTFPc
/* 0114E4 01DBD1E4 00000000 */   nop
/* 0114E8 01DBD1E8 FC9C848F */  lw          $4, -0x6304($28)
/* 0114EC 01DBD1EC 282E2072 */  paddub      $5, $17, $0
/* 0114F0 01DBD1F0 C4B8060C */  jal         SetDmg__12CSHOT_EFFECTFi
/* 0114F4 01DBD1F4 00000000 */   nop
/* 0114F8 01DBD1F8 4B000010 */  b           .L01DBD328_2F8928
/* 0114FC 01DBD1FC 00000000 */   nop
.L01DBD200_2F8800:
/* 011500 01DBD200 DC01023C */  lui         $2, %hi(LIT_5755)
/* 011504 01DBD204 E0284224 */  addiu       $2, $2, %lo(LIT_5755)
/* 011508 01DBD208 6000A327 */  addiu       $3, $29, 0x60
/* 01150C 01DBD20C 00004278 */  lq          $2, 0x0($2)
/* 011510 01DBD210 0000627C */  sq          $2, 0x0($3)
/* 011514 01DBD214 BC00848E */  lw          $4, 0xBC($20)
/* 011518 01DBD218 DC01023C */  lui         $2, %hi(LIT_4980)
/* 01151C 01DBD21C E0304524 */  addiu       $5, $2, %lo(LIT_4980)
/* 011520 01DBD220 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 011524 01DBD224 00000000 */   nop
/* 011528 01DBD228 28264070 */  paddub      $4, $2, $0
/* 01152C 01DBD22C F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 011530 01DBD230 B0684524 */  addiu       $5, $2, %lo(ruby_effect_pos)
/* 011534 01DBD234 6000A627 */  addiu       $6, $29, 0x60
/* 011538 01DBD238 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 01153C 01DBD23C 00000000 */   nop
/* 011540 01DBD240 6040023C */  lui         $2, (0x40600000 >> 16)
/* 011544 01DBD244 00608244 */  mtc1        $2, $f12
/* 011548 01DBD248 F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 01154C 01DBD24C C0684424 */  addiu       $4, $2, %lo(ruby_effect_vec)
/* 011550 01DBD250 AC9C8DC7 */  lwc1        $f13, -0x6354($28)
/* 011554 01DBD254 B09C8EC7 */  lwc1        $f14, -0x6350($28)
/* 011558 01DBD258 4050070C */  jal         setShotVector__FPffff
/* 01155C 01DBD25C 00000000 */   nop
/* 011560 01DBD260 F001013C */  lui         $1, %hi(ruby_effect_vec)
/* 011564 01DBD264 C06821C4 */  lwc1        $f1, %lo(ruby_effect_vec)($1)
/* 011568 01DBD268 F001013C */  lui         $1, %hi(ruby_effect_pos)
/* 01156C 01DBD26C B06820C4 */  lwc1        $f0, %lo(ruby_effect_pos)($1)
/* 011570 01DBD270 00080046 */  add.s       $f0, $f1, $f0
/* 011574 01DBD274 F001013C */  lui         $1, %hi(ruby_effect_vec)
/* 011578 01DBD278 C06820E4 */  swc1        $f0, %lo(ruby_effect_vec)($1)
/* 01157C 01DBD27C F001013C */  lui         $1, %hi(ruby_effect_vec + 0x4)
/* 011580 01DBD280 C46821C4 */  lwc1        $f1, %lo(ruby_effect_vec + 0x4)($1)
/* 011584 01DBD284 F001013C */  lui         $1, %hi(ruby_effect_pos + 0x4)
/* 011588 01DBD288 B46820C4 */  lwc1        $f0, %lo(ruby_effect_pos + 0x4)($1)
/* 01158C 01DBD28C 00080046 */  add.s       $f0, $f1, $f0
/* 011590 01DBD290 F001013C */  lui         $1, %hi(ruby_effect_vec + 0x4)
/* 011594 01DBD294 C46820E4 */  swc1        $f0, %lo(ruby_effect_vec + 0x4)($1)
/* 011598 01DBD298 F001013C */  lui         $1, %hi(ruby_effect_vec + 0x8)
/* 01159C 01DBD29C C86821C4 */  lwc1        $f1, %lo(ruby_effect_vec + 0x8)($1)
/* 0115A0 01DBD2A0 F001013C */  lui         $1, %hi(ruby_effect_pos + 0x8)
/* 0115A4 01DBD2A4 B86820C4 */  lwc1        $f0, %lo(ruby_effect_pos + 0x8)($1)
/* 0115A8 01DBD2A8 00080046 */  add.s       $f0, $f1, $f0
/* 0115AC 01DBD2AC F001013C */  lui         $1, %hi(ruby_effect_vec + 0x8)
/* 0115B0 01DBD2B0 C86820E4 */  swc1        $f0, %lo(ruby_effect_vec + 0x8)($1)
/* 0115B4 01DBD2B4 FC9C848F */  lw          $4, -0x6304($28)
/* 0115B8 01DBD2B8 F001023C */  lui         $2, %hi(ruby_effect_pos)
/* 0115BC 01DBD2BC B0684524 */  addiu       $5, $2, %lo(ruby_effect_pos)
/* 0115C0 01DBD2C0 F001023C */  lui         $2, %hi(ruby_effect_vec)
/* 0115C4 01DBD2C4 C0684624 */  addiu       $6, $2, %lo(ruby_effect_vec)
/* 0115C8 01DBD2C8 03000724 */  addiu       $7, $0, 0x3
/* 0115CC 01DBD2CC 28460072 */  paddub      $8, $16, $0
/* 0115D0 01DBD2D0 284E0070 */  paddub      $9, $0, $0
/* 0115D4 01DBD2D4 28560070 */  paddub      $10, $0, $0
/* 0115D8 01DBD2D8 01000B24 */  addiu       $11, $0, 0x1
/* 0115DC 01DBD2DC 58B7060C */  jal         Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* 0115E0 01DBD2E0 00000000 */   nop
/* 0115E4 01DBD2E4 FFFF0324 */  addiu       $3, $0, -0x1
/* 0115E8 01DBD2E8 0F004310 */  beq         $2, $3, .L01DBD328_2F8928
/* 0115EC 01DBD2EC 00000000 */   nop
/* 0115F0 01DBD2F0 049D828F */  lw          $2, -0x62FC($28)
/* 0115F4 01DBD2F4 EE004584 */  lh          $5, 0xEE($2)
/* 0115F8 01DBD2F8 FC9C848F */  lw          $4, -0x6304($28)
/* 0115FC 01DBD2FC E0B8060C */  jal         SetWepStatus__12CSHOT_EFFECTFi
/* 011600 01DBD300 00000000 */   nop
/* 011604 01DBD304 049D828F */  lw          $2, -0x62FC($28)
/* 011608 01DBD308 FC9C848F */  lw          $4, -0x6304($28)
/* 01160C 01DBD30C 1C004524 */  addiu       $5, $2, 0x1C
/* 011610 01DBD310 F0B8060C */  jal         SetVsMonster__12CSHOT_EFFECTFPc
/* 011614 01DBD314 00000000 */   nop
/* 011618 01DBD318 FC9C848F */  lw          $4, -0x6304($28)
/* 01161C 01DBD31C 282E2072 */  paddub      $5, $17, $0
/* 011620 01DBD320 C4B8060C */  jal         SetDmg__12CSHOT_EFFECTFi
/* 011624 01DBD324 00000000 */   nop
.L01DBD328_2F8928:
/* 011628 01DBD328 5000BF7B */  lq          $31, 0x50($29)
/* 01162C 01DBD32C 4000B47B */  lq          $20, 0x40($29)
/* 011630 01DBD330 3000B37B */  lq          $19, 0x30($29)
/* 011634 01DBD334 2000B27B */  lq          $18, 0x20($29)
/* 011638 01DBD338 1000B17B */  lq          $17, 0x10($29)
/* 01163C 01DBD33C 0000B07B */  lq          $16, 0x0($29)
/* 011640 01DBD340 7000BD27 */  addiu       $29, $29, 0x70
/* 011644 01DBD344 0800E003 */  jr          $31
/* 011648 01DBD348 00000000 */   nop
/* 01164C 01DBD34C 00000000 */  nop
