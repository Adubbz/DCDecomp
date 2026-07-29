.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcA__Fv
/* 020090 01DCBD90 C0FEBD27 */  addiu       $29, $29, -0x140
/* 020094 01DCBD94 2000BF7F */  sq          $31, 0x20($29)
/* 020098 01DCBD98 1000B17F */  sq          $17, 0x10($29)
/* 02009C 01DCBD9C 0000B07F */  sq          $16, 0x0($29)
/* 0200A0 01DCBDA0 DE01023C */  lui         $2, %hi(LIT_957__3)
/* 0200A4 01DCBDA4 50B24524 */  addiu       $5, $2, %lo(LIT_957__3)
/* 0200A8 01DCBDA8 3000A427 */  addiu       $4, $29, 0x30
/* 0200AC 01DCBDAC 04000324 */  addiu       $3, $0, 0x4
.L01DCBDB0_2D15B0:
/* 0200B0 01DCBDB0 0000A278 */  lq          $2, 0x0($5)
/* 0200B4 01DCBDB4 1000A524 */  addiu       $5, $5, 0x10
/* 0200B8 01DCBDB8 FFFF6324 */  addiu       $3, $3, -0x1
/* 0200BC 01DCBDBC 0000827C */  sq          $2, 0x0($4)
/* 0200C0 01DCBDC0 10008424 */  addiu       $4, $4, 0x10
/* 0200C4 01DCBDC4 FAFF601C */  bgtz        $3, .L01DCBDB0_2D15B0
/* 0200C8 01DCBDC8 00000000 */   nop
/* 0200CC 01DCBDCC 7000A427 */  addiu       $4, $29, 0x70
/* 0200D0 01DCBDD0 2500023C */  lui         $2, %hi(lightcolor)
/* 0200D4 01DCBDD4 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 0200D8 01DCBDD8 1086040C */  jal         sceVu0CopyMatrix
/* 0200DC 01DCBDDC 00000000 */   nop
/* 0200E0 01DCBDE0 B000A427 */  addiu       $4, $29, 0xB0
/* 0200E4 01DCBDE4 3000A527 */  addiu       $5, $29, 0x30
/* 0200E8 01DCBDE8 1086040C */  jal         sceVu0CopyMatrix
/* 0200EC 01DCBDEC 00000000 */   nop
/* 0200F0 01DCBDF0 209C8283 */  lb          $2, -0x63E0($28)
/* 0200F4 01DCBDF4 04004014 */  bnez        $2, .L01DCBE08_2D1608
/* 0200F8 01DCBDF8 00000000 */   nop
/* 0200FC 01DCBDFC 1C9C80AF */  sw          $0, -0x63E4($28)
/* 020100 01DCBE00 01000224 */  addiu       $2, $0, 0x1
/* 020104 01DCBE04 209C82A3 */  sb          $2, -0x63E0($28)
.L01DCBE08_2D1608:
/* 020108 01DCBE08 289C8283 */  lb          $2, -0x63D8($28)
/* 02010C 01DCBE0C 04004014 */  bnez        $2, .L01DCBE20_2D1620
/* 020110 01DCBE10 00000000 */   nop
/* 020114 01DCBE14 249C80AF */  sw          $0, -0x63DC($28)
/* 020118 01DCBE18 01000224 */  addiu       $2, $0, 0x1
/* 02011C 01DCBE1C 289C82A3 */  sb          $2, -0x63D8($28)
.L01DCBE20_2D1620:
/* 020120 01DCBE20 BE11040C */  jal         rand
/* 020124 01DCBE24 00000000 */   nop
/* 020128 01DCBE28 7F000324 */  addiu       $3, $0, 0x7F
/* 02012C 01DCBE2C 1A004300 */  div         $0, $2, $3
/* 020130 01DCBE30 00000000 */  nop
/* 020134 01DCBE34 00000000 */  nop
/* 020138 01DCBE38 10100000 */  mfhi        $2
/* 02013C 01DCBE3C 14004014 */  bnez        $2, .L01DCBE90_2D1690
/* 020140 01DCBE40 00000000 */   nop
/* 020144 01DCBE44 FE000224 */  addiu       $2, $0, 0xFE
/* 020148 01DCBE48 249C82AF */  sw          $2, -0x63DC($28)
/* 02014C 01DCBE4C 04000224 */  addiu       $2, $0, 0x4
/* 020150 01DCBE50 1C9C82AF */  sw          $2, -0x63E4($28)
/* 020154 01DCBE54 BE11040C */  jal         rand
/* 020158 01DCBE58 00000000 */   nop
/* 02015C 01DCBE5C 06000324 */  addiu       $3, $0, 0x6
/* 020160 01DCBE60 1A004300 */  div         $0, $2, $3
/* 020164 01DCBE64 00000000 */  nop
/* 020168 01DCBE68 00000000 */  nop
/* 02016C 01DCBE6C 10100000 */  mfhi        $2
/* 020170 01DCBE70 06004128 */  slti        $1, $2, 0x6
/* 020174 01DCBE74 06002010 */  beqz        $1, .L01DCBE90_2D1690
/* 020178 01DCBE78 00000000 */   nop
/* 02017C 01DCBE7C 43004424 */  addiu       $4, $2, 0x43
/* 020180 01DCBE80 FFFF0524 */  addiu       $5, $0, -0x1
/* 020184 01DCBE84 28360070 */  paddub      $6, $0, $0
/* 020188 01DCBE88 AC69050C */  jal         SndSePlay__Fiii
/* 02018C 01DCBE8C 00000000 */   nop
.L01DCBE90_2D1690:
/* 020190 01DCBE90 E301013C */  lui         $1, %hi(CScript)
/* 020194 01DCBE94 C0E9228C */  lw          $2, %lo(CScript)($1)
/* 020198 01DCBE98 1D004014 */  bnez        $2, .L01DCBF10_2D1710
/* 02019C 01DCBE9C 00000000 */   nop
/* 0201A0 01DCBEA0 C09B838F */  lw          $3, -0x6440($28)
/* 0201A4 01DCBEA4 B0110224 */  addiu       $2, $0, 0x11B0
/* 0201A8 01DCBEA8 18186200 */  mult        $3, $3, $2
/* 0201AC 01DCBEAC E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 0201B0 01DCBEB0 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 0201B4 01DCBEB4 21104300 */  addu        $2, $2, $3
/* 0201B8 01DCBEB8 000041C4 */  lwc1        $f1, 0x0($2)
/* 0201BC 01DCBEBC A041023C */  lui         $2, (0x41A00000 >> 16)
/* 0201C0 01DCBEC0 00008244 */  mtc1        $2, $f0
/* 0201C4 01DCBEC4 00000000 */  nop
/* 0201C8 01DCBEC8 36080046 */  c.le.s      $f1, $f0
/* 0201CC 01DCBECC 00000000 */  nop
/* 0201D0 01DCBED0 0F000145 */  bc1t        .L01DCBF10_2D1710
/* 0201D4 01DCBED4 00000000 */   nop
/* 0201D8 01DCBED8 D49B828F */  lw          $2, -0x642C($28)
/* 0201DC 01DCBEDC 0C004014 */  bnez        $2, .L01DCBF10_2D1710
/* 0201E0 01DCBEE0 00000000 */   nop
/* 0201E4 01DCBEE4 01000224 */  addiu       $2, $0, 0x1
/* 0201E8 01DCBEE8 D49B82AF */  sw          $2, -0x642C($28)
/* 0201EC 01DCBEEC FE000224 */  addiu       $2, $0, 0xFE
/* 0201F0 01DCBEF0 249C82AF */  sw          $2, -0x63DC($28)
/* 0201F4 01DCBEF4 04000224 */  addiu       $2, $0, 0x4
/* 0201F8 01DCBEF8 1C9C82AF */  sw          $2, -0x63E4($28)
/* 0201FC 01DCBEFC 4A000424 */  addiu       $4, $0, 0x4A
/* 020200 01DCBF00 FFFF0524 */  addiu       $5, $0, -0x1
/* 020204 01DCBF04 28360070 */  paddub      $6, $0, $0
/* 020208 01DCBF08 AC69050C */  jal         SndSePlay__Fiii
/* 02020C 01DCBF0C 00000000 */   nop
.L01DCBF10_2D1710:
/* 020210 01DCBF10 281E0070 */  paddub      $3, $0, $0
/* 020214 01DCBF14 4F000010 */  b           .L01DCC054_2D1854
/* 020218 01DCBF18 00000000 */   nop
.L01DCBF1C_2D171C:
/* 02021C 01DCBF1C 00290300 */  sll         $5, $3, 4
/* 020220 01DCBF20 2500023C */  lui         $2, %hi(lightcolor)
/* 020224 01DCBF24 C01B4224 */  addiu       $2, $2, %lo(lightcolor)
/* 020228 01DCBF28 21104500 */  addu        $2, $2, $5
/* 02022C 01DCBF2C 000041C4 */  lwc1        $f1, 0x0($2)
/* 020230 01DCBF30 249C848F */  lw          $4, -0x63DC($28)
/* 020234 01DCBF34 00008444 */  mtc1        $4, $f0
/* 020238 01DCBF38 00000000 */  nop
/* 02023C 01DCBF3C 20008046 */  cvt.s.w     $f0, $f0
/* 020240 01DCBF40 34080046 */  c.lt.s      $f1, $f0
/* 020244 01DCBF44 00000000 */  nop
/* 020248 01DCBF48 03000045 */  bc1f        .L01DCBF58_2D1758
/* 02024C 01DCBF4C 00000000 */   nop
/* 020250 01DCBF50 2110BD00 */  addu        $2, $5, $29
/* 020254 01DCBF54 700040E4 */  swc1        $f0, 0x70($2)
.L01DCBF58_2D1758:
/* 020258 01DCBF58 2500023C */  lui         $2, %hi(lightcolor + 0x4)
/* 02025C 01DCBF5C C41B4224 */  addiu       $2, $2, %lo(lightcolor + 0x4)
/* 020260 01DCBF60 21104500 */  addu        $2, $2, $5
/* 020264 01DCBF64 000041C4 */  lwc1        $f1, 0x0($2)
/* 020268 01DCBF68 00008444 */  mtc1        $4, $f0
/* 02026C 01DCBF6C 00000000 */  nop
/* 020270 01DCBF70 20008046 */  cvt.s.w     $f0, $f0
/* 020274 01DCBF74 34080046 */  c.lt.s      $f1, $f0
/* 020278 01DCBF78 00000000 */  nop
/* 02027C 01DCBF7C 03000045 */  bc1f        .L01DCBF8C_2D178C
/* 020280 01DCBF80 00000000 */   nop
/* 020284 01DCBF84 2110BD00 */  addu        $2, $5, $29
/* 020288 01DCBF88 740040E4 */  swc1        $f0, 0x74($2)
.L01DCBF8C_2D178C:
/* 02028C 01DCBF8C 2500023C */  lui         $2, %hi(lightcolor + 0x8)
/* 020290 01DCBF90 C81B4224 */  addiu       $2, $2, %lo(lightcolor + 0x8)
/* 020294 01DCBF94 21104500 */  addu        $2, $2, $5
/* 020298 01DCBF98 000041C4 */  lwc1        $f1, 0x0($2)
/* 02029C 01DCBF9C 00008444 */  mtc1        $4, $f0
/* 0202A0 01DCBFA0 00000000 */  nop
/* 0202A4 01DCBFA4 20008046 */  cvt.s.w     $f0, $f0
/* 0202A8 01DCBFA8 34080046 */  c.lt.s      $f1, $f0
/* 0202AC 01DCBFAC 00000000 */  nop
/* 0202B0 01DCBFB0 03000045 */  bc1f        .L01DCBFC0_2D17C0
/* 0202B4 01DCBFB4 00000000 */   nop
/* 0202B8 01DCBFB8 2110BD00 */  addu        $2, $5, $29
/* 0202BC 01DCBFBC 780040E4 */  swc1        $f0, 0x78($2)
.L01DCBFC0_2D17C0:
/* 0202C0 01DCBFC0 2110BD00 */  addu        $2, $5, $29
/* 0202C4 01DCBFC4 300041C4 */  lwc1        $f1, 0x30($2)
/* 0202C8 01DCBFC8 00008444 */  mtc1        $4, $f0
/* 0202CC 01DCBFCC 00000000 */  nop
/* 0202D0 01DCBFD0 20008046 */  cvt.s.w     $f0, $f0
/* 0202D4 01DCBFD4 34080046 */  c.lt.s      $f1, $f0
/* 0202D8 01DCBFD8 00000000 */  nop
/* 0202DC 01DCBFDC 02000045 */  bc1f        .L01DCBFE8_2D17E8
/* 0202E0 01DCBFE0 00000000 */   nop
/* 0202E4 01DCBFE4 B00040E4 */  swc1        $f0, 0xB0($2)
.L01DCBFE8_2D17E8:
/* 0202E8 01DCBFE8 2110BD00 */  addu        $2, $5, $29
/* 0202EC 01DCBFEC 340041C4 */  lwc1        $f1, 0x34($2)
/* 0202F0 01DCBFF0 00008444 */  mtc1        $4, $f0
/* 0202F4 01DCBFF4 00000000 */  nop
/* 0202F8 01DCBFF8 20008046 */  cvt.s.w     $f0, $f0
/* 0202FC 01DCBFFC 34080046 */  c.lt.s      $f1, $f0
/* 020300 01DCC000 00000000 */  nop
/* 020304 01DCC004 02000045 */  bc1f        .L01DCC010_2D1810
/* 020308 01DCC008 00000000 */   nop
/* 02030C 01DCC00C B40040E4 */  swc1        $f0, 0xB4($2)
.L01DCC010_2D1810:
/* 020310 01DCC010 2110BD00 */  addu        $2, $5, $29
/* 020314 01DCC014 380041C4 */  lwc1        $f1, 0x38($2)
/* 020318 01DCC018 00008444 */  mtc1        $4, $f0
/* 02031C 01DCC01C 00000000 */  nop
/* 020320 01DCC020 20008046 */  cvt.s.w     $f0, $f0
/* 020324 01DCC024 34080046 */  c.lt.s      $f1, $f0
/* 020328 01DCC028 00000000 */  nop
/* 02032C 01DCC02C 02000045 */  bc1f        .L01DCC038_2D1838
/* 020330 01DCC030 00000000 */   nop
/* 020334 01DCC034 B80040E4 */  swc1        $f0, 0xB8($2)
.L01DCC038_2D1838:
/* 020338 01DCC038 03008128 */  slti        $1, $4, 0x3
/* 02033C 01DCC03C 04002014 */  bnez        $1, .L01DCC050_2D1850
/* 020340 01DCC040 00000000 */   nop
/* 020344 01DCC044 249C828F */  lw          $2, -0x63DC($28)
/* 020348 01DCC048 FEFF4224 */  addiu       $2, $2, -0x2
/* 02034C 01DCC04C 249C82AF */  sw          $2, -0x63DC($28)
.L01DCC050_2D1850:
/* 020350 01DCC050 01006324 */  addiu       $3, $3, 0x1
.L01DCC054_2D1854:
/* 020354 01DCC054 04006228 */  slti        $2, $3, 0x4
/* 020358 01DCC058 B0FF4014 */  bnez        $2, .L01DCBF1C_2D171C
/* 02035C 01DCC05C 00000000 */   nop
/* 020360 01DCC060 E301013C */  lui         $1, %hi(CScript)
/* 020364 01DCC064 C0E9238C */  lw          $3, %lo(CScript)($1)
/* 020368 01DCC068 02000224 */  addiu       $2, $0, 0x2
/* 02036C 01DCC06C 13006214 */  bne         $3, $2, .L01DCC0BC_2D18BC
/* 020370 01DCC070 00000000 */   nop
/* 020374 01DCC074 0040023C */  lui         $2, (0x40000000 >> 16)
/* 020378 01DCC078 00688244 */  mtc1        $2, $f13
/* 02037C 01DCC07C 00000000 */  nop
/* 020380 01DCC080 866B0046 */  mov.s       $f14, $f13
/* 020384 01DCC084 066B0046 */  mov.s       $f12, $f13
/* 020388 01DCC088 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 02038C 01DCC08C 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 020390 01DCC090 94E4040C */  jal         SetScale__10CCharacterFfff
/* 020394 01DCC094 00000000 */   nop
/* 020398 01DCC098 0040023C */  lui         $2, (0x40000000 >> 16)
/* 02039C 01DCC09C 00608244 */  mtc1        $2, $f12
/* 0203A0 01DCC0A0 00000000 */  nop
/* 0203A4 01DCC0A4 46630046 */  mov.s       $f13, $f12
/* 0203A8 01DCC0A8 86630046 */  mov.s       $f14, $f12
/* 0203AC 01DCC0AC E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 0203B0 01DCC0B0 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 0203B4 01DCC0B4 94E4040C */  jal         SetScale__10CCharacterFfff
/* 0203B8 01DCC0B8 00000000 */   nop
.L01DCC0BC_2D18BC:
/* 0203BC 01DCC0BC 28860070 */  paddub      $16, $0, $0
/* 0203C0 01DCC0C0 2A000010 */  b           .L01DCC16C_2D196C
/* 0203C4 01DCC0C4 00000000 */   nop
.L01DCC0C8_2D18C8:
/* 0203C8 01DCC0C8 40101000 */  sll         $2, $16, 1
/* 0203CC 01DCC0CC 21105000 */  addu        $2, $2, $16
/* 0203D0 01DCC0D0 80100200 */  sll         $2, $2, 2
/* 0203D4 01DCC0D4 21105000 */  addu        $2, $2, $16
/* 0203D8 01DCC0D8 80180200 */  sll         $3, $2, 2
/* 0203DC 01DCC0DC E301023C */  lui         $2, %hi(CScript + 0x30)
/* 0203E0 01DCC0E0 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 0203E4 01DCC0E4 21104300 */  addu        $2, $2, $3
/* 0203E8 01DCC0E8 00004290 */  lbu         $2, 0x0($2)
/* 0203EC 01DCC0EC 1E004010 */  beqz        $2, .L01DCC168_2D1968
/* 0203F0 01DCC0F0 00000000 */   nop
/* 0203F4 01DCC0F4 E401023C */  lui         $2, %hi(CharaTex)
/* 0203F8 01DCC0F8 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 0203FC 01DCC0FC 21105000 */  addu        $2, $2, $16
/* 020400 01DCC100 00004680 */  lb          $6, 0x0($2)
/* 020404 01DCC104 C701023C */  lui         $2, %hi(TexManager)
/* 020408 01DCC108 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02040C 01DCC10C D48B858F */  lw          $5, -0x742C($28)
/* 020410 01DCC110 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 020414 01DCC114 00000000 */   nop
/* 020418 01DCC118 B0110224 */  addiu       $2, $0, 0x11B0
/* 02041C 01DCC11C 18180202 */  mult        $3, $16, $2
/* 020420 01DCC120 DF01023C */  lui         $2, %hi(Chara__3)
/* 020424 01DCC124 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 020428 01DCC128 21884300 */  addu        $17, $2, $3
/* 02042C 01DCC12C 28262072 */  paddub      $4, $17, $0
/* 020430 01DCC130 4CE1040C */  jal         Step__10CCharacterFv
/* 020434 01DCC134 00000000 */   nop
/* 020438 01DCC138 28262072 */  paddub      $4, $17, $0
/* 02043C 01DCC13C 282E0070 */  paddub      $5, $0, $0
/* 020440 01DCC140 94E3040C */  jal         ClothStep__10CCharacterFi
/* 020444 01DCC144 00000000 */   nop
/* 020448 01DCC148 2500023C */  lui         $2, %hi(light)
/* 02044C 01DCC14C 801B4424 */  addiu       $4, $2, %lo(light)
/* 020450 01DCC150 B000A527 */  addiu       $5, $29, 0xB0
/* 020454 01DCC154 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 020458 01DCC158 00000000 */   nop
/* 02045C 01DCC15C 28262072 */  paddub      $4, $17, $0
/* 020460 01DCC160 C4E4040C */  jal         Draw__10CCharacterFv
/* 020464 01DCC164 00000000 */   nop
.L01DCC168_2D1968:
/* 020468 01DCC168 01001026 */  addiu       $16, $16, 0x1
.L01DCC16C_2D196C:
/* 02046C 01DCC16C 0900022A */  slti        $2, $16, 0x9
/* 020470 01DCC170 D5FF4014 */  bnez        $2, .L01DCC0C8_2D18C8
/* 020474 01DCC174 00000000 */   nop
/* 020478 01DCC178 2500023C */  lui         $2, %hi(light)
/* 02047C 01DCC17C 801B4424 */  addiu       $4, $2, %lo(light)
/* 020480 01DCC180 7000A527 */  addiu       $5, $29, 0x70
/* 020484 01DCC184 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 020488 01DCC188 00000000 */   nop
/* 02048C 01DCC18C C701023C */  lui         $2, %hi(TexManager)
/* 020490 01DCC190 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 020494 01DCC194 D48B858F */  lw          $5, -0x742C($28)
/* 020498 01DCC198 0A000624 */  addiu       $6, $0, 0xA
/* 02049C 01DCC19C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0204A0 01DCC1A0 00000000 */   nop
/* 0204A4 01DCC1A4 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 0204A8 01DCC1A8 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 0204AC 01DCC1AC 282E0070 */  paddub      $5, $0, $0
/* 0204B0 01DCC1B0 600E050C */  jal         GetObject__4CMapFi
/* 0204B4 01DCC1B4 00000000 */   nop
/* 0204B8 01DCC1B8 28864070 */  paddub      $16, $2, $0
/* 0204BC 01DCC1BC E301023C */  lui         $2, %hi(MainCamera__3)
/* 0204C0 01DCC1C0 80E64424 */  addiu       $4, $2, %lo(MainCamera__3)
/* 0204C4 01DCC1C4 F000A527 */  addiu       $5, $29, 0xF0
/* 0204C8 01DCC1C8 9C91040C */  jal         GetPos__7CCameraFPf
/* 0204CC 01DCC1CC 00000000 */   nop
/* 0204D0 01DCC1D0 28260072 */  paddub      $4, $16, $0
/* 0204D4 01DCC1D4 F000A527 */  addiu       $5, $29, 0xF0
/* 0204D8 01DCC1D8 A000198E */  lw          $25, 0xA0($16)
/* 0204DC 01DCC1DC 1400398F */  lw          $25, 0x14($25)
/* 0204E0 01DCC1E0 09F82003 */  jalr        $25
/* 0204E4 01DCC1E4 00000000 */   nop
/* 0204E8 01DCC1E8 1C9C828F */  lw          $2, -0x63E4($28)
/* 0204EC 01DCC1EC 0B004010 */  beqz        $2, .L01DCC21C_2D1A1C
/* 0204F0 01DCC1F0 00000000 */   nop
/* 0204F4 01DCC1F4 28260072 */  paddub      $4, $16, $0
/* 0204F8 01DCC1F8 DE01023C */  lui         $2, %hi(LIT_952__2)
/* 0204FC 01DCC1FC C8024524 */  addiu       $5, $2, %lo(LIT_952__2)
/* 020500 01DCC200 01000624 */  addiu       $6, $0, 0x1
/* 020504 01DCC204 A000198E */  lw          $25, 0xA0($16)
/* 020508 01DCC208 9000398F */  lw          $25, 0x90($25)
/* 02050C 01DCC20C 09F82003 */  jalr        $25
/* 020510 01DCC210 00000000 */   nop
/* 020514 01DCC214 28000010 */  b           .L01DCC2B8_2D1AB8
/* 020518 01DCC218 00000000 */   nop
.L01DCC21C_2D1A1C:
/* 02051C 01DCC21C 28260072 */  paddub      $4, $16, $0
/* 020520 01DCC220 DE01023C */  lui         $2, %hi(LIT_952__2)
/* 020524 01DCC224 C8024524 */  addiu       $5, $2, %lo(LIT_952__2)
/* 020528 01DCC228 28360070 */  paddub      $6, $0, $0
/* 02052C 01DCC22C A000198E */  lw          $25, 0xA0($16)
/* 020530 01DCC230 9000398F */  lw          $25, 0x90($25)
/* 020534 01DCC234 09F82003 */  jalr        $25
/* 020538 01DCC238 00000000 */   nop
/* 02053C 01DCC23C BE11040C */  jal         rand
/* 020540 01DCC240 00000000 */   nop
/* 020544 01DCC244 0A000324 */  addiu       $3, $0, 0xA
/* 020548 01DCC248 1A004300 */  div         $0, $2, $3
/* 02054C 01DCC24C 00000000 */  nop
/* 020550 01DCC250 00000000 */  nop
/* 020554 01DCC254 10100000 */  mfhi        $2
/* 020558 01DCC258 00008244 */  mtc1        $2, $f0
/* 02055C 01DCC25C 00000000 */  nop
/* 020560 01DCC260 60008046 */  cvt.s.w     $f1, $f0
/* 020564 01DCC264 2041023C */  lui         $2, (0x41200000 >> 16)
/* 020568 01DCC268 00008244 */  mtc1        $2, $f0
/* 02056C 01DCC26C 00000000 */  nop
/* 020570 01DCC270 03080046 */  div.s       $f0, $f1, $f0
/* 020574 01DCC274 B498848F */  lw          $4, -0x674C($28)
/* 020578 01DCC278 C0100400 */  sll         $2, $4, 3
/* 02057C 01DCC27C 21104400 */  addu        $2, $2, $4
/* 020580 01DCC280 00190200 */  sll         $3, $2, 4
/* 020584 01DCC284 E201023C */  lui         $2, %hi(OP_GroundMap + 0xAA0)
/* 020588 01DCC288 D0C44224 */  addiu       $2, $2, %lo(OP_GroundMap + 0xAA0)
/* 02058C 01DCC28C 21104300 */  addu        $2, $2, $3
/* 020590 01DCC290 000040E4 */  swc1        $f0, 0x0($2)
/* 020594 01DCC294 FFFF8324 */  addiu       $3, $4, -0x1
/* 020598 01DCC298 C0100300 */  sll         $2, $3, 3
/* 02059C 01DCC29C 21104300 */  addu        $2, $2, $3
/* 0205A0 01DCC2A0 00190200 */  sll         $3, $2, 4
/* 0205A4 01DCC2A4 E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 0205A8 01DCC2A8 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 0205AC 01DCC2AC 21204300 */  addu        $4, $2, $3
/* 0205B0 01DCC2B0 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 0205B4 01DCC2B4 00000000 */   nop
.L01DCC2B8_2D1AB8:
/* 0205B8 01DCC2B8 1C9C828F */  lw          $2, -0x63E4($28)
/* 0205BC 01DCC2BC 03004018 */  blez        $2, .L01DCC2CC_2D1ACC
/* 0205C0 01DCC2C0 00000000 */   nop
/* 0205C4 01DCC2C4 FFFF4224 */  addiu       $2, $2, -0x1
/* 0205C8 01DCC2C8 1C9C82AF */  sw          $2, -0x63E4($28)
.L01DCC2CC_2D1ACC:
/* 0205CC 01DCC2CC DE01023C */  lui         $2, %hi(LIT_1006)
/* 0205D0 01DCC2D0 90B24224 */  addiu       $2, $2, %lo(LIT_1006)
/* 0205D4 01DCC2D4 0001A427 */  addiu       $4, $29, 0x100
/* 0205D8 01DCC2D8 00004278 */  lq          $2, 0x0($2)
/* 0205DC 01DCC2DC 0000827C */  sq          $2, 0x0($4)
/* 0205E0 01DCC2E0 40B7040C */  jal         MGSetAmbient__FPf
/* 0205E4 01DCC2E4 00000000 */   nop
/* 0205E8 01DCC2E8 2801A527 */  addiu       $5, $29, 0x128
/* 0205EC 01DCC2EC F88B82DF */  ld          $2, -0x7408($28)
/* 0205F0 01DCC2F0 0000A2FC */  sd          $2, 0x0($5)
/* 0205F4 01DCC2F4 2801A393 */  lbu         $3, 0x128($29)
/* 0205F8 01DCC2F8 03000630 */  andi        $6, $0, 0x3
/* 0205FC 01DCC2FC FCFF0224 */  addiu       $2, $0, -0x4
/* 020600 01DCC300 24106200 */  and         $2, $3, $2
/* 020604 01DCC304 25104600 */  or          $2, $2, $6
/* 020608 01DCC308 2801A2A3 */  sb          $2, 0x128($29)
/* 02060C 01DCC30C 2801A493 */  lbu         $4, 0x128($29)
/* 020610 01DCC310 08000364 */  daddiu      $3, $0, 0x8
/* 020614 01DCC314 F3FF0224 */  addiu       $2, $0, -0xD
/* 020618 01DCC318 24108200 */  and         $2, $4, $2
/* 02061C 01DCC31C 25104300 */  or          $2, $2, $3
/* 020620 01DCC320 2801A2A3 */  sb          $2, 0x128($29)
/* 020624 01DCC324 2801A493 */  lbu         $4, 0x128($29)
/* 020628 01DCC328 00190600 */  sll         $3, $6, 4
/* 02062C 01DCC32C CFFF0224 */  addiu       $2, $0, -0x31
/* 020630 01DCC330 24108200 */  and         $2, $4, $2
/* 020634 01DCC334 25104300 */  or          $2, $2, $3
/* 020638 01DCC338 2801A2A3 */  sb          $2, 0x128($29)
/* 02063C 01DCC33C 2801A493 */  lbu         $4, 0x128($29)
/* 020640 01DCC340 40000364 */  daddiu      $3, $0, 0x40
/* 020644 01DCC344 3FFF0224 */  addiu       $2, $0, -0xC1
/* 020648 01DCC348 24108200 */  and         $2, $4, $2
/* 02064C 01DCC34C 25104300 */  or          $2, $2, $3
/* 020650 01DCC350 2801A2A3 */  sb          $2, 0x128($29)
/* 020654 01DCC354 D48B848F */  lw          $4, -0x742C($28)
/* 020658 01DCC358 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 02065C 01DCC35C 00000000 */   nop
/* 020660 01DCC360 28260072 */  paddub      $4, $16, $0
/* 020664 01DCC364 A000198E */  lw          $25, 0xA0($16)
/* 020668 01DCC368 9400398F */  lw          $25, 0x94($25)
/* 02066C 01DCC36C 09F82003 */  jalr        $25
/* 020670 01DCC370 00000000 */   nop
/* 020674 01DCC374 2500023C */  lui         $2, %hi(ambientlight)
/* 020678 01DCC378 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 02067C 01DCC37C 40B7040C */  jal         MGSetAmbient__FPf
/* 020680 01DCC380 00000000 */   nop
/* 020684 01DCC384 D48B848F */  lw          $4, -0x742C($28)
/* 020688 01DCC388 F88B8527 */  addiu       $5, $28, -0x7408
/* 02068C 01DCC38C 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 020690 01DCC390 00000000 */   nop
/* 020694 01DCC394 C701023C */  lui         $2, %hi(TexManager)
/* 020698 01DCC398 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02069C 01DCC39C D48B858F */  lw          $5, -0x742C($28)
/* 0206A0 01DCC3A0 0A000624 */  addiu       $6, $0, 0xA
/* 0206A4 01DCC3A4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0206A8 01DCC3A8 00000000 */   nop
/* 0206AC 01DCC3AC E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 0206B0 01DCC3B0 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 0206B4 01DCC3B4 700E050C */  jal         Draw__4CMapFv
/* 0206B8 01DCC3B8 00000000 */   nop
/* 0206BC 01DCC3BC A0B8040C */  jal         GetVif1Packet__Fv
/* 0206C0 01DCC3C0 00000000 */   nop
/* 0206C4 01DCC3C4 C701033C */  lui         $3, %hi(TexManager)
/* 0206C8 01DCC3C8 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 0206CC 01DCC3CC 282E4070 */  paddub      $5, $2, $0
/* 0206D0 01DCC3D0 28360070 */  paddub      $6, $0, $0
/* 0206D4 01DCC3D4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0206D8 01DCC3D8 00000000 */   nop
/* 0206DC 01DCC3DC C09B838F */  lw          $3, -0x6440($28)
/* 0206E0 01DCC3E0 B0110224 */  addiu       $2, $0, 0x11B0
/* 0206E4 01DCC3E4 18186200 */  mult        $3, $3, $2
/* 0206E8 01DCC3E8 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 0206EC 01DCC3EC ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 0206F0 01DCC3F0 21104300 */  addu        $2, $2, $3
/* 0206F4 01DCC3F4 0000428C */  lw          $2, 0x0($2)
/* 0206F8 01DCC3F8 B09B82AF */  sw          $2, -0x6450($28)
/* 0206FC 01DCC3FC B09B828F */  lw          $2, -0x6450($28)
/* 020700 01DCC400 1001A427 */  addiu       $4, $29, 0x110
/* 020704 01DCC404 20024524 */  addiu       $5, $2, 0x220
/* 020708 01DCC408 0C86040C */  jal         sceVu0CopyVector
/* 02070C 01DCC40C 00000000 */   nop
/* 020710 01DCC410 E301023C */  lui         $2, %hi(CFire__4)
/* 020714 01DCC414 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 020718 01DCC418 BC85050C */  jal         FireStep__9CFireOmniFv
/* 02071C 01DCC41C 00000000 */   nop
/* 020720 01DCC420 E301023C */  lui         $2, %hi(CFire__4)
/* 020724 01DCC424 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 020728 01DCC428 F085050C */  jal         FireCreate__9CFireOmniFv
/* 02072C 01DCC42C 00000000 */   nop
/* 020730 01DCC430 28860070 */  paddub      $16, $0, $0
/* 020734 01DCC434 2F000010 */  b           .L01DCC4F4_2D1CF4
/* 020738 01DCC438 00000000 */   nop
.L01DCC43C_2D1C3C:
/* 02073C 01DCC43C 00191000 */  sll         $3, $16, 4
/* 020740 01DCC440 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 020744 01DCC444 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 020748 01DCC448 21104300 */  addu        $2, $2, $3
/* 02074C 01DCC44C 000043C4 */  lwc1        $f3, 0x0($2)
/* 020750 01DCC450 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 020754 01DCC454 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 020758 01DCC458 21104300 */  addu        $2, $2, $3
/* 02075C 01DCC45C 000042C4 */  lwc1        $f2, 0x0($2)
/* 020760 01DCC460 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 020764 01DCC464 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 020768 01DCC468 21104300 */  addu        $2, $2, $3
/* 02076C 01DCC46C 000040C4 */  lwc1        $f0, 0x0($2)
/* 020770 01DCC470 2041023C */  lui         $2, (0x41200000 >> 16)
/* 020774 01DCC474 00088244 */  mtc1        $2, $f1
/* 020778 01DCC478 00000000 */  nop
/* 02077C 01DCC47C 02080046 */  mul.s       $f0, $f1, $f0
/* 020780 01DCC480 E301013C */  lui         $1, %hi(CFire__4 + 0x20)
/* 020784 01DCC484 A0E920E4 */  swc1        $f0, %lo(CFire__4 + 0x20)($1)
/* 020788 01DCC488 02080246 */  mul.s       $f0, $f1, $f2
/* 02078C 01DCC48C E301013C */  lui         $1, %hi(CFire__4 + 0x24)
/* 020790 01DCC490 A4E920E4 */  swc1        $f0, %lo(CFire__4 + 0x24)($1)
/* 020794 01DCC494 02080346 */  mul.s       $f0, $f1, $f3
/* 020798 01DCC498 E301013C */  lui         $1, %hi(CFire__4 + 0x28)
/* 02079C 01DCC49C A8E920E4 */  swc1        $f0, %lo(CFire__4 + 0x28)($1)
/* 0207A0 01DCC4A0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0207A4 01DCC4A4 E301013C */  lui         $1, %hi(CFire__4 + 0x2C)
/* 0207A8 01DCC4A8 ACE922AC */  sw          $2, %lo(CFire__4 + 0x2C)($1)
/* 0207AC 01DCC4AC 80181000 */  sll         $3, $16, 2
/* 0207B0 01DCC4B0 E201023C */  lui         $2, %hi(OP_FireScale)
/* 0207B4 01DCC4B4 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 0207B8 01DCC4B8 21184300 */  addu        $3, $2, $3
/* 0207BC 01DCC4BC 7041023C */  lui         $2, (0x41700000 >> 16)
/* 0207C0 01DCC4C0 00688244 */  mtc1        $2, $f13
/* 0207C4 01DCC4C4 E301023C */  lui         $2, %hi(CFire__4)
/* 0207C8 01DCC4C8 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 0207CC 01DCC4CC 01000524 */  addiu       $5, $0, 0x1
/* 0207D0 01DCC4D0 2836A070 */  paddub      $6, $5, $0
/* 0207D4 01DCC4D4 E301023C */  lui         $2, %hi(MainCamera__3)
/* 0207D8 01DCC4D8 80E64724 */  addiu       $7, $2, %lo(MainCamera__3)
/* 0207DC 01DCC4DC 1001A827 */  addiu       $8, $29, 0x110
/* 0207E0 01DCC4E0 00006CC4 */  lwc1        $f12, 0x0($3)
/* 0207E4 01DCC4E4 0F000924 */  addiu       $9, $0, 0xF
/* 0207E8 01DCC4E8 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 0207EC 01DCC4EC 00000000 */   nop
/* 0207F0 01DCC4F0 01001026 */  addiu       $16, $16, 0x1
.L01DCC4F4_2D1CF4:
/* 0207F4 01DCC4F4 B898828F */  lw          $2, -0x6748($28)
/* 0207F8 01DCC4F8 2A100202 */  slt         $2, $16, $2
/* 0207FC 01DCC4FC CFFF4014 */  bnez        $2, .L01DCC43C_2D1C3C
/* 020800 01DCC500 00000000 */   nop
/* 020804 01DCC504 C701023C */  lui         $2, %hi(TexManager)
/* 020808 01DCC508 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02080C 01DCC50C D48B858F */  lw          $5, -0x742C($28)
/* 020810 01DCC510 16000624 */  addiu       $6, $0, 0x16
/* 020814 01DCC514 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 020818 01DCC518 00000000 */   nop
/* 02081C 01DCC51C DE01023C */  lui         $2, %hi(LIT_1012__3)
/* 020820 01DCC520 A0B24324 */  addiu       $3, $2, %lo(LIT_1012__3)
/* 020824 01DCC524 3001A427 */  addiu       $4, $29, 0x130
/* 020828 01DCC528 000062DC */  ld          $2, 0x0($3)
/* 02082C 01DCC52C 080060C4 */  lwc1        $f0, 0x8($3)
/* 020830 01DCC530 000082FC */  sd          $2, 0x0($4)
/* 020834 01DCC534 080080E4 */  swc1        $f0, 0x8($4)
/* 020838 01DCC538 03000524 */  addiu       $5, $0, 0x3
/* 02083C 01DCC53C 20000624 */  addiu       $6, $0, 0x20
/* 020840 01DCC540 283E0070 */  paddub      $7, $0, $0
/* 020844 01DCC544 B094050C */  jal         DepthOfField__FPfiii
/* 020848 01DCC548 00000000 */   nop
/* 02084C 01DCC54C 2000BF7B */  lq          $31, 0x20($29)
/* 020850 01DCC550 1000B17B */  lq          $17, 0x10($29)
/* 020854 01DCC554 0000B07B */  lq          $16, 0x0($29)
/* 020858 01DCC558 4001BD27 */  addiu       $29, $29, 0x140
/* 02085C 01DCC55C 0800E003 */  jr          $31
/* 020860 01DCC560 00000000 */   nop
/* 020864 01DCC564 00000000 */  nop
/* 020868 01DCC568 00000000 */  nop
/* 02086C 01DCC56C 00000000 */  nop
