.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpB_SoundProcess__Fv
/* 00F020 01DBAD20 A0FFBD27 */  addiu       $29, $29, -0x60
/* 00F024 01DBAD24 1000BF7F */  sq          $31, 0x10($29)
/* 00F028 01DBAD28 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00F02C 01DBAD2C DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 00F030 01DBAD30 181B258C */  lw          $5, %lo(CScript__2 + 0x18)($1)
/* 00F034 01DBAD34 01000424 */  addiu       $4, $0, 0x1
/* 00F038 01DBAD38 7F00A414 */  bne         $5, $4, .L01DBAF38_2C0738
/* 00F03C 01DBAD3C 00000000 */   nop
/* 00F040 01DBAD40 0498838F */  lw          $3, -0x67FC($28)
/* 00F044 01DBAD44 B0110224 */  addiu       $2, $0, 0x11B0
/* 00F048 01DBAD48 18186200 */  mult        $3, $3, $2
/* 00F04C 01DBAD4C E101023C */  lui         $2, %hi(Cam__2 + 0x2F0)
/* 00F050 01DBAD50 C09B4224 */  addiu       $2, $2, %lo(Cam__2 + 0x2F0)
/* 00F054 01DBAD54 21104300 */  addu        $2, $2, $3
/* 00F058 01DBAD58 000054C4 */  lwc1        $f20, 0x0($2)
/* 00F05C 01DBAD5C DE01013C */  lui         $1, %hi(CScript__2 + 0x208)
/* 00F060 01DBAD60 081D228C */  lw          $2, %lo(CScript__2 + 0x208)($1)
/* 00F064 01DBAD64 64004014 */  bnez        $2, .L01DBAEF8_2C06F8
/* 00F068 01DBAD68 00000000 */   nop
/* 00F06C 01DBAD6C C0998283 */  lb          $2, -0x6640($28)
/* 00F070 01DBAD70 03004014 */  bnez        $2, .L01DBAD80_2C0580
/* 00F074 01DBAD74 00000000 */   nop
/* 00F078 01DBAD78 BC9980AF */  sw          $0, -0x6644($28)
/* 00F07C 01DBAD7C C09984A3 */  sb          $4, -0x6640($28)
.L01DBAD80_2C0580:
/* 00F080 01DBAD80 2000A427 */  addiu       $4, $29, 0x20
/* 00F084 01DBAD84 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x1650)
/* 00F088 01DBAD88 209E4524 */  addiu       $5, $2, %lo(MainMonstorUnit + 0x1650)
/* 00F08C 01DBAD8C 0C86040C */  jal         sceVu0CopyVector
/* 00F090 01DBAD90 00000000 */   nop
/* 00F094 01DBAD94 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x1930)
/* 00F098 01DBAD98 00A12CC4 */  lwc1        $f12, %lo(MainMonstorUnit + 0x1930)($1)
/* 00F09C 01DBAD9C 2C44040C */  jal         fptosi
/* 00F0A0 01DBADA0 00000000 */   nop
/* 00F0A4 01DBADA4 BC99838F */  lw          $3, -0x6644($28)
/* 00F0A8 01DBADA8 51006014 */  bnez        $3, .L01DBAEF0_2C06F0
/* 00F0AC 01DBADAC 00000000 */   nop
/* 00F0B0 01DBADB0 1D004128 */  slti        $1, $2, 0x1D
/* 00F0B4 01DBADB4 26002014 */  bnez        $1, .L01DBAE50_2C0650
/* 00F0B8 01DBADB8 00000000 */   nop
/* 00F0BC 01DBADBC 1E004128 */  slti        $1, $2, 0x1E
/* 00F0C0 01DBADC0 23002010 */  beqz        $1, .L01DBAE50_2C0650
/* 00F0C4 01DBADC4 00000000 */   nop
/* 00F0C8 01DBADC8 83010224 */  addiu       $2, $0, 0x183
/* 00F0CC 01DBADCC 00008244 */  mtc1        $2, $f0
/* 00F0D0 01DBADD0 00000000 */  nop
/* 00F0D4 01DBADD4 20008046 */  cvt.s.w     $f0, $f0
/* 00F0D8 01DBADD8 34A00046 */  c.lt.s      $f20, $f0
/* 00F0DC 01DBADDC 00000000 */  nop
/* 00F0E0 01DBADE0 0D000045 */  bc1f        .L01DBAE18_2C0618
/* 00F0E4 01DBADE4 00000000 */   nop
/* 00F0E8 01DBADE8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00F0EC 01DBADEC 00608244 */  mtc1        $2, $f12
/* 00F0F0 01DBADF0 C843023C */  lui         $2, (0x43C80000 >> 16)
/* 00F0F4 01DBADF4 00688244 */  mtc1        $2, $f13
/* 00F0F8 01DBADF8 2000A427 */  addiu       $4, $29, 0x20
/* 00F0FC 01DBADFC 0E000524 */  addiu       $5, $0, 0xE
/* 00F100 01DBAE00 15000624 */  addiu       $6, $0, 0x15
/* 00F104 01DBAE04 14000724 */  addiu       $7, $0, 0x14
/* 00F108 01DBAE08 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F10C 01DBAE0C 00000000 */   nop
/* 00F110 01DBAE10 0B000010 */  b           .L01DBAE40_2C0640
/* 00F114 01DBAE14 00000000 */   nop
.L01DBAE18_2C0618:
/* 00F118 01DBAE18 C843023C */  lui         $2, (0x43C80000 >> 16)
/* 00F11C 01DBAE1C 00688244 */  mtc1        $2, $f13
/* 00F120 01DBAE20 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00F124 01DBAE24 00608244 */  mtc1        $2, $f12
/* 00F128 01DBAE28 2000A427 */  addiu       $4, $29, 0x20
/* 00F12C 01DBAE2C 0E000524 */  addiu       $5, $0, 0xE
/* 00F130 01DBAE30 15000624 */  addiu       $6, $0, 0x15
/* 00F134 01DBAE34 20000724 */  addiu       $7, $0, 0x20
/* 00F138 01DBAE38 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F13C 01DBAE3C 00000000 */   nop
.L01DBAE40_2C0640:
/* 00F140 01DBAE40 04000224 */  addiu       $2, $0, 0x4
/* 00F144 01DBAE44 BC9982AF */  sw          $2, -0x6644($28)
/* 00F148 01DBAE48 2B000010 */  b           .L01DBAEF8_2C06F8
/* 00F14C 01DBAE4C 00000000 */   nop
.L01DBAE50_2C0650:
/* 00F150 01DBAE50 27004128 */  slti        $1, $2, 0x27
/* 00F154 01DBAE54 28002014 */  bnez        $1, .L01DBAEF8_2C06F8
/* 00F158 01DBAE58 00000000 */   nop
/* 00F15C 01DBAE5C 28004128 */  slti        $1, $2, 0x28
/* 00F160 01DBAE60 25002010 */  beqz        $1, .L01DBAEF8_2C06F8
/* 00F164 01DBAE64 00000000 */   nop
/* 00F168 01DBAE68 83010224 */  addiu       $2, $0, 0x183
/* 00F16C 01DBAE6C 00008244 */  mtc1        $2, $f0
/* 00F170 01DBAE70 00000000 */  nop
/* 00F174 01DBAE74 20008046 */  cvt.s.w     $f0, $f0
/* 00F178 01DBAE78 34A00046 */  c.lt.s      $f20, $f0
/* 00F17C 01DBAE7C 00000000 */  nop
/* 00F180 01DBAE80 0D000045 */  bc1f        .L01DBAEB8_2C06B8
/* 00F184 01DBAE84 00000000 */   nop
/* 00F188 01DBAE88 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00F18C 01DBAE8C 00608244 */  mtc1        $2, $f12
/* 00F190 01DBAE90 C843023C */  lui         $2, (0x43C80000 >> 16)
/* 00F194 01DBAE94 00688244 */  mtc1        $2, $f13
/* 00F198 01DBAE98 2000A427 */  addiu       $4, $29, 0x20
/* 00F19C 01DBAE9C 0E000524 */  addiu       $5, $0, 0xE
/* 00F1A0 01DBAEA0 15000624 */  addiu       $6, $0, 0x15
/* 00F1A4 01DBAEA4 283EC070 */  paddub      $7, $6, $0
/* 00F1A8 01DBAEA8 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F1AC 01DBAEAC 00000000 */   nop
/* 00F1B0 01DBAEB0 0B000010 */  b           .L01DBAEE0_2C06E0
/* 00F1B4 01DBAEB4 00000000 */   nop
.L01DBAEB8_2C06B8:
/* 00F1B8 01DBAEB8 C843023C */  lui         $2, (0x43C80000 >> 16)
/* 00F1BC 01DBAEBC 00688244 */  mtc1        $2, $f13
/* 00F1C0 01DBAEC0 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00F1C4 01DBAEC4 00608244 */  mtc1        $2, $f12
/* 00F1C8 01DBAEC8 2000A427 */  addiu       $4, $29, 0x20
/* 00F1CC 01DBAECC 0E000524 */  addiu       $5, $0, 0xE
/* 00F1D0 01DBAED0 15000624 */  addiu       $6, $0, 0x15
/* 00F1D4 01DBAED4 21000724 */  addiu       $7, $0, 0x21
/* 00F1D8 01DBAED8 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F1DC 01DBAEDC 00000000 */   nop
.L01DBAEE0_2C06E0:
/* 00F1E0 01DBAEE0 04000224 */  addiu       $2, $0, 0x4
/* 00F1E4 01DBAEE4 BC9982AF */  sw          $2, -0x6644($28)
/* 00F1E8 01DBAEE8 03000010 */  b           .L01DBAEF8_2C06F8
/* 00F1EC 01DBAEEC 00000000 */   nop
.L01DBAEF0_2C06F0:
/* 00F1F0 01DBAEF0 FFFF6224 */  addiu       $2, $3, -0x1
/* 00F1F4 01DBAEF4 BC9982AF */  sw          $2, -0x6644($28)
.L01DBAEF8_2C06F8:
/* 00F1F8 01DBAEF8 DD01023C */  lui         $2, %hi(LIT_663__3)
/* 00F1FC 01DBAEFC A0774224 */  addiu       $2, $2, %lo(LIT_663__3)
/* 00F200 01DBAF00 3000A427 */  addiu       $4, $29, 0x30
/* 00F204 01DBAF04 00004278 */  lq          $2, 0x0($2)
/* 00F208 01DBAF08 0000827C */  sq          $2, 0x0($4)
/* 00F20C 01DBAF0C C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00F210 01DBAF10 00608244 */  mtc1        $2, $f12
/* 00F214 01DBAF14 C843023C */  lui         $2, (0x43C80000 >> 16)
/* 00F218 01DBAF18 00688244 */  mtc1        $2, $f13
/* 00F21C 01DBAF1C 0F000524 */  addiu       $5, $0, 0xF
/* 00F220 01DBAF20 10000624 */  addiu       $6, $0, 0x10
/* 00F224 01DBAF24 15000724 */  addiu       $7, $0, 0x15
/* 00F228 01DBAF28 28C4760C */  jal         OpSetVolPanSE__FPfffiii
/* 00F22C 01DBAF2C 00000000 */   nop
/* 00F230 01DBAF30 B3000010 */  b           .L01DBB200_2C0A00
/* 00F234 01DBAF34 00000000 */   nop
.L01DBAF38_2C0738:
/* 00F238 01DBAF38 02000324 */  addiu       $3, $0, 0x2
/* 00F23C 01DBAF3C B000A314 */  bne         $5, $3, .L01DBB200_2C0A00
/* 00F240 01DBAF40 00000000 */   nop
/* 00F244 01DBAF44 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 00F248 01DBAF48 141B228C */  lw          $2, %lo(CScript__2 + 0x14)($1)
/* 00F24C 01DBAF4C 27004414 */  bne         $2, $4, .L01DBAFEC_2C07EC
/* 00F250 01DBAF50 00000000 */   nop
/* 00F254 01DBAF54 28260070 */  paddub      $4, $0, $0
/* 00F258 01DBAF58 BCC4760C */  jal         OpGetVolSQ__Fi
/* 00F25C 01DBAF5C 00000000 */   nop
/* 00F260 01DBAF60 28264070 */  paddub      $4, $2, $0
/* 00F264 01DBAF64 FC40040C */  jal         litodp
/* 00F268 01DBAF68 00000000 */   nop
/* 00F26C 01DBAF6C 28264070 */  paddub      $4, $2, $0
/* 00F270 01DBAF70 9241040C */  jal         dptofp
/* 00F274 01DBAF74 00000000 */   nop
/* 00F278 01DBAF78 06030046 */  mov.s       $f12, $f0
/* 00F27C 01DBAF7C 2C44040C */  jal         fptosi
/* 00F280 01DBAF80 00000000 */   nop
/* 00F284 01DBAF84 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00F288 01DBAF88 282E0070 */  paddub      $5, $0, $0
/* 00F28C 01DBAF8C 28364070 */  paddub      $6, $2, $0
/* 00F290 01DBAF90 581A050C */  jal         SetVol__6CSoundFii
/* 00F294 01DBAF94 00000000 */   nop
/* 00F298 01DBAF98 01000424 */  addiu       $4, $0, 0x1
/* 00F29C 01DBAF9C BCC4760C */  jal         OpGetVolSQ__Fi
/* 00F2A0 01DBAFA0 00000000 */   nop
/* 00F2A4 01DBAFA4 28264070 */  paddub      $4, $2, $0
/* 00F2A8 01DBAFA8 FC40040C */  jal         litodp
/* 00F2AC 01DBAFAC 00000000 */   nop
/* 00F2B0 01DBAFB0 488084DF */  ld          $4, -0x7FB8($28)
/* 00F2B4 01DBAFB4 282E4070 */  paddub      $5, $2, $0
/* 00F2B8 01DBAFB8 9E3F040C */  jal         dpmul
/* 00F2BC 01DBAFBC 00000000 */   nop
/* 00F2C0 01DBAFC0 28264070 */  paddub      $4, $2, $0
/* 00F2C4 01DBAFC4 9241040C */  jal         dptofp
/* 00F2C8 01DBAFC8 00000000 */   nop
/* 00F2CC 01DBAFCC 06030046 */  mov.s       $f12, $f0
/* 00F2D0 01DBAFD0 2C44040C */  jal         fptosi
/* 00F2D4 01DBAFD4 00000000 */   nop
/* 00F2D8 01DBAFD8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00F2DC 01DBAFDC 01000524 */  addiu       $5, $0, 0x1
/* 00F2E0 01DBAFE0 28364070 */  paddub      $6, $2, $0
/* 00F2E4 01DBAFE4 581A050C */  jal         SetVol__6CSoundFii
/* 00F2E8 01DBAFE8 00000000 */   nop
.L01DBAFEC_2C07EC:
/* 00F2EC 01DBAFEC DE01013C */  lui         $1, %hi(CScript__2)
/* 00F2F0 01DBAFF0 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00F2F4 01DBAFF4 37000224 */  addiu       $2, $0, 0x37
/* 00F2F8 01DBAFF8 2C006214 */  bne         $3, $2, .L01DBB0AC_2C08AC
/* 00F2FC 01DBAFFC 00000000 */   nop
/* 00F300 01DBB000 28260070 */  paddub      $4, $0, $0
/* 00F304 01DBB004 BCC4760C */  jal         OpGetVolSQ__Fi
/* 00F308 01DBB008 00000000 */   nop
/* 00F30C 01DBB00C 28264070 */  paddub      $4, $2, $0
/* 00F310 01DBB010 FC40040C */  jal         litodp
/* 00F314 01DBB014 00000000 */   nop
/* 00F318 01DBB018 E03F033C */  lui         $3, (0x3FE00000 >> 16)
/* 00F31C 01DBB01C 3C200300 */  dsll32      $4, $3, 0
/* 00F320 01DBB020 282E4070 */  paddub      $5, $2, $0
/* 00F324 01DBB024 9E3F040C */  jal         dpmul
/* 00F328 01DBB028 00000000 */   nop
/* 00F32C 01DBB02C 28264070 */  paddub      $4, $2, $0
/* 00F330 01DBB030 9241040C */  jal         dptofp
/* 00F334 01DBB034 00000000 */   nop
/* 00F338 01DBB038 06030046 */  mov.s       $f12, $f0
/* 00F33C 01DBB03C 2C44040C */  jal         fptosi
/* 00F340 01DBB040 00000000 */   nop
/* 00F344 01DBB044 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00F348 01DBB048 282E0070 */  paddub      $5, $0, $0
/* 00F34C 01DBB04C 28364070 */  paddub      $6, $2, $0
/* 00F350 01DBB050 581A050C */  jal         SetVol__6CSoundFii
/* 00F354 01DBB054 00000000 */   nop
/* 00F358 01DBB058 01000424 */  addiu       $4, $0, 0x1
/* 00F35C 01DBB05C BCC4760C */  jal         OpGetVolSQ__Fi
/* 00F360 01DBB060 00000000 */   nop
/* 00F364 01DBB064 28264070 */  paddub      $4, $2, $0
/* 00F368 01DBB068 FC40040C */  jal         litodp
/* 00F36C 01DBB06C 00000000 */   nop
/* 00F370 01DBB070 408084DF */  ld          $4, -0x7FC0($28)
/* 00F374 01DBB074 282E4070 */  paddub      $5, $2, $0
/* 00F378 01DBB078 9E3F040C */  jal         dpmul
/* 00F37C 01DBB07C 00000000 */   nop
/* 00F380 01DBB080 28264070 */  paddub      $4, $2, $0
/* 00F384 01DBB084 9241040C */  jal         dptofp
/* 00F388 01DBB088 00000000 */   nop
/* 00F38C 01DBB08C 06030046 */  mov.s       $f12, $f0
/* 00F390 01DBB090 2C44040C */  jal         fptosi
/* 00F394 01DBB094 00000000 */   nop
/* 00F398 01DBB098 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 00F39C 01DBB09C 01000524 */  addiu       $5, $0, 0x1
/* 00F3A0 01DBB0A0 28364070 */  paddub      $6, $2, $0
/* 00F3A4 01DBB0A4 581A050C */  jal         SetVol__6CSoundFii
/* 00F3A8 01DBB0A8 00000000 */   nop
.L01DBB0AC_2C08AC:
/* 00F3AC 01DBB0AC DE01013C */  lui         $1, %hi(CScript__2)
/* 00F3B0 01DBB0B0 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00F3B4 01DBB0B4 37000224 */  addiu       $2, $0, 0x37
/* 00F3B8 01DBB0B8 42006214 */  bne         $3, $2, .L01DBB1C4_2C09C4
/* 00F3BC 01DBB0BC 00000000 */   nop
/* 00F3C0 01DBB0C0 DE01013C */  lui         $1, %hi(CScript__2 + 0x23C)
/* 00F3C4 01DBB0C4 3C1D238C */  lw          $3, %lo(CScript__2 + 0x23C)($1)
/* 00F3C8 01DBB0C8 06000224 */  addiu       $2, $0, 0x6
/* 00F3CC 01DBB0CC 3D006214 */  bne         $3, $2, .L01DBB1C4_2C09C4
/* 00F3D0 01DBB0D0 00000000 */   nop
/* 00F3D4 01DBB0D4 C8998283 */  lb          $2, -0x6638($28)
/* 00F3D8 01DBB0D8 04004014 */  bnez        $2, .L01DBB0EC_2C08EC
/* 00F3DC 01DBB0DC 00000000 */   nop
/* 00F3E0 01DBB0E0 C49980AF */  sw          $0, -0x663C($28)
/* 00F3E4 01DBB0E4 01000224 */  addiu       $2, $0, 0x1
/* 00F3E8 01DBB0E8 C89982A3 */  sb          $2, -0x6638($28)
.L01DBB0EC_2C08EC:
/* 00F3EC 01DBB0EC 4000A427 */  addiu       $4, $29, 0x40
/* 00F3F0 01DBB0F0 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x1650)
/* 00F3F4 01DBB0F4 209E4524 */  addiu       $5, $2, %lo(MainMonstorUnit + 0x1650)
/* 00F3F8 01DBB0F8 0C86040C */  jal         sceVu0CopyVector
/* 00F3FC 01DBB0FC 00000000 */   nop
/* 00F400 01DBB100 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x2AE0)
/* 00F404 01DBB104 B0B22CC4 */  lwc1        $f12, %lo(MainMonstorUnit + 0x2AE0)($1)
/* 00F408 01DBB108 2C44040C */  jal         fptosi
/* 00F40C 01DBB10C 00000000 */   nop
/* 00F410 01DBB110 C499838F */  lw          $3, -0x663C($28)
/* 00F414 01DBB114 29006014 */  bnez        $3, .L01DBB1BC_2C09BC
/* 00F418 01DBB118 00000000 */   nop
/* 00F41C 01DBB11C 87004128 */  slti        $1, $2, 0x87
/* 00F420 01DBB120 12002014 */  bnez        $1, .L01DBB16C_2C096C
/* 00F424 01DBB124 00000000 */   nop
/* 00F428 01DBB128 88004128 */  slti        $1, $2, 0x88
/* 00F42C 01DBB12C 0F002010 */  beqz        $1, .L01DBB16C_2C096C
/* 00F430 01DBB130 00000000 */   nop
/* 00F434 01DBB134 4842023C */  lui         $2, (0x42480000 >> 16)
/* 00F438 01DBB138 00608244 */  mtc1        $2, $f12
/* 00F43C 01DBB13C 9643023C */  lui         $2, (0x43960000 >> 16)
/* 00F440 01DBB140 00688244 */  mtc1        $2, $f13
/* 00F444 01DBB144 4000A427 */  addiu       $4, $29, 0x40
/* 00F448 01DBB148 0E000524 */  addiu       $5, $0, 0xE
/* 00F44C 01DBB14C 15000624 */  addiu       $6, $0, 0x15
/* 00F450 01DBB150 20000724 */  addiu       $7, $0, 0x20
/* 00F454 01DBB154 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F458 01DBB158 00000000 */   nop
/* 00F45C 01DBB15C 05000224 */  addiu       $2, $0, 0x5
/* 00F460 01DBB160 C49982AF */  sw          $2, -0x663C($28)
/* 00F464 01DBB164 17000010 */  b           .L01DBB1C4_2C09C4
/* 00F468 01DBB168 00000000 */   nop
.L01DBB16C_2C096C:
/* 00F46C 01DBB16C 91004128 */  slti        $1, $2, 0x91
/* 00F470 01DBB170 14002014 */  bnez        $1, .L01DBB1C4_2C09C4
/* 00F474 01DBB174 00000000 */   nop
/* 00F478 01DBB178 92004128 */  slti        $1, $2, 0x92
/* 00F47C 01DBB17C 11002010 */  beqz        $1, .L01DBB1C4_2C09C4
/* 00F480 01DBB180 00000000 */   nop
/* 00F484 01DBB184 9643023C */  lui         $2, (0x43960000 >> 16)
/* 00F488 01DBB188 00688244 */  mtc1        $2, $f13
/* 00F48C 01DBB18C 4842023C */  lui         $2, (0x42480000 >> 16)
/* 00F490 01DBB190 00608244 */  mtc1        $2, $f12
/* 00F494 01DBB194 4000A427 */  addiu       $4, $29, 0x40
/* 00F498 01DBB198 0E000524 */  addiu       $5, $0, 0xE
/* 00F49C 01DBB19C 15000624 */  addiu       $6, $0, 0x15
/* 00F4A0 01DBB1A0 21000724 */  addiu       $7, $0, 0x21
/* 00F4A4 01DBB1A4 D0C3760C */  jal         OpPlayVolPanSE__FPfffiii
/* 00F4A8 01DBB1A8 00000000 */   nop
/* 00F4AC 01DBB1AC 05000224 */  addiu       $2, $0, 0x5
/* 00F4B0 01DBB1B0 C49982AF */  sw          $2, -0x663C($28)
/* 00F4B4 01DBB1B4 03000010 */  b           .L01DBB1C4_2C09C4
/* 00F4B8 01DBB1B8 00000000 */   nop
.L01DBB1BC_2C09BC:
/* 00F4BC 01DBB1BC FFFF6224 */  addiu       $2, $3, -0x1
/* 00F4C0 01DBB1C0 C49982AF */  sw          $2, -0x663C($28)
.L01DBB1C4_2C09C4:
/* 00F4C4 01DBB1C4 5000A427 */  addiu       $4, $29, 0x50
/* 00F4C8 01DBB1C8 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x2800)
/* 00F4CC 01DBB1CC D0AF4524 */  addiu       $5, $2, %lo(MainMonstorUnit + 0x2800)
/* 00F4D0 01DBB1D0 0C86040C */  jal         sceVu0CopyVector
/* 00F4D4 01DBB1D4 00000000 */   nop
/* 00F4D8 01DBB1D8 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 00F4DC 01DBB1DC 00608244 */  mtc1        $2, $f12
/* 00F4E0 01DBB1E0 4843023C */  lui         $2, (0x43480000 >> 16)
/* 00F4E4 01DBB1E4 00688244 */  mtc1        $2, $f13
/* 00F4E8 01DBB1E8 5000A427 */  addiu       $4, $29, 0x50
/* 00F4EC 01DBB1EC 0E000524 */  addiu       $5, $0, 0xE
/* 00F4F0 01DBB1F0 28000624 */  addiu       $6, $0, 0x28
/* 00F4F4 01DBB1F4 27000724 */  addiu       $7, $0, 0x27
/* 00F4F8 01DBB1F8 28C4760C */  jal         OpSetVolPanSE__FPfffiii
/* 00F4FC 01DBB1FC 00000000 */   nop
.L01DBB200_2C0A00:
/* 00F500 01DBB200 1000BF7B */  lq          $31, 0x10($29)
/* 00F504 01DBB204 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00F508 01DBB208 6000BD27 */  addiu       $29, $29, 0x60
/* 00F50C 01DBB20C 0800E003 */  jr          $31
/* 00F510 01DBB210 00000000 */   nop
/* 00F514 01DBB214 00000000 */  nop
/* 00F518 01DBB218 00000000 */  nop
/* 00F51C 01DBB21C 00000000 */  nop
