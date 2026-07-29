.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcG__Fv
/* 023FF0 01DCFCF0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 023FF4 01DCFCF4 3000BF7F */  sq          $31, 0x30($29)
/* 023FF8 01DCFCF8 2000B17F */  sq          $17, 0x20($29)
/* 023FFC 01DCFCFC 1000B07F */  sq          $16, 0x10($29)
/* 024000 01DCFD00 C701023C */  lui         $2, %hi(TexManager)
/* 024004 01DCFD04 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024008 01DCFD08 D48B858F */  lw          $5, -0x742C($28)
/* 02400C 01DCFD0C 0A000624 */  addiu       $6, $0, 0xA
/* 024010 01DCFD10 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024014 01DCFD14 00000000 */   nop
/* 024018 01DCFD18 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 02401C 01DCFD1C 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 024020 01DCFD20 700E050C */  jal         Draw__4CMapFv
/* 024024 01DCFD24 00000000 */   nop
/* 024028 01DCFD28 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 02402C 01DCFD2C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 024030 01DCFD30 700E050C */  jal         Draw__4CMapFv
/* 024034 01DCFD34 00000000 */   nop
/* 024038 01DCFD38 C701023C */  lui         $2, %hi(TexManager)
/* 02403C 01DCFD3C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024040 01DCFD40 D48B858F */  lw          $5, -0x742C($28)
/* 024044 01DCFD44 17000624 */  addiu       $6, $0, 0x17
/* 024048 01DCFD48 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 02404C 01DCFD4C 00000000 */   nop
/* 024050 01DCFD50 C701023C */  lui         $2, %hi(TexManager)
/* 024054 01DCFD54 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024058 01DCFD58 DE01023C */  lui         $2, %hi(LIT_1137)
/* 02405C 01DCFD5C 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 024060 01DCFD60 FFFF0624 */  addiu       $6, $0, -0x1
/* 024064 01DCFD64 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 024068 01DCFD68 00000000 */   nop
/* 02406C 01DCFD6C 280044DC */  ld          $4, 0x28($2)
/* 024070 01DCFD70 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 024074 01DCFD74 00000000 */   nop
/* 024078 01DCFD78 28860070 */  paddub      $16, $0, $0
/* 02407C 01DCFD7C 18000010 */  b           .L01DCFDE0_2D55E0
/* 024080 01DCFD80 00000000 */   nop
.L01DCFD84_2D5584:
/* 024084 01DCFD84 40101000 */  sll         $2, $16, 1
/* 024088 01DCFD88 21105000 */  addu        $2, $2, $16
/* 02408C 01DCFD8C 80100200 */  sll         $2, $2, 2
/* 024090 01DCFD90 21105000 */  addu        $2, $2, $16
/* 024094 01DCFD94 80180200 */  sll         $3, $2, 2
/* 024098 01DCFD98 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 02409C 01DCFD9C F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 0240A0 01DCFDA0 21104300 */  addu        $2, $2, $3
/* 0240A4 01DCFDA4 00004290 */  lbu         $2, 0x0($2)
/* 0240A8 01DCFDA8 0C004010 */  beqz        $2, .L01DCFDDC_2D55DC
/* 0240AC 01DCFDAC 00000000 */   nop
/* 0240B0 01DCFDB0 B0110224 */  addiu       $2, $0, 0x11B0
/* 0240B4 01DCFDB4 18180202 */  mult        $3, $16, $2
/* 0240B8 01DCFDB8 DF01023C */  lui         $2, %hi(Chara__3)
/* 0240BC 01DCFDBC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 0240C0 01DCFDC0 21884300 */  addu        $17, $2, $3
/* 0240C4 01DCFDC4 28262072 */  paddub      $4, $17, $0
/* 0240C8 01DCFDC8 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 0240CC 01DCFDCC 00000000 */   nop
/* 0240D0 01DCFDD0 28262072 */  paddub      $4, $17, $0
/* 0240D4 01DCFDD4 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 0240D8 01DCFDD8 00000000 */   nop
.L01DCFDDC_2D55DC:
/* 0240DC 01DCFDDC 01001026 */  addiu       $16, $16, 0x1
.L01DCFDE0_2D55E0:
/* 0240E0 01DCFDE0 0900022A */  slti        $2, $16, 0x9
/* 0240E4 01DCFDE4 E7FF4014 */  bnez        $2, .L01DCFD84_2D5584
/* 0240E8 01DCFDE8 00000000 */   nop
/* 0240EC 01DCFDEC 34000424 */  addiu       $4, $0, 0x34
/* 0240F0 01DCFDF0 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 0240F4 01DCFDF4 00000000 */   nop
/* 0240F8 01DCFDF8 28860070 */  paddub      $16, $0, $0
/* 0240FC 01DCFDFC 25000010 */  b           .L01DCFE94_2D5694
/* 024100 01DCFE00 00000000 */   nop
.L01DCFE04_2D5604:
/* 024104 01DCFE04 40101000 */  sll         $2, $16, 1
/* 024108 01DCFE08 21105000 */  addu        $2, $2, $16
/* 02410C 01DCFE0C 80100200 */  sll         $2, $2, 2
/* 024110 01DCFE10 21105000 */  addu        $2, $2, $16
/* 024114 01DCFE14 80180200 */  sll         $3, $2, 2
/* 024118 01DCFE18 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 02411C 01DCFE1C F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 024120 01DCFE20 21104300 */  addu        $2, $2, $3
/* 024124 01DCFE24 00004290 */  lbu         $2, 0x0($2)
/* 024128 01DCFE28 19004010 */  beqz        $2, .L01DCFE90_2D5690
/* 02412C 01DCFE2C 00000000 */   nop
/* 024130 01DCFE30 E401023C */  lui         $2, %hi(CharaTex)
/* 024134 01DCFE34 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 024138 01DCFE38 21105000 */  addu        $2, $2, $16
/* 02413C 01DCFE3C 00004680 */  lb          $6, 0x0($2)
/* 024140 01DCFE40 C701023C */  lui         $2, %hi(TexManager)
/* 024144 01DCFE44 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024148 01DCFE48 D48B858F */  lw          $5, -0x742C($28)
/* 02414C 01DCFE4C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024150 01DCFE50 00000000 */   nop
/* 024154 01DCFE54 B0110224 */  addiu       $2, $0, 0x11B0
/* 024158 01DCFE58 18180202 */  mult        $3, $16, $2
/* 02415C 01DCFE5C DF01023C */  lui         $2, %hi(Chara__3)
/* 024160 01DCFE60 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 024164 01DCFE64 21884300 */  addu        $17, $2, $3
/* 024168 01DCFE68 28262072 */  paddub      $4, $17, $0
/* 02416C 01DCFE6C 4CE1040C */  jal         Step__10CCharacterFv
/* 024170 01DCFE70 00000000 */   nop
/* 024174 01DCFE74 28262072 */  paddub      $4, $17, $0
/* 024178 01DCFE78 282E0070 */  paddub      $5, $0, $0
/* 02417C 01DCFE7C 94E3040C */  jal         ClothStep__10CCharacterFi
/* 024180 01DCFE80 00000000 */   nop
/* 024184 01DCFE84 28262072 */  paddub      $4, $17, $0
/* 024188 01DCFE88 C4E4040C */  jal         Draw__10CCharacterFv
/* 02418C 01DCFE8C 00000000 */   nop
.L01DCFE90_2D5690:
/* 024190 01DCFE90 01001026 */  addiu       $16, $16, 0x1
.L01DCFE94_2D5694:
/* 024194 01DCFE94 0900022A */  slti        $2, $16, 0x9
/* 024198 01DCFE98 DAFF4014 */  bnez        $2, .L01DCFE04_2D5604
/* 02419C 01DCFE9C 00000000 */   nop
/* 0241A0 01DCFEA0 C701023C */  lui         $2, %hi(TexManager)
/* 0241A4 01DCFEA4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0241A8 01DCFEA8 D48B858F */  lw          $5, -0x742C($28)
/* 0241AC 01DCFEAC 16000624 */  addiu       $6, $0, 0x16
/* 0241B0 01DCFEB0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0241B4 01DCFEB4 00000000 */   nop
/* 0241B8 01DCFEB8 4800A427 */  addiu       $4, $29, 0x48
/* 0241BC 01DCFEBC C08A82DF */  ld          $2, -0x7540($28)
/* 0241C0 01DCFEC0 000082FC */  sd          $2, 0x0($4)
/* 0241C4 01DCFEC4 02000524 */  addiu       $5, $0, 0x2
/* 0241C8 01DCFEC8 20000624 */  addiu       $6, $0, 0x20
/* 0241CC 01DCFECC 283E0070 */  paddub      $7, $0, $0
/* 0241D0 01DCFED0 B094050C */  jal         DepthOfField__FPfiii
/* 0241D4 01DCFED4 00000000 */   nop
/* 0241D8 01DCFED8 3000BF7B */  lq          $31, 0x30($29)
/* 0241DC 01DCFEDC 2000B17B */  lq          $17, 0x20($29)
/* 0241E0 01DCFEE0 1000B07B */  lq          $16, 0x10($29)
/* 0241E4 01DCFEE4 5000BD27 */  addiu       $29, $29, 0x50
/* 0241E8 01DCFEE8 0800E003 */  jr          $31
/* 0241EC 01DCFEEC 00000000 */   nop
