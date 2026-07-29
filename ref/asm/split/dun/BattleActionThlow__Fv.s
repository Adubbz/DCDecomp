.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleActionThlow__Fv
/* 0101E0 01DBBEE0 20FFBD27 */  addiu       $29, $29, -0xE0
/* 0101E4 01DBBEE4 3000BF7F */  sq          $31, 0x30($29)
/* 0101E8 01DBBEE8 2000B17F */  sq          $17, 0x20($29)
/* 0101EC 01DBBEEC 1000B07F */  sq          $16, 0x10($29)
/* 0101F0 01DBBEF0 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0101F4 01DBBEF4 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0101F8 01DBBEF8 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0101FC 01DBBEFC A89C848F */  lw          $4, -0x6358($28)
/* 010200 01DBBF00 D092040C */  jal         GetAngle__13CCameraFollowFv
/* 010204 01DBBF04 00000000 */   nop
/* 010208 01DBBF08 06050046 */  mov.s       $f20, $f0
/* 01020C 01DBBF0C DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010210 01DBBF10 9044248C */  lw          $4, %lo(BtActStatus + 0x10)($1)
/* 010214 01DBBF14 02000324 */  addiu       $3, $0, 0x2
/* 010218 01DBBF18 B0018314 */  bne         $4, $3, .L01DBC5DC_2F7BDC
/* 01021C 01DBBF1C 00000000 */   nop
/* 010220 01DBBF20 EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 010224 01DBBF24 0463238C */  lw          $3, %lo(BombInfo + 0x14)($1)
/* 010228 01DBBF28 A0006010 */  beqz        $3, .L01DBC1AC_2F77AC
/* 01022C 01DBBF2C 00000000 */   nop
/* 010230 01DBBF30 CC01023C */  lui         $2, %hi(GamePad)
/* 010234 01DBBF34 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 010238 01DBBF38 80000524 */  addiu       $5, $0, 0x80
/* 01023C 01DBBF3C 04AE040C */  jal         On__8CGamePadFi
/* 010240 01DBBF40 00000000 */   nop
/* 010244 01DBBF44 91004010 */  beqz        $2, .L01DBC18C_2F778C
/* 010248 01DBBF48 00000000 */   nop
/* 01024C 01DBBF4C CC01023C */  lui         $2, %hi(GamePad)
/* 010250 01DBBF50 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 010254 01DBBF54 C4AD040C */  jal         GetLXf__8CGamePadFv
/* 010258 01DBBF58 00000000 */   nop
/* 01025C 01DBBF5C 46050046 */  mov.s       $f21, $f0
/* 010260 01DBBF60 CC01023C */  lui         $2, %hi(GamePad)
/* 010264 01DBBF64 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 010268 01DBBF68 D4AD040C */  jal         GetLYf__8CGamePadFv
/* 01026C 01DBBF6C 00000000 */   nop
/* 010270 01DBBF70 86050046 */  mov.s       $f22, $f0
/* 010274 01DBBF74 4000A427 */  addiu       $4, $29, 0x40
/* 010278 01DBBF78 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 01027C 01DBBF7C 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 010280 01DBBF80 0C86040C */  jal         sceVu0CopyVector
/* 010284 01DBBF84 00000000 */   nop
/* 010288 01DBBF88 06A30046 */  mov.s       $f12, $f20
/* 01028C 01DBBF8C 9044040C */  jal         fptodp
/* 010290 01DBBF90 00000000 */   nop
/* 010294 01DBBF94 28264070 */  paddub      $4, $2, $0
/* 010298 01DBBF98 F473040C */  jal         cos
/* 01029C 01DBBF9C 00000000 */   nop
/* 0102A0 01DBBFA0 28864070 */  paddub      $16, $2, $0
/* 0102A4 01DBBFA4 06AB0046 */  mov.s       $f12, $f21
/* 0102A8 01DBBFA8 9044040C */  jal         fptodp
/* 0102AC 01DBBFAC 00000000 */   nop
/* 0102B0 01DBBFB0 28264070 */  paddub      $4, $2, $0
/* 0102B4 01DBBFB4 282E0072 */  paddub      $5, $16, $0
/* 0102B8 01DBBFB8 9E3F040C */  jal         dpmul
/* 0102BC 01DBBFBC 00000000 */   nop
/* 0102C0 01DBBFC0 28864070 */  paddub      $16, $2, $0
/* 0102C4 01DBBFC4 EB01013C */  lui         $1, %hi(BombInfo)
/* 0102C8 01DBBFC8 F0622CC4 */  lwc1        $f12, %lo(BombInfo)($1)
/* 0102CC 01DBBFCC 9044040C */  jal         fptodp
/* 0102D0 01DBBFD0 00000000 */   nop
/* 0102D4 01DBBFD4 28264070 */  paddub      $4, $2, $0
/* 0102D8 01DBBFD8 282E0072 */  paddub      $5, $16, $0
/* 0102DC 01DBBFDC 6E3F040C */  jal         dpadd
/* 0102E0 01DBBFE0 00000000 */   nop
/* 0102E4 01DBBFE4 28864070 */  paddub      $16, $2, $0
/* 0102E8 01DBBFE8 06A30046 */  mov.s       $f12, $f20
/* 0102EC 01DBBFEC 2876040C */  jal         sinf
/* 0102F0 01DBBFF0 00000000 */   nop
/* 0102F4 01DBBFF4 02B30046 */  mul.s       $f12, $f22, $f0
/* 0102F8 01DBBFF8 9044040C */  jal         fptodp
/* 0102FC 01DBBFFC 00000000 */   nop
/* 010300 01DBC000 28260072 */  paddub      $4, $16, $0
/* 010304 01DBC004 282E4070 */  paddub      $5, $2, $0
/* 010308 01DBC008 6E3F040C */  jal         dpadd
/* 01030C 01DBC00C 00000000 */   nop
/* 010310 01DBC010 28264070 */  paddub      $4, $2, $0
/* 010314 01DBC014 9241040C */  jal         dptofp
/* 010318 01DBC018 00000000 */   nop
/* 01031C 01DBC01C 5000A0E7 */  swc1        $f0, 0x50($29)
/* 010320 01DBC020 06A30046 */  mov.s       $f12, $f20
/* 010324 01DBC024 9044040C */  jal         fptodp
/* 010328 01DBC028 00000000 */   nop
/* 01032C 01DBC02C 28264070 */  paddub      $4, $2, $0
/* 010330 01DBC030 F473040C */  jal         cos
/* 010334 01DBC034 00000000 */   nop
/* 010338 01DBC038 28864070 */  paddub      $16, $2, $0
/* 01033C 01DBC03C 06B30046 */  mov.s       $f12, $f22
/* 010340 01DBC040 9044040C */  jal         fptodp
/* 010344 01DBC044 00000000 */   nop
/* 010348 01DBC048 28264070 */  paddub      $4, $2, $0
/* 01034C 01DBC04C 282E0072 */  paddub      $5, $16, $0
/* 010350 01DBC050 9E3F040C */  jal         dpmul
/* 010354 01DBC054 00000000 */   nop
/* 010358 01DBC058 28864070 */  paddub      $16, $2, $0
/* 01035C 01DBC05C EB01013C */  lui         $1, %hi(BombInfo + 0x8)
/* 010360 01DBC060 F8622CC4 */  lwc1        $f12, %lo(BombInfo + 0x8)($1)
/* 010364 01DBC064 9044040C */  jal         fptodp
/* 010368 01DBC068 00000000 */   nop
/* 01036C 01DBC06C 28264070 */  paddub      $4, $2, $0
/* 010370 01DBC070 282E0072 */  paddub      $5, $16, $0
/* 010374 01DBC074 6E3F040C */  jal         dpadd
/* 010378 01DBC078 00000000 */   nop
/* 01037C 01DBC07C 28864070 */  paddub      $16, $2, $0
/* 010380 01DBC080 06A30046 */  mov.s       $f12, $f20
/* 010384 01DBC084 2876040C */  jal         sinf
/* 010388 01DBC088 00000000 */   nop
/* 01038C 01DBC08C 02AB0046 */  mul.s       $f12, $f21, $f0
/* 010390 01DBC090 9044040C */  jal         fptodp
/* 010394 01DBC094 00000000 */   nop
/* 010398 01DBC098 28260072 */  paddub      $4, $16, $0
/* 01039C 01DBC09C 282E4070 */  paddub      $5, $2, $0
/* 0103A0 01DBC0A0 843F040C */  jal         dpsub
/* 0103A4 01DBC0A4 00000000 */   nop
/* 0103A8 01DBC0A8 28264070 */  paddub      $4, $2, $0
/* 0103AC 01DBC0AC 9241040C */  jal         dptofp
/* 0103B0 01DBC0B0 00000000 */   nop
/* 0103B4 01DBC0B4 5800B027 */  addiu       $16, $29, 0x58
/* 0103B8 01DBC0B8 000000E6 */  swc1        $f0, 0x0($16)
/* 0103BC 01DBC0BC EB01013C */  lui         $1, %hi(BombInfo + 0x4)
/* 0103C0 01DBC0C0 F46220C4 */  lwc1        $f0, %lo(BombInfo + 0x4)($1)
/* 0103C4 01DBC0C4 5400A0E7 */  swc1        $f0, 0x54($29)
/* 0103C8 01DBC0C8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0103CC 01DBC0CC 5C00A2AF */  sw          $2, 0x5C($29)
/* 0103D0 01DBC0D0 5000A427 */  addiu       $4, $29, 0x50
/* 0103D4 01DBC0D4 4000A527 */  addiu       $5, $29, 0x40
/* 0103D8 01DBC0D8 648D040C */  jal         DistVector__FPfPf
/* 0103DC 01DBC0DC 00000000 */   nop
/* 0103E0 01DBC0E0 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 0103E4 01DBC0E4 00088244 */  mtc1        $2, $f1
/* 0103E8 01DBC0E8 00000000 */  nop
/* 0103EC 01DBC0EC 34000146 */  c.lt.s      $f0, $f1
/* 0103F0 01DBC0F0 00000000 */  nop
/* 0103F4 01DBC0F4 0D000145 */  bc1t        .L01DBC12C_2F772C
/* 0103F8 01DBC0F8 00000000 */   nop
/* 0103FC 01DBC0FC F042023C */  lui         $2, (0x42F00000 >> 16)
/* 010400 01DBC100 00088244 */  mtc1        $2, $f1
/* 010404 01DBC104 00000000 */  nop
/* 010408 01DBC108 36000146 */  c.le.s      $f0, $f1
/* 01040C 01DBC10C 00000000 */  nop
/* 010410 01DBC110 06000045 */  bc1f        .L01DBC12C_2F772C
/* 010414 01DBC114 00000000 */   nop
/* 010418 01DBC118 EB01023C */  lui         $2, %hi(BombInfo)
/* 01041C 01DBC11C F0624424 */  addiu       $4, $2, %lo(BombInfo)
/* 010420 01DBC120 5000A527 */  addiu       $5, $29, 0x50
/* 010424 01DBC124 0C86040C */  jal         sceVu0CopyVector
/* 010428 01DBC128 00000000 */   nop
.L01DBC12C_2F772C:
/* 01042C 01DBC12C 5000A1C7 */  lwc1        $f1, 0x50($29)
/* 010430 01DBC130 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 010434 01DBC134 010B0046 */  sub.s       $f12, $f1, $f0
/* 010438 01DBC138 000001C6 */  lwc1        $f1, 0x0($16)
/* 01043C 01DBC13C 4800A0C7 */  lwc1        $f0, 0x48($29)
/* 010440 01DBC140 410B0046 */  sub.s       $f13, $f1, $f0
/* 010444 01DBC144 5077040C */  jal         atan2f
/* 010448 01DBC148 00000000 */   nop
/* 01044C 01DBC14C 109D848F */  lw          $4, -0x62F0($28)
/* 010450 01DBC150 06030046 */  mov.s       $f12, $f0
/* 010454 01DBC154 0402050C */  jal         unitRotation__FP9CFrameVu1f
/* 010458 01DBC158 00000000 */   nop
/* 01045C 01DBC15C 00608044 */  mtc1        $0, $f12
/* 010460 01DBC160 00000000 */  nop
/* 010464 01DBC164 86630046 */  mov.s       $f14, $f12
/* 010468 01DBC168 109D848F */  lw          $4, -0x62F0($28)
/* 01046C 01DBC16C 46030046 */  mov.s       $f13, $f0
/* 010470 01DBC170 70A3040C */  jal         SetRotation__6CFrameFfff
/* 010474 01DBC174 00000000 */   nop
/* 010478 01DBC178 1A000324 */  addiu       $3, $0, 0x1A
/* 01047C 01DBC17C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010480 01DBC180 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 010484 01DBC184 09000010 */  b           .L01DBC1AC_2F77AC
/* 010488 01DBC188 00000000 */   nop
.L01DBC18C_2F778C:
/* 01048C 01DBC18C EB01013C */  lui         $1, %hi(BombInfo + 0x14)
/* 010490 01DBC190 046320AC */  sw          $0, %lo(BombInfo + 0x14)($1)
/* 010494 01DBC194 01000324 */  addiu       $3, $0, 0x1
/* 010498 01DBC198 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 01049C 01DBC19C 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 0104A0 01DBC1A0 1B000324 */  addiu       $3, $0, 0x1B
/* 0104A4 01DBC1A4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0104A8 01DBC1A8 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBC1AC_2F77AC:
/* 0104AC 01DBC1AC EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 0104B0 01DBC1B0 0863248C */  lw          $4, %lo(BombInfo + 0x18)($1)
/* 0104B4 01DBC1B4 01000324 */  addiu       $3, $0, 0x1
/* 0104B8 01DBC1B8 DC008314 */  bne         $4, $3, .L01DBC52C_2F7B2C
/* 0104BC 01DBC1BC 00000000 */   nop
/* 0104C0 01DBC1C0 DC01033C */  lui         $3, %hi(LIT_5574)
/* 0104C4 01DBC1C4 60286324 */  addiu       $3, $3, %lo(LIT_5574)
/* 0104C8 01DBC1C8 6000A527 */  addiu       $5, $29, 0x60
/* 0104CC 01DBC1CC 00006478 */  lq          $4, 0x0($3)
/* 0104D0 01DBC1D0 100063DC */  ld          $3, 0x10($3)
/* 0104D4 01DBC1D4 0000A47C */  sq          $4, 0x0($5)
/* 0104D8 01DBC1D8 1000A3FC */  sd          $3, 0x10($5)
/* 0104DC 01DBC1DC EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 0104E0 01DBC1E0 6420238C */  lw          $3, %lo(CharaMain + 0x344)($1)
/* 0104E4 01DBC1E4 B40160C4 */  lwc1        $f0, 0x1B4($3)
/* 0104E8 01DBC1E8 20008046 */  cvt.s.w     $f0, $f0
/* 0104EC 01DBC1EC 789C838F */  lw          $3, -0x6388($28)
/* 0104F0 01DBC1F0 04006380 */  lb          $3, 0x4($3)
/* 0104F4 01DBC1F4 80180300 */  sll         $3, $3, 2
/* 0104F8 01DBC1F8 21187D00 */  addu        $3, $3, $29
/* 0104FC 01DBC1FC 600061C4 */  lwc1        $f1, 0x60($3)
/* 010500 01DBC200 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 010504 01DBC204 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 010508 01DBC208 34100146 */  c.lt.s      $f2, $f1
/* 01050C 01DBC20C 00000000 */  nop
/* 010510 01DBC210 C3000145 */  bc1t        .L01DBC520_2F7B20
/* 010514 01DBC214 00000000 */   nop
/* 010518 01DBC218 36100046 */  c.le.s      $f2, $f0
/* 01051C 01DBC21C 00000000 */  nop
/* 010520 01DBC220 BF000045 */  bc1f        .L01DBC520_2F7B20
/* 010524 01DBC224 00000000 */   nop
/* 010528 01DBC228 96000424 */  addiu       $4, $0, 0x96
/* 01052C 01DBC22C FFFF0524 */  addiu       $5, $0, -0x1
/* 010530 01DBC230 28360070 */  paddub      $6, $0, $0
/* 010534 01DBC234 AC69050C */  jal         SndSePlay__Fiii
/* 010538 01DBC238 00000000 */   nop
/* 01053C 01DBC23C 789C828F */  lw          $2, -0x6388($28)
/* 010540 01DBC240 60434524 */  addiu       $5, $2, 0x4360
/* 010544 01DBC244 A89D828F */  lw          $2, -0x6258($28)
/* 010548 01DBC248 40100200 */  sll         $2, $2, 1
/* 01054C 01DBC24C 21204500 */  addu        $4, $2, $5
/* 010550 01DBC250 06008624 */  addiu       $6, $4, 0x6
/* 010554 01DBC254 06008384 */  lh          $3, 0x6($4)
/* 010558 01DBC258 01000224 */  addiu       $2, $0, 0x1
/* 01055C 01DBC25C 09006214 */  bne         $3, $2, .L01DBC284_2F7884
/* 010560 01DBC260 00000000 */   nop
/* 010564 01DBC264 FFFF0224 */  addiu       $2, $0, -0x1
/* 010568 01DBC268 000082A4 */  sh          $2, 0x0($4)
/* 01056C 01DBC26C A89D828F */  lw          $2, -0x6258($28)
/* 010570 01DBC270 40100200 */  sll         $2, $2, 1
/* 010574 01DBC274 21104500 */  addu        $2, $2, $5
/* 010578 01DBC278 060040A4 */  sh          $0, 0x6($2)
/* 01057C 01DBC27C 04000010 */  b           .L01DBC290_2F7890
/* 010580 01DBC280 00000000 */   nop
.L01DBC284_2F7884:
/* 010584 01DBC284 0000C284 */  lh          $2, 0x0($6)
/* 010588 01DBC288 FFFF4224 */  addiu       $2, $2, -0x1
/* 01058C 01DBC28C 0000C2A4 */  sh          $2, 0x0($6)
.L01DBC290_2F7890:
/* 010590 01DBC290 989D828F */  lw          $2, -0x6268($28)
/* 010594 01DBC294 49004014 */  bnez        $2, .L01DBC3BC_2F79BC
/* 010598 01DBC298 00000000 */   nop
/* 01059C 01DBC29C EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0105A0 01DBC2A0 A478258C */  lw          $5, %lo(activeItem + 0x34)($1)
/* 0105A4 01DBC2A4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0105A8 01DBC2A8 0500A210 */  beq         $5, $2, .L01DBC2C0_2F78C0
/* 0105AC 01DBC2AC 00000000 */   nop
/* 0105B0 01DBC2B0 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0105B4 01DBC2B4 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0105B8 01DBC2B8 DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 0105BC 01DBC2BC 00000000 */   nop
.L01DBC2C0_2F78C0:
/* 0105C0 01DBC2C0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0105C4 01DBC2C4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0105C8 01DBC2C8 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
/* 0105CC 01DBC2CC DC01023C */  lui         $2, %hi(LIT_5583)
/* 0105D0 01DBC2D0 80284224 */  addiu       $2, $2, %lo(LIT_5583)
/* 0105D4 01DBC2D4 A000A327 */  addiu       $3, $29, 0xA0
/* 0105D8 01DBC2D8 00004278 */  lq          $2, 0x0($2)
/* 0105DC 01DBC2DC 0000627C */  sq          $2, 0x0($3)
/* 0105E0 01DBC2E0 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 0105E4 01DBC2E4 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 0105E8 01DBC2E8 DC01023C */  lui         $2, %hi(LIT_5627)
/* 0105EC 01DBC2EC 90334524 */  addiu       $5, $2, %lo(LIT_5627)
/* 0105F0 01DBC2F0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0105F4 01DBC2F4 00000000 */   nop
/* 0105F8 01DBC2F8 28264070 */  paddub      $4, $2, $0
/* 0105FC 01DBC2FC 9000A527 */  addiu       $5, $29, 0x90
/* 010600 01DBC300 A000A627 */  addiu       $6, $29, 0xA0
/* 010604 01DBC304 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 010608 01DBC308 00000000 */   nop
/* 01060C 01DBC30C 9000A427 */  addiu       $4, $29, 0x90
/* 010610 01DBC310 EB01023C */  lui         $2, %hi(BombInfo)
/* 010614 01DBC314 F0624524 */  addiu       $5, $2, %lo(BombInfo)
/* 010618 01DBC318 648D040C */  jal         DistVector__FPfPf
/* 01061C 01DBC31C 00000000 */   nop
/* 010620 01DBC320 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 010624 01DBC324 00688244 */  mtc1        $2, $f13
/* 010628 01DBC328 8000A427 */  addiu       $4, $29, 0x80
/* 01062C 01DBC32C 9000A527 */  addiu       $5, $29, 0x90
/* 010630 01DBC330 EB01023C */  lui         $2, %hi(BombInfo)
/* 010634 01DBC334 F0624624 */  addiu       $6, $2, %lo(BombInfo)
/* 010638 01DBC338 20858CC7 */  lwc1        $f12, -0x7AE0($28)
/* 01063C 01DBC33C 2050070C */  jal         ParabolicInitialVector__FPfPfPfff
/* 010640 01DBC340 00000000 */   nop
/* 010644 01DBC344 8000A427 */  addiu       $4, $29, 0x80
/* 010648 01DBC348 282E8070 */  paddub      $5, $4, $0
/* 01064C 01DBC34C DC838CC7 */  lwc1        $f12, -0x7C24($28)
/* 010650 01DBC350 4688040C */  jal         sceVu0ScaleVectorXYZ
/* 010654 01DBC354 00000000 */   nop
/* 010658 01DBC358 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 01065C 01DBC35C A478248C */  lw          $4, %lo(activeItem + 0x34)($1)
/* 010660 01DBC360 FFFF0324 */  addiu       $3, $0, -0x1
/* 010664 01DBC364 0E008314 */  bne         $4, $3, .L01DBC3A0_2F79A0
/* 010668 01DBC368 00000000 */   nop
/* 01066C 01DBC36C EC01013C */  lui         $1, %hi(activeItem)
/* 010670 01DBC370 7078228C */  lw          $2, %lo(activeItem)($1)
/* 010674 01DBC374 80180200 */  sll         $3, $2, 2
/* 010678 01DBC378 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 01067C 01DBC37C 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 010680 01DBC380 21104300 */  addu        $2, $2, $3
/* 010684 01DBC384 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 010688 01DBC388 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 01068C 01DBC38C 0000458C */  lw          $5, 0x0($2)
/* 010690 01DBC390 9000A627 */  addiu       $6, $29, 0x90
/* 010694 01DBC394 8000A727 */  addiu       $7, $29, 0x80
/* 010698 01DBC398 7052070C */  jal         SetThrowModel__14CMainItemModelFiPfPf
/* 01069C 01DBC39C 00000000 */   nop
.L01DBC3A0_2F79A0:
/* 0106A0 01DBC3A0 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 0106A4 01DBC3A4 0863238C */  lw          $3, %lo(BombInfo + 0x18)($1)
/* 0106A8 01DBC3A8 01006324 */  addiu       $3, $3, 0x1
/* 0106AC 01DBC3AC EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 0106B0 01DBC3B0 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
/* 0106B4 01DBC3B4 5A000010 */  b           .L01DBC520_2F7B20
/* 0106B8 01DBC3B8 00000000 */   nop
.L01DBC3BC_2F79BC:
/* 0106BC 01DBC3BC EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0106C0 01DBC3C0 A478258C */  lw          $5, %lo(activeItem + 0x34)($1)
/* 0106C4 01DBC3C4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0106C8 01DBC3C8 0500A210 */  beq         $5, $2, .L01DBC3E0_2F79E0
/* 0106CC 01DBC3CC 00000000 */   nop
/* 0106D0 01DBC3D0 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0106D4 01DBC3D4 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0106D8 01DBC3D8 DC51070C */  jal         DeleteModel__14CMainItemModelFi
/* 0106DC 01DBC3DC 00000000 */   nop
.L01DBC3E0_2F79E0:
/* 0106E0 01DBC3E0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0106E4 01DBC3E4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0106E8 01DBC3E8 A47822AC */  sw          $2, %lo(activeItem + 0x34)($1)
/* 0106EC 01DBC3EC DC01023C */  lui         $2, %hi(LIT_5585)
/* 0106F0 01DBC3F0 90284224 */  addiu       $2, $2, %lo(LIT_5585)
/* 0106F4 01DBC3F4 D000A327 */  addiu       $3, $29, 0xD0
/* 0106F8 01DBC3F8 00004278 */  lq          $2, 0x0($2)
/* 0106FC 01DBC3FC 0000627C */  sq          $2, 0x0($3)
/* 010700 01DBC400 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 010704 01DBC404 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 010708 01DBC408 DC01023C */  lui         $2, %hi(LIT_5627)
/* 01070C 01DBC40C 90334524 */  addiu       $5, $2, %lo(LIT_5627)
/* 010710 01DBC410 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 010714 01DBC414 00000000 */   nop
/* 010718 01DBC418 06004010 */  beqz        $2, .L01DBC434_2F7A34
/* 01071C 01DBC41C 00000000 */   nop
/* 010720 01DBC420 28264070 */  paddub      $4, $2, $0
/* 010724 01DBC424 C000A527 */  addiu       $5, $29, 0xC0
/* 010728 01DBC428 D000A627 */  addiu       $6, $29, 0xD0
/* 01072C 01DBC42C 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 010730 01DBC430 00000000 */   nop
.L01DBC434_2F7A34:
/* 010734 01DBC434 DC01013C */  lui         $1, %hi(BtActStatus + 0x80)
/* 010738 01DBC438 004521C4 */  lwc1        $f1, %lo(BtActStatus + 0x80)($1)
/* 01073C 01DBC43C C000A0C7 */  lwc1        $f0, 0xC0($29)
/* 010740 01DBC440 01080046 */  sub.s       $f0, $f1, $f0
/* 010744 01DBC444 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 010748 01DBC448 DC01013C */  lui         $1, %hi(BtActStatus + 0x84)
/* 01074C 01DBC44C 044521C4 */  lwc1        $f1, %lo(BtActStatus + 0x84)($1)
/* 010750 01DBC450 C400A0C7 */  lwc1        $f0, 0xC4($29)
/* 010754 01DBC454 41080046 */  sub.s       $f1, $f1, $f0
/* 010758 01DBC458 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 01075C 01DBC45C 00008244 */  mtc1        $2, $f0
/* 010760 01DBC460 00000000 */  nop
/* 010764 01DBC464 00000146 */  add.s       $f0, $f0, $f1
/* 010768 01DBC468 B400B027 */  addiu       $16, $29, 0xB4
/* 01076C 01DBC46C 000000E6 */  swc1        $f0, 0x0($16)
/* 010770 01DBC470 DC01013C */  lui         $1, %hi(BtActStatus + 0x88)
/* 010774 01DBC474 084521C4 */  lwc1        $f1, %lo(BtActStatus + 0x88)($1)
/* 010778 01DBC478 C800A0C7 */  lwc1        $f0, 0xC8($29)
/* 01077C 01DBC47C 01080046 */  sub.s       $f0, $f1, $f0
/* 010780 01DBC480 B800B127 */  addiu       $17, $29, 0xB8
/* 010784 01DBC484 000020E6 */  swc1        $f0, 0x0($17)
/* 010788 01DBC488 B000A427 */  addiu       $4, $29, 0xB0
/* 01078C 01DBC48C 282E8070 */  paddub      $5, $4, $0
/* 010790 01DBC490 9285040C */  jal         sceVu0Normalize
/* 010794 01DBC494 00000000 */   nop
/* 010798 01DBC498 9040033C */  lui         $3, (0x40900000 >> 16)
/* 01079C 01DBC49C 00088344 */  mtc1        $3, $f1
/* 0107A0 01DBC4A0 B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 0107A4 01DBC4A4 02000146 */  mul.s       $f0, $f0, $f1
/* 0107A8 01DBC4A8 B000A0E7 */  swc1        $f0, 0xB0($29)
/* 0107AC 01DBC4AC 000000C6 */  lwc1        $f0, 0x0($16)
/* 0107B0 01DBC4B0 02000146 */  mul.s       $f0, $f0, $f1
/* 0107B4 01DBC4B4 000000E6 */  swc1        $f0, 0x0($16)
/* 0107B8 01DBC4B8 000020C6 */  lwc1        $f0, 0x0($17)
/* 0107BC 01DBC4BC 02000146 */  mul.s       $f0, $f0, $f1
/* 0107C0 01DBC4C0 000020E6 */  swc1        $f0, 0x0($17)
/* 0107C4 01DBC4C4 EC01013C */  lui         $1, %hi(activeItem + 0x34)
/* 0107C8 01DBC4C8 A478248C */  lw          $4, %lo(activeItem + 0x34)($1)
/* 0107CC 01DBC4CC FFFF0324 */  addiu       $3, $0, -0x1
/* 0107D0 01DBC4D0 0E008314 */  bne         $4, $3, .L01DBC50C_2F7B0C
/* 0107D4 01DBC4D4 00000000 */   nop
/* 0107D8 01DBC4D8 EC01013C */  lui         $1, %hi(activeItem)
/* 0107DC 01DBC4DC 7078228C */  lw          $2, %lo(activeItem)($1)
/* 0107E0 01DBC4E0 80180200 */  sll         $3, $2, 2
/* 0107E4 01DBC4E4 EC01023C */  lui         $2, %hi(activeItem + 0x14)
/* 0107E8 01DBC4E8 84784224 */  addiu       $2, $2, %lo(activeItem + 0x14)
/* 0107EC 01DBC4EC 21104300 */  addu        $2, $2, $3
/* 0107F0 01DBC4F0 EC01013C */  lui         $1, %hi(activeItem + 0x38)
/* 0107F4 01DBC4F4 A878248C */  lw          $4, %lo(activeItem + 0x38)($1)
/* 0107F8 01DBC4F8 0000458C */  lw          $5, 0x0($2)
/* 0107FC 01DBC4FC C000A627 */  addiu       $6, $29, 0xC0
/* 010800 01DBC500 B000A727 */  addiu       $7, $29, 0xB0
/* 010804 01DBC504 7052070C */  jal         SetThrowModel__14CMainItemModelFiPfPf
/* 010808 01DBC508 00000000 */   nop
.L01DBC50C_2F7B0C:
/* 01080C 01DBC50C EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 010810 01DBC510 0863238C */  lw          $3, %lo(BombInfo + 0x18)($1)
/* 010814 01DBC514 01006324 */  addiu       $3, $3, 0x1
/* 010818 01DBC518 EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 01081C 01DBC51C 086323AC */  sw          $3, %lo(BombInfo + 0x18)($1)
.L01DBC520_2F7B20:
/* 010820 01DBC520 1B000324 */  addiu       $3, $0, 0x1B
/* 010824 01DBC524 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010828 01DBC528 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBC52C_2F7B2C:
/* 01082C 01DBC52C EB01013C */  lui         $1, %hi(BombInfo + 0x18)
/* 010830 01DBC530 0863248C */  lw          $4, %lo(BombInfo + 0x18)($1)
/* 010834 01DBC534 02000324 */  addiu       $3, $0, 0x2
/* 010838 01DBC538 28008314 */  bne         $4, $3, .L01DBC5DC_2F7BDC
/* 01083C 01DBC53C 00000000 */   nop
/* 010840 01DBC540 1B000324 */  addiu       $3, $0, 0x1B
/* 010844 01DBC544 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 010848 01DBC548 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
/* 01084C 01DBC54C EA01013C */  lui         $1, %hi(CharaMain + 0x344)
/* 010850 01DBC550 6420238C */  lw          $3, %lo(CharaMain + 0x344)($1)
/* 010854 01DBC554 B40160C4 */  lwc1        $f0, 0x1B4($3)
/* 010858 01DBC558 60008046 */  cvt.s.w     $f1, $f0
/* 01085C 01DBC55C EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 010860 01DBC560 102022C4 */  lwc1        $f2, %lo(CharaMain + 0x2F0)($1)
/* 010864 01DBC564 0040033C */  lui         $3, (0x40000000 >> 16)
/* 010868 01DBC568 00008344 */  mtc1        $3, $f0
/* 01086C 01DBC56C 00000000 */  nop
/* 010870 01DBC570 01080046 */  sub.s       $f0, $f1, $f0
/* 010874 01DBC574 34100046 */  c.lt.s      $f2, $f0
/* 010878 01DBC578 00000000 */  nop
/* 01087C 01DBC57C 17000145 */  bc1t        .L01DBC5DC_2F7BDC
/* 010880 01DBC580 00000000 */   nop
/* 010884 01DBC584 36100146 */  c.le.s      $f2, $f1
/* 010888 01DBC588 00000000 */  nop
/* 01088C 01DBC58C 13000045 */  bc1f        .L01DBC5DC_2F7BDC
/* 010890 01DBC590 00000000 */   nop
/* 010894 01DBC594 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 010898 01DBC598 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 01089C 01DBC59C 01000324 */  addiu       $3, $0, 0x1
/* 0108A0 01DBC5A0 DC01013C */  lui         $1, %hi(BtActStatus + 0x64)
/* 0108A4 01DBC5A4 E44423A4 */  sh          $3, %lo(BtActStatus + 0x64)($1)
/* 0108A8 01DBC5A8 DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 0108AC 01DBC5AC A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 0108B0 01DBC5B0 7C9D83AF */  sw          $3, -0x6284($28)
/* 0108B4 01DBC5B4 989D838F */  lw          $3, -0x6268($28)
/* 0108B8 01DBC5B8 04006010 */  beqz        $3, .L01DBC5CC_2F7BCC
/* 0108BC 01DBC5BC 00000000 */   nop
/* 0108C0 01DBC5C0 12000324 */  addiu       $3, $0, 0x12
/* 0108C4 01DBC5C4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0108C8 01DBC5C8 8C4423AC */  sw          $3, %lo(BtActStatus + 0xC)($1)
.L01DBC5CC_2F7BCC:
/* 0108CC 01DBC5CC DC01013C */  lui         $1, %hi(BtActStatus + 0x70)
/* 0108D0 01DBC5D0 F04420AC */  sw          $0, %lo(BtActStatus + 0x70)($1)
/* 0108D4 01DBC5D4 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0108D8 01DBC5D8 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
.L01DBC5DC_2F7BDC:
/* 0108DC 01DBC5DC 3000BF7B */  lq          $31, 0x30($29)
/* 0108E0 01DBC5E0 2000B17B */  lq          $17, 0x20($29)
/* 0108E4 01DBC5E4 1000B07B */  lq          $16, 0x10($29)
/* 0108E8 01DBC5E8 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0108EC 01DBC5EC 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0108F0 01DBC5F0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0108F4 01DBC5F4 E000BD27 */  addiu       $29, $29, 0xE0
/* 0108F8 01DBC5F8 0800E003 */  jr          $31
/* 0108FC 01DBC5FC 00000000 */   nop
