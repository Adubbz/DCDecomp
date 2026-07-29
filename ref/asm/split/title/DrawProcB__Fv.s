.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcB__Fv
/* 021020 01DCCD20 00FFBD27 */  addiu       $29, $29, -0x100
/* 021024 01DCCD24 4000BF7F */  sq          $31, 0x40($29)
/* 021028 01DCCD28 3000B27F */  sq          $18, 0x30($29)
/* 02102C 01DCCD2C 2000B17F */  sq          $17, 0x20($29)
/* 021030 01DCCD30 1000B07F */  sq          $16, 0x10($29)
/* 021034 01DCCD34 C701023C */  lui         $2, %hi(TexManager)
/* 021038 01DCCD38 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02103C 01DCCD3C D48B858F */  lw          $5, -0x742C($28)
/* 021040 01DCCD40 0A000624 */  addiu       $6, $0, 0xA
/* 021044 01DCCD44 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021048 01DCCD48 00000000 */   nop
/* 02104C 01DCCD4C E201023C */  lui         $2, %hi(OP_GroundMap)
/* 021050 01DCCD50 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 021054 01DCCD54 700E050C */  jal         Draw__4CMapFv
/* 021058 01DCCD58 00000000 */   nop
/* 02105C 01DCCD5C E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 021060 01DCCD60 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 021064 01DCCD64 700E050C */  jal         Draw__4CMapFv
/* 021068 01DCCD68 00000000 */   nop
/* 02106C 01DCCD6C 082C770C */  jal         WaterProcess__Fv__2
/* 021070 01DCCD70 00000000 */   nop
/* 021074 01DCCD74 C701023C */  lui         $2, %hi(TexManager)
/* 021078 01DCCD78 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02107C 01DCCD7C D48B858F */  lw          $5, -0x742C($28)
/* 021080 01DCCD80 17000624 */  addiu       $6, $0, 0x17
/* 021084 01DCCD84 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021088 01DCCD88 00000000 */   nop
/* 02108C 01DCCD8C C701023C */  lui         $2, %hi(TexManager)
/* 021090 01DCCD90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021094 01DCCD94 DE01023C */  lui         $2, %hi(LIT_1137)
/* 021098 01DCCD98 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 02109C 01DCCD9C FFFF0624 */  addiu       $6, $0, -0x1
/* 0210A0 01DCCDA0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0210A4 01DCCDA4 00000000 */   nop
/* 0210A8 01DCCDA8 280044DC */  ld          $4, 0x28($2)
/* 0210AC 01DCCDAC 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 0210B0 01DCCDB0 00000000 */   nop
/* 0210B4 01DCCDB4 28860070 */  paddub      $16, $0, $0
/* 0210B8 01DCCDB8 18000010 */  b           .L01DCCE1C_2D261C
/* 0210BC 01DCCDBC 00000000 */   nop
.L01DCCDC0_2D25C0:
/* 0210C0 01DCCDC0 40101000 */  sll         $2, $16, 1
/* 0210C4 01DCCDC4 21105000 */  addu        $2, $2, $16
/* 0210C8 01DCCDC8 80100200 */  sll         $2, $2, 2
/* 0210CC 01DCCDCC 21105000 */  addu        $2, $2, $16
/* 0210D0 01DCCDD0 80180200 */  sll         $3, $2, 2
/* 0210D4 01DCCDD4 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 0210D8 01DCCDD8 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 0210DC 01DCCDDC 21104300 */  addu        $2, $2, $3
/* 0210E0 01DCCDE0 00004290 */  lbu         $2, 0x0($2)
/* 0210E4 01DCCDE4 0C004010 */  beqz        $2, .L01DCCE18_2D2618
/* 0210E8 01DCCDE8 00000000 */   nop
/* 0210EC 01DCCDEC B0110224 */  addiu       $2, $0, 0x11B0
/* 0210F0 01DCCDF0 18180202 */  mult        $3, $16, $2
/* 0210F4 01DCCDF4 DF01023C */  lui         $2, %hi(Chara__3)
/* 0210F8 01DCCDF8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0210FC 01DCCDFC 21884300 */  addu        $17, $2, $3
/* 021100 01DCCE00 28262072 */  paddub      $4, $17, $0
/* 021104 01DCCE04 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 021108 01DCCE08 00000000 */   nop
/* 02110C 01DCCE0C 28262072 */  paddub      $4, $17, $0
/* 021110 01DCCE10 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 021114 01DCCE14 00000000 */   nop
.L01DCCE18_2D2618:
/* 021118 01DCCE18 01001026 */  addiu       $16, $16, 0x1
.L01DCCE1C_2D261C:
/* 02111C 01DCCE1C 0900022A */  slti        $2, $16, 0x9
/* 021120 01DCCE20 E7FF4014 */  bnez        $2, .L01DCCDC0_2D25C0
/* 021124 01DCCE24 00000000 */   nop
/* 021128 01DCCE28 34000424 */  addiu       $4, $0, 0x34
/* 02112C 01DCCE2C CCC2040C */  jal         MGEndDrawShadow__FUc
/* 021130 01DCCE30 00000000 */   nop
/* 021134 01DCCE34 28860070 */  paddub      $16, $0, $0
/* 021138 01DCCE38 4C000010 */  b           .L01DCCF6C_2D276C
/* 02113C 01DCCE3C 00000000 */   nop
.L01DCCE40_2D2640:
/* 021140 01DCCE40 40101000 */  sll         $2, $16, 1
/* 021144 01DCCE44 21105000 */  addu        $2, $2, $16
/* 021148 01DCCE48 80100200 */  sll         $2, $2, 2
/* 02114C 01DCCE4C 21105000 */  addu        $2, $2, $16
/* 021150 01DCCE50 80180200 */  sll         $3, $2, 2
/* 021154 01DCCE54 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 021158 01DCCE58 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 02115C 01DCCE5C 21104300 */  addu        $2, $2, $3
/* 021160 01DCCE60 00004290 */  lbu         $2, 0x0($2)
/* 021164 01DCCE64 40004010 */  beqz        $2, .L01DCCF68_2D2768
/* 021168 01DCCE68 00000000 */   nop
/* 02116C 01DCCE6C 5000A427 */  addiu       $4, $29, 0x50
/* 021170 01DCCE70 2500023C */  lui         $2, %hi(light)
/* 021174 01DCCE74 801B4524 */  addiu       $5, $2, %lo(light)
/* 021178 01DCCE78 1086040C */  jal         sceVu0CopyMatrix
/* 02117C 01DCCE7C 00000000 */   nop
/* 021180 01DCCE80 9000A427 */  addiu       $4, $29, 0x90
/* 021184 01DCCE84 2500023C */  lui         $2, %hi(lightcolor)
/* 021188 01DCCE88 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 02118C 01DCCE8C 1086040C */  jal         sceVu0CopyMatrix
/* 021190 01DCCE90 00000000 */   nop
/* 021194 01DCCE94 08000016 */  bnez        $16, .L01DCCEB8_2D26B8
/* 021198 01DCCE98 00000000 */   nop
/* 02119C 01DCCE9C E301013C */  lui         $1, %hi(CScript)
/* 0211A0 01DCCEA0 C0E9238C */  lw          $3, %lo(CScript)($1)
/* 0211A4 01DCCEA4 06000224 */  addiu       $2, $0, 0x6
/* 0211A8 01DCCEA8 03006214 */  bne         $3, $2, .L01DCCEB8_2D26B8
/* 0211AC 01DCCEAC 00000000 */   nop
/* 0211B0 01DCCEB0 7434770C */  jal         AtraLight__Fv
/* 0211B4 01DCCEB4 00000000 */   nop
.L01DCCEB8_2D26B8:
/* 0211B8 01DCCEB8 E401023C */  lui         $2, %hi(CharaTex)
/* 0211BC 01DCCEBC 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 0211C0 01DCCEC0 21885000 */  addu        $17, $2, $16
/* 0211C4 01DCCEC4 00002682 */  lb          $6, 0x0($17)
/* 0211C8 01DCCEC8 C701023C */  lui         $2, %hi(TexManager)
/* 0211CC 01DCCECC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0211D0 01DCCED0 D48B858F */  lw          $5, -0x742C($28)
/* 0211D4 01DCCED4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0211D8 01DCCED8 00000000 */   nop
/* 0211DC 01DCCEDC B0110224 */  addiu       $2, $0, 0x11B0
/* 0211E0 01DCCEE0 18180202 */  mult        $3, $16, $2
/* 0211E4 01DCCEE4 DF01023C */  lui         $2, %hi(Chara__3)
/* 0211E8 01DCCEE8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0211EC 01DCCEEC 21904300 */  addu        $18, $2, $3
/* 0211F0 01DCCEF0 00002582 */  lb          $5, 0x0($17)
/* 0211F4 01DCCEF4 28264072 */  paddub      $4, $18, $0
/* 0211F8 01DCCEF8 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 0211FC 01DCCEFC 00000000 */   nop
/* 021200 01DCCF00 28264072 */  paddub      $4, $18, $0
/* 021204 01DCCF04 4CE1040C */  jal         Step__10CCharacterFv
/* 021208 01DCCF08 00000000 */   nop
/* 02120C 01DCCF0C 28264072 */  paddub      $4, $18, $0
/* 021210 01DCCF10 282E0070 */  paddub      $5, $0, $0
/* 021214 01DCCF14 94E3040C */  jal         ClothStep__10CCharacterFi
/* 021218 01DCCF18 00000000 */   nop
/* 02121C 01DCCF1C 28264072 */  paddub      $4, $18, $0
/* 021220 01DCCF20 C4E4040C */  jal         Draw__10CCharacterFv
/* 021224 01DCCF24 00000000 */   nop
/* 021228 01DCCF28 2500023C */  lui         $2, %hi(light)
/* 02122C 01DCCF2C 801B4424 */  addiu       $4, $2, %lo(light)
/* 021230 01DCCF30 5000A527 */  addiu       $5, $29, 0x50
/* 021234 01DCCF34 1086040C */  jal         sceVu0CopyMatrix
/* 021238 01DCCF38 00000000 */   nop
/* 02123C 01DCCF3C 2500023C */  lui         $2, %hi(lightcolor)
/* 021240 01DCCF40 C01B4424 */  addiu       $4, $2, %lo(lightcolor)
/* 021244 01DCCF44 9000A527 */  addiu       $5, $29, 0x90
/* 021248 01DCCF48 1086040C */  jal         sceVu0CopyMatrix
/* 02124C 01DCCF4C 00000000 */   nop
/* 021250 01DCCF50 2500023C */  lui         $2, %hi(light)
/* 021254 01DCCF54 801B4424 */  addiu       $4, $2, %lo(light)
/* 021258 01DCCF58 2500023C */  lui         $2, %hi(lightcolor)
/* 02125C 01DCCF5C C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 021260 01DCCF60 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 021264 01DCCF64 00000000 */   nop
.L01DCCF68_2D2768:
/* 021268 01DCCF68 01001026 */  addiu       $16, $16, 0x1
.L01DCCF6C_2D276C:
/* 02126C 01DCCF6C 0900022A */  slti        $2, $16, 0x9
/* 021270 01DCCF70 B3FF4014 */  bnez        $2, .L01DCCE40_2D2640
/* 021274 01DCCF74 00000000 */   nop
/* 021278 01DCCF78 A0B8040C */  jal         GetVif1Packet__Fv
/* 02127C 01DCCF7C 00000000 */   nop
/* 021280 01DCCF80 C701033C */  lui         $3, %hi(TexManager)
/* 021284 01DCCF84 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 021288 01DCCF88 282E4070 */  paddub      $5, $2, $0
/* 02128C 01DCCF8C 28360070 */  paddub      $6, $0, $0
/* 021290 01DCCF90 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021294 01DCCF94 00000000 */   nop
/* 021298 01DCCF98 E301013C */  lui         $1, %hi(CScript)
/* 02129C 01DCCF9C C0E9238C */  lw          $3, %lo(CScript)($1)
/* 0212A0 01DCCFA0 04000224 */  addiu       $2, $0, 0x4
/* 0212A4 01DCCFA4 29006214 */  bne         $3, $2, .L01DCD04C_2D284C
/* 0212A8 01DCCFA8 00000000 */   nop
/* 0212AC 01DCCFAC DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 0212B0 01DCCFB0 9CFF228C */  lw          $2, %lo(Chara__3 + 0xBC)($1)
/* 0212B4 01DCCFB4 D000A427 */  addiu       $4, $29, 0xD0
/* 0212B8 01DCCFB8 20024524 */  addiu       $5, $2, 0x220
/* 0212BC 01DCCFBC 0C86040C */  jal         sceVu0CopyVector
/* 0212C0 01DCCFC0 00000000 */   nop
/* 0212C4 01DCCFC4 E501023C */  lui         $2, %hi(CRunFx)
/* 0212C8 01DCCFC8 40154424 */  addiu       $4, $2, %lo(CRunFx)
/* 0212CC 01DCCFCC 01000524 */  addiu       $5, $0, 0x1
/* 0212D0 01DCCFD0 1C8D050C */  jal         Lighting__10CRunEffectFi
/* 0212D4 01DCCFD4 00000000 */   nop
/* 0212D8 01DCCFD8 DF01013C */  lui         $1, %hi(Chara__3 + 0x2F0)
/* 0212DC 01DCCFDC D0012CC4 */  lwc1        $f12, %lo(Chara__3 + 0x2F0)($1)
/* 0212E0 01DCCFE0 2C44040C */  jal         fptosi
/* 0212E4 01DCCFE4 00000000 */   nop
/* 0212E8 01DCCFE8 49004328 */  slti        $3, $2, 0x49
/* 0212EC 01DCCFEC 04006014 */  bnez        $3, .L01DCD000_2D2800
/* 0212F0 01DCCFF0 00000000 */   nop
/* 0212F4 01DCCFF4 4A004328 */  slti        $3, $2, 0x4A
/* 0212F8 01DCCFF8 07006014 */  bnez        $3, .L01DCD018_2D2818
/* 0212FC 01DCCFFC 00000000 */   nop
.L01DCD000_2D2800:
/* 021300 01DCD000 53004328 */  slti        $3, $2, 0x53
/* 021304 01DCD004 09006014 */  bnez        $3, .L01DCD02C_2D282C
/* 021308 01DCD008 00000000 */   nop
/* 02130C 01DCD00C 54004128 */  slti        $1, $2, 0x54
/* 021310 01DCD010 06002010 */  beqz        $1, .L01DCD02C_2D282C
/* 021314 01DCD014 00000000 */   nop
.L01DCD018_2D2818:
/* 021318 01DCD018 E501023C */  lui         $2, %hi(CRunFx)
/* 02131C 01DCD01C 40154424 */  addiu       $4, $2, %lo(CRunFx)
/* 021320 01DCD020 D000A527 */  addiu       $5, $29, 0xD0
/* 021324 01DCD024 3C8E050C */  jal         Set__10CRunEffectFPf
/* 021328 01DCD028 00000000 */   nop
.L01DCD02C_2D282C:
/* 02132C 01DCD02C E501023C */  lui         $2, %hi(CRunFx)
/* 021330 01DCD030 40154424 */  addiu       $4, $2, %lo(CRunFx)
/* 021334 01DCD034 608E050C */  jal         Step__10CRunEffectFv
/* 021338 01DCD038 00000000 */   nop
/* 02133C 01DCD03C E501023C */  lui         $2, %hi(CRunFx)
/* 021340 01DCD040 40154424 */  addiu       $4, $2, %lo(CRunFx)
/* 021344 01DCD044 208D050C */  jal         Draw__10CRunEffectFv
/* 021348 01DCD048 00000000 */   nop
.L01DCD04C_2D284C:
/* 02134C 01DCD04C C09B838F */  lw          $3, -0x6440($28)
/* 021350 01DCD050 B0110224 */  addiu       $2, $0, 0x11B0
/* 021354 01DCD054 18186200 */  mult        $3, $3, $2
/* 021358 01DCD058 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 02135C 01DCD05C ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 021360 01DCD060 21104300 */  addu        $2, $2, $3
/* 021364 01DCD064 0000428C */  lw          $2, 0x0($2)
/* 021368 01DCD068 B09B82AF */  sw          $2, -0x6450($28)
/* 02136C 01DCD06C B09B828F */  lw          $2, -0x6450($28)
/* 021370 01DCD070 E000A427 */  addiu       $4, $29, 0xE0
/* 021374 01DCD074 20024524 */  addiu       $5, $2, 0x220
/* 021378 01DCD078 0C86040C */  jal         sceVu0CopyVector
/* 02137C 01DCD07C 00000000 */   nop
/* 021380 01DCD080 E301023C */  lui         $2, %hi(CFire__4)
/* 021384 01DCD084 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 021388 01DCD088 BC85050C */  jal         FireStep__9CFireOmniFv
/* 02138C 01DCD08C 00000000 */   nop
/* 021390 01DCD090 E301023C */  lui         $2, %hi(CFire__4)
/* 021394 01DCD094 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 021398 01DCD098 F085050C */  jal         FireCreate__9CFireOmniFv
/* 02139C 01DCD09C 00000000 */   nop
/* 0213A0 01DCD0A0 28860070 */  paddub      $16, $0, $0
/* 0213A4 01DCD0A4 31000010 */  b           .L01DCD16C_2D296C
/* 0213A8 01DCD0A8 00000000 */   nop
.L01DCD0AC_2D28AC:
/* 0213AC 01DCD0AC 00211000 */  sll         $4, $16, 4
/* 0213B0 01DCD0B0 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 0213B4 01DCD0B4 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 0213B8 01DCD0B8 21184400 */  addu        $3, $2, $4
/* 0213BC 01DCD0BC 2041023C */  lui         $2, (0x41200000 >> 16)
/* 0213C0 01DCD0C0 00088244 */  mtc1        $2, $f1
/* 0213C4 01DCD0C4 000060C4 */  lwc1        $f0, 0x0($3)
/* 0213C8 01DCD0C8 C3000146 */  div.s       $f3, $f0, $f1
/* 0213CC 01DCD0CC E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 0213D0 01DCD0D0 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 0213D4 01DCD0D4 21104400 */  addu        $2, $2, $4
/* 0213D8 01DCD0D8 000040C4 */  lwc1        $f0, 0x0($2)
/* 0213DC 01DCD0DC 83000146 */  div.s       $f2, $f0, $f1
/* 0213E0 01DCD0E0 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 0213E4 01DCD0E4 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 0213E8 01DCD0E8 21104400 */  addu        $2, $2, $4
/* 0213EC 01DCD0EC 000040C4 */  lwc1        $f0, 0x0($2)
/* 0213F0 01DCD0F0 03000146 */  div.s       $f0, $f0, $f1
/* 0213F4 01DCD0F4 02080046 */  mul.s       $f0, $f1, $f0
/* 0213F8 01DCD0F8 E301013C */  lui         $1, %hi(CFire__4 + 0x20)
/* 0213FC 01DCD0FC A0E920E4 */  swc1        $f0, %lo(CFire__4 + 0x20)($1)
/* 021400 01DCD100 02080246 */  mul.s       $f0, $f1, $f2
/* 021404 01DCD104 E301013C */  lui         $1, %hi(CFire__4 + 0x24)
/* 021408 01DCD108 A4E920E4 */  swc1        $f0, %lo(CFire__4 + 0x24)($1)
/* 02140C 01DCD10C 02080346 */  mul.s       $f0, $f1, $f3
/* 021410 01DCD110 E301013C */  lui         $1, %hi(CFire__4 + 0x28)
/* 021414 01DCD114 A8E920E4 */  swc1        $f0, %lo(CFire__4 + 0x28)($1)
/* 021418 01DCD118 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 02141C 01DCD11C E301013C */  lui         $1, %hi(CFire__4 + 0x2C)
/* 021420 01DCD120 ACE922AC */  sw          $2, %lo(CFire__4 + 0x2C)($1)
/* 021424 01DCD124 80181000 */  sll         $3, $16, 2
/* 021428 01DCD128 E201023C */  lui         $2, %hi(OP_FireScale)
/* 02142C 01DCD12C 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 021430 01DCD130 21184300 */  addu        $3, $2, $3
/* 021434 01DCD134 7041023C */  lui         $2, (0x41700000 >> 16)
/* 021438 01DCD138 00688244 */  mtc1        $2, $f13
/* 02143C 01DCD13C E301023C */  lui         $2, %hi(CFire__4)
/* 021440 01DCD140 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 021444 01DCD144 01000524 */  addiu       $5, $0, 0x1
/* 021448 01DCD148 2836A070 */  paddub      $6, $5, $0
/* 02144C 01DCD14C E301023C */  lui         $2, %hi(MainCamera__3)
/* 021450 01DCD150 80E64724 */  addiu       $7, $2, %lo(MainCamera__3)
/* 021454 01DCD154 E000A827 */  addiu       $8, $29, 0xE0
/* 021458 01DCD158 00006CC4 */  lwc1        $f12, 0x0($3)
/* 02145C 01DCD15C 03000924 */  addiu       $9, $0, 0x3
/* 021460 01DCD160 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 021464 01DCD164 00000000 */   nop
/* 021468 01DCD168 01001026 */  addiu       $16, $16, 0x1
.L01DCD16C_2D296C:
/* 02146C 01DCD16C B898828F */  lw          $2, -0x6748($28)
/* 021470 01DCD170 2A100202 */  slt         $2, $16, $2
/* 021474 01DCD174 CDFF4014 */  bnez        $2, .L01DCD0AC_2D28AC
/* 021478 01DCD178 00000000 */   nop
/* 02147C 01DCD17C C701023C */  lui         $2, %hi(TexManager)
/* 021480 01DCD180 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 021484 01DCD184 D48B858F */  lw          $5, -0x742C($28)
/* 021488 01DCD188 16000624 */  addiu       $6, $0, 0x16
/* 02148C 01DCD18C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 021490 01DCD190 00000000 */   nop
/* 021494 01DCD194 F800A427 */  addiu       $4, $29, 0xF8
/* 021498 01DCD198 908A82DF */  ld          $2, -0x7570($28)
/* 02149C 01DCD19C 000082FC */  sd          $2, 0x0($4)
/* 0214A0 01DCD1A0 02000524 */  addiu       $5, $0, 0x2
/* 0214A4 01DCD1A4 20000624 */  addiu       $6, $0, 0x20
/* 0214A8 01DCD1A8 283E0070 */  paddub      $7, $0, $0
/* 0214AC 01DCD1AC B094050C */  jal         DepthOfField__FPfiii
/* 0214B0 01DCD1B0 00000000 */   nop
/* 0214B4 01DCD1B4 4000BF7B */  lq          $31, 0x40($29)
/* 0214B8 01DCD1B8 3000B27B */  lq          $18, 0x30($29)
/* 0214BC 01DCD1BC 2000B17B */  lq          $17, 0x20($29)
/* 0214C0 01DCD1C0 1000B07B */  lq          $16, 0x10($29)
/* 0214C4 01DCD1C4 0001BD27 */  addiu       $29, $29, 0x100
/* 0214C8 01DCD1C8 0800E003 */  jr          $31
/* 0214CC 01DCD1CC 00000000 */   nop
