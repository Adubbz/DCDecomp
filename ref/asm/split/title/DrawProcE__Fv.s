.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcE__Fv
/* 022EE0 01DCEBE0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 022EE4 01DCEBE4 4000BF7F */  sq          $31, 0x40($29)
/* 022EE8 01DCEBE8 3000B27F */  sq          $18, 0x30($29)
/* 022EEC 01DCEBEC 2000B17F */  sq          $17, 0x20($29)
/* 022EF0 01DCEBF0 1000B07F */  sq          $16, 0x10($29)
/* 022EF4 01DCEBF4 C701023C */  lui         $2, %hi(TexManager)
/* 022EF8 01DCEBF8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022EFC 01DCEBFC D48B858F */  lw          $5, -0x742C($28)
/* 022F00 01DCEC00 0A000624 */  addiu       $6, $0, 0xA
/* 022F04 01DCEC04 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 022F08 01DCEC08 00000000 */   nop
/* 022F0C 01DCEC0C E201023C */  lui         $2, %hi(OP_GroundMap)
/* 022F10 01DCEC10 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 022F14 01DCEC14 700E050C */  jal         Draw__4CMapFv
/* 022F18 01DCEC18 00000000 */   nop
/* 022F1C 01DCEC1C E301013C */  lui         $1, %hi(CScript)
/* 022F20 01DCEC20 C0E9238C */  lw          $3, %lo(CScript)($1)
/* 022F24 01DCEC24 0A000224 */  addiu       $2, $0, 0xA
/* 022F28 01DCEC28 14006214 */  bne         $3, $2, .L01DCEC7C_2D447C
/* 022F2C 01DCEC2C 00000000 */   nop
/* 022F30 01DCEC30 C09B838F */  lw          $3, -0x6440($28)
/* 022F34 01DCEC34 B0110224 */  addiu       $2, $0, 0x11B0
/* 022F38 01DCEC38 18186200 */  mult        $3, $3, $2
/* 022F3C 01DCEC3C E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 022F40 01DCEC40 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 022F44 01DCEC44 21104300 */  addu        $2, $2, $3
/* 022F48 01DCEC48 000041C4 */  lwc1        $f1, 0x0($2)
/* 022F4C 01DCEC4C 8C42023C */  lui         $2, (0x428C0000 >> 16)
/* 022F50 01DCEC50 00008244 */  mtc1        $2, $f0
/* 022F54 01DCEC54 00000000 */  nop
/* 022F58 01DCEC58 34080046 */  c.lt.s      $f1, $f0
/* 022F5C 01DCEC5C 00000000 */  nop
/* 022F60 01DCEC60 06000145 */  bc1t        .L01DCEC7C_2D447C
/* 022F64 01DCEC64 00000000 */   nop
/* 022F68 01DCEC68 DF01023C */  lui         $2, %hi(Chara__3)
/* 022F6C 01DCEC6C E0FE4424 */  addiu       $4, $2, %lo(Chara__3)
/* 022F70 01DCEC70 03000524 */  addiu       $5, $0, 0x3
/* 022F74 01DCEC74 20E0040C */  jal         TexAnimeOn__10CCharacterFi
/* 022F78 01DCEC78 00000000 */   nop
.L01DCEC7C_2D447C:
/* 022F7C 01DCEC7C C701023C */  lui         $2, %hi(TexManager)
/* 022F80 01DCEC80 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022F84 01DCEC84 D48B858F */  lw          $5, -0x742C($28)
/* 022F88 01DCEC88 17000624 */  addiu       $6, $0, 0x17
/* 022F8C 01DCEC8C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 022F90 01DCEC90 00000000 */   nop
/* 022F94 01DCEC94 C701023C */  lui         $2, %hi(TexManager)
/* 022F98 01DCEC98 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 022F9C 01DCEC9C DE01023C */  lui         $2, %hi(LIT_1137)
/* 022FA0 01DCECA0 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 022FA4 01DCECA4 FFFF0624 */  addiu       $6, $0, -0x1
/* 022FA8 01DCECA8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 022FAC 01DCECAC 00000000 */   nop
/* 022FB0 01DCECB0 280044DC */  ld          $4, 0x28($2)
/* 022FB4 01DCECB4 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 022FB8 01DCECB8 00000000 */   nop
/* 022FBC 01DCECBC 28860070 */  paddub      $16, $0, $0
/* 022FC0 01DCECC0 18000010 */  b           .L01DCED24_2D4524
/* 022FC4 01DCECC4 00000000 */   nop
.L01DCECC8_2D44C8:
/* 022FC8 01DCECC8 40101000 */  sll         $2, $16, 1
/* 022FCC 01DCECCC 21105000 */  addu        $2, $2, $16
/* 022FD0 01DCECD0 80100200 */  sll         $2, $2, 2
/* 022FD4 01DCECD4 21105000 */  addu        $2, $2, $16
/* 022FD8 01DCECD8 80180200 */  sll         $3, $2, 2
/* 022FDC 01DCECDC E301023C */  lui         $2, %hi(CScript + 0x30)
/* 022FE0 01DCECE0 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 022FE4 01DCECE4 21104300 */  addu        $2, $2, $3
/* 022FE8 01DCECE8 00004290 */  lbu         $2, 0x0($2)
/* 022FEC 01DCECEC 0C004010 */  beqz        $2, .L01DCED20_2D4520
/* 022FF0 01DCECF0 00000000 */   nop
/* 022FF4 01DCECF4 B0110224 */  addiu       $2, $0, 0x11B0
/* 022FF8 01DCECF8 18180202 */  mult        $3, $16, $2
/* 022FFC 01DCECFC DF01023C */  lui         $2, %hi(Chara__3)
/* 023000 01DCED00 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 023004 01DCED04 21884300 */  addu        $17, $2, $3
/* 023008 01DCED08 28262072 */  paddub      $4, $17, $0
/* 02300C 01DCED0C 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 023010 01DCED10 00000000 */   nop
/* 023014 01DCED14 28262072 */  paddub      $4, $17, $0
/* 023018 01DCED18 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 02301C 01DCED1C 00000000 */   nop
.L01DCED20_2D4520:
/* 023020 01DCED20 01001026 */  addiu       $16, $16, 0x1
.L01DCED24_2D4524:
/* 023024 01DCED24 0900022A */  slti        $2, $16, 0x9
/* 023028 01DCED28 E7FF4014 */  bnez        $2, .L01DCECC8_2D44C8
/* 02302C 01DCED2C 00000000 */   nop
/* 023030 01DCED30 34000424 */  addiu       $4, $0, 0x34
/* 023034 01DCED34 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 023038 01DCED38 00000000 */   nop
/* 02303C 01DCED3C 28860070 */  paddub      $16, $0, $0
/* 023040 01DCED40 29000010 */  b           .L01DCEDE8_2D45E8
/* 023044 01DCED44 00000000 */   nop
.L01DCED48_2D4548:
/* 023048 01DCED48 40181000 */  sll         $3, $16, 1
/* 02304C 01DCED4C 21187000 */  addu        $3, $3, $16
/* 023050 01DCED50 80180300 */  sll         $3, $3, 2
/* 023054 01DCED54 21187000 */  addu        $3, $3, $16
/* 023058 01DCED58 80200300 */  sll         $4, $3, 2
/* 02305C 01DCED5C E301033C */  lui         $3, %hi(CScript + 0x30)
/* 023060 01DCED60 F0E96324 */  addiu       $3, $3, %lo(CScript + 0x30)
/* 023064 01DCED64 21186400 */  addu        $3, $3, $4
/* 023068 01DCED68 00006390 */  lbu         $3, 0x0($3)
/* 02306C 01DCED6C 1D006010 */  beqz        $3, .L01DCEDE4_2D45E4
/* 023070 01DCED70 00000000 */   nop
/* 023074 01DCED74 E401023C */  lui         $2, %hi(CharaTex)
/* 023078 01DCED78 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 02307C 01DCED7C 21885000 */  addu        $17, $2, $16
/* 023080 01DCED80 00002682 */  lb          $6, 0x0($17)
/* 023084 01DCED84 C701023C */  lui         $2, %hi(TexManager)
/* 023088 01DCED88 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 02308C 01DCED8C D48B858F */  lw          $5, -0x742C($28)
/* 023090 01DCED90 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 023094 01DCED94 00000000 */   nop
/* 023098 01DCED98 B0110224 */  addiu       $2, $0, 0x11B0
/* 02309C 01DCED9C 18180202 */  mult        $3, $16, $2
/* 0230A0 01DCEDA0 DF01023C */  lui         $2, %hi(Chara__3)
/* 0230A4 01DCEDA4 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0230A8 01DCEDA8 21904300 */  addu        $18, $2, $3
/* 0230AC 01DCEDAC 00002582 */  lb          $5, 0x0($17)
/* 0230B0 01DCEDB0 28264072 */  paddub      $4, $18, $0
/* 0230B4 01DCEDB4 14E0040C */  jal         TextureAnime__10CCharacterFi
/* 0230B8 01DCEDB8 00000000 */   nop
/* 0230BC 01DCEDBC 28264072 */  paddub      $4, $18, $0
/* 0230C0 01DCEDC0 4CE1040C */  jal         Step__10CCharacterFv
/* 0230C4 01DCEDC4 00000000 */   nop
/* 0230C8 01DCEDC8 28264072 */  paddub      $4, $18, $0
/* 0230CC 01DCEDCC 282E0070 */  paddub      $5, $0, $0
/* 0230D0 01DCEDD0 94E3040C */  jal         ClothStep__10CCharacterFi
/* 0230D4 01DCEDD4 00000000 */   nop
/* 0230D8 01DCEDD8 28264072 */  paddub      $4, $18, $0
/* 0230DC 01DCEDDC C4E4040C */  jal         Draw__10CCharacterFv
/* 0230E0 01DCEDE0 00000000 */   nop
.L01DCEDE4_2D45E4:
/* 0230E4 01DCEDE4 01001026 */  addiu       $16, $16, 0x1
.L01DCEDE8_2D45E8:
/* 0230E8 01DCEDE8 0900032A */  slti        $3, $16, 0x9
/* 0230EC 01DCEDEC D6FF6014 */  bnez        $3, .L01DCED48_2D4548
/* 0230F0 01DCEDF0 00000000 */   nop
/* 0230F4 01DCEDF4 4000BF7B */  lq          $31, 0x40($29)
/* 0230F8 01DCEDF8 3000B27B */  lq          $18, 0x30($29)
/* 0230FC 01DCEDFC 2000B17B */  lq          $17, 0x20($29)
/* 023100 01DCEE00 1000B07B */  lq          $16, 0x10($29)
/* 023104 01DCEE04 5000BD27 */  addiu       $29, $29, 0x50
/* 023108 01DCEE08 0800E003 */  jr          $31
/* 02310C 01DCEE0C 00000000 */   nop
