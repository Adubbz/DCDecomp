.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_InitProcess2__Fv
/* 0110D0 01DBCDD0 20FDBD27 */  addiu       $29, $29, -0x2E0
/* 0110D4 01DBCDD4 3000BF7F */  sq          $31, 0x30($29)
/* 0110D8 01DBCDD8 2000B27F */  sq          $18, 0x20($29)
/* 0110DC 01DBCDDC 1000B17F */  sq          $17, 0x10($29)
/* 0110E0 01DBCDE0 0000B07F */  sq          $16, 0x0($29)
.L01DBCDE4_2C25E4:
/* 0110E4 01DBCDE4 8CFB040C */  jal         ReadBGSync__Fv
/* 0110E8 01DBCDE8 00000000 */   nop
/* 0110EC 01DBCDEC FDFF4014 */  bnez        $2, .L01DBCDE4_2C25E4
/* 0110F0 01DBCDF0 00000000 */   nop
/* 0110F4 01DBCDF4 C701023C */  lui         $2, %hi(TexManager)
/* 0110F8 01DBCDF8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0110FC 01DBCDFC 282E0070 */  paddub      $5, $0, $0
/* 011100 01DBCE00 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011104 01DBCE04 00000000 */   nop
/* 011108 01DBCE08 C701023C */  lui         $2, %hi(TexManager)
/* 01110C 01DBCE0C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011110 01DBCE10 0E000524 */  addiu       $5, $0, 0xE
/* 011114 01DBCE14 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 011118 01DBCE18 00000000 */   nop
/* 01111C 01DBCE1C C701023C */  lui         $2, %hi(TexManager)
/* 011120 01DBCE20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011124 01DBCE24 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 011128 01DBCE28 00000000 */   nop
/* 01112C 01DBCE2C DD01023C */  lui         $2, %hi(LIT_513__4)
/* 011130 01DBCE30 F07C4524 */  addiu       $5, $2, %lo(LIT_513__4)
/* 011134 01DBCE34 4000A427 */  addiu       $4, $29, 0x40
/* 011138 01DBCE38 0B000324 */  addiu       $3, $0, 0xB
.L01DBCE3C_2C263C:
/* 01113C 01DBCE3C 0000A278 */  lq          $2, 0x0($5)
/* 011140 01DBCE40 1000A524 */  addiu       $5, $5, 0x10
/* 011144 01DBCE44 FFFF6324 */  addiu       $3, $3, -0x1
/* 011148 01DBCE48 0000827C */  sq          $2, 0x0($4)
/* 01114C 01DBCE4C 10008424 */  addiu       $4, $4, 0x10
/* 011150 01DBCE50 FAFF601C */  bgtz        $3, .L01DBCE3C_2C263C
/* 011154 01DBCE54 00000000 */   nop
/* 011158 01DBCE58 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 01115C 01DBCE5C 000082E4 */  swc1        $f2, 0x0($4)
/* 011160 01DBCE60 948B848F */  lw          $4, -0x746C($28)
/* 011164 01DBCE64 DE01023C */  lui         $2, %hi(LIT_468__5)
/* 011168 01DBCE68 08ED4524 */  addiu       $5, $2, %lo(LIT_468__5)
/* 01116C 01DBCE6C 28360070 */  paddub      $6, $0, $0
/* 011170 01DBCE70 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011174 01DBCE74 00000000 */   nop
/* 011178 01DBCE78 4C00B027 */  addiu       $16, $29, 0x4C
/* 01117C 01DBCE7C 000002AE */  sw          $2, 0x0($16)
/* 011180 01DBCE80 5000A0AF */  sw          $0, 0x50($29)
/* 011184 01DBCE84 5400A0AF */  sw          $0, 0x54($29)
/* 011188 01DBCE88 5800A0AF */  sw          $0, 0x58($29)
/* 01118C 01DBCE8C C701023C */  lui         $2, %hi(TexManager)
/* 011190 01DBCE90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011194 01DBCE94 282E0070 */  paddub      $5, $0, $0
/* 011198 01DBCE98 4000A627 */  addiu       $6, $29, 0x40
/* 01119C 01DBCE9C C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0111A0 01DBCEA0 00000000 */   nop
/* 0111A4 01DBCEA4 948B848F */  lw          $4, -0x746C($28)
/* 0111A8 01DBCEA8 DE01023C */  lui         $2, %hi(LIT_524__4)
/* 0111AC 01DBCEAC 68EF4524 */  addiu       $5, $2, %lo(LIT_524__4)
/* 0111B0 01DBCEB0 28360070 */  paddub      $6, $0, $0
/* 0111B4 01DBCEB4 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0111B8 01DBCEB8 00000000 */   nop
/* 0111BC 01DBCEBC 4000A2AF */  sw          $2, 0x40($29)
/* 0111C0 01DBCEC0 11000524 */  addiu       $5, $0, 0x11
/* 0111C4 01DBCEC4 4400B127 */  addiu       $17, $29, 0x44
/* 0111C8 01DBCEC8 000025AE */  sw          $5, 0x0($17)
/* 0111CC 01DBCECC 4800B227 */  addiu       $18, $29, 0x48
/* 0111D0 01DBCED0 000040AE */  sw          $0, 0x0($18)
/* 0111D4 01DBCED4 000000AE */  sw          $0, 0x0($16)
/* 0111D8 01DBCED8 C701023C */  lui         $2, %hi(TexManager)
/* 0111DC 01DBCEDC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0111E0 01DBCEE0 4000A627 */  addiu       $6, $29, 0x40
/* 0111E4 01DBCEE4 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 0111E8 01DBCEE8 00000000 */   nop
/* 0111EC 01DBCEEC DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 0111F0 01DBCEF0 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 0111F4 01DBCEF4 948B848F */  lw          $4, -0x746C($28)
/* 0111F8 01DBCEF8 DE01023C */  lui         $2, %hi(LIT_525__4)
/* 0111FC 01DBCEFC 78EF4524 */  addiu       $5, $2, %lo(LIT_525__4)
/* 011200 01DBCF00 28360070 */  paddub      $6, $0, $0
/* 011204 01DBCF04 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011208 01DBCF08 00000000 */   nop
/* 01120C 01DBCF0C 28264070 */  paddub      $4, $2, $0
/* 011210 01DBCF10 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 011214 01DBCF14 60FE4524 */  addiu       $5, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 011218 01DBCF18 02000624 */  addiu       $6, $0, 0x2
/* 01121C 01DBCF1C 283E0070 */  paddub      $7, $0, $0
/* 011220 01DBCF20 28460070 */  paddub      $8, $0, $0
/* 011224 01DBCF24 AC98040C */  jal         LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* 011228 01DBCF28 00000000 */   nop
/* 01122C 01DBCF2C 282E0070 */  paddub      $5, $0, $0
/* 011230 01DBCF30 07000010 */  b           .L01DBCF50_2C2750
/* 011234 01DBCF34 00000000 */   nop
.L01DBCF38_2C2738:
/* 011238 01DBCF38 80200500 */  sll         $4, $5, 2
/* 01123C 01DBCF3C E301033C */  lui         $3, %hi(Shadow__2)
/* 011240 01DBCF40 30D26324 */  addiu       $3, $3, %lo(Shadow__2)
/* 011244 01DBCF44 21186400 */  addu        $3, $3, $4
/* 011248 01DBCF48 000062AC */  sw          $2, 0x0($3)
/* 01124C 01DBCF4C 0100A524 */  addiu       $5, $5, 0x1
.L01DBCF50_2C2750:
/* 011250 01DBCF50 1000A328 */  slti        $3, $5, 0x10
/* 011254 01DBCF54 F8FF6014 */  bnez        $3, .L01DBCF38_2C2738
/* 011258 01DBCF58 00000000 */   nop
/* 01125C 01DBCF5C 948B848F */  lw          $4, -0x746C($28)
/* 011260 01DBCF60 DE01023C */  lui         $2, %hi(LIT_526__3)
/* 011264 01DBCF64 88EF4524 */  addiu       $5, $2, %lo(LIT_526__3)
/* 011268 01DBCF68 28360070 */  paddub      $6, $0, $0
/* 01126C 01DBCF6C C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011270 01DBCF70 00000000 */   nop
/* 011274 01DBCF74 4000A2AF */  sw          $2, 0x40($29)
/* 011278 01DBCF78 04000524 */  addiu       $5, $0, 0x4
/* 01127C 01DBCF7C 000025AE */  sw          $5, 0x0($17)
/* 011280 01DBCF80 000040AE */  sw          $0, 0x0($18)
/* 011284 01DBCF84 000000AE */  sw          $0, 0x0($16)
/* 011288 01DBCF88 C701023C */  lui         $2, %hi(TexManager)
/* 01128C 01DBCF8C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011290 01DBCF90 4000A627 */  addiu       $6, $29, 0x40
/* 011294 01DBCF94 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011298 01DBCF98 00000000 */   nop
/* 01129C 01DBCF9C E001023C */  lui         $2, %hi(MainMonstorUnit + 0x6EB0)
/* 0112A0 01DBCFA0 80F64424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x6EB0)
/* 0112A4 01DBCFA4 948B858F */  lw          $5, -0x746C($28)
/* 0112A8 01DBCFA8 DE01023C */  lui         $2, %hi(LIT_527__3)
/* 0112AC 01DBCFAC 98EF4624 */  addiu       $6, $2, %lo(LIT_527__3)
/* 0112B0 01DBCFB0 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0112B4 01DBCFB4 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0112B8 01DBCFB8 28460070 */  paddub      $8, $0, $0
/* 0112BC 01DBCFBC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0112C0 01DBCFC0 00000000 */   nop
/* 0112C4 01DBCFC4 0001A427 */  addiu       $4, $29, 0x100
/* 0112C8 01DBCFC8 509F040C */  jal         __ct__10CFrameAttrFv
/* 0112CC 01DBCFCC 00000000 */   nop
/* 0112D0 01DBCFD0 0801A0A3 */  sb          $0, 0x108($29)
/* 0112D4 01DBCFD4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x6F6C)
/* 0112D8 01DBCFD8 3CF7248C */  lw          $4, %lo(MainMonstorUnit + 0x6F6C)($1)
/* 0112DC 01DBCFDC 0001A527 */  addiu       $5, $29, 0x100
/* 0112E0 01DBCFE0 01000624 */  addiu       $6, $0, 0x1
/* 0112E4 01DBCFE4 04000724 */  addiu       $7, $0, 0x4
/* 0112E8 01DBCFE8 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0112EC 01DBCFEC 00000000 */   nop
/* 0112F0 01DBCFF0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0112F4 01DBCFF4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x71A0)
/* 0112F8 01DBCFF8 70F922AC */  sw          $2, %lo(MainMonstorUnit + 0x71A0)($1)
/* 0112FC 01DBCFFC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x71A8)
/* 011300 01DBD000 78F922AC */  sw          $2, %lo(MainMonstorUnit + 0x71A8)($1)
/* 011304 01DBD004 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x71B4)
/* 011308 01DBD008 84F920AC */  sw          $0, %lo(MainMonstorUnit + 0x71B4)($1)
/* 01130C 01DBD00C E001013C */  lui         $1, %hi(MainMonstorUnit + 0x71B8)
/* 011310 01DBD010 88F920AC */  sw          $0, %lo(MainMonstorUnit + 0x71B8)($1)
/* 011314 01DBD014 948B848F */  lw          $4, -0x746C($28)
/* 011318 01DBD018 DE01023C */  lui         $2, %hi(LIT_528__3)
/* 01131C 01DBD01C A8EF4524 */  addiu       $5, $2, %lo(LIT_528__3)
/* 011320 01DBD020 28360070 */  paddub      $6, $0, $0
/* 011324 01DBD024 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011328 01DBD028 00000000 */   nop
/* 01132C 01DBD02C 4000A2AF */  sw          $2, 0x40($29)
/* 011330 01DBD030 09000524 */  addiu       $5, $0, 0x9
/* 011334 01DBD034 000025AE */  sw          $5, 0x0($17)
/* 011338 01DBD038 000040AE */  sw          $0, 0x0($18)
/* 01133C 01DBD03C 000000AE */  sw          $0, 0x0($16)
/* 011340 01DBD040 C701023C */  lui         $2, %hi(TexManager)
/* 011344 01DBD044 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011348 01DBD048 4000A627 */  addiu       $6, $29, 0x40
/* 01134C 01DBD04C C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011350 01DBD050 00000000 */   nop
/* 011354 01DBD054 E001023C */  lui         $2, %hi(MainMonstorUnit + 0xC720)
/* 011358 01DBD058 F04E4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xC720)
/* 01135C 01DBD05C 948B858F */  lw          $5, -0x746C($28)
/* 011360 01DBD060 DE01023C */  lui         $2, %hi(LIT_529__3)
/* 011364 01DBD064 B8EF4624 */  addiu       $6, $2, %lo(LIT_529__3)
/* 011368 01DBD068 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 01136C 01DBD06C 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 011370 01DBD070 28460070 */  paddub      $8, $0, $0
/* 011374 01DBD074 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 011378 01DBD078 00000000 */   nop
/* 01137C 01DBD07C 6001A427 */  addiu       $4, $29, 0x160
/* 011380 01DBD080 509F040C */  jal         __ct__10CFrameAttrFv
/* 011384 01DBD084 00000000 */   nop
/* 011388 01DBD088 6801A0A3 */  sb          $0, 0x168($29)
/* 01138C 01DBD08C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xC7DC)
/* 011390 01DBD090 AC4F248C */  lw          $4, %lo(MainMonstorUnit + 0xC7DC)($1)
/* 011394 01DBD094 6001A527 */  addiu       $5, $29, 0x160
/* 011398 01DBD098 01000624 */  addiu       $6, $0, 0x1
/* 01139C 01DBD09C 04000724 */  addiu       $7, $0, 0x4
/* 0113A0 01DBD0A0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0113A4 01DBD0A4 00000000 */   nop
/* 0113A8 01DBD0A8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0113AC 01DBD0AC E001013C */  lui         $1, %hi(MainMonstorUnit + 0xCA10)
/* 0113B0 01DBD0B0 E05122AC */  sw          $2, %lo(MainMonstorUnit + 0xCA10)($1)
/* 0113B4 01DBD0B4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xCA18)
/* 0113B8 01DBD0B8 E85122AC */  sw          $2, %lo(MainMonstorUnit + 0xCA18)($1)
/* 0113BC 01DBD0BC E001013C */  lui         $1, %hi(MainMonstorUnit + 0xCA24)
/* 0113C0 01DBD0C0 F45120AC */  sw          $0, %lo(MainMonstorUnit + 0xCA24)($1)
/* 0113C4 01DBD0C4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xCA28)
/* 0113C8 01DBD0C8 F85120AC */  sw          $0, %lo(MainMonstorUnit + 0xCA28)($1)
/* 0113CC 01DBD0CC E001023C */  lui         $2, %hi(MainMonstorUnit + 0xD8D0)
/* 0113D0 01DBD0D0 A0604424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0xD8D0)
/* 0113D4 01DBD0D4 948B858F */  lw          $5, -0x746C($28)
/* 0113D8 01DBD0D8 DE01023C */  lui         $2, %hi(LIT_530__4)
/* 0113DC 01DBD0DC C8EF4624 */  addiu       $6, $2, %lo(LIT_530__4)
/* 0113E0 01DBD0E0 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 0113E4 01DBD0E4 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0113E8 01DBD0E8 28460070 */  paddub      $8, $0, $0
/* 0113EC 01DBD0EC FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0113F0 01DBD0F0 00000000 */   nop
/* 0113F4 01DBD0F4 C001A427 */  addiu       $4, $29, 0x1C0
/* 0113F8 01DBD0F8 509F040C */  jal         __ct__10CFrameAttrFv
/* 0113FC 01DBD0FC 00000000 */   nop
/* 011400 01DBD100 C801A0A3 */  sb          $0, 0x1C8($29)
/* 011404 01DBD104 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xD98C)
/* 011408 01DBD108 5C61248C */  lw          $4, %lo(MainMonstorUnit + 0xD98C)($1)
/* 01140C 01DBD10C C001A527 */  addiu       $5, $29, 0x1C0
/* 011410 01DBD110 01000624 */  addiu       $6, $0, 0x1
/* 011414 01DBD114 04000724 */  addiu       $7, $0, 0x4
/* 011418 01DBD118 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 01141C 01DBD11C 00000000 */   nop
/* 011420 01DBD120 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 011424 01DBD124 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xDBC0)
/* 011428 01DBD128 906322AC */  sw          $2, %lo(MainMonstorUnit + 0xDBC0)($1)
/* 01142C 01DBD12C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xDBC8)
/* 011430 01DBD130 986322AC */  sw          $2, %lo(MainMonstorUnit + 0xDBC8)($1)
/* 011434 01DBD134 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xDBD4)
/* 011438 01DBD138 A46320AC */  sw          $0, %lo(MainMonstorUnit + 0xDBD4)($1)
/* 01143C 01DBD13C E001013C */  lui         $1, %hi(MainMonstorUnit + 0xDBD8)
/* 011440 01DBD140 A86320AC */  sw          $0, %lo(MainMonstorUnit + 0xDBD8)($1)
/* 011444 01DBD144 948B848F */  lw          $4, -0x746C($28)
/* 011448 01DBD148 DE01023C */  lui         $2, %hi(LIT_531__5)
/* 01144C 01DBD14C D8EF4524 */  addiu       $5, $2, %lo(LIT_531__5)
/* 011450 01DBD150 28360070 */  paddub      $6, $0, $0
/* 011454 01DBD154 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011458 01DBD158 00000000 */   nop
/* 01145C 01DBD15C 4000A2AF */  sw          $2, 0x40($29)
/* 011460 01DBD160 05000524 */  addiu       $5, $0, 0x5
/* 011464 01DBD164 000025AE */  sw          $5, 0x0($17)
/* 011468 01DBD168 000040AE */  sw          $0, 0x0($18)
/* 01146C 01DBD16C 000000AE */  sw          $0, 0x0($16)
/* 011470 01DBD170 C701023C */  lui         $2, %hi(TexManager)
/* 011474 01DBD174 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011478 01DBD178 4000A627 */  addiu       $6, $29, 0x40
/* 01147C 01DBD17C C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 011480 01DBD180 00000000 */   nop
/* 011484 01DBD184 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x8060)
/* 011488 01DBD188 30084424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x8060)
/* 01148C 01DBD18C 948B858F */  lw          $5, -0x746C($28)
/* 011490 01DBD190 DE01023C */  lui         $2, %hi(LIT_532__5)
/* 011494 01DBD194 E8EF4624 */  addiu       $6, $2, %lo(LIT_532__5)
/* 011498 01DBD198 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 01149C 01DBD19C 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 0114A0 01DBD1A0 28460070 */  paddub      $8, $0, $0
/* 0114A4 01DBD1A4 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 0114A8 01DBD1A8 00000000 */   nop
/* 0114AC 01DBD1AC 2002A427 */  addiu       $4, $29, 0x220
/* 0114B0 01DBD1B0 509F040C */  jal         __ct__10CFrameAttrFv
/* 0114B4 01DBD1B4 00000000 */   nop
/* 0114B8 01DBD1B8 2802A0A3 */  sb          $0, 0x228($29)
/* 0114BC 01DBD1BC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x811C)
/* 0114C0 01DBD1C0 EC08248C */  lw          $4, %lo(MainMonstorUnit + 0x811C)($1)
/* 0114C4 01DBD1C4 2002A527 */  addiu       $5, $29, 0x220
/* 0114C8 01DBD1C8 01000624 */  addiu       $6, $0, 0x1
/* 0114CC 01DBD1CC 04000724 */  addiu       $7, $0, 0x4
/* 0114D0 01DBD1D0 D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 0114D4 01DBD1D4 00000000 */   nop
/* 0114D8 01DBD1D8 9643023C */  lui         $2, (0x43960000 >> 16)
/* 0114DC 01DBD1DC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x8350)
/* 0114E0 01DBD1E0 200B22AC */  sw          $2, %lo(MainMonstorUnit + 0x8350)($1)
/* 0114E4 01DBD1E4 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0114E8 01DBD1E8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x8358)
/* 0114EC 01DBD1EC 280B22AC */  sw          $2, %lo(MainMonstorUnit + 0x8358)($1)
/* 0114F0 01DBD1F0 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x8364)
/* 0114F4 01DBD1F4 340B20AC */  sw          $0, %lo(MainMonstorUnit + 0x8364)($1)
/* 0114F8 01DBD1F8 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x8368)
/* 0114FC 01DBD1FC 380B20AC */  sw          $0, %lo(MainMonstorUnit + 0x8368)($1)
/* 011500 01DBD200 948B848F */  lw          $4, -0x746C($28)
/* 011504 01DBD204 DE01023C */  lui         $2, %hi(LIT_533__3)
/* 011508 01DBD208 F8EF4524 */  addiu       $5, $2, %lo(LIT_533__3)
/* 01150C 01DBD20C 28360070 */  paddub      $6, $0, $0
/* 011510 01DBD210 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 011514 01DBD214 00000000 */   nop
/* 011518 01DBD218 4000A2AF */  sw          $2, 0x40($29)
/* 01151C 01DBD21C 06000524 */  addiu       $5, $0, 0x6
/* 011520 01DBD220 000025AE */  sw          $5, 0x0($17)
/* 011524 01DBD224 000040AE */  sw          $0, 0x0($18)
/* 011528 01DBD228 000000AE */  sw          $0, 0x0($16)
/* 01152C 01DBD22C C701023C */  lui         $2, %hi(TexManager)
/* 011530 01DBD230 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 011534 01DBD234 4000A627 */  addiu       $6, $29, 0x40
/* 011538 01DBD238 C8CF040C */  jal         LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 01153C 01DBD23C 00000000 */   nop
/* 011540 01DBD240 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x9210)
/* 011544 01DBD244 E0194424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x9210)
/* 011548 01DBD248 948B858F */  lw          $5, -0x746C($28)
/* 01154C 01DBD24C DE01023C */  lui         $2, %hi(LIT_534__4)
/* 011550 01DBD250 08F04624 */  addiu       $6, $2, %lo(LIT_534__4)
/* 011554 01DBD254 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 011558 01DBD258 60FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 01155C 01DBD25C 28460070 */  paddub      $8, $0, $0
/* 011560 01DBD260 FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 011564 01DBD264 00000000 */   nop
/* 011568 01DBD268 8002A427 */  addiu       $4, $29, 0x280
/* 01156C 01DBD26C 509F040C */  jal         __ct__10CFrameAttrFv
/* 011570 01DBD270 00000000 */   nop
/* 011574 01DBD274 8802A0A3 */  sb          $0, 0x288($29)
/* 011578 01DBD278 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x92CC)
/* 01157C 01DBD27C 9C1A248C */  lw          $4, %lo(MainMonstorUnit + 0x92CC)($1)
/* 011580 01DBD280 8002A527 */  addiu       $5, $29, 0x280
/* 011584 01DBD284 01000624 */  addiu       $6, $0, 0x1
/* 011588 01DBD288 04000724 */  addiu       $7, $0, 0x4
/* 01158C 01DBD28C D4A2040C */  jal         SetAttr__6CFrameFR10CFrameAttrii
/* 011590 01DBD290 00000000 */   nop
/* 011594 01DBD294 9643033C */  lui         $3, (0x43960000 >> 16)
/* 011598 01DBD298 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x9500)
/* 01159C 01DBD29C D01C23AC */  sw          $3, %lo(MainMonstorUnit + 0x9500)($1)
/* 0115A0 01DBD2A0 003F033C */  lui         $3, (0x3F000000 >> 16)
/* 0115A4 01DBD2A4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x9508)
/* 0115A8 01DBD2A8 D81C23AC */  sw          $3, %lo(MainMonstorUnit + 0x9508)($1)
/* 0115AC 01DBD2AC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x9514)
/* 0115B0 01DBD2B0 E41C20AC */  sw          $0, %lo(MainMonstorUnit + 0x9514)($1)
/* 0115B4 01DBD2B4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x9518)
/* 0115B8 01DBD2B8 E81C20AC */  sw          $0, %lo(MainMonstorUnit + 0x9518)($1)
/* 0115BC 01DBD2BC DE01013C */  lui         $1, %hi(CScript__2 + 0x20)
/* 0115C0 01DBD2C0 201B20AC */  sw          $0, %lo(CScript__2 + 0x20)($1)
/* 0115C4 01DBD2C4 3000BF7B */  lq          $31, 0x30($29)
/* 0115C8 01DBD2C8 2000B27B */  lq          $18, 0x20($29)
/* 0115CC 01DBD2CC 1000B17B */  lq          $17, 0x10($29)
/* 0115D0 01DBD2D0 0000B07B */  lq          $16, 0x0($29)
/* 0115D4 01DBD2D4 E002BD27 */  addiu       $29, $29, 0x2E0
/* 0115D8 01DBD2D8 0800E003 */  jr          $31
/* 0115DC 01DBD2DC 00000000 */   nop
