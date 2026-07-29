.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtCheckDamageProc__Fv
/* 00F2D0 01DBAFD0 90FEBD27 */  addiu       $29, $29, -0x170
/* 00F2D4 01DBAFD4 9000BF7F */  sq          $31, 0x90($29)
/* 00F2D8 01DBAFD8 8000BE7F */  sq          $30, 0x80($29)
/* 00F2DC 01DBAFDC 7000B77F */  sq          $23, 0x70($29)
/* 00F2E0 01DBAFE0 6000B67F */  sq          $22, 0x60($29)
/* 00F2E4 01DBAFE4 5000B57F */  sq          $21, 0x50($29)
/* 00F2E8 01DBAFE8 4000B47F */  sq          $20, 0x40($29)
/* 00F2EC 01DBAFEC 3000B37F */  sq          $19, 0x30($29)
/* 00F2F0 01DBAFF0 2000B27F */  sq          $18, 0x20($29)
/* 00F2F4 01DBAFF4 1000B17F */  sq          $17, 0x10($29)
/* 00F2F8 01DBAFF8 0000B07F */  sq          $16, 0x0($29)
/* 00F2FC 01DBAFFC 28B60070 */  paddub      $22, $0, $0
/* 00F300 01DBB000 28F60070 */  paddub      $30, $0, $0
/* 00F304 01DBB004 A09E8283 */  lb          $2, -0x6160($28)
/* 00F308 01DBB008 04004014 */  bnez        $2, .L01DBB01C_2F661C
/* 00F30C 01DBB00C 00000000 */   nop
/* 00F310 01DBB010 9C9E80AF */  sw          $0, -0x6164($28)
/* 00F314 01DBB014 01000224 */  addiu       $2, $0, 0x1
/* 00F318 01DBB018 A09E82A3 */  sb          $2, -0x6160($28)
.L01DBB01C_2F661C:
/* 00F31C 01DBB01C 9C9E828F */  lw          $2, -0x6164($28)
/* 00F320 01DBB020 03004018 */  blez        $2, .L01DBB030_2F6630
/* 00F324 01DBB024 00000000 */   nop
/* 00F328 01DBB028 FFFF4224 */  addiu       $2, $2, -0x1
/* 00F32C 01DBB02C 9C9E82AF */  sw          $2, -0x6164($28)
.L01DBB030_2F6630:
/* 00F330 01DBB030 D501013C */  lui         $1, %hi(DebugStatus + 0x50)
/* 00F334 01DBB034 B064238C */  lw          $3, %lo(DebugStatus + 0x50)($1)
/* 00F338 01DBB038 02000224 */  addiu       $2, $0, 0x2
/* 00F33C 01DBB03C 0A006214 */  bne         $3, $2, .L01DBB068_2F6668
/* 00F340 01DBB040 00000000 */   nop
/* 00F344 01DBB044 789C838F */  lw          $3, -0x6388($28)
/* 00F348 01DBB048 04006280 */  lb          $2, 0x4($3)
/* 00F34C 01DBB04C 40100200 */  sll         $2, $2, 1
/* 00F350 01DBB050 21184300 */  addu        $3, $2, $3
/* 00F354 01DBB054 06006284 */  lh          $2, 0x6($3)
/* 00F358 01DBB058 120062A4 */  sh          $2, 0x12($3)
/* 00F35C 01DBB05C 28160070 */  paddub      $2, $0, $0
/* 00F360 01DBB060 91030010 */  b           .L01DBBEA8_2F74A8
/* 00F364 01DBB064 00000000 */   nop
.L01DBB068_2F6668:
/* 00F368 01DBB068 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 00F36C 01DBB06C A044228C */  lw          $2, %lo(BtActStatus + 0x20)($1)
/* 00F370 01DBB070 82034014 */  bnez        $2, .L01DBBE7C_2F747C
/* 00F374 01DBB074 00000000 */   nop
/* 00F378 01DBB078 DC01013C */  lui         $1, %hi(BtActStatus + 0x24)
/* 00F37C 01DBB07C A444228C */  lw          $2, %lo(BtActStatus + 0x24)($1)
/* 00F380 01DBB080 7E034014 */  bnez        $2, .L01DBBE7C_2F747C
/* 00F384 01DBB084 00000000 */   nop
/* 00F388 01DBB088 A000A427 */  addiu       $4, $29, 0xA0
/* 00F38C 01DBB08C EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 00F390 01DBB090 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 00F394 01DBB094 0C86040C */  jal         sceVu0CopyVector
/* 00F398 01DBB098 00000000 */   nop
/* 00F39C 01DBB09C 789C858F */  lw          $5, -0x6388($28)
/* 00F3A0 01DBB0A0 DC01023C */  lui         $2, %hi(LIT_345__11)
/* 00F3A4 01DBB0A4 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 00F3A8 01DBB0A8 1001A427 */  addiu       $4, $29, 0x110
/* 00F3AC 01DBB0AC 00004378 */  lq          $3, 0x0($2)
/* 00F3B0 01DBB0B0 100042DC */  ld          $2, 0x10($2)
/* 00F3B4 01DBB0B4 0000837C */  sq          $3, 0x0($4)
/* 00F3B8 01DBB0B8 100082FC */  sd          $2, 0x10($4)
/* 00F3BC 01DBB0BC 0400A280 */  lb          $2, 0x4($5)
/* 00F3C0 01DBB0C0 80100200 */  sll         $2, $2, 2
/* 00F3C4 01DBB0C4 21105D00 */  addu        $2, $2, $29
/* 00F3C8 01DBB0C8 10014CC4 */  lwc1        $f12, 0x110($2)
/* 00F3CC 01DBB0CC F09D848F */  lw          $4, -0x6210($28)
/* 00F3D0 01DBB0D0 A000A527 */  addiu       $5, $29, 0xA0
/* 00F3D4 01DBB0D4 01000624 */  addiu       $6, $0, 0x1
/* 00F3D8 01DBB0D8 48D6060C */  jal         CheckHitUser__14CCollisionDataFPfif
/* 00F3DC 01DBB0DC 00000000 */   nop
/* 00F3E0 01DBB0E0 28864070 */  paddub      $16, $2, $0
/* 00F3E4 01DBB0E4 FFFF0224 */  addiu       $2, $0, -0x1
/* 00F3E8 01DBB0E8 64030212 */  beq         $16, $2, .L01DBBE7C_2F747C
/* 00F3EC 01DBB0EC 00000000 */   nop
/* 00F3F0 01DBB0F0 01001624 */  addiu       $22, $0, 0x1
/* 00F3F4 01DBB0F4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00F3F8 01DBB0F8 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 00F3FC 01DBB0FC 06000224 */  addiu       $2, $0, 0x6
/* 00F400 01DBB100 02006214 */  bne         $3, $2, .L01DBB10C_2F670C
/* 00F404 01DBB104 00000000 */   nop
/* 00F408 01DBB108 28F6C072 */  paddub      $30, $22, $0
.L01DBB10C_2F670C:
/* 00F40C 01DBB10C EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 00F410 01DBB110 046320AC */  sw          $0, %lo(BombInfo + 0x14)($1)
/* 00F414 01DBB114 FFFF0324 */  addiu       $3, $0, -0x1
/* 00F418 01DBB118 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 00F41C 01DBB11C 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 00F420 01DBB120 01000224 */  addiu       $2, $0, 0x1
/* 00F424 01DBB124 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 00F428 01DBB128 E44422A4 */  sh          $2, %lo(BtActStatus + 0x64)($1)
/* 00F42C 01DBB12C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00F430 01DBB130 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 00F434 01DBB134 DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 00F438 01DBB138 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 00F43C 01DBB13C EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00F440 01DBB140 A478228C */  lw          $2, %lo(activeItem + 0x34)($1)
/* 00F444 01DBB144 08004310 */  beq         $2, $3, .L01DBB168_2F6768
/* 00F448 01DBB148 00000000 */   nop
/* 00F44C 01DBB14C EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 00F450 01DBB150 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 00F454 01DBB154 5052070C */  jal         AllReleasItem__14CMainItemModelFv
/* 00F458 01DBB158 00000000 */   nop
/* 00F45C 01DBB15C FFFF0224 */  addiu       $2, $0, -0x1
/* 00F460 01DBB160 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 00F464 01DBB164 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
.L01DBB168_2F6768:
/* 00F468 01DBB168 DC01013C */  lui         $1, %hi(BtActStatus + 0x110)
/* 00F46C 01DBB16C 904520AC */  sw          $0, %lo(BtActStatus + 0x110)($1)
/* 00F470 01DBB170 DC01013C */  lui         $1, %hi(BtActStatus + 0xA4)
/* 00F474 01DBB174 244520AC */  sw          $0, %lo(BtActStatus + 0xA4)($1)
/* 00F478 01DBB178 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00F47C 01DBB17C DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 00F480 01DBB180 C84422AC */  sw          $2, %lo(BtActStatus + 0x48)($1)
/* 00F484 01DBB184 EC9C80AF */  sw          $0, -0x6314($28)
/* 00F488 01DBB188 E49C80AF */  sw          $0, -0x631C($28)
/* 00F48C 01DBB18C A49C858F */  lw          $5, -0x635C($28)
/* 00F490 01DBB190 FFFF0224 */  addiu       $2, $0, -0x1
/* 00F494 01DBB194 0B00A210 */  beq         $5, $2, .L01DBB1C4_2F67C4
/* 00F498 01DBB198 00000000 */   nop
/* 00F49C 01DBB19C 789C828F */  lw          $2, -0x6388($28)
/* 00F4A0 01DBB1A0 04004380 */  lb          $3, 0x4($2)
/* 00F4A4 01DBB1A4 03000224 */  addiu       $2, $0, 0x3
/* 00F4A8 01DBB1A8 06006214 */  bne         $3, $2, .L01DBB1C4_2F67C4
/* 00F4AC 01DBB1AC 00000000 */   nop
/* 00F4B0 01DBB1B0 FC9C848F */  lw          $4, -0x6304($28)
/* 00F4B4 01DBB1B4 04B3060C */  jal         OffEffect__12CSHOT_EFFECTFi
/* 00F4B8 01DBB1B8 00000000 */   nop
/* 00F4BC 01DBB1BC FFFF0224 */  addiu       $2, $0, -0x1
/* 00F4C0 01DBB1C0 A49C82AF */  sw          $2, -0x635C($28)
.L01DBB1C4_2F67C4:
/* 00F4C4 01DBB1C4 F09D838F */  lw          $3, -0x6210($28)
/* 00F4C8 01DBB1C8 80101000 */  sll         $2, $16, 2
/* 00F4CC 01DBB1CC 21105000 */  addu        $2, $2, $16
/* 00F4D0 01DBB1D0 40A90200 */  sll         $21, $2, 5
/* 00F4D4 01DBB1D4 21A07500 */  addu        $20, $3, $21
/* 00F4D8 01DBB1D8 3400918E */  lw          $17, 0x34($20)
/* 00F4DC 01DBB1DC 789C838F */  lw          $3, -0x6388($28)
/* 00F4E0 01DBB1E0 04006280 */  lb          $2, 0x4($3)
/* 00F4E4 01DBB1E4 80100200 */  sll         $2, $2, 2
/* 00F4E8 01DBB1E8 21104300 */  addu        $2, $2, $3
/* 00F4EC 01DBB1EC 4843528C */  lw          $18, 0x4348($2)
/* 00F4F0 01DBB1F0 08000424 */  addiu       $4, $0, 0x8
/* 00F4F4 01DBB1F4 4CC6060C */  jal         StatusErrCheck__Fi
/* 00F4F8 01DBB1F8 00000000 */   nop
/* 00F4FC 01DBB1FC 02004010 */  beqz        $2, .L01DBB208_2F6808
/* 00F500 01DBB200 00000000 */   nop
/* 00F504 01DBB204 40901200 */  sll         $18, $18, 1
.L01DBB208_2F6808:
/* 00F508 01DBB208 23883202 */  subu        $17, $17, $18
/* 00F50C 01DBB20C 0200201E */  bgtz        $17, .L01DBB218_2F6818
/* 00F510 01DBB210 00000000 */   nop
/* 00F514 01DBB214 288E0070 */  paddub      $17, $0, $0
.L01DBB218_2F6818:
/* 00F518 01DBB218 F09D828F */  lw          $2, -0x6210($28)
/* 00F51C 01DBB21C 2110A202 */  addu        $2, $21, $2
/* 00F520 01DBB220 5800428C */  lw          $2, 0x58($2)
/* 00F524 01DBB224 FFFF1224 */  addiu       $18, $0, -0x1
/* 00F528 01DBB228 23005210 */  beq         $2, $18, .L01DBB2B8_2F68B8
/* 00F52C 01DBB22C 00000000 */   nop
/* 00F530 01DBB230 38FF4324 */  addiu       $3, $2, -0xC8
/* 00F534 01DBB234 05000224 */  addiu       $2, $0, 0x5
/* 00F538 01DBB238 1A006200 */  div         $0, $3, $2
/* 00F53C 01DBB23C 02004014 */  bnez        $2, .L01DBB248_2F6848
/* 00F540 01DBB240 00000000 */   nop
/* 00F544 01DBB244 CD010000 */  break       0, 7
.L01DBB248_2F6848:
/* 00F548 01DBB248 12900000 */  mflo        $18
/* 00F54C 01DBB24C E09C848F */  lw          $4, -0x6320($28)
/* 00F550 01DBB250 0D004006 */  bltz        $18, .L01DBB288_2F6888
/* 00F554 01DBB254 00000000 */   nop
/* 00F558 01DBB258 1000412A */  slti        $1, $18, 0x10
/* 00F55C 01DBB25C 0A002010 */  beqz        $1, .L01DBB288_2F6888
/* 00F560 01DBB260 00000000 */   nop
/* 00F564 01DBB264 80101200 */  sll         $2, $18, 2
/* 00F568 01DBB268 21185200 */  addu        $3, $2, $18
/* 00F56C 01DBB26C 80100300 */  sll         $2, $3, 2
/* 00F570 01DBB270 21106200 */  addu        $2, $3, $2
/* 00F574 01DBB274 00110200 */  sll         $2, $2, 4
/* 00F578 01DBB278 21104400 */  addu        $2, $2, $4
/* 00F57C 01DBB27C 0200013C */  lui         $1, (0x20000 >> 16)
/* 00F580 01DBB280 21084100 */  addu        $1, $2, $1
/* 00F584 01DBB284 90E431AC */  sw          $17, -0x1B70($1)
.L01DBB288_2F6888:
/* 00F588 01DBB288 10350224 */  addiu       $2, $0, 0x3510
/* 00F58C 01DBB28C 18184202 */  mult        $3, $18, $2
/* 00F590 01DBB290 E09C828F */  lw          $2, -0x6320($28)
/* 00F594 01DBB294 21104300 */  addu        $2, $2, $3
/* 00F598 01DBB298 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 00F59C 01DBB29C D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 00F5A0 01DBB2A0 21204100 */  addu        $4, $2, $1
/* 00F5A4 01DBB2A4 B000A527 */  addiu       $5, $29, 0xB0
/* 00F5A8 01DBB2A8 A000998C */  lw          $25, 0xA0($4)
/* 00F5AC 01DBB2AC A000398F */  lw          $25, 0xA0($25)
/* 00F5B0 01DBB2B0 09F82003 */  jalr        $25
/* 00F5B4 01DBB2B4 00000000 */   nop
.L01DBB2B8_2F68B8:
/* 00F5B8 01DBB2B8 BE11040C */  jal         rand
/* 00F5BC 01DBB2BC 00000000 */   nop
/* 00F5C0 01DBB2C0 00008244 */  mtc1        $2, $f0
/* 00F5C4 01DBB2C4 00000000 */  nop
/* 00F5C8 01DBB2C8 60008046 */  cvt.s.w     $f1, $f0
/* 00F5CC 01DBB2CC C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00F5D0 01DBB2D0 00008244 */  mtc1        $2, $f0
/* 00F5D4 01DBB2D4 00000000 */  nop
/* 00F5D8 01DBB2D8 42000146 */  mul.s       $f1, $f0, $f1
/* 00F5DC 01DBB2DC 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 00F5E0 01DBB2E0 00008244 */  mtc1        $2, $f0
/* 00F5E4 01DBB2E4 00000000 */  nop
/* 00F5E8 01DBB2E8 030B0046 */  div.s       $f12, $f1, $f0
/* 00F5EC 01DBB2EC 2C44040C */  jal         fptosi
/* 00F5F0 01DBB2F0 00000000 */   nop
/* 00F5F4 01DBB2F4 289E4070 */  paddub      $19, $2, $0
/* 00F5F8 01DBB2F8 5000838E */  lw          $3, 0x50($20)
/* 00F5FC 01DBB2FC 0400023C */  lui         $2, (0x40000 >> 16)
/* 00F600 01DBB300 24106200 */  and         $2, $3, $2
/* 00F604 01DBB304 31004010 */  beqz        $2, .L01DBB3CC_2F69CC
/* 00F608 01DBB308 00000000 */   nop
/* 00F60C 01DBB30C 1400612A */  slti        $1, $19, 0x14
/* 00F610 01DBB310 2E002010 */  beqz        $1, .L01DBB3CC_2F69CC
/* 00F614 01DBB314 00000000 */   nop
/* 00F618 01DBB318 FFFF0224 */  addiu       $2, $0, -0x1
/* 00F61C 01DBB31C 2B004212 */  beq         $18, $2, .L01DBB3CC_2F69CC
/* 00F620 01DBB320 00000000 */   nop
/* 00F624 01DBB324 789C828F */  lw          $2, -0x6388($28)
/* 00F628 01DBB328 46434424 */  addiu       $4, $2, 0x4346
/* 00F62C 01DBB32C 46434394 */  lhu         $3, 0x4346($2)
/* 00F630 01DBB330 0B006128 */  slti        $1, $3, 0xB
/* 00F634 01DBB334 25002014 */  bnez        $1, .L01DBB3CC_2F69CC
/* 00F638 01DBB338 00000000 */   nop
/* 00F63C 01DBB33C 05000224 */  addiu       $2, $0, 0x5
/* 00F640 01DBB340 1A006200 */  div         $0, $3, $2
/* 00F644 01DBB344 02004014 */  bnez        $2, .L01DBB350_2F6950
/* 00F648 01DBB348 00000000 */   nop
/* 00F64C 01DBB34C CD010000 */  break       0, 7
.L01DBB350_2F6950:
/* 00F650 01DBB350 12B80000 */  mflo        $23
/* 00F654 01DBB354 00008294 */  lhu         $2, 0x0($4)
/* 00F658 01DBB358 23105700 */  subu        $2, $2, $23
/* 00F65C 01DBB35C 000082A4 */  sh          $2, 0x0($4)
/* 00F660 01DBB360 DF000424 */  addiu       $4, $0, 0xDF
/* 00F664 01DBB364 FFFF0524 */  addiu       $5, $0, -0x1
/* 00F668 01DBB368 28360070 */  paddub      $6, $0, $0
/* 00F66C 01DBB36C AC69050C */  jal         SndSePlay__Fiii
/* 00F670 01DBB370 00000000 */   nop
/* 00F674 01DBB374 E09C848F */  lw          $4, -0x6320($28)
/* 00F678 01DBB378 80101200 */  sll         $2, $18, 2
/* 00F67C 01DBB37C 21185200 */  addu        $3, $2, $18
/* 00F680 01DBB380 80100300 */  sll         $2, $3, 2
/* 00F684 01DBB384 21106200 */  addu        $2, $3, $2
/* 00F688 01DBB388 00110200 */  sll         $2, $2, 4
/* 00F68C 01DBB38C 21184400 */  addu        $3, $2, $4
/* 00F690 01DBB390 0200013C */  lui         $1, (0x20000 >> 16)
/* 00F694 01DBB394 21086100 */  addu        $1, $3, $1
/* 00F698 01DBB398 0CE4228C */  lw          $2, -0x1BF4($1)
/* 00F69C 01DBB39C 21105700 */  addu        $2, $2, $23
/* 00F6A0 01DBB3A0 0200013C */  lui         $1, (0x20000 >> 16)
/* 00F6A4 01DBB3A4 21086100 */  addu        $1, $3, $1
/* 00F6A8 01DBB3A8 0CE422AC */  sw          $2, -0x1BF4($1)
/* 00F6AC 01DBB3AC B5000224 */  addiu       $2, $0, 0xB5
/* 00F6B0 01DBB3B0 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F6B4 01DBB3B4 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F6B8 01DBB3B8 B4000224 */  addiu       $2, $0, 0xB4
/* 00F6BC 01DBB3BC EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F6C0 01DBB3C0 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F6C4 01DBB3C4 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F6C8 01DBB3C8 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DBB3CC_2F69CC:
/* 00F6CC 01DBB3CC 5000828E */  lw          $2, 0x50($20)
/* 00F6D0 01DBB3D0 00104230 */  andi        $2, $2, 0x1000
/* 00F6D4 01DBB3D4 07004010 */  beqz        $2, .L01DBB3F4_2F69F4
/* 00F6D8 01DBB3D8 00000000 */   nop
/* 00F6DC 01DBB3DC 4100612A */  slti        $1, $19, 0x41
/* 00F6E0 01DBB3E0 04002010 */  beqz        $1, .L01DBB3F4_2F69F4
/* 00F6E4 01DBB3E4 00000000 */   nop
/* 00F6E8 01DBB3E8 08000424 */  addiu       $4, $0, 0x8
/* 00F6EC 01DBB3EC ECC6060C */  jal         BtSetStatusErr__Fi
/* 00F6F0 01DBB3F0 00000000 */   nop
.L01DBB3F4_2F69F4:
/* 00F6F4 01DBB3F4 5000838E */  lw          $3, 0x50($20)
/* 00F6F8 01DBB3F8 1000023C */  lui         $2, (0x100000 >> 16)
/* 00F6FC 01DBB3FC 24106200 */  and         $2, $3, $2
/* 00F700 01DBB400 04004010 */  beqz        $2, .L01DBB414_2F6A14
/* 00F704 01DBB404 00000000 */   nop
/* 00F708 01DBB408 04000424 */  addiu       $4, $0, 0x4
/* 00F70C 01DBB40C ECC6060C */  jal         BtSetStatusErr__Fi
/* 00F710 01DBB410 00000000 */   nop
.L01DBB414_2F6A14:
/* 00F714 01DBB414 5000828E */  lw          $2, 0x50($20)
/* 00F718 01DBB418 00014230 */  andi        $2, $2, 0x100
/* 00F71C 01DBB41C 2A004010 */  beqz        $2, .L01DBB4C8_2F6AC8
/* 00F720 01DBB420 00000000 */   nop
/* 00F724 01DBB424 4100612A */  slti        $1, $19, 0x41
/* 00F728 01DBB428 27002010 */  beqz        $1, .L01DBB4C8_2F6AC8
/* 00F72C 01DBB42C 00000000 */   nop
/* 00F730 01DBB430 789C848F */  lw          $4, -0x6388($28)
/* 00F734 01DBB434 84000524 */  addiu       $5, $0, 0x84
/* 00F738 01DBB438 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 00F73C 01DBB43C 00000000 */   nop
/* 00F740 01DBB440 FFFF0324 */  addiu       $3, $0, -0x1
/* 00F744 01DBB444 06004314 */  bne         $2, $3, .L01DBB460_2F6A60
/* 00F748 01DBB448 00000000 */   nop
/* 00F74C 01DBB44C 04000424 */  addiu       $4, $0, 0x4
/* 00F750 01DBB450 ECC6060C */  jal         BtSetStatusErr__Fi
/* 00F754 01DBB454 00000000 */   nop
/* 00F758 01DBB458 1B000010 */  b           .L01DBB4C8_2F6AC8
/* 00F75C 01DBB45C 00000000 */   nop
.L01DBB460_2F6A60:
/* 00F760 01DBB460 789C848F */  lw          $4, -0x6388($28)
/* 00F764 01DBB464 80180200 */  sll         $3, $2, 2
/* 00F768 01DBB468 21186400 */  addu        $3, $3, $4
/* 00F76C 01DBB46C 1C0B6424 */  addiu       $4, $3, 0xB1C
/* 00F770 01DBB470 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 00F774 01DBB474 0000838C */  lw          $3, 0x0($4)
/* 00F778 01DBB478 FFFF6324 */  addiu       $3, $3, -0x1
/* 00F77C 01DBB47C 000083AC */  sw          $3, 0x0($4)
/* 00F780 01DBB480 1100601C */  bgtz        $3, .L01DBB4C8_2F6AC8
/* 00F784 01DBB484 00000000 */   nop
/* 00F788 01DBB488 01004424 */  addiu       $4, $2, 0x1
/* 00F78C 01DBB48C 74FE760C */  jal         DelActiveItem__Fi
/* 00F790 01DBB490 00000000 */   nop
/* 00F794 01DBB494 B7000224 */  addiu       $2, $0, 0xB7
/* 00F798 01DBB498 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F79C 01DBB49C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F7A0 01DBB4A0 84000424 */  addiu       $4, $0, 0x84
/* 00F7A4 01DBB4A4 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 00F7A8 01DBB4A8 00000000 */   nop
/* 00F7AC 01DBB4AC EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 00F7B0 01DBB4B0 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 00F7B4 01DBB4B4 B4000224 */  addiu       $2, $0, 0xB4
/* 00F7B8 01DBB4B8 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F7BC 01DBB4BC 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F7C0 01DBB4C0 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F7C4 01DBB4C4 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DBB4C8_2F6AC8:
/* 00F7C8 01DBB4C8 5000828E */  lw          $2, 0x50($20)
/* 00F7CC 01DBB4CC 00024230 */  andi        $2, $2, 0x200
/* 00F7D0 01DBB4D0 39004010 */  beqz        $2, .L01DBB5B8_2F6BB8
/* 00F7D4 01DBB4D4 00000000 */   nop
/* 00F7D8 01DBB4D8 4100612A */  slti        $1, $19, 0x41
/* 00F7DC 01DBB4DC 36002010 */  beqz        $1, .L01DBB5B8_2F6BB8
/* 00F7E0 01DBB4E0 00000000 */   nop
/* 00F7E4 01DBB4E4 789C848F */  lw          $4, -0x6388($28)
/* 00F7E8 01DBB4E8 04008280 */  lb          $2, 0x4($4)
/* 00F7EC 01DBB4EC 80100200 */  sll         $2, $2, 2
/* 00F7F0 01DBB4F0 21104400 */  addu        $2, $2, $4
/* 00F7F4 01DBB4F4 C842428C */  lw          $2, 0x42C8($2)
/* 00F7F8 01DBB4F8 10004230 */  andi        $2, $2, 0x10
/* 00F7FC 01DBB4FC 2E004014 */  bnez        $2, .L01DBB5B8_2F6BB8
/* 00F800 01DBB500 00000000 */   nop
/* 00F804 01DBB504 87000524 */  addiu       $5, $0, 0x87
/* 00F808 01DBB508 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 00F80C 01DBB50C 00000000 */   nop
/* 00F810 01DBB510 FFFF0324 */  addiu       $3, $0, -0x1
/* 00F814 01DBB514 0E004314 */  bne         $2, $3, .L01DBB550_2F6B50
/* 00F818 01DBB518 00000000 */   nop
/* 00F81C 01DBB51C 10000424 */  addiu       $4, $0, 0x10
/* 00F820 01DBB520 ECC6060C */  jal         BtSetStatusErr__Fi
/* 00F824 01DBB524 00000000 */   nop
/* 00F828 01DBB528 BB000224 */  addiu       $2, $0, 0xBB
/* 00F82C 01DBB52C EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F830 01DBB530 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F834 01DBB534 B4000224 */  addiu       $2, $0, 0xB4
/* 00F838 01DBB538 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F83C 01DBB53C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F840 01DBB540 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F844 01DBB544 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00F848 01DBB548 1B000010 */  b           .L01DBB5B8_2F6BB8
/* 00F84C 01DBB54C 00000000 */   nop
.L01DBB550_2F6B50:
/* 00F850 01DBB550 789C848F */  lw          $4, -0x6388($28)
/* 00F854 01DBB554 80180200 */  sll         $3, $2, 2
/* 00F858 01DBB558 21186400 */  addu        $3, $3, $4
/* 00F85C 01DBB55C 1C0B6424 */  addiu       $4, $3, 0xB1C
/* 00F860 01DBB560 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 00F864 01DBB564 0000838C */  lw          $3, 0x0($4)
/* 00F868 01DBB568 FFFF6324 */  addiu       $3, $3, -0x1
/* 00F86C 01DBB56C 000083AC */  sw          $3, 0x0($4)
/* 00F870 01DBB570 1100601C */  bgtz        $3, .L01DBB5B8_2F6BB8
/* 00F874 01DBB574 00000000 */   nop
/* 00F878 01DBB578 01004424 */  addiu       $4, $2, 0x1
/* 00F87C 01DBB57C 74FE760C */  jal         DelActiveItem__Fi
/* 00F880 01DBB580 00000000 */   nop
/* 00F884 01DBB584 B7000224 */  addiu       $2, $0, 0xB7
/* 00F888 01DBB588 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F88C 01DBB58C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F890 01DBB590 87000424 */  addiu       $4, $0, 0x87
/* 00F894 01DBB594 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 00F898 01DBB598 00000000 */   nop
/* 00F89C 01DBB59C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 00F8A0 01DBB5A0 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 00F8A4 01DBB5A4 B4000224 */  addiu       $2, $0, 0xB4
/* 00F8A8 01DBB5A8 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F8AC 01DBB5AC 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F8B0 01DBB5B0 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F8B4 01DBB5B4 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DBB5B8_2F6BB8:
/* 00F8B8 01DBB5B8 5000828E */  lw          $2, 0x50($20)
/* 00F8BC 01DBB5BC 00044230 */  andi        $2, $2, 0x400
/* 00F8C0 01DBB5C0 39004010 */  beqz        $2, .L01DBB6A8_2F6CA8
/* 00F8C4 01DBB5C4 00000000 */   nop
/* 00F8C8 01DBB5C8 4100612A */  slti        $1, $19, 0x41
/* 00F8CC 01DBB5CC 36002010 */  beqz        $1, .L01DBB6A8_2F6CA8
/* 00F8D0 01DBB5D0 00000000 */   nop
/* 00F8D4 01DBB5D4 789C848F */  lw          $4, -0x6388($28)
/* 00F8D8 01DBB5D8 04008280 */  lb          $2, 0x4($4)
/* 00F8DC 01DBB5DC 80100200 */  sll         $2, $2, 2
/* 00F8E0 01DBB5E0 21104400 */  addu        $2, $2, $4
/* 00F8E4 01DBB5E4 C842428C */  lw          $2, 0x42C8($2)
/* 00F8E8 01DBB5E8 20004230 */  andi        $2, $2, 0x20
/* 00F8EC 01DBB5EC 2E004014 */  bnez        $2, .L01DBB6A8_2F6CA8
/* 00F8F0 01DBB5F0 00000000 */   nop
/* 00F8F4 01DBB5F4 85000524 */  addiu       $5, $0, 0x85
/* 00F8F8 01DBB5F8 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 00F8FC 01DBB5FC 00000000 */   nop
/* 00F900 01DBB600 FFFF0324 */  addiu       $3, $0, -0x1
/* 00F904 01DBB604 0E004314 */  bne         $2, $3, .L01DBB640_2F6C40
/* 00F908 01DBB608 00000000 */   nop
/* 00F90C 01DBB60C 20000424 */  addiu       $4, $0, 0x20
/* 00F910 01DBB610 ECC6060C */  jal         BtSetStatusErr__Fi
/* 00F914 01DBB614 00000000 */   nop
/* 00F918 01DBB618 B9000224 */  addiu       $2, $0, 0xB9
/* 00F91C 01DBB61C EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F920 01DBB620 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F924 01DBB624 B4000224 */  addiu       $2, $0, 0xB4
/* 00F928 01DBB628 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F92C 01DBB62C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F930 01DBB630 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F934 01DBB634 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00F938 01DBB638 1B000010 */  b           .L01DBB6A8_2F6CA8
/* 00F93C 01DBB63C 00000000 */   nop
.L01DBB640_2F6C40:
/* 00F940 01DBB640 789C848F */  lw          $4, -0x6388($28)
/* 00F944 01DBB644 80180200 */  sll         $3, $2, 2
/* 00F948 01DBB648 21186400 */  addu        $3, $3, $4
/* 00F94C 01DBB64C 1C0B6424 */  addiu       $4, $3, 0xB1C
/* 00F950 01DBB650 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 00F954 01DBB654 0000838C */  lw          $3, 0x0($4)
/* 00F958 01DBB658 FFFF6324 */  addiu       $3, $3, -0x1
/* 00F95C 01DBB65C 000083AC */  sw          $3, 0x0($4)
/* 00F960 01DBB660 1100601C */  bgtz        $3, .L01DBB6A8_2F6CA8
/* 00F964 01DBB664 00000000 */   nop
/* 00F968 01DBB668 01004424 */  addiu       $4, $2, 0x1
/* 00F96C 01DBB66C 74FE760C */  jal         DelActiveItem__Fi
/* 00F970 01DBB670 00000000 */   nop
/* 00F974 01DBB674 B7000224 */  addiu       $2, $0, 0xB7
/* 00F978 01DBB678 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00F97C 01DBB67C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00F980 01DBB680 85000424 */  addiu       $4, $0, 0x85
/* 00F984 01DBB684 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 00F988 01DBB688 00000000 */   nop
/* 00F98C 01DBB68C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 00F990 01DBB690 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 00F994 01DBB694 B4000224 */  addiu       $2, $0, 0xB4
/* 00F998 01DBB698 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00F99C 01DBB69C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00F9A0 01DBB6A0 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00F9A4 01DBB6A4 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DBB6A8_2F6CA8:
/* 00F9A8 01DBB6A8 5000828E */  lw          $2, 0x50($20)
/* 00F9AC 01DBB6AC 00084230 */  andi        $2, $2, 0x800
/* 00F9B0 01DBB6B0 39004010 */  beqz        $2, .L01DBB798_2F6D98
/* 00F9B4 01DBB6B4 00000000 */   nop
/* 00F9B8 01DBB6B8 4100612A */  slti        $1, $19, 0x41
/* 00F9BC 01DBB6BC 36002010 */  beqz        $1, .L01DBB798_2F6D98
/* 00F9C0 01DBB6C0 00000000 */   nop
/* 00F9C4 01DBB6C4 789C848F */  lw          $4, -0x6388($28)
/* 00F9C8 01DBB6C8 04008280 */  lb          $2, 0x4($4)
/* 00F9CC 01DBB6CC 80100200 */  sll         $2, $2, 2
/* 00F9D0 01DBB6D0 21104400 */  addu        $2, $2, $4
/* 00F9D4 01DBB6D4 C842428C */  lw          $2, 0x42C8($2)
/* 00F9D8 01DBB6D8 40004230 */  andi        $2, $2, 0x40
/* 00F9DC 01DBB6DC 2E004014 */  bnez        $2, .L01DBB798_2F6D98
/* 00F9E0 01DBB6E0 00000000 */   nop
/* 00F9E4 01DBB6E4 86000524 */  addiu       $5, $0, 0x86
/* 00F9E8 01DBB6E8 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 00F9EC 01DBB6EC 00000000 */   nop
/* 00F9F0 01DBB6F0 FFFF0324 */  addiu       $3, $0, -0x1
/* 00F9F4 01DBB6F4 0E004314 */  bne         $2, $3, .L01DBB730_2F6D30
/* 00F9F8 01DBB6F8 00000000 */   nop
/* 00F9FC 01DBB6FC 40000424 */  addiu       $4, $0, 0x40
/* 00FA00 01DBB700 ECC6060C */  jal         BtSetStatusErr__Fi
/* 00FA04 01DBB704 00000000 */   nop
/* 00FA08 01DBB708 BA000224 */  addiu       $2, $0, 0xBA
/* 00FA0C 01DBB70C EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00FA10 01DBB710 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00FA14 01DBB714 B4000224 */  addiu       $2, $0, 0xB4
/* 00FA18 01DBB718 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00FA1C 01DBB71C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00FA20 01DBB720 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00FA24 01DBB724 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00FA28 01DBB728 1B000010 */  b           .L01DBB798_2F6D98
/* 00FA2C 01DBB72C 00000000 */   nop
.L01DBB730_2F6D30:
/* 00FA30 01DBB730 789C848F */  lw          $4, -0x6388($28)
/* 00FA34 01DBB734 80180200 */  sll         $3, $2, 2
/* 00FA38 01DBB738 21186400 */  addu        $3, $3, $4
/* 00FA3C 01DBB73C 1C0B6424 */  addiu       $4, $3, 0xB1C
/* 00FA40 01DBB740 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 00FA44 01DBB744 0000838C */  lw          $3, 0x0($4)
/* 00FA48 01DBB748 FFFF6324 */  addiu       $3, $3, -0x1
/* 00FA4C 01DBB74C 000083AC */  sw          $3, 0x0($4)
/* 00FA50 01DBB750 1100601C */  bgtz        $3, .L01DBB798_2F6D98
/* 00FA54 01DBB754 00000000 */   nop
/* 00FA58 01DBB758 01004424 */  addiu       $4, $2, 0x1
/* 00FA5C 01DBB75C 74FE760C */  jal         DelActiveItem__Fi
/* 00FA60 01DBB760 00000000 */   nop
/* 00FA64 01DBB764 B7000224 */  addiu       $2, $0, 0xB7
/* 00FA68 01DBB768 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00FA6C 01DBB76C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00FA70 01DBB770 86000424 */  addiu       $4, $0, 0x86
/* 00FA74 01DBB774 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 00FA78 01DBB778 00000000 */   nop
/* 00FA7C 01DBB77C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 00FA80 01DBB780 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 00FA84 01DBB784 B4000224 */  addiu       $2, $0, 0xB4
/* 00FA88 01DBB788 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00FA8C 01DBB78C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00FA90 01DBB790 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00FA94 01DBB794 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L01DBB798_2F6D98:
/* 00FA98 01DBB798 5000838E */  lw          $3, 0x50($20)
/* 00FA9C 01DBB79C 0800023C */  lui         $2, (0x80000 >> 16)
/* 00FAA0 01DBB7A0 24106200 */  and         $2, $3, $2
/* 00FAA4 01DBB7A4 07004010 */  beqz        $2, .L01DBB7C4_2F6DC4
/* 00FAA8 01DBB7A8 00000000 */   nop
/* 00FAAC 01DBB7AC 789C838F */  lw          $3, -0x6388($28)
/* 00FAB0 01DBB7B0 04006280 */  lb          $2, 0x4($3)
/* 00FAB4 01DBB7B4 40100200 */  sll         $2, $2, 1
/* 00FAB8 01DBB7B8 21104300 */  addu        $2, $2, $3
/* 00FABC 01DBB7BC 06004284 */  lh          $2, 0x6($2)
/* 00FAC0 01DBB7C0 43880200 */  sra         $17, $2, 1
.L01DBB7C4_2F6DC4:
/* 00FAC4 01DBB7C4 F09D828F */  lw          $2, -0x6210($28)
/* 00FAC8 01DBB7C8 2128A202 */  addu        $5, $21, $2
/* 00FACC 01DBB7CC 4C00A38C */  lw          $3, 0x4C($5)
/* 00FAD0 01DBB7D0 03000224 */  addiu       $2, $0, 0x3
/* 00FAD4 01DBB7D4 AD006214 */  bne         $3, $2, .L01DBBA8C_2F708C
/* 00FAD8 01DBB7D8 00000000 */   nop
/* 00FADC 01DBB7DC C000A427 */  addiu       $4, $29, 0xC0
/* 00FAE0 01DBB7E0 0C86040C */  jal         sceVu0CopyVector
/* 00FAE4 01DBB7E4 00000000 */   nop
/* 00FAE8 01DBB7E8 CC01023C */  lui         $2, %hi(GamePad)
/* 00FAEC 01DBB7EC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00FAF0 01DBB7F0 01000524 */  addiu       $5, $0, 0x1
/* 00FAF4 01DBB7F4 E6000624 */  addiu       $6, $0, 0xE6
/* 00FAF8 01DBB7F8 16000724 */  addiu       $7, $0, 0x16
/* 00FAFC 01DBB7FC 50AE040C */  jal         SetVibration__8CGamePadFiii
/* 00FB00 01DBB800 00000000 */   nop
/* 00FB04 01DBB804 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 00FB08 01DBB808 9444238C */  lw          $3, %lo(BtActStatus + 0x14)($1)
/* 00FB0C 01DBB80C 09000224 */  addiu       $2, $0, 0x9
/* 00FB10 01DBB810 29006214 */  bne         $3, $2, .L01DBB8B8_2F6EB8
/* 00FB14 01DBB814 00000000 */   nop
/* 00FB18 01DBB818 F09D828F */  lw          $2, -0x6210($28)
/* 00FB1C 01DBB81C 21185500 */  addu        $3, $2, $21
/* 00FB20 01DBB820 DC01023C */  lui         $2, %hi(blowVelo)
/* 00FB24 01DBB824 70254424 */  addiu       $4, $2, %lo(blowVelo)
/* 00FB28 01DBB828 20006524 */  addiu       $5, $3, 0x20
/* 00FB2C 01DBB82C 0C86040C */  jal         sceVu0CopyVector
/* 00FB30 01DBB830 00000000 */   nop
/* 00FB34 01DBB834 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00FB38 01DBB838 00088244 */  mtc1        $2, $f1
/* 00FB3C 01DBB83C DC01013C */  lui         $1, %hi(blowVelo)
/* 00FB40 01DBB840 702520C4 */  lwc1        $f0, %lo(blowVelo)($1)
/* 00FB44 01DBB844 03000146 */  div.s       $f0, $f0, $f1
/* 00FB48 01DBB848 DC01013C */  lui         $1, %hi(velo__2)
/* 00FB4C 01DBB84C 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 00FB50 01DBB850 DC01013C */  lui         $1, %hi(blowVelo + 0x8)
/* 00FB54 01DBB854 782520C4 */  lwc1        $f0, %lo(blowVelo + 0x8)($1)
/* 00FB58 01DBB858 03000146 */  div.s       $f0, $f0, $f1
/* 00FB5C 01DBB85C DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 00FB60 01DBB860 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 00FB64 01DBB864 F09D848F */  lw          $4, -0x6210($28)
/* 00FB68 01DBB868 2110A402 */  addu        $2, $21, $4
/* 00FB6C 01DBB86C 4800438C */  lw          $3, 0x48($2)
/* 00FB70 01DBB870 03000224 */  addiu       $2, $0, 0x3
/* 00FB74 01DBB874 04006210 */  beq         $3, $2, .L01DBB888_2F6E88
/* 00FB78 01DBB878 00000000 */   nop
/* 00FB7C 01DBB87C 80101000 */  sll         $2, $16, 2
/* 00FB80 01DBB880 21104400 */  addu        $2, $2, $4
/* 00FB84 01DBB884 003C40AC */  sw          $0, 0x3C00($2)
.L01DBB888_2F6E88:
/* 00FB88 01DBB888 9C9E828F */  lw          $2, -0x6164($28)
/* 00FB8C 01DBB88C 7F00401C */  bgtz        $2, .L01DBBA8C_2F708C
/* 00FB90 01DBB890 00000000 */   nop
/* 00FB94 01DBB894 A2000424 */  addiu       $4, $0, 0xA2
/* 00FB98 01DBB898 FFFF0524 */  addiu       $5, $0, -0x1
/* 00FB9C 01DBB89C 28360070 */  paddub      $6, $0, $0
/* 00FBA0 01DBB8A0 AC69050C */  jal         SndSePlay__Fiii
/* 00FBA4 01DBB8A4 00000000 */   nop
/* 00FBA8 01DBB8A8 1E000224 */  addiu       $2, $0, 0x1E
/* 00FBAC 01DBB8AC 9C9E82AF */  sw          $2, -0x6164($28)
/* 00FBB0 01DBB8B0 76000010 */  b           .L01DBBA8C_2F708C
/* 00FBB4 01DBB8B4 00000000 */   nop
.L01DBB8B8_2F6EB8:
/* 00FBB8 01DBB8B8 AF010424 */  addiu       $4, $0, 0x1AF
/* 00FBBC 01DBB8BC FFFF0524 */  addiu       $5, $0, -0x1
/* 00FBC0 01DBB8C0 28360070 */  paddub      $6, $0, $0
/* 00FBC4 01DBB8C4 AC69050C */  jal         SndSePlay__Fiii
/* 00FBC8 01DBB8C8 00000000 */   nop
/* 00FBCC 01DBB8CC A1000424 */  addiu       $4, $0, 0xA1
/* 00FBD0 01DBB8D0 FFFF0524 */  addiu       $5, $0, -0x1
/* 00FBD4 01DBB8D4 28360070 */  paddub      $6, $0, $0
/* 00FBD8 01DBB8D8 AC69050C */  jal         SndSePlay__Fiii
/* 00FBDC 01DBB8DC 00000000 */   nop
/* 00FBE0 01DBB8E0 0F000224 */  addiu       $2, $0, 0xF
/* 00FBE4 01DBB8E4 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 00FBE8 01DBB8E8 C44522A4 */  sh          $2, %lo(BtActStatus + 0x144)($1)
/* 00FBEC 01DBB8EC 2043023C */  lui         $2, (0x43200000 >> 16)
/* 00FBF0 01DBB8F0 00608244 */  mtc1        $2, $f12
/* 00FBF4 01DBB8F4 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 00FBF8 01DBB8F8 00708244 */  mtc1        $2, $f14
/* 00FBFC 01DBB8FC 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00FC00 01DBB900 00688244 */  mtc1        $2, $f13
/* 00FC04 01DBB904 00788044 */  mtc1        $0, $f15
/* 00FC08 01DBB908 00000000 */  nop
/* 00FC0C 01DBB90C 067C0046 */  mov.s       $f16, $f15
/* 00FC10 01DBB910 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00FC14 01DBB914 00000000 */   nop
/* 00FC18 01DBB918 789C848F */  lw          $4, -0x6388($28)
/* 00FC1C 01DBB91C 04008580 */  lb          $5, 0x4($4)
/* 00FC20 01DBB920 23101100 */  negu        $2, $17
/* 00FC24 01DBB924 3C340200 */  dsll32      $6, $2, 16
/* 00FC28 01DBB928 3F340600 */  dsra32      $6, $6, 16
/* 00FC2C 01DBB92C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00FC30 01DBB930 00608244 */  mtc1        $2, $f12
/* 00FC34 01DBB934 C4F9060C */  jal         AddNowLife__11CUserStatusFisf
/* 00FC38 01DBB938 00000000 */   nop
/* 00FC3C 01DBB93C DC01023C */  lui         $2, %hi(LIT_5329)
/* 00FC40 01DBB940 40284224 */  addiu       $2, $2, %lo(LIT_5329)
/* 00FC44 01DBB944 D000A527 */  addiu       $5, $29, 0xD0
/* 00FC48 01DBB948 00004278 */  lq          $2, 0x0($2)
/* 00FC4C 01DBB94C 0000A27C */  sq          $2, 0x0($5)
/* 00FC50 01DBB950 789C868F */  lw          $6, -0x6388($28)
/* 00FC54 01DBB954 DC01023C */  lui         $2, %hi(LIT_345__11)
/* 00FC58 01DBB958 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 00FC5C 01DBB95C 3001A427 */  addiu       $4, $29, 0x130
/* 00FC60 01DBB960 00004378 */  lq          $3, 0x0($2)
/* 00FC64 01DBB964 100042DC */  ld          $2, 0x10($2)
/* 00FC68 01DBB968 0000837C */  sq          $3, 0x0($4)
/* 00FC6C 01DBB96C 100082FC */  sd          $2, 0x10($4)
/* 00FC70 01DBB970 0400C280 */  lb          $2, 0x4($6)
/* 00FC74 01DBB974 80100200 */  sll         $2, $2, 2
/* 00FC78 01DBB978 21105D00 */  addu        $2, $2, $29
/* 00FC7C 01DBB97C 300140C4 */  lwc1        $f0, 0x130($2)
/* 00FC80 01DBB980 D400A0E7 */  swc1        $f0, 0xD4($29)
/* 00FC84 01DBB984 E09D848F */  lw          $4, -0x6220($28)
/* 00FC88 01DBB988 28362072 */  paddub      $6, $17, $0
/* 00FC8C 01DBB98C 02000724 */  addiu       $7, $0, 0x2
/* 00FC90 01DBB990 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00FC94 01DBB994 DC1D288C */  lw          $8, %lo(CharaMain + 0xBC)($1)
/* 00FC98 01DBB998 C0D8060C */  jal         HitValueEntry__FP9CHitValuePfiiP6CFrame
/* 00FC9C 01DBB99C 00000000 */   nop
/* 00FCA0 01DBB9A0 F09D828F */  lw          $2, -0x6210($28)
/* 00FCA4 01DBB9A4 21185500 */  addu        $3, $2, $21
/* 00FCA8 01DBB9A8 DC01023C */  lui         $2, %hi(blowVelo)
/* 00FCAC 01DBB9AC 70254424 */  addiu       $4, $2, %lo(blowVelo)
/* 00FCB0 01DBB9B0 20006524 */  addiu       $5, $3, 0x20
/* 00FCB4 01DBB9B4 0C86040C */  jal         sceVu0CopyVector
/* 00FCB8 01DBB9B8 00000000 */   nop
/* 00FCBC 01DBB9BC DC01023C */  lui         $2, %hi(blowVelo)
/* 00FCC0 01DBB9C0 70254424 */  addiu       $4, $2, %lo(blowVelo)
/* 00FCC4 01DBB9C4 A003770C */  jal         unitBlowActionRot__FPf
/* 00FCC8 01DBB9C8 00000000 */   nop
/* 00FCCC 01DBB9CC F09D848F */  lw          $4, -0x6210($28)
/* 00FCD0 01DBB9D0 2110A402 */  addu        $2, $21, $4
/* 00FCD4 01DBB9D4 4800438C */  lw          $3, 0x48($2)
/* 00FCD8 01DBB9D8 03000224 */  addiu       $2, $0, 0x3
/* 00FCDC 01DBB9DC 04006210 */  beq         $3, $2, .L01DBB9F0_2F6FF0
/* 00FCE0 01DBB9E0 00000000 */   nop
/* 00FCE4 01DBB9E4 80101000 */  sll         $2, $16, 2
/* 00FCE8 01DBB9E8 21104400 */  addu        $2, $2, $4
/* 00FCEC 01DBB9EC 003C40AC */  sw          $0, 0x3C00($2)
.L01DBB9F0_2F6FF0:
/* 00FCF0 01DBB9F0 789C838F */  lw          $3, -0x6388($28)
/* 00FCF4 01DBB9F4 04006280 */  lb          $2, 0x4($3)
/* 00FCF8 01DBB9F8 40100200 */  sll         $2, $2, 1
/* 00FCFC 01DBB9FC 21104300 */  addu        $2, $2, $3
/* 00FD00 01DBBA00 12004284 */  lh          $2, 0x12($2)
/* 00FD04 01DBBA04 2A082202 */  slt         $1, $17, $2
/* 00FD08 01DBBA08 0F002010 */  beqz        $1, .L01DBBA48_2F7048
/* 00FD0C 01DBBA0C 00000000 */   nop
/* 00FD10 01DBBA10 05000224 */  addiu       $2, $0, 0x5
/* 00FD14 01DBBA14 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00FD18 01DBBA18 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 00FD1C 01DBBA1C 06000224 */  addiu       $2, $0, 0x6
/* 00FD20 01DBBA20 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00FD24 01DBBA24 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 00FD28 01DBBA28 EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 00FD2C 01DBBA2C 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 00FD30 01DBBA30 600040C4 */  lwc1        $f0, 0x60($2)
/* 00FD34 01DBBA34 20008046 */  cvt.s.w     $f0, $f0
/* 00FD38 01DBBA38 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 00FD3C 01DBBA3C 102020E4 */  swc1        $f0, %lo(CharaMain + 0x2F0)($1)
/* 00FD40 01DBBA40 0C000010 */  b           .L01DBBA74_2F7074
/* 00FD44 01DBBA44 00000000 */   nop
.L01DBBA48_2F7048:
/* 00FD48 01DBBA48 04000224 */  addiu       $2, $0, 0x4
/* 00FD4C 01DBBA4C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00FD50 01DBBA50 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 00FD54 01DBBA54 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 00FD58 01DBBA58 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 00FD5C 01DBBA5C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 00FD60 01DBBA60 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 00FD64 01DBBA64 400040C4 */  lwc1        $f0, 0x40($2)
/* 00FD68 01DBBA68 20008046 */  cvt.s.w     $f0, $f0
/* 00FD6C 01DBBA6C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 00FD70 01DBBA70 102020E4 */  swc1        $f0, %lo(CharaMain + 0x2F0)($1)
.L01DBBA74_2F7074:
/* 00FD74 01DBBA74 01000224 */  addiu       $2, $0, 0x1
/* 00FD78 01DBBA78 7C9D82AF */  sw          $2, -0x6284($28)
/* 00FD7C 01DBBA7C 989D80AF */  sw          $0, -0x6268($28)
/* 00FD80 01DBBA80 A0000224 */  addiu       $2, $0, 0xA0
/* 00FD84 01DBBA84 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 00FD88 01DBBA88 A04422AC */  sw          $2, %lo(BtActStatus + 0x20)($1)
.L01DBBA8C_2F708C:
/* 00FD8C 01DBBA8C F09D838F */  lw          $3, -0x6210($28)
/* 00FD90 01DBBA90 2110A302 */  addu        $2, $21, $3
/* 00FD94 01DBBA94 4C00448C */  lw          $4, 0x4C($2)
/* 00FD98 01DBBA98 02000224 */  addiu       $2, $0, 0x2
/* 00FD9C 01DBBA9C 04008210 */  beq         $4, $2, .L01DBBAB0_2F70B0
/* 00FDA0 01DBBAA0 00000000 */   nop
/* 00FDA4 01DBBAA4 04000224 */  addiu       $2, $0, 0x4
/* 00FDA8 01DBBAA8 F4008214 */  bne         $4, $2, .L01DBBE7C_2F747C
/* 00FDAC 01DBBAAC 00000000 */   nop
.L01DBBAB0_2F70B0:
/* 00FDB0 01DBBAB0 21287500 */  addu        $5, $3, $21
/* 00FDB4 01DBBAB4 E000A427 */  addiu       $4, $29, 0xE0
/* 00FDB8 01DBBAB8 0C86040C */  jal         sceVu0CopyVector
/* 00FDBC 01DBBABC 00000000 */   nop
/* 00FDC0 01DBBAC0 CC01023C */  lui         $2, %hi(GamePad)
/* 00FDC4 01DBBAC4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 00FDC8 01DBBAC8 01000524 */  addiu       $5, $0, 0x1
/* 00FDCC 01DBBACC DC000624 */  addiu       $6, $0, 0xDC
/* 00FDD0 01DBBAD0 0C000724 */  addiu       $7, $0, 0xC
/* 00FDD4 01DBBAD4 50AE040C */  jal         SetVibration__8CGamePadFiii
/* 00FDD8 01DBBAD8 00000000 */   nop
/* 00FDDC 01DBBADC 4900C013 */  beqz        $30, .L01DBBC04_2F7204
/* 00FDE0 01DBBAE0 00000000 */   nop
/* 00FDE4 01DBBAE4 F000A427 */  addiu       $4, $29, 0xF0
/* 00FDE8 01DBBAE8 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 00FDEC 01DBBAEC 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 00FDF0 01DBBAF0 0C86040C */  jal         sceVu0CopyVector
/* 00FDF4 01DBBAF4 00000000 */   nop
/* 00FDF8 01DBBAF8 FFFF0224 */  addiu       $2, $0, -0x1
/* 00FDFC 01DBBAFC 0C004212 */  beq         $18, $2, .L01DBBB30_2F7130
/* 00FE00 01DBBB00 00000000 */   nop
/* 00FE04 01DBBB04 F000A1C7 */  lwc1        $f1, 0xF0($29)
/* 00FE08 01DBBB08 B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 00FE0C 01DBBB0C 01080046 */  sub.s       $f0, $f1, $f0
/* 00FE10 01DBBB10 F000A0E7 */  swc1        $f0, 0xF0($29)
/* 00FE14 01DBBB14 F400A0AF */  sw          $0, 0xF4($29)
/* 00FE18 01DBBB18 F800A1C7 */  lwc1        $f1, 0xF8($29)
/* 00FE1C 01DBBB1C B800A0C7 */  lwc1        $f0, 0xB8($29)
/* 00FE20 01DBBB20 01080046 */  sub.s       $f0, $f1, $f0
/* 00FE24 01DBBB24 F800A0E7 */  swc1        $f0, 0xF8($29)
/* 00FE28 01DBBB28 0A000010 */  b           .L01DBBB54_2F7154
/* 00FE2C 01DBBB2C 00000000 */   nop
.L01DBBB30_2F7130:
/* 00FE30 01DBBB30 F000A1C7 */  lwc1        $f1, 0xF0($29)
/* 00FE34 01DBBB34 E000A0C7 */  lwc1        $f0, 0xE0($29)
/* 00FE38 01DBBB38 01080046 */  sub.s       $f0, $f1, $f0
/* 00FE3C 01DBBB3C F000A0E7 */  swc1        $f0, 0xF0($29)
/* 00FE40 01DBBB40 F400A0AF */  sw          $0, 0xF4($29)
/* 00FE44 01DBBB44 F800A1C7 */  lwc1        $f1, 0xF8($29)
/* 00FE48 01DBBB48 E800A0C7 */  lwc1        $f0, 0xE8($29)
/* 00FE4C 01DBBB4C 01080046 */  sub.s       $f0, $f1, $f0
/* 00FE50 01DBBB50 F800A0E7 */  swc1        $f0, 0xF8($29)
.L01DBBB54_2F7154:
/* 00FE54 01DBBB54 EC01023C */  lui         $2, %hi(MyHitPointMark)
/* 00FE58 01DBBB58 40494424 */  addiu       $4, $2, %lo(MyHitPointMark)
/* 00FE5C 01DBBB5C E000A527 */  addiu       $5, $29, 0xE0
/* 00FE60 01DBBB60 0C86040C */  jal         sceVu0CopyVector
/* 00FE64 01DBBB64 00000000 */   nop
/* 00FE68 01DBBB68 01000224 */  addiu       $2, $0, 0x1
/* 00FE6C 01DBBB6C EC01013C */  lui         $1, %hi(MyHitPointMark + 0x18)
/* 00FE70 01DBBB70 584922AC */  sw          $2, %lo(MyHitPointMark + 0x18)($1)
/* 00FE74 01DBBB74 EC01013C */  lui         $1, %hi(MyHitPointMark + 0x14)
/* 00FE78 01DBBB78 544920AC */  sw          $0, %lo(MyHitPointMark + 0x14)($1)
/* 00FE7C 01DBBB7C 10000224 */  addiu       $2, $0, 0x10
/* 00FE80 01DBBB80 EC01013C */  lui         $1, %hi(MyHitPointMark + 0x10)
/* 00FE84 01DBBB84 504922AC */  sw          $2, %lo(MyHitPointMark + 0x10)($1)
/* 00FE88 01DBBB88 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00FE8C 01DBBB8C 00088244 */  mtc1        $2, $f1
/* 00FE90 01DBBB90 F000A0C7 */  lwc1        $f0, 0xF0($29)
/* 00FE94 01DBBB94 03000146 */  div.s       $f0, $f0, $f1
/* 00FE98 01DBBB98 DC01013C */  lui         $1, %hi(velo__2)
/* 00FE9C 01DBBB9C 502520E4 */  swc1        $f0, %lo(velo__2)($1)
/* 00FEA0 01DBBBA0 F800A0C7 */  lwc1        $f0, 0xF8($29)
/* 00FEA4 01DBBBA4 03000146 */  div.s       $f0, $f0, $f1
/* 00FEA8 01DBBBA8 DC01013C */  lui         $1, %hi(velo__2 + 0x8)
/* 00FEAC 01DBBBAC 582520E4 */  swc1        $f0, %lo(velo__2 + 0x8)($1)
/* 00FEB0 01DBBBB0 F09D848F */  lw          $4, -0x6210($28)
/* 00FEB4 01DBBBB4 2110A402 */  addu        $2, $21, $4
/* 00FEB8 01DBBBB8 4800438C */  lw          $3, 0x48($2)
/* 00FEBC 01DBBBBC 03000224 */  addiu       $2, $0, 0x3
/* 00FEC0 01DBBBC0 04006210 */  beq         $3, $2, .L01DBBBD4_2F71D4
/* 00FEC4 01DBBBC4 00000000 */   nop
/* 00FEC8 01DBBBC8 80101000 */  sll         $2, $16, 2
/* 00FECC 01DBBBCC 21104400 */  addu        $2, $2, $4
/* 00FED0 01DBBBD0 003C40AC */  sw          $0, 0x3C00($2)
.L01DBBBD4_2F71D4:
/* 00FED4 01DBBBD4 9C9E828F */  lw          $2, -0x6164($28)
/* 00FED8 01DBBBD8 A800401C */  bgtz        $2, .L01DBBE7C_2F747C
/* 00FEDC 01DBBBDC 00000000 */   nop
/* 00FEE0 01DBBBE0 A2000424 */  addiu       $4, $0, 0xA2
/* 00FEE4 01DBBBE4 FFFF0524 */  addiu       $5, $0, -0x1
/* 00FEE8 01DBBBE8 28360070 */  paddub      $6, $0, $0
/* 00FEEC 01DBBBEC AC69050C */  jal         SndSePlay__Fiii
/* 00FEF0 01DBBBF0 00000000 */   nop
/* 00FEF4 01DBBBF4 1E000224 */  addiu       $2, $0, 0x1E
/* 00FEF8 01DBBBF8 9C9E82AF */  sw          $2, -0x6164($28)
/* 00FEFC 01DBBBFC 9F000010 */  b           .L01DBBE7C_2F747C
/* 00FF00 01DBBC00 00000000 */   nop
.L01DBBC04_2F7204:
/* 00FF04 01DBBC04 AE010424 */  addiu       $4, $0, 0x1AE
/* 00FF08 01DBBC08 FFFF0524 */  addiu       $5, $0, -0x1
/* 00FF0C 01DBBC0C 28360070 */  paddub      $6, $0, $0
/* 00FF10 01DBBC10 AC69050C */  jal         SndSePlay__Fiii
/* 00FF14 01DBBC14 00000000 */   nop
/* 00FF18 01DBBC18 A1000424 */  addiu       $4, $0, 0xA1
/* 00FF1C 01DBBC1C FFFF0524 */  addiu       $5, $0, -0x1
/* 00FF20 01DBBC20 28360070 */  paddub      $6, $0, $0
/* 00FF24 01DBBC24 AC69050C */  jal         SndSePlay__Fiii
/* 00FF28 01DBBC28 00000000 */   nop
/* 00FF2C 01DBBC2C 19000224 */  addiu       $2, $0, 0x19
/* 00FF30 01DBBC30 DC01013C */  lui         $1, %hi(BtActStatus + 0x144)
/* 00FF34 01DBBC34 C44522A4 */  sh          $2, %lo(BtActStatus + 0x144)($1)
/* 00FF38 01DBBC38 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 00FF3C 01DBBC3C 00608244 */  mtc1        $2, $f12
/* 00FF40 01DBBC40 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00FF44 01DBBC44 00688244 */  mtc1        $2, $f13
/* 00FF48 01DBBC48 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 00FF4C 01DBBC4C 00708244 */  mtc1        $2, $f14
/* 00FF50 01DBBC50 00788044 */  mtc1        $0, $f15
/* 00FF54 01DBBC54 00000000 */  nop
/* 00FF58 01DBBC58 067C0046 */  mov.s       $f16, $f15
/* 00FF5C 01DBBC5C 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 00FF60 01DBBC60 00000000 */   nop
/* 00FF64 01DBBC64 789C848F */  lw          $4, -0x6388($28)
/* 00FF68 01DBBC68 04008580 */  lb          $5, 0x4($4)
/* 00FF6C 01DBBC6C 23101100 */  negu        $2, $17
/* 00FF70 01DBBC70 3C340200 */  dsll32      $6, $2, 16
/* 00FF74 01DBBC74 3F340600 */  dsra32      $6, $6, 16
/* 00FF78 01DBBC78 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00FF7C 01DBBC7C 00608244 */  mtc1        $2, $f12
/* 00FF80 01DBBC80 C4F9060C */  jal         AddNowLife__11CUserStatusFisf
/* 00FF84 01DBBC84 00000000 */   nop
/* 00FF88 01DBBC88 F09D848F */  lw          $4, -0x6210($28)
/* 00FF8C 01DBBC8C 2110A402 */  addu        $2, $21, $4
/* 00FF90 01DBBC90 4800438C */  lw          $3, 0x48($2)
/* 00FF94 01DBBC94 03000224 */  addiu       $2, $0, 0x3
/* 00FF98 01DBBC98 04006210 */  beq         $3, $2, .L01DBBCAC_2F72AC
/* 00FF9C 01DBBC9C 00000000 */   nop
/* 00FFA0 01DBBCA0 80101000 */  sll         $2, $16, 2
/* 00FFA4 01DBBCA4 21104400 */  addu        $2, $2, $4
/* 00FFA8 01DBBCA8 003C40AC */  sw          $0, 0x3C00($2)
.L01DBBCAC_2F72AC:
/* 00FFAC 01DBBCAC DC01023C */  lui         $2, %hi(LIT_5344)
/* 00FFB0 01DBBCB0 50284224 */  addiu       $2, $2, %lo(LIT_5344)
/* 00FFB4 01DBBCB4 0001A527 */  addiu       $5, $29, 0x100
/* 00FFB8 01DBBCB8 00004278 */  lq          $2, 0x0($2)
/* 00FFBC 01DBBCBC 0000A27C */  sq          $2, 0x0($5)
/* 00FFC0 01DBBCC0 789C868F */  lw          $6, -0x6388($28)
/* 00FFC4 01DBBCC4 DC01023C */  lui         $2, %hi(LIT_345__11)
/* 00FFC8 01DBBCC8 401B4224 */  addiu       $2, $2, %lo(LIT_345__11)
/* 00FFCC 01DBBCCC 5001A427 */  addiu       $4, $29, 0x150
/* 00FFD0 01DBBCD0 00004378 */  lq          $3, 0x0($2)
/* 00FFD4 01DBBCD4 100042DC */  ld          $2, 0x10($2)
/* 00FFD8 01DBBCD8 0000837C */  sq          $3, 0x0($4)
/* 00FFDC 01DBBCDC 100082FC */  sd          $2, 0x10($4)
/* 00FFE0 01DBBCE0 0400C280 */  lb          $2, 0x4($6)
/* 00FFE4 01DBBCE4 80100200 */  sll         $2, $2, 2
/* 00FFE8 01DBBCE8 21105D00 */  addu        $2, $2, $29
/* 00FFEC 01DBBCEC 500140C4 */  lwc1        $f0, 0x150($2)
/* 00FFF0 01DBBCF0 0401A0E7 */  swc1        $f0, 0x104($29)
/* 00FFF4 01DBBCF4 E09D848F */  lw          $4, -0x6220($28)
/* 00FFF8 01DBBCF8 28362072 */  paddub      $6, $17, $0
/* 00FFFC 01DBBCFC 02000724 */  addiu       $7, $0, 0x2
/* 010000 01DBBD00 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 010004 01DBBD04 DC1D288C */  lw          $8, %lo(CharaMain + 0xBC)($1)
/* 010008 01DBBD08 C0D8060C */  jal         HitValueEntry__FP9CHitValuePfiiP6CFrame
/* 01000C 01DBBD0C 00000000 */   nop
/* 010010 01DBBD10 A89E8283 */  lb          $2, -0x6158($28)
/* 010014 01DBBD14 04004014 */  bnez        $2, .L01DBBD28_2F7328
/* 010018 01DBBD18 00000000 */   nop
/* 01001C 01DBBD1C A49E80AF */  sw          $0, -0x615C($28)
/* 010020 01DBBD20 01000224 */  addiu       $2, $0, 0x1
/* 010024 01DBBD24 A89E82A3 */  sb          $2, -0x6158($28)
.L01DBBD28_2F7328:
/* 010028 01DBBD28 A49E828F */  lw          $2, -0x615C($28)
/* 01002C 01DBBD2C 40190200 */  sll         $3, $2, 5
/* 010030 01DBBD30 EC01023C */  lui         $2, %hi(MyHitPointMark)
/* 010034 01DBBD34 40494224 */  addiu       $2, $2, %lo(MyHitPointMark)
/* 010038 01DBBD38 21804300 */  addu        $16, $2, $3
/* 01003C 01DBBD3C 28260072 */  paddub      $4, $16, $0
/* 010040 01DBBD40 E000A527 */  addiu       $5, $29, 0xE0
/* 010044 01DBBD44 0C86040C */  jal         sceVu0CopyVector
/* 010048 01DBBD48 00000000 */   nop
/* 01004C 01DBBD4C 01000224 */  addiu       $2, $0, 0x1
/* 010050 01DBBD50 180002AE */  sw          $2, 0x18($16)
/* 010054 01DBBD54 140000AE */  sw          $0, 0x14($16)
/* 010058 01DBBD58 10000224 */  addiu       $2, $0, 0x10
/* 01005C 01DBBD5C 100002AE */  sw          $2, 0x10($16)
/* 010060 01DBBD60 A49E838F */  lw          $3, -0x615C($28)
/* 010064 01DBBD64 0F006228 */  slti        $2, $3, 0xF
/* 010068 01DBBD68 04004014 */  bnez        $2, .L01DBBD7C_2F737C
/* 01006C 01DBBD6C 00000000 */   nop
/* 010070 01DBBD70 A49E80AF */  sw          $0, -0x615C($28)
/* 010074 01DBBD74 03000010 */  b           .L01DBBD84_2F7384
/* 010078 01DBBD78 00000000 */   nop
.L01DBBD7C_2F737C:
/* 01007C 01DBBD7C 01006224 */  addiu       $2, $3, 0x1
/* 010080 01DBBD80 A49E82AF */  sw          $2, -0x615C($28)
.L01DBBD84_2F7384:
/* 010084 01DBBD84 C89D81C7 */  lwc1        $f1, -0x6238($28)
/* 010088 01DBBD88 DC8380C7 */  lwc1        $f0, -0x7C24($28)
/* 01008C 01DBBD8C 34080046 */  c.lt.s      $f1, $f0
/* 010090 01DBBD90 00000000 */  nop
/* 010094 01DBBD94 08000145 */  bc1t        .L01DBBDB8_2F73B8
/* 010098 01DBBD98 00000000 */   nop
/* 01009C 01DBBD9C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0100A0 01DBBDA0 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0100A4 01DBBDA4 1D000224 */  addiu       $2, $0, 0x1D
/* 0100A8 01DBBDA8 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0100AC 01DBBDAC 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0100B0 01DBBDB0 0C000010 */  b           .L01DBBDE4_2F73E4
/* 0100B4 01DBBDB4 00000000 */   nop
.L01DBBDB8_2F73B8:
/* 0100B8 01DBBDB8 04000224 */  addiu       $2, $0, 0x4
/* 0100BC 01DBBDBC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0100C0 01DBBDC0 904422AC */  sw          $2, %lo(BtActStatus + 0x10)($1)
/* 0100C4 01DBBDC4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0100C8 01DBBDC8 8C4422AC */  sw          $2, %lo(BtActStatus + 0xC)($1)
/* 0100CC 01DBBDCC EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 0100D0 01DBBDD0 6420228C */  lw          $2, %lo(CharaMain + 0x344)($1)
/* 0100D4 01DBBDD4 400040C4 */  lwc1        $f0, 0x40($2)
/* 0100D8 01DBBDD8 20008046 */  cvt.s.w     $f0, $f0
/* 0100DC 01DBBDDC EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 0100E0 01DBBDE0 102020E4 */  swc1        $f0, %lo(CharaMain + 0x2F0)($1)
.L01DBBDE4_2F73E4:
/* 0100E4 01DBBDE4 01000224 */  addiu       $2, $0, 0x1
/* 0100E8 01DBBDE8 7C9D82AF */  sw          $2, -0x6284($28)
/* 0100EC 01DBBDEC 50000224 */  addiu       $2, $0, 0x50
/* 0100F0 01DBBDF0 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 0100F4 01DBBDF4 A04422AC */  sw          $2, %lo(BtActStatus + 0x20)($1)
/* 0100F8 01DBBDF8 F09D828F */  lw          $2, -0x6210($28)
/* 0100FC 01DBBDFC 2110A202 */  addu        $2, $21, $2
/* 010100 01DBBE00 4C00438C */  lw          $3, 0x4C($2)
/* 010104 01DBBE04 04000224 */  addiu       $2, $0, 0x4
/* 010108 01DBBE08 11006214 */  bne         $3, $2, .L01DBBE50_2F7450
/* 01010C 01DBBE0C 00000000 */   nop
/* 010110 01DBBE10 08000224 */  addiu       $2, $0, 0x8
/* 010114 01DBBE14 DC01013C */  lui         $1, %hi(BtActStatus + 0x20)
/* 010118 01DBBE18 A04422AC */  sw          $2, %lo(BtActStatus + 0x20)($1)
/* 01011C 01DBBE1C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 010120 01DBBE20 00608244 */  mtc1        $2, $f12
/* 010124 01DBBE24 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 010128 01DBBE28 00688244 */  mtc1        $2, $f13
/* 01012C 01DBBE2C 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 010130 01DBBE30 00708244 */  mtc1        $2, $f14
/* 010134 01DBBE34 00788044 */  mtc1        $0, $f15
/* 010138 01DBBE38 00000000 */  nop
/* 01013C 01DBBE3C 067C0046 */  mov.s       $f16, $f15
/* 010140 01DBBE40 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 010144 01DBBE44 00000000 */   nop
/* 010148 01DBBE48 0C000010 */  b           .L01DBBE7C_2F747C
/* 01014C 01DBBE4C 00000000 */   nop
.L01DBBE50_2F7450:
/* 010150 01DBBE50 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 010154 01DBBE54 00608244 */  mtc1        $2, $f12
/* 010158 01DBBE58 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 01015C 01DBBE5C 00708244 */  mtc1        $2, $f14
/* 010160 01DBBE60 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 010164 01DBBE64 00688244 */  mtc1        $2, $f13
/* 010168 01DBBE68 00788044 */  mtc1        $0, $f15
/* 01016C 01DBBE6C 00000000 */  nop
/* 010170 01DBBE70 067C0046 */  mov.s       $f16, $f15
/* 010174 01DBBE74 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 010178 01DBBE78 00000000 */   nop
.L01DBBE7C_2F747C:
/* 01017C 01DBBE7C D501013C */  lui         $1, %hi(DebugStatus + 0x50)
/* 010180 01DBBE80 B064228C */  lw          $2, %lo(DebugStatus + 0x50)($1)
/* 010184 01DBBE84 07004018 */  blez        $2, .L01DBBEA4_2F74A4
/* 010188 01DBBE88 00000000 */   nop
/* 01018C 01DBBE8C 789C838F */  lw          $3, -0x6388($28)
/* 010190 01DBBE90 04006280 */  lb          $2, 0x4($3)
/* 010194 01DBBE94 40100200 */  sll         $2, $2, 1
/* 010198 01DBBE98 21184300 */  addu        $3, $2, $3
/* 01019C 01DBBE9C 06006284 */  lh          $2, 0x6($3)
/* 0101A0 01DBBEA0 120062A4 */  sh          $2, 0x12($3)
.L01DBBEA4_2F74A4:
/* 0101A4 01DBBEA4 2816C072 */  paddub      $2, $22, $0
.L01DBBEA8_2F74A8:
/* 0101A8 01DBBEA8 9000BF7B */  lq          $31, 0x90($29)
/* 0101AC 01DBBEAC 8000BE7B */  lq          $30, 0x80($29)
/* 0101B0 01DBBEB0 7000B77B */  lq          $23, 0x70($29)
/* 0101B4 01DBBEB4 6000B67B */  lq          $22, 0x60($29)
/* 0101B8 01DBBEB8 5000B57B */  lq          $21, 0x50($29)
/* 0101BC 01DBBEBC 4000B47B */  lq          $20, 0x40($29)
/* 0101C0 01DBBEC0 3000B37B */  lq          $19, 0x30($29)
/* 0101C4 01DBBEC4 2000B27B */  lq          $18, 0x20($29)
/* 0101C8 01DBBEC8 1000B17B */  lq          $17, 0x10($29)
/* 0101CC 01DBBECC 0000B07B */  lq          $16, 0x0($29)
/* 0101D0 01DBBED0 7001BD27 */  addiu       $29, $29, 0x170
/* 0101D4 01DBBED4 0800E003 */  jr          $31
/* 0101D8 01DBBED8 00000000 */   nop
/* 0101DC 01DBBEDC 00000000 */  nop
