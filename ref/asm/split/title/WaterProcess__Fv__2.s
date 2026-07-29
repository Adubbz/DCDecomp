.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WaterProcess__Fv__2
/* 01F320 01DCB020 90FFBD27 */  addiu       $29, $29, -0x70
/* 01F324 01DCB024 1000BF7F */  sq          $31, 0x10($29)
/* 01F328 01DCB028 0000B07F */  sq          $16, 0x0($29)
/* 01F32C 01DCB02C 5800A427 */  addiu       $4, $29, 0x58
/* 01F330 01DCB030 4CBC040C */  jal         MGGetFBuffTex__FP9sceGsTex0
/* 01F334 01DCB034 00000000 */   nop
/* 01F338 01DCB038 2000A0AF */  sw          $0, 0x20($29)
/* 01F33C 01DCB03C 2400A0AF */  sw          $0, 0x24($29)
/* 01F340 01DCB040 80020224 */  addiu       $2, $0, 0x280
/* 01F344 01DCB044 2800A2AF */  sw          $2, 0x28($29)
/* 01F348 01DCB048 E0000224 */  addiu       $2, $0, 0xE0
/* 01F34C 01DCB04C 2C00A2AF */  sw          $2, 0x2C($29)
/* 01F350 01DCB050 C701023C */  lui         $2, %hi(TexManager)
/* 01F354 01DCB054 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01F358 01DCB058 DE01023C */  lui         $2, %hi(LIT_824)
/* 01F35C 01DCB05C A0FF4524 */  addiu       $5, $2, %lo(LIT_824)
/* 01F360 01DCB060 FFFF0624 */  addiu       $6, $0, -0x1
/* 01F364 01DCB064 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01F368 01DCB068 00000000 */   nop
/* 01F36C 01DCB06C 6000A627 */  addiu       $6, $29, 0x60
/* 01F370 01DCB070 280042DC */  ld          $2, 0x28($2)
/* 01F374 01DCB074 0000C2FC */  sd          $2, 0x0($6)
/* 01F378 01DCB078 5800A427 */  addiu       $4, $29, 0x58
/* 01F37C 01DCB07C 2000A527 */  addiu       $5, $29, 0x20
/* 01F380 01DCB080 283E0070 */  paddub      $7, $0, $0
/* 01F384 01DCB084 28460070 */  paddub      $8, $0, $0
/* 01F388 01DCB088 284E0070 */  paddub      $9, $0, $0
/* 01F38C 01DCB08C 84BC040C */  jal         MGMoveImage__FP9sceGsTex0RC8CRect_i_P9sceGsTex0iii
/* 01F390 01DCB090 00000000 */   nop
/* 01F394 01DCB094 6800A427 */  addiu       $4, $29, 0x68
/* 01F398 01DCB098 F08B82DF */  ld          $2, -0x7410($28)
/* 01F39C 01DCB09C 000082FC */  sd          $2, 0x0($4)
/* 01F3A0 01DCB0A0 6C00A593 */  lbu         $5, 0x6C($29)
/* 01F3A4 01DCB0A4 01000364 */  daddiu      $3, $0, 0x1
/* 01F3A8 01DCB0A8 FEFF0224 */  addiu       $2, $0, -0x2
/* 01F3AC 01DCB0AC 2410A200 */  and         $2, $5, $2
/* 01F3B0 01DCB0B0 25104300 */  or          $2, $2, $3
/* 01F3B4 01DCB0B4 6C00A2A3 */  sb          $2, 0x6C($29)
/* 01F3B8 01DCB0B8 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 01F3BC 01DCB0BC 00000000 */   nop
/* 01F3C0 01DCB0C0 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01F3C4 01DCB0C4 D8E9238C */  lw          $3, %lo(CScript + 0x18)($1)
/* 01F3C8 01DCB0C8 01000224 */  addiu       $2, $0, 0x1
/* 01F3CC 01DCB0CC 30006214 */  bne         $3, $2, .L01DCB190_2D0990
/* 01F3D0 01DCB0D0 00000000 */   nop
/* 01F3D4 01DCB0D4 DE01023C */  lui         $2, %hi(LIT_820__3)
/* 01F3D8 01DCB0D8 80B14224 */  addiu       $2, $2, %lo(LIT_820__3)
/* 01F3DC 01DCB0DC 3000A527 */  addiu       $5, $29, 0x30
/* 01F3E0 01DCB0E0 00004278 */  lq          $2, 0x0($2)
/* 01F3E4 01DCB0E4 0000A27C */  sq          $2, 0x0($5)
/* 01F3E8 01DCB0E8 E401023C */  lui         $2, %hi(Water__2 + 0xB0)
/* 01F3EC 01DCB0EC A0CD4424 */  addiu       $4, $2, %lo(Water__2 + 0xB0)
/* 01F3F0 01DCB0F0 B89F040C */  jal         SetPosition__6CFrameFPf
/* 01F3F4 01DCB0F4 00000000 */   nop
/* 01F3F8 01DCB0F8 BE11040C */  jal         rand
/* 01F3FC 01DCB0FC 00000000 */   nop
/* 01F400 01DCB100 00008244 */  mtc1        $2, $f0
/* 01F404 01DCB104 00000000 */  nop
/* 01F408 01DCB108 20038046 */  cvt.s.w     $f12, $f0
/* 01F40C 01DCB10C 9044040C */  jal         fptodp
/* 01F410 01DCB110 00000000 */   nop
/* 01F414 01DCB114 1240033C */  lui         $3, (0x40120000 >> 16)
/* 01F418 01DCB118 3C200300 */  dsll32      $4, $3, 0
/* 01F41C 01DCB11C 282E4070 */  paddub      $5, $2, $0
/* 01F420 01DCB120 9E3F040C */  jal         dpmul
/* 01F424 01DCB124 00000000 */   nop
/* 01F428 01DCB128 28864070 */  paddub      $16, $2, $0
/* 01F42C 01DCB12C FF7F023C */  lui         $2, (0x7FFFFFFF >> 16)
/* 01F430 01DCB130 FFFF4434 */  ori         $4, $2, (0x7FFFFFFF & 0xFFFF)
/* 01F434 01DCB134 FC40040C */  jal         litodp
/* 01F438 01DCB138 00000000 */   nop
/* 01F43C 01DCB13C 28260072 */  paddub      $4, $16, $0
/* 01F440 01DCB140 282E4070 */  paddub      $5, $2, $0
/* 01F444 01DCB144 4840040C */  jal         dpdiv
/* 01F448 01DCB148 00000000 */   nop
/* 01F44C 01DCB14C E03F033C */  lui         $3, (0x3FE00000 >> 16)
/* 01F450 01DCB150 3C200300 */  dsll32      $4, $3, 0
/* 01F454 01DCB154 282E4070 */  paddub      $5, $2, $0
/* 01F458 01DCB158 6E3F040C */  jal         dpadd
/* 01F45C 01DCB15C 00000000 */   nop
/* 01F460 01DCB160 28264070 */  paddub      $4, $2, $0
/* 01F464 01DCB164 9241040C */  jal         dptofp
/* 01F468 01DCB168 00000000 */   nop
/* 01F46C 01DCB16C E401023C */  lui         $2, %hi(Water__2)
/* 01F470 01DCB170 F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 01F474 01DCB174 0C000524 */  addiu       $5, $0, 0xC
/* 01F478 01DCB178 04000624 */  addiu       $6, $0, 0x4
/* 01F47C 01DCB17C 06030046 */  mov.s       $f12, $f0
/* 01F480 01DCB180 DC84050C */  jal         Shake__6CWaterFiif
/* 01F484 01DCB184 00000000 */   nop
/* 01F488 01DCB188 33000010 */  b           .L01DCB258_2D0A58
/* 01F48C 01DCB18C 00000000 */   nop
.L01DCB190_2D0990:
/* 01F490 01DCB190 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01F494 01DCB194 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 01F498 01DCB198 4000A527 */  addiu       $5, $29, 0x40
/* 01F49C 01DCB19C A891040C */  jal         GetRef__7CCameraFPf
/* 01F4A0 01DCB1A0 00000000 */   nop
/* 01F4A4 01DCB1A4 4400A0AF */  sw          $0, 0x44($29)
/* 01F4A8 01DCB1A8 E401023C */  lui         $2, %hi(Water__2 + 0xB0)
/* 01F4AC 01DCB1AC A0CD4424 */  addiu       $4, $2, %lo(Water__2 + 0xB0)
/* 01F4B0 01DCB1B0 4000A527 */  addiu       $5, $29, 0x40
/* 01F4B4 01DCB1B4 B89F040C */  jal         SetPosition__6CFrameFPf
/* 01F4B8 01DCB1B8 00000000 */   nop
/* 01F4BC 01DCB1BC BE11040C */  jal         rand
/* 01F4C0 01DCB1C0 00000000 */   nop
/* 01F4C4 01DCB1C4 00008244 */  mtc1        $2, $f0
/* 01F4C8 01DCB1C8 00000000 */  nop
/* 01F4CC 01DCB1CC 60008046 */  cvt.s.w     $f1, $f0
/* 01F4D0 01DCB1D0 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01F4D4 01DCB1D4 00008244 */  mtc1        $2, $f0
/* 01F4D8 01DCB1D8 00000000 */  nop
/* 01F4DC 01DCB1DC 42000146 */  mul.s       $f1, $f0, $f1
/* 01F4E0 01DCB1E0 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 01F4E4 01DCB1E4 00008244 */  mtc1        $2, $f0
/* 01F4E8 01DCB1E8 00000000 */  nop
/* 01F4EC 01DCB1EC 030B0046 */  div.s       $f12, $f1, $f0
/* 01F4F0 01DCB1F0 2C44040C */  jal         fptosi
/* 01F4F4 01DCB1F4 00000000 */   nop
/* 01F4F8 01DCB1F8 28864070 */  paddub      $16, $2, $0
/* 01F4FC 01DCB1FC BE11040C */  jal         rand
/* 01F500 01DCB200 00000000 */   nop
/* 01F504 01DCB204 00008244 */  mtc1        $2, $f0
/* 01F508 01DCB208 00000000 */  nop
/* 01F50C 01DCB20C 60008046 */  cvt.s.w     $f1, $f0
/* 01F510 01DCB210 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01F514 01DCB214 00008244 */  mtc1        $2, $f0
/* 01F518 01DCB218 00000000 */  nop
/* 01F51C 01DCB21C 42000146 */  mul.s       $f1, $f0, $f1
/* 01F520 01DCB220 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 01F524 01DCB224 00008244 */  mtc1        $2, $f0
/* 01F528 01DCB228 00000000 */  nop
/* 01F52C 01DCB22C 030B0046 */  div.s       $f12, $f1, $f0
/* 01F530 01DCB230 2C44040C */  jal         fptosi
/* 01F534 01DCB234 00000000 */   nop
/* 01F538 01DCB238 00BF033C */  lui         $3, (0xBF000000 >> 16)
/* 01F53C 01DCB23C 00608344 */  mtc1        $3, $f12
/* 01F540 01DCB240 E401033C */  lui         $3, %hi(Water__2)
/* 01F544 01DCB244 F0CC6424 */  addiu       $4, $3, %lo(Water__2)
/* 01F548 01DCB248 282E0072 */  paddub      $5, $16, $0
/* 01F54C 01DCB24C 28364070 */  paddub      $6, $2, $0
/* 01F550 01DCB250 DC84050C */  jal         Shake__6CWaterFiif
/* 01F554 01DCB254 00000000 */   nop
.L01DCB258_2D0A58:
/* 01F558 01DCB258 E401023C */  lui         $2, %hi(Water__2)
/* 01F55C 01DCB25C F0CC4424 */  addiu       $4, $2, %lo(Water__2)
/* 01F560 01DCB260 7484050C */  jal         Hamon__6CWaterFv
/* 01F564 01DCB264 00000000 */   nop
/* 01F568 01DCB268 A0B8040C */  jal         GetVif1Packet__Fv
/* 01F56C 01DCB26C 00000000 */   nop
/* 01F570 01DCB270 E401033C */  lui         $3, %hi(Water__2)
/* 01F574 01DCB274 F0CC6424 */  addiu       $4, $3, %lo(Water__2)
/* 01F578 01DCB278 C701033C */  lui         $3, %hi(mgRenderInfo)
/* 01F57C 01DCB27C 20556524 */  addiu       $5, $3, %lo(mgRenderInfo)
/* 01F580 01DCB280 28364070 */  paddub      $6, $2, $0
/* 01F584 01DCB284 283E0070 */  paddub      $7, $0, $0
/* 01F588 01DCB288 C883050C */  jal         DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1
/* 01F58C 01DCB28C 00000000 */   nop
/* 01F590 01DCB290 F08B8427 */  addiu       $4, $28, -0x7410
/* 01F594 01DCB294 B0BB040C */  jal         MGSetGsZBUF__FP9sceGsZbuf
/* 01F598 01DCB298 00000000 */   nop
/* 01F59C 01DCB29C 1000BF7B */  lq          $31, 0x10($29)
/* 01F5A0 01DCB2A0 0000B07B */  lq          $16, 0x0($29)
/* 01F5A4 01DCB2A4 7000BD27 */  addiu       $29, $29, 0x70
/* 01F5A8 01DCB2A8 0800E003 */  jr          $31
/* 01F5AC 01DCB2AC 00000000 */   nop
