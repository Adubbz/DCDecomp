.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpA_DrawProcess__Fv
/* 009CD0 01DB59D0 30FFBD27 */  addiu       $29, $29, -0xD0
/* 009CD4 01DB59D4 5000BF7F */  sq          $31, 0x50($29)
/* 009CD8 01DB59D8 4000B37F */  sq          $19, 0x40($29)
/* 009CDC 01DB59DC 3000B27F */  sq          $18, 0x30($29)
/* 009CE0 01DB59E0 2000B17F */  sq          $17, 0x20($29)
/* 009CE4 01DB59E4 1000B07F */  sq          $16, 0x10($29)
/* 009CE8 01DB59E8 0800B6E7 */  swc1        $f22, 0x8($29)
/* 009CEC 01DB59EC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 009CF0 01DB59F0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 009CF4 01DB59F4 C701023C */  lui         $2, %hi(TexManager)
/* 009CF8 01DB59F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 009CFC 01DB59FC D48B858F */  lw          $5, -0x742C($28)
/* 009D00 01DB5A00 0A000624 */  addiu       $6, $0, 0xA
/* 009D04 01DB5A04 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 009D08 01DB5A08 00000000 */   nop
/* 009D0C 01DB5A0C E201023C */  lui         $2, %hi(OP_GroundMap)
/* 009D10 01DB5A10 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 009D14 01DB5A14 700E050C */  jal         Draw__4CMapFv
/* 009D18 01DB5A18 00000000 */   nop
/* 009D1C 01DB5A1C C701023C */  lui         $2, %hi(TexManager)
/* 009D20 01DB5A20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 009D24 01DB5A24 D48B858F */  lw          $5, -0x742C($28)
/* 009D28 01DB5A28 0B000624 */  addiu       $6, $0, 0xB
/* 009D2C 01DB5A2C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 009D30 01DB5A30 00000000 */   nop
/* 009D34 01DB5A34 0898828F */  lw          $2, -0x67F8($28)
/* 009D38 01DB5A38 03004014 */  bnez        $2, .L01DB5A48_2BB248
/* 009D3C 01DB5A3C 00000000 */   nop
/* 009D40 01DB5A40 B4E0760C */  jal         setTexScroll__Fv
/* 009D44 01DB5A44 00000000 */   nop
.L01DB5A48_2BB248:
/* 009D48 01DB5A48 DE01013C */  lui         $1, %hi(CScript__2)
/* 009D4C 01DB5A4C 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 009D50 01DB5A50 2C000224 */  addiu       $2, $0, 0x2C
/* 009D54 01DB5A54 10006210 */  beq         $3, $2, .L01DB5A98_2BB298
/* 009D58 01DB5A58 00000000 */   nop
/* 009D5C 01DB5A5C 0F006228 */  slti        $2, $3, 0xF
/* 009D60 01DB5A60 04004014 */  bnez        $2, .L01DB5A74_2BB274
/* 009D64 01DB5A64 00000000 */   nop
/* 009D68 01DB5A68 27006228 */  slti        $2, $3, 0x27
/* 009D6C 01DB5A6C 05004014 */  bnez        $2, .L01DB5A84_2BB284
/* 009D70 01DB5A70 00000000 */   nop
.L01DB5A74_2BB274:
/* 009D74 01DB5A74 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 009D78 01DB5A78 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 009D7C 01DB5A7C 700E050C */  jal         Draw__4CMapFv
/* 009D80 01DB5A80 00000000 */   nop
.L01DB5A84_2BB284:
/* 009D84 01DB5A84 DD01013C */  lui         $1, %hi(ambient$359 + 0xC)
/* 009D88 01DB5A88 4C6620AC */  sw          $0, %lo(ambient$359 + 0xC)($1)
/* 009D8C 01DB5A8C F09880AF */  sw          $0, -0x6710($28)
/* 009D90 01DB5A90 24000010 */  b           .L01DB5B24_2BB324
/* 009D94 01DB5A94 00000000 */   nop
.L01DB5A98_2BB298:
/* 009D98 01DB5A98 6000A427 */  addiu       $4, $29, 0x60
/* 009D9C 01DB5A9C 4CB7040C */  jal         MGGetAmbient__FPf
/* 009DA0 01DB5AA0 00000000 */   nop
/* 009DA4 01DB5AA4 F098828F */  lw          $2, -0x6710($28)
/* 009DA8 01DB5AA8 BD024128 */  slti        $1, $2, 0x2BD
/* 009DAC 01DB5AAC 10002014 */  bnez        $1, .L01DB5AF0_2BB2F0
/* 009DB0 01DB5AB0 00000000 */   nop
/* 009DB4 01DB5AB4 DD01013C */  lui         $1, %hi(ambient$359 + 0xC)
/* 009DB8 01DB5AB8 4C6621C4 */  lwc1        $f1, %lo(ambient$359 + 0xC)($1)
/* 009DBC 01DB5ABC 0043023C */  lui         $2, (0x43000000 >> 16)
/* 009DC0 01DB5AC0 00008244 */  mtc1        $2, $f0
/* 009DC4 01DB5AC4 00000000 */  nop
/* 009DC8 01DB5AC8 34080046 */  c.lt.s      $f1, $f0
/* 009DCC 01DB5ACC 00000000 */  nop
/* 009DD0 01DB5AD0 09000045 */  bc1f        .L01DB5AF8_2BB2F8
/* 009DD4 01DB5AD4 00000000 */   nop
/* 009DD8 01DB5AD8 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 009DDC 01DB5ADC 00080046 */  add.s       $f0, $f1, $f0
/* 009DE0 01DB5AE0 DD01013C */  lui         $1, %hi(ambient$359 + 0xC)
/* 009DE4 01DB5AE4 4C6620E4 */  swc1        $f0, %lo(ambient$359 + 0xC)($1)
/* 009DE8 01DB5AE8 03000010 */  b           .L01DB5AF8_2BB2F8
/* 009DEC 01DB5AEC 00000000 */   nop
.L01DB5AF0_2BB2F0:
/* 009DF0 01DB5AF0 01004224 */  addiu       $2, $2, 0x1
/* 009DF4 01DB5AF4 F09882AF */  sw          $2, -0x6710($28)
.L01DB5AF8_2BB2F8:
/* 009DF8 01DB5AF8 DD01023C */  lui         $2, %hi(ambient$359)
/* 009DFC 01DB5AFC 40664424 */  addiu       $4, $2, %lo(ambient$359)
/* 009E00 01DB5B00 40B7040C */  jal         MGSetAmbient__FPf
/* 009E04 01DB5B04 00000000 */   nop
/* 009E08 01DB5B08 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 009E0C 01DB5B0C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 009E10 01DB5B10 700E050C */  jal         Draw__4CMapFv
/* 009E14 01DB5B14 00000000 */   nop
/* 009E18 01DB5B18 6000A427 */  addiu       $4, $29, 0x60
/* 009E1C 01DB5B1C 40B7040C */  jal         MGSetAmbient__FPf
/* 009E20 01DB5B20 00000000 */   nop
.L01DB5B24_2BB324:
/* 009E24 01DB5B24 28860070 */  paddub      $16, $0, $0
/* 009E28 01DB5B28 37000010 */  b           .L01DB5C08_2BB408
/* 009E2C 01DB5B2C 00000000 */   nop
.L01DB5B30_2BB330:
/* 009E30 01DB5B30 01000224 */  addiu       $2, $0, 0x1
/* 009E34 01DB5B34 33000212 */  beq         $16, $2, .L01DB5C04_2BB404
/* 009E38 01DB5B38 00000000 */   nop
/* 009E3C 01DB5B3C 40101000 */  sll         $2, $16, 1
/* 009E40 01DB5B40 21105000 */  addu        $2, $2, $16
/* 009E44 01DB5B44 80100200 */  sll         $2, $2, 2
/* 009E48 01DB5B48 21105000 */  addu        $2, $2, $16
/* 009E4C 01DB5B4C 80180200 */  sll         $3, $2, 2
/* 009E50 01DB5B50 DE01023C */  lui         $2, %hi(CScript__2 + 0x30)
/* 009E54 01DB5B54 301B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x30)
/* 009E58 01DB5B58 21104300 */  addu        $2, $2, $3
/* 009E5C 01DB5B5C 00004290 */  lbu         $2, 0x0($2)
/* 009E60 01DB5B60 28004010 */  beqz        $2, .L01DB5C04_2BB404
/* 009E64 01DB5B64 00000000 */   nop
/* 009E68 01DB5B68 E101023C */  lui         $2, %hi(CharaTex__2)
/* 009E6C 01DB5B6C B0954224 */  addiu       $2, $2, %lo(CharaTex__2)
/* 009E70 01DB5B70 21105000 */  addu        $2, $2, $16
/* 009E74 01DB5B74 00004680 */  lb          $6, 0x0($2)
/* 009E78 01DB5B78 C701023C */  lui         $2, %hi(TexManager)
/* 009E7C 01DB5B7C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 009E80 01DB5B80 D48B858F */  lw          $5, -0x742C($28)
/* 009E84 01DB5B84 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 009E88 01DB5B88 00000000 */   nop
/* 009E8C 01DB5B8C 28260072 */  paddub      $4, $16, $0
/* 009E90 01DB5B90 F4E1760C */  jal         FaceChange__Fi
/* 009E94 01DB5B94 00000000 */   nop
/* 009E98 01DB5B98 0898828F */  lw          $2, -0x67F8($28)
/* 009E9C 01DB5B9C 08004014 */  bnez        $2, .L01DB5BC0_2BB3C0
/* 009EA0 01DB5BA0 00000000 */   nop
/* 009EA4 01DB5BA4 B0110224 */  addiu       $2, $0, 0x11B0
/* 009EA8 01DB5BA8 18180202 */  mult        $3, $16, $2
/* 009EAC 01DB5BAC DF01023C */  lui         $2, %hi(Chara__3)
/* 009EB0 01DB5BB0 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 009EB4 01DB5BB4 21204300 */  addu        $4, $2, $3
/* 009EB8 01DB5BB8 4CE1040C */  jal         Step__10CCharacterFv
/* 009EBC 01DB5BBC 00000000 */   nop
.L01DB5BC0_2BB3C0:
/* 009EC0 01DB5BC0 B0110224 */  addiu       $2, $0, 0x11B0
/* 009EC4 01DB5BC4 18180202 */  mult        $3, $16, $2
/* 009EC8 01DB5BC8 DF01023C */  lui         $2, %hi(Chara__3)
/* 009ECC 01DB5BCC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 009ED0 01DB5BD0 21204300 */  addu        $4, $2, $3
/* 009ED4 01DB5BD4 C4E4040C */  jal         Draw__10CCharacterFv
/* 009ED8 01DB5BD8 00000000 */   nop
/* 009EDC 01DB5BDC 02000224 */  addiu       $2, $0, 0x2
/* 009EE0 01DB5BE0 03000216 */  bne         $16, $2, .L01DB5BF0_2BB3F0
/* 009EE4 01DB5BE4 00000000 */   nop
/* 009EE8 01DB5BE8 6CDE760C */  jal         ShisaiShadow__Fv
/* 009EEC 01DB5BEC 00000000 */   nop
.L01DB5BF0_2BB3F0:
/* 009EF0 01DB5BF0 03000224 */  addiu       $2, $0, 0x3
/* 009EF4 01DB5BF4 03000216 */  bne         $16, $2, .L01DB5C04_2BB404
/* 009EF8 01DB5BF8 00000000 */   nop
/* 009EFC 01DB5BFC 38DE760C */  jal         ShogunShadow__Fv
/* 009F00 01DB5C00 00000000 */   nop
.L01DB5C04_2BB404:
/* 009F04 01DB5C04 01001026 */  addiu       $16, $16, 0x1
.L01DB5C08_2BB408:
/* 009F08 01DB5C08 0600022A */  slti        $2, $16, 0x6
/* 009F0C 01DB5C0C C8FF4014 */  bnez        $2, .L01DB5B30_2BB330
/* 009F10 01DB5C10 00000000 */   nop
/* 009F14 01DB5C14 DE01013C */  lui         $1, %hi(CScript__2 + 0x64)
/* 009F18 01DB5C18 641B2290 */  lbu         $2, %lo(CScript__2 + 0x64)($1)
/* 009F1C 01DB5C1C 8D004010 */  beqz        $2, .L01DB5E54_2BB654
/* 009F20 01DB5C20 00000000 */   nop
/* 009F24 01DB5C24 E101013C */  lui         $1, %hi(CharaTex__2 + 0x1)
/* 009F28 01DB5C28 B1952680 */  lb          $6, %lo(CharaTex__2 + 0x1)($1)
/* 009F2C 01DB5C2C C701023C */  lui         $2, %hi(TexManager)
/* 009F30 01DB5C30 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 009F34 01DB5C34 D48B858F */  lw          $5, -0x742C($28)
/* 009F38 01DB5C38 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 009F3C 01DB5C3C 00000000 */   nop
/* 009F40 01DB5C40 0898828F */  lw          $2, -0x67F8($28)
/* 009F44 01DB5C44 05004014 */  bnez        $2, .L01DB5C5C_2BB45C
/* 009F48 01DB5C48 00000000 */   nop
/* 009F4C 01DB5C4C DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 009F50 01DB5C50 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 009F54 01DB5C54 4CE1040C */  jal         Step__10CCharacterFv
/* 009F58 01DB5C58 00000000 */   nop
.L01DB5C5C_2BB45C:
/* 009F5C 01DB5C5C F8988283 */  lb          $2, -0x6708($28)
/* 009F60 01DB5C60 04004014 */  bnez        $2, .L01DB5C74_2BB474
/* 009F64 01DB5C64 00000000 */   nop
/* 009F68 01DB5C68 F49880AF */  sw          $0, -0x670C($28)
/* 009F6C 01DB5C6C 01000224 */  addiu       $2, $0, 0x1
/* 009F70 01DB5C70 F89882A3 */  sb          $2, -0x6708($28)
.L01DB5C74_2BB474:
/* 009F74 01DB5C74 00998283 */  lb          $2, -0x6700($28)
/* 009F78 01DB5C78 04004014 */  bnez        $2, .L01DB5C8C_2BB48C
/* 009F7C 01DB5C7C 00000000 */   nop
/* 009F80 01DB5C80 FC9880AF */  sw          $0, -0x6704($28)
/* 009F84 01DB5C84 01000224 */  addiu       $2, $0, 0x1
/* 009F88 01DB5C88 009982A3 */  sb          $2, -0x6700($28)
.L01DB5C8C_2BB48C:
/* 009F8C 01DB5C8C 08998283 */  lb          $2, -0x66F8($28)
/* 009F90 01DB5C90 04004014 */  bnez        $2, .L01DB5CA4_2BB4A4
/* 009F94 01DB5C94 00000000 */   nop
/* 009F98 01DB5C98 049980AF */  sw          $0, -0x66FC($28)
/* 009F9C 01DB5C9C 01000224 */  addiu       $2, $0, 0x1
/* 009FA0 01DB5CA0 089982A3 */  sb          $2, -0x66F8($28)
.L01DB5CA4_2BB4A4:
/* 009FA4 01DB5CA4 DE01013C */  lui         $1, %hi(CScript__2)
/* 009FA8 01DB5CA8 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 009FAC 01DB5CAC 11000224 */  addiu       $2, $0, 0x11
/* 009FB0 01DB5CB0 61006214 */  bne         $3, $2, .L01DB5E38_2BB638
/* 009FB4 01DB5CB4 00000000 */   nop
/* 009FB8 01DB5CB8 281E0070 */  paddub      $3, $0, $0
/* 009FBC 01DB5CBC 28000010 */  b           .L01DB5D60_2BB560
/* 009FC0 01DB5CC0 00000000 */   nop
.L01DB5CC4_2BB4C4:
/* 009FC4 01DB5CC4 00210300 */  sll         $4, $3, 4
/* 009FC8 01DB5CC8 2500023C */  lui         $2, %hi(lightcolor)
/* 009FCC 01DB5CCC C01B4224 */  addiu       $2, $2, %lo(lightcolor)
/* 009FD0 01DB5CD0 21104400 */  addu        $2, $2, $4
/* 009FD4 01DB5CD4 000040C4 */  lwc1        $f0, 0x0($2)
/* 009FD8 01DB5CD8 F49881C7 */  lwc1        $f1, -0x670C($28)
/* 009FDC 01DB5CDC 36000146 */  c.le.s      $f0, $f1
/* 009FE0 01DB5CE0 00000000 */  nop
/* 009FE4 01DB5CE4 05000145 */  bc1t        .L01DB5CFC_2BB4FC
/* 009FE8 01DB5CE8 00000000 */   nop
/* 009FEC 01DB5CEC E201023C */  lui         $2, %hi(lcolor$404)
/* 009FF0 01DB5CF0 70F64224 */  addiu       $2, $2, %lo(lcolor$404)
/* 009FF4 01DB5CF4 21104400 */  addu        $2, $2, $4
/* 009FF8 01DB5CF8 000041E4 */  swc1        $f1, 0x0($2)
.L01DB5CFC_2BB4FC:
/* 009FFC 01DB5CFC 2500023C */  lui         $2, %hi(lightcolor + 0x4)
/* 00A000 01DB5D00 C41B4224 */  addiu       $2, $2, %lo(lightcolor + 0x4)
/* 00A004 01DB5D04 21104400 */  addu        $2, $2, $4
/* 00A008 01DB5D08 000040C4 */  lwc1        $f0, 0x0($2)
/* 00A00C 01DB5D0C 36000146 */  c.le.s      $f0, $f1
/* 00A010 01DB5D10 00000000 */  nop
/* 00A014 01DB5D14 05000145 */  bc1t        .L01DB5D2C_2BB52C
/* 00A018 01DB5D18 00000000 */   nop
/* 00A01C 01DB5D1C E201023C */  lui         $2, %hi(lcolor$404 + 0x4)
/* 00A020 01DB5D20 74F64224 */  addiu       $2, $2, %lo(lcolor$404 + 0x4)
/* 00A024 01DB5D24 21104400 */  addu        $2, $2, $4
/* 00A028 01DB5D28 000041E4 */  swc1        $f1, 0x0($2)
.L01DB5D2C_2BB52C:
/* 00A02C 01DB5D2C 2500023C */  lui         $2, %hi(lightcolor + 0x8)
/* 00A030 01DB5D30 C81B4224 */  addiu       $2, $2, %lo(lightcolor + 0x8)
/* 00A034 01DB5D34 21104400 */  addu        $2, $2, $4
/* 00A038 01DB5D38 000040C4 */  lwc1        $f0, 0x0($2)
/* 00A03C 01DB5D3C 36000146 */  c.le.s      $f0, $f1
/* 00A040 01DB5D40 00000000 */  nop
/* 00A044 01DB5D44 05000145 */  bc1t        .L01DB5D5C_2BB55C
/* 00A048 01DB5D48 00000000 */   nop
/* 00A04C 01DB5D4C E201023C */  lui         $2, %hi(lcolor$404 + 0x8)
/* 00A050 01DB5D50 78F64224 */  addiu       $2, $2, %lo(lcolor$404 + 0x8)
/* 00A054 01DB5D54 21104400 */  addu        $2, $2, $4
/* 00A058 01DB5D58 000041E4 */  swc1        $f1, 0x0($2)
.L01DB5D5C_2BB55C:
/* 00A05C 01DB5D5C 01006324 */  addiu       $3, $3, 0x1
.L01DB5D60_2BB560:
/* 00A060 01DB5D60 03006228 */  slti        $2, $3, 0x3
/* 00A064 01DB5D64 D7FF4014 */  bnez        $2, .L01DB5CC4_2BB4C4
/* 00A068 01DB5D68 00000000 */   nop
/* 00A06C 01DB5D6C 0499828F */  lw          $2, -0x66FC($28)
/* 00A070 01DB5D70 B5004128 */  slti        $1, $2, 0xB5
/* 00A074 01DB5D74 10002014 */  bnez        $1, .L01DB5DB8_2BB5B8
/* 00A078 01DB5D78 00000000 */   nop
/* 00A07C 01DB5D7C F49881C7 */  lwc1        $f1, -0x670C($28)
/* 00A080 01DB5D80 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00A084 01DB5D84 00008244 */  mtc1        $2, $f0
/* 00A088 01DB5D88 00000000 */  nop
/* 00A08C 01DB5D8C 34080046 */  c.lt.s      $f1, $f0
/* 00A090 01DB5D90 00000000 */  nop
/* 00A094 01DB5D94 0A000045 */  bc1f        .L01DB5DC0_2BB5C0
/* 00A098 01DB5D98 00000000 */   nop
/* 00A09C 01DB5D9C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00A0A0 01DB5DA0 00008244 */  mtc1        $2, $f0
/* 00A0A4 01DB5DA4 00000000 */  nop
/* 00A0A8 01DB5DA8 00080046 */  add.s       $f0, $f1, $f0
/* 00A0AC 01DB5DAC F49880E7 */  swc1        $f0, -0x670C($28)
/* 00A0B0 01DB5DB0 03000010 */  b           .L01DB5DC0_2BB5C0
/* 00A0B4 01DB5DB4 00000000 */   nop
.L01DB5DB8_2BB5B8:
/* 00A0B8 01DB5DB8 01004224 */  addiu       $2, $2, 0x1
/* 00A0BC 01DB5DBC 049982AF */  sw          $2, -0x66FC($28)
.L01DB5DC0_2BB5C0:
/* 00A0C0 01DB5DC0 2500023C */  lui         $2, %hi(light)
/* 00A0C4 01DB5DC4 801B4424 */  addiu       $4, $2, %lo(light)
/* 00A0C8 01DB5DC8 E201023C */  lui         $2, %hi(lcolor$404)
/* 00A0CC 01DB5DCC 70F64524 */  addiu       $5, $2, %lo(lcolor$404)
/* 00A0D0 01DB5DD0 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 00A0D4 01DB5DD4 00000000 */   nop
/* 00A0D8 01DB5DD8 DD01023C */  lui         $2, %hi(LIT_421__5)
/* 00A0DC 01DB5DDC 50664224 */  addiu       $2, $2, %lo(LIT_421__5)
/* 00A0E0 01DB5DE0 7000A327 */  addiu       $3, $29, 0x70
/* 00A0E4 01DB5DE4 00004278 */  lq          $2, 0x0($2)
/* 00A0E8 01DB5DE8 0000627C */  sq          $2, 0x0($3)
/* 00A0EC 01DB5DEC FC9881C7 */  lwc1        $f1, -0x6704($28)
/* 00A0F0 01DB5DF0 7C00A1E7 */  swc1        $f1, 0x7C($29)
/* 00A0F4 01DB5DF4 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00A0F8 01DB5DF8 00008244 */  mtc1        $2, $f0
/* 00A0FC 01DB5DFC 00000000 */  nop
/* 00A100 01DB5E00 34080046 */  c.lt.s      $f1, $f0
/* 00A104 01DB5E04 00000000 */  nop
/* 00A108 01DB5E08 06000045 */  bc1f        .L01DB5E24_2BB624
/* 00A10C 01DB5E0C 00000000 */   nop
/* 00A110 01DB5E10 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00A114 01DB5E14 00008244 */  mtc1        $2, $f0
/* 00A118 01DB5E18 00000000 */  nop
/* 00A11C 01DB5E1C 00080046 */  add.s       $f0, $f1, $f0
/* 00A120 01DB5E20 FC9880E7 */  swc1        $f0, -0x6704($28)
.L01DB5E24_2BB624:
/* 00A124 01DB5E24 7000A427 */  addiu       $4, $29, 0x70
/* 00A128 01DB5E28 40B7040C */  jal         MGSetAmbient__FPf
/* 00A12C 01DB5E2C 00000000 */   nop
/* 00A130 01DB5E30 04000010 */  b           .L01DB5E44_2BB644
/* 00A134 01DB5E34 00000000 */   nop
.L01DB5E38_2BB638:
/* 00A138 01DB5E38 FC9880AF */  sw          $0, -0x6704($28)
/* 00A13C 01DB5E3C F49880AF */  sw          $0, -0x670C($28)
/* 00A140 01DB5E40 049980AF */  sw          $0, -0x66FC($28)
.L01DB5E44_2BB644:
/* 00A144 01DB5E44 DF01023C */  lui         $2, %hi(Chara__3 + 0x11B0)
/* 00A148 01DB5E48 90104424 */  addiu       $4, $2, %lo(Chara__3 + 0x11B0)
/* 00A14C 01DB5E4C C4E4040C */  jal         Draw__10CCharacterFv
/* 00A150 01DB5E50 00000000 */   nop
.L01DB5E54_2BB654:
/* 00A154 01DB5E54 2500023C */  lui         $2, %hi(ambientlight)
/* 00A158 01DB5E58 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 00A15C 01DB5E5C 40B7040C */  jal         MGSetAmbient__FPf
/* 00A160 01DB5E60 00000000 */   nop
/* 00A164 01DB5E64 2500023C */  lui         $2, %hi(light)
/* 00A168 01DB5E68 801B4424 */  addiu       $4, $2, %lo(light)
/* 00A16C 01DB5E6C 2500023C */  lui         $2, %hi(lightcolor)
/* 00A170 01DB5E70 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 00A174 01DB5E74 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 00A178 01DB5E78 00000000 */   nop
/* 00A17C 01DB5E7C 8000A427 */  addiu       $4, $29, 0x80
/* 00A180 01DB5E80 2500023C */  lui         $2, %hi(ambientlight)
/* 00A184 01DB5E84 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 00A188 01DB5E88 0C86040C */  jal         sceVu0CopyVector
/* 00A18C 01DB5E8C 00000000 */   nop
/* 00A190 01DB5E90 DE01013C */  lui         $1, %hi(CScript__2)
/* 00A194 01DB5E94 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00A198 01DB5E98 2C000224 */  addiu       $2, $0, 0x2C
/* 00A19C 01DB5E9C 1E006214 */  bne         $3, $2, .L01DB5F18_2BB718
/* 00A1A0 01DB5EA0 00000000 */   nop
/* 00A1A4 01DB5EA4 0498838F */  lw          $3, -0x67FC($28)
/* 00A1A8 01DB5EA8 B0110224 */  addiu       $2, $0, 0x11B0
/* 00A1AC 01DB5EAC 18186200 */  mult        $3, $3, $2
/* 00A1B0 01DB5EB0 E101023C */  lui         $2, %hi(Cam__2 + 0x2F0)
/* 00A1B4 01DB5EB4 C09B4224 */  addiu       $2, $2, %lo(Cam__2 + 0x2F0)
/* 00A1B8 01DB5EB8 21104300 */  addu        $2, $2, $3
/* 00A1BC 01DB5EBC 000041C4 */  lwc1        $f1, 0x0($2)
/* 00A1C0 01DB5EC0 7943023C */  lui         $2, (0x43790000 >> 16)
/* 00A1C4 01DB5EC4 00008244 */  mtc1        $2, $f0
/* 00A1C8 01DB5EC8 00000000 */  nop
/* 00A1CC 01DB5ECC 36080046 */  c.le.s      $f1, $f0
/* 00A1D0 01DB5ED0 00000000 */  nop
/* 00A1D4 01DB5ED4 12000145 */  bc1t        .L01DB5F20_2BB720
/* 00A1D8 01DB5ED8 00000000 */   nop
/* 00A1DC 01DB5EDC D09881C7 */  lwc1        $f1, -0x6730($28)
/* 00A1E0 01DB5EE0 9C8280C7 */  lwc1        $f0, -0x7D64($28)
/* 00A1E4 01DB5EE4 41080046 */  sub.s       $f1, $f1, $f0
/* 00A1E8 01DB5EE8 D09881E7 */  swc1        $f1, -0x6730($28)
/* 00A1EC 01DB5EEC 00008044 */  mtc1        $0, $f0
/* 00A1F0 01DB5EF0 00000000 */  nop
/* 00A1F4 01DB5EF4 34080046 */  c.lt.s      $f1, $f0
/* 00A1F8 01DB5EF8 00000000 */  nop
/* 00A1FC 01DB5EFC 02000045 */  bc1f        .L01DB5F08_2BB708
/* 00A200 01DB5F00 00000000 */   nop
/* 00A204 01DB5F04 D09880AF */  sw          $0, -0x6730($28)
.L01DB5F08_2BB708:
/* 00A208 01DB5F08 D09880C7 */  lwc1        $f0, -0x6730($28)
/* 00A20C 01DB5F0C 8C00A0E7 */  swc1        $f0, 0x8C($29)
/* 00A210 01DB5F10 03000010 */  b           .L01DB5F20_2BB720
/* 00A214 01DB5F14 00000000 */   nop
.L01DB5F18_2BB718:
/* 00A218 01DB5F18 FE42023C */  lui         $2, (0x42FE0000 >> 16)
/* 00A21C 01DB5F1C D09882AF */  sw          $2, -0x6730($28)
.L01DB5F20_2BB720:
/* 00A220 01DB5F20 DE01013C */  lui         $1, %hi(CScript__2 + 0x168)
/* 00A224 01DB5F24 681C2290 */  lbu         $2, %lo(CScript__2 + 0x168)($1)
/* 00A228 01DB5F28 2A004010 */  beqz        $2, .L01DB5FD4_2BB7D4
/* 00A22C 01DB5F2C 00000000 */   nop
/* 00A230 01DB5F30 0898828F */  lw          $2, -0x67F8($28)
/* 00A234 01DB5F34 27004014 */  bnez        $2, .L01DB5FD4_2BB7D4
/* 00A238 01DB5F38 00000000 */   nop
/* 00A23C 01DB5F3C E49881C7 */  lwc1        $f1, -0x671C($28)
/* 00A240 01DB5F40 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00A244 01DB5F44 00008244 */  mtc1        $2, $f0
/* 00A248 01DB5F48 00000000 */  nop
/* 00A24C 01DB5F4C 34080046 */  c.lt.s      $f1, $f0
/* 00A250 01DB5F50 00000000 */  nop
/* 00A254 01DB5F54 08000145 */  bc1t        .L01DB5F78_2BB778
/* 00A258 01DB5F58 00000000 */   nop
/* 00A25C 01DB5F5C F043023C */  lui         $2, (0x43F00000 >> 16)
/* 00A260 01DB5F60 00008244 */  mtc1        $2, $f0
/* 00A264 01DB5F64 00000000 */  nop
/* 00A268 01DB5F68 36080046 */  c.le.s      $f1, $f0
/* 00A26C 01DB5F6C 00000000 */  nop
/* 00A270 01DB5F70 09000145 */  bc1t        .L01DB5F98_2BB798
/* 00A274 01DB5F74 00000000 */   nop
.L01DB5F78_2BB778:
/* 00A278 01DB5F78 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 00A27C 01DB5F7C 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 00A280 01DB5F80 4CE1040C */  jal         Step__10CCharacterFv
/* 00A284 01DB5F84 00000000 */   nop
/* 00A288 01DB5F88 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 00A28C 01DB5F8C B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 00A290 01DB5F90 4CE1040C */  jal         Step__10CCharacterFv
/* 00A294 01DB5F94 00000000 */   nop
.L01DB5F98_2BB798:
/* 00A298 01DB5F98 E49881C7 */  lwc1        $f1, -0x671C($28)
/* 00A29C 01DB5F9C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00A2A0 01DB5FA0 00008244 */  mtc1        $2, $f0
/* 00A2A4 01DB5FA4 00000000 */  nop
/* 00A2A8 01DB5FA8 40080046 */  add.s       $f1, $f1, $f0
/* 00A2AC 01DB5FAC E49881E7 */  swc1        $f1, -0x671C($28)
/* 00A2B0 01DB5FB0 10270224 */  addiu       $2, $0, 0x2710
/* 00A2B4 01DB5FB4 00008244 */  mtc1        $2, $f0
/* 00A2B8 01DB5FB8 00000000 */  nop
/* 00A2BC 01DB5FBC 20008046 */  cvt.s.w     $f0, $f0
/* 00A2C0 01DB5FC0 36080046 */  c.le.s      $f1, $f0
/* 00A2C4 01DB5FC4 00000000 */  nop
/* 00A2C8 01DB5FC8 02000145 */  bc1t        .L01DB5FD4_2BB7D4
/* 00A2CC 01DB5FCC 00000000 */   nop
/* 00A2D0 01DB5FD0 E49880E7 */  swc1        $f0, -0x671C($28)
.L01DB5FD4_2BB7D4:
/* 00A2D4 01DB5FD4 DE01013C */  lui         $1, %hi(CScript__2 + 0x168)
/* 00A2D8 01DB5FD8 681C2290 */  lbu         $2, %lo(CScript__2 + 0x168)($1)
/* 00A2DC 01DB5FDC 14004010 */  beqz        $2, .L01DB6030_2BB830
/* 00A2E0 01DB5FE0 00000000 */   nop
/* 00A2E4 01DB5FE4 E101013C */  lui         $1, %hi(CharaTex__2 + 0x6)
/* 00A2E8 01DB5FE8 B6952680 */  lb          $6, %lo(CharaTex__2 + 0x6)($1)
/* 00A2EC 01DB5FEC C701023C */  lui         $2, %hi(TexManager)
/* 00A2F0 01DB5FF0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00A2F4 01DB5FF4 D48B858F */  lw          $5, -0x742C($28)
/* 00A2F8 01DB5FF8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00A2FC 01DB5FFC 00000000 */   nop
/* 00A300 01DB6000 06000424 */  addiu       $4, $0, 0x6
/* 00A304 01DB6004 F4E1760C */  jal         FaceChange__Fi
/* 00A308 01DB6008 00000000 */   nop
/* 00A30C 01DB600C 8000A427 */  addiu       $4, $29, 0x80
/* 00A310 01DB6010 40B7040C */  jal         MGSetAmbient__FPf
/* 00A314 01DB6014 00000000 */   nop
/* 00A318 01DB6018 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 00A31C 01DB601C 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 00A320 01DB6020 C4E4040C */  jal         Draw__10CCharacterFv
/* 00A324 01DB6024 00000000 */   nop
/* 00A328 01DB6028 D8DD760C */  jal         ReaderShadow__Fv
/* 00A32C 01DB602C 00000000 */   nop
.L01DB6030_2BB830:
/* 00A330 01DB6030 DE01013C */  lui         $1, %hi(CScript__2 + 0x19C)
/* 00A334 01DB6034 9C1C2290 */  lbu         $2, %lo(CScript__2 + 0x19C)($1)
/* 00A338 01DB6038 8E004010 */  beqz        $2, .L01DB6274_2BBA74
/* 00A33C 01DB603C 00000000 */   nop
/* 00A340 01DB6040 C701023C */  lui         $2, %hi(TexManager)
/* 00A344 01DB6044 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00A348 01DB6048 D48B858F */  lw          $5, -0x742C($28)
/* 00A34C 01DB604C 06000624 */  addiu       $6, $0, 0x6
/* 00A350 01DB6050 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00A354 01DB6054 00000000 */   nop
/* 00A358 01DB6058 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 00A35C 01DB605C B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 00A360 01DB6060 E201013C */  lui         $1, %hi(DancerPos)
/* 00A364 01DB6064 60E02CC4 */  lwc1        $f12, %lo(DancerPos)($1)
/* 00A368 01DB6068 E201013C */  lui         $1, %hi(DancerPos + 0x4)
/* 00A36C 01DB606C 64E02DC4 */  lwc1        $f13, %lo(DancerPos + 0x4)($1)
/* 00A370 01DB6070 E201013C */  lui         $1, %hi(DancerPos + 0x8)
/* 00A374 01DB6074 68E02EC4 */  lwc1        $f14, %lo(DancerPos + 0x8)($1)
/* 00A378 01DB6078 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00A37C 01DB607C 00000000 */   nop
/* 00A380 01DB6080 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 00A384 01DB6084 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 00A388 01DB6088 E201013C */  lui         $1, %hi(DancerRot)
/* 00A38C 01DB608C 90E22CC4 */  lwc1        $f12, %lo(DancerRot)($1)
/* 00A390 01DB6090 E201013C */  lui         $1, %hi(DancerRot + 0x4)
/* 00A394 01DB6094 94E22DC4 */  lwc1        $f13, %lo(DancerRot + 0x4)($1)
/* 00A398 01DB6098 E201013C */  lui         $1, %hi(DancerRot + 0x8)
/* 00A39C 01DB609C 98E22EC4 */  lwc1        $f14, %lo(DancerRot + 0x8)($1)
/* 00A3A0 01DB60A0 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00A3A4 01DB60A4 00000000 */   nop
/* 00A3A8 01DB60A8 8000A427 */  addiu       $4, $29, 0x80
/* 00A3AC 01DB60AC 40B7040C */  jal         MGSetAmbient__FPf
/* 00A3B0 01DB60B0 00000000 */   nop
/* 00A3B4 01DB60B4 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 00A3B8 01DB60B8 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 00A3BC 01DB60BC C4E4040C */  jal         Draw__10CCharacterFv
/* 00A3C0 01DB60C0 00000000 */   nop
/* 00A3C4 01DB60C4 08DE760C */  jal         DancerShadow__Fv
/* 00A3C8 01DB60C8 00000000 */   nop
/* 00A3CC 01DB60CC DE01013C */  lui         $1, %hi(CScript__2)
/* 00A3D0 01DB60D0 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00A3D4 01DB60D4 2D000224 */  addiu       $2, $0, 0x2D
/* 00A3D8 01DB60D8 32006210 */  beq         $3, $2, .L01DB61A4_2BB9A4
/* 00A3DC 01DB60DC 00000000 */   nop
/* 00A3E0 01DB60E0 2B000224 */  addiu       $2, $0, 0x2B
/* 00A3E4 01DB60E4 2C006210 */  beq         $3, $2, .L01DB6198_2BB998
/* 00A3E8 01DB60E8 00000000 */   nop
/* 00A3EC 01DB60EC 27000224 */  addiu       $2, $0, 0x27
/* 00A3F0 01DB60F0 26006210 */  beq         $3, $2, .L01DB618C_2BB98C
/* 00A3F4 01DB60F4 00000000 */   nop
/* 00A3F8 01DB60F8 0A000224 */  addiu       $2, $0, 0xA
/* 00A3FC 01DB60FC 20006210 */  beq         $3, $2, .L01DB6180_2BB980
/* 00A400 01DB6100 00000000 */   nop
/* 00A404 01DB6104 09000224 */  addiu       $2, $0, 0x9
/* 00A408 01DB6108 1A006210 */  beq         $3, $2, .L01DB6174_2BB974
/* 00A40C 01DB610C 00000000 */   nop
/* 00A410 01DB6110 08000224 */  addiu       $2, $0, 0x8
/* 00A414 01DB6114 14006210 */  beq         $3, $2, .L01DB6168_2BB968
/* 00A418 01DB6118 00000000 */   nop
/* 00A41C 01DB611C 07000224 */  addiu       $2, $0, 0x7
/* 00A420 01DB6120 0E006210 */  beq         $3, $2, .L01DB615C_2BB95C
/* 00A424 01DB6124 00000000 */   nop
/* 00A428 01DB6128 03000224 */  addiu       $2, $0, 0x3
/* 00A42C 01DB612C 08006210 */  beq         $3, $2, .L01DB6150_2BB950
/* 00A430 01DB6130 00000000 */   nop
/* 00A434 01DB6134 03006010 */  beqz        $3, .L01DB6144_2BB944
/* 00A438 01DB6138 00000000 */   nop
/* 00A43C 01DB613C 1C000010 */  b           .L01DB61B0_2BB9B0
/* 00A440 01DB6140 00000000 */   nop
.L01DB6144_2BB944:
/* 00A444 01DB6144 1C001024 */  addiu       $16, $0, 0x1C
/* 00A448 01DB6148 1A000010 */  b           .L01DB61B4_2BB9B4
/* 00A44C 01DB614C 00000000 */   nop
.L01DB6150_2BB950:
/* 00A450 01DB6150 1E001024 */  addiu       $16, $0, 0x1E
/* 00A454 01DB6154 17000010 */  b           .L01DB61B4_2BB9B4
/* 00A458 01DB6158 00000000 */   nop
.L01DB615C_2BB95C:
/* 00A45C 01DB615C 1E001024 */  addiu       $16, $0, 0x1E
/* 00A460 01DB6160 14000010 */  b           .L01DB61B4_2BB9B4
/* 00A464 01DB6164 00000000 */   nop
.L01DB6168_2BB968:
/* 00A468 01DB6168 1E001024 */  addiu       $16, $0, 0x1E
/* 00A46C 01DB616C 11000010 */  b           .L01DB61B4_2BB9B4
/* 00A470 01DB6170 00000000 */   nop
.L01DB6174_2BB974:
/* 00A474 01DB6174 19001024 */  addiu       $16, $0, 0x19
/* 00A478 01DB6178 0E000010 */  b           .L01DB61B4_2BB9B4
/* 00A47C 01DB617C 00000000 */   nop
.L01DB6180_2BB980:
/* 00A480 01DB6180 0F001024 */  addiu       $16, $0, 0xF
/* 00A484 01DB6184 0B000010 */  b           .L01DB61B4_2BB9B4
/* 00A488 01DB6188 00000000 */   nop
.L01DB618C_2BB98C:
/* 00A48C 01DB618C 1E001024 */  addiu       $16, $0, 0x1E
/* 00A490 01DB6190 08000010 */  b           .L01DB61B4_2BB9B4
/* 00A494 01DB6194 00000000 */   nop
.L01DB6198_2BB998:
/* 00A498 01DB6198 1E001024 */  addiu       $16, $0, 0x1E
/* 00A49C 01DB619C 05000010 */  b           .L01DB61B4_2BB9B4
/* 00A4A0 01DB61A0 00000000 */   nop
.L01DB61A4_2BB9A4:
/* 00A4A4 01DB61A4 0E001024 */  addiu       $16, $0, 0xE
/* 00A4A8 01DB61A8 02000010 */  b           .L01DB61B4_2BB9B4
/* 00A4AC 01DB61AC 00000000 */   nop
.L01DB61B0_2BB9B0:
/* 00A4B0 01DB61B0 23001024 */  addiu       $16, $0, 0x23
.L01DB61B4_2BB9B4:
/* 00A4B4 01DB61B4 01001124 */  addiu       $17, $0, 0x1
/* 00A4B8 01DB61B8 2B000010 */  b           .L01DB6268_2BBA68
/* 00A4BC 01DB61BC 00000000 */   nop
.L01DB61C0_2BB9C0:
/* 00A4C0 01DB61C0 DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 00A4C4 01DB61C4 6C7B328C */  lw          $18, %lo(UraEventMan + 0x1CBC)($1)
/* 00A4C8 01DB61C8 00991100 */  sll         $19, $17, 4
/* 00A4CC 01DB61CC E201023C */  lui         $2, %hi(DancerPos)
/* 00A4D0 01DB61D0 60E04224 */  addiu       $2, $2, %lo(DancerPos)
/* 00A4D4 01DB61D4 21285300 */  addu        $5, $2, $19
/* 00A4D8 01DB61D8 E201023C */  lui         $2, %hi(DancerPos + 0x4)
/* 00A4DC 01DB61DC 64E04224 */  addiu       $2, $2, %lo(DancerPos + 0x4)
/* 00A4E0 01DB61E0 21185300 */  addu        $3, $2, $19
/* 00A4E4 01DB61E4 E201023C */  lui         $2, %hi(DancerPos + 0x8)
/* 00A4E8 01DB61E8 68E04224 */  addiu       $2, $2, %lo(DancerPos + 0x8)
/* 00A4EC 01DB61EC 21105300 */  addu        $2, $2, $19
/* 00A4F0 01DB61F0 28264072 */  paddub      $4, $18, $0
/* 00A4F4 01DB61F4 0000ACC4 */  lwc1        $f12, 0x0($5)
/* 00A4F8 01DB61F8 00006DC4 */  lwc1        $f13, 0x0($3)
/* 00A4FC 01DB61FC 00004EC4 */  lwc1        $f14, 0x0($2)
/* 00A500 01DB6200 A09F040C */  jal         SetPosition__6CFrameFfff
/* 00A504 01DB6204 00000000 */   nop
/* 00A508 01DB6208 E201023C */  lui         $2, %hi(DancerRot)
/* 00A50C 01DB620C 90E24224 */  addiu       $2, $2, %lo(DancerRot)
/* 00A510 01DB6210 21285300 */  addu        $5, $2, $19
/* 00A514 01DB6214 E201023C */  lui         $2, %hi(DancerRot + 0x4)
/* 00A518 01DB6218 94E24224 */  addiu       $2, $2, %lo(DancerRot + 0x4)
/* 00A51C 01DB621C 21185300 */  addu        $3, $2, $19
/* 00A520 01DB6220 E201023C */  lui         $2, %hi(DancerRot + 0x8)
/* 00A524 01DB6224 98E24224 */  addiu       $2, $2, %lo(DancerRot + 0x8)
/* 00A528 01DB6228 21105300 */  addu        $2, $2, $19
/* 00A52C 01DB622C 28264072 */  paddub      $4, $18, $0
/* 00A530 01DB6230 0000ACC4 */  lwc1        $f12, 0x0($5)
/* 00A534 01DB6234 00006DC4 */  lwc1        $f13, 0x0($3)
/* 00A538 01DB6238 00004EC4 */  lwc1        $f14, 0x0($2)
/* 00A53C 01DB623C 70A3040C */  jal         SetRotation__6CFrameFfff
/* 00A540 01DB6240 00000000 */   nop
/* 00A544 01DB6244 8000A427 */  addiu       $4, $29, 0x80
/* 00A548 01DB6248 40B7040C */  jal         MGSetAmbient__FPf
/* 00A54C 01DB624C 00000000 */   nop
/* 00A550 01DB6250 28264072 */  paddub      $4, $18, $0
/* 00A554 01DB6254 60BB040C */  jal         MGDraw__FP6CFrame
/* 00A558 01DB6258 00000000 */   nop
/* 00A55C 01DB625C 08DE760C */  jal         DancerShadow__Fv
/* 00A560 01DB6260 00000000 */   nop
/* 00A564 01DB6264 01003126 */  addiu       $17, $17, 0x1
.L01DB6268_2BBA68:
/* 00A568 01DB6268 2A103002 */  slt         $2, $17, $16
/* 00A56C 01DB626C D4FF4014 */  bnez        $2, .L01DB61C0_2BB9C0
/* 00A570 01DB6270 00000000 */   nop
.L01DB6274_2BBA74:
/* 00A574 01DB6274 2500023C */  lui         $2, %hi(ambientlight)
/* 00A578 01DB6278 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 00A57C 01DB627C 40B7040C */  jal         MGSetAmbient__FPf
/* 00A580 01DB6280 00000000 */   nop
/* 00A584 01DB6284 A0B8040C */  jal         GetVif1Packet__Fv
/* 00A588 01DB6288 00000000 */   nop
/* 00A58C 01DB628C C701033C */  lui         $3, %hi(TexManager)
/* 00A590 01DB6290 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 00A594 01DB6294 282E4070 */  paddub      $5, $2, $0
/* 00A598 01DB6298 28360070 */  paddub      $6, $0, $0
/* 00A59C 01DB629C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00A5A0 01DB62A0 00000000 */   nop
/* 00A5A4 01DB62A4 0498838F */  lw          $3, -0x67FC($28)
/* 00A5A8 01DB62A8 B0110224 */  addiu       $2, $0, 0x11B0
/* 00A5AC 01DB62AC 18186200 */  mult        $3, $3, $2
/* 00A5B0 01DB62B0 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 00A5B4 01DB62B4 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 00A5B8 01DB62B8 21104300 */  addu        $2, $2, $3
/* 00A5BC 01DB62BC 0000428C */  lw          $2, 0x0($2)
/* 00A5C0 01DB62C0 C49882AF */  sw          $2, -0x673C($28)
/* 00A5C4 01DB62C4 C498828F */  lw          $2, -0x673C($28)
/* 00A5C8 01DB62C8 9000A427 */  addiu       $4, $29, 0x90
/* 00A5CC 01DB62CC 20024524 */  addiu       $5, $2, 0x220
/* 00A5D0 01DB62D0 0C86040C */  jal         sceVu0CopyVector
/* 00A5D4 01DB62D4 00000000 */   nop
/* 00A5D8 01DB62D8 0898828F */  lw          $2, -0x67F8($28)
/* 00A5DC 01DB62DC 05004014 */  bnez        $2, .L01DB62F4_2BBAF4
/* 00A5E0 01DB62E0 00000000 */   nop
/* 00A5E4 01DB62E4 E201023C */  lui         $2, %hi(CFire)
/* 00A5E8 01DB62E8 20E04424 */  addiu       $4, $2, %lo(CFire)
/* 00A5EC 01DB62EC BC85050C */  jal         FireStep__9CFireOmniFv
/* 00A5F0 01DB62F0 00000000 */   nop
.L01DB62F4_2BBAF4:
/* 00A5F4 01DB62F4 E201023C */  lui         $2, %hi(CFire)
/* 00A5F8 01DB62F8 20E04424 */  addiu       $4, $2, %lo(CFire)
/* 00A5FC 01DB62FC F085050C */  jal         FireCreate__9CFireOmniFv
/* 00A600 01DB6300 00000000 */   nop
/* 00A604 01DB6304 28860070 */  paddub      $16, $0, $0
/* 00A608 01DB6308 2F000010 */  b           .L01DB63C8_2BBBC8
/* 00A60C 01DB630C 00000000 */   nop
.L01DB6310_2BBB10:
/* 00A610 01DB6310 00191000 */  sll         $3, $16, 4
/* 00A614 01DB6314 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 00A618 01DB6318 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 00A61C 01DB631C 21104300 */  addu        $2, $2, $3
/* 00A620 01DB6320 000043C4 */  lwc1        $f3, 0x0($2)
/* 00A624 01DB6324 E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 00A628 01DB6328 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 00A62C 01DB632C 21104300 */  addu        $2, $2, $3
/* 00A630 01DB6330 000042C4 */  lwc1        $f2, 0x0($2)
/* 00A634 01DB6334 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 00A638 01DB6338 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 00A63C 01DB633C 21104300 */  addu        $2, $2, $3
/* 00A640 01DB6340 000040C4 */  lwc1        $f0, 0x0($2)
/* 00A644 01DB6344 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00A648 01DB6348 00088244 */  mtc1        $2, $f1
/* 00A64C 01DB634C 00000000 */  nop
/* 00A650 01DB6350 02080046 */  mul.s       $f0, $f1, $f0
/* 00A654 01DB6354 E201013C */  lui         $1, %hi(CFire + 0x20)
/* 00A658 01DB6358 40E020E4 */  swc1        $f0, %lo(CFire + 0x20)($1)
/* 00A65C 01DB635C 02080246 */  mul.s       $f0, $f1, $f2
/* 00A660 01DB6360 E201013C */  lui         $1, %hi(CFire + 0x24)
/* 00A664 01DB6364 44E020E4 */  swc1        $f0, %lo(CFire + 0x24)($1)
/* 00A668 01DB6368 02080346 */  mul.s       $f0, $f1, $f3
/* 00A66C 01DB636C E201013C */  lui         $1, %hi(CFire + 0x28)
/* 00A670 01DB6370 48E020E4 */  swc1        $f0, %lo(CFire + 0x28)($1)
/* 00A674 01DB6374 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 00A678 01DB6378 E201013C */  lui         $1, %hi(CFire + 0x2C)
/* 00A67C 01DB637C 4CE022AC */  sw          $2, %lo(CFire + 0x2C)($1)
/* 00A680 01DB6380 80181000 */  sll         $3, $16, 2
/* 00A684 01DB6384 E201023C */  lui         $2, %hi(OP_FireScale)
/* 00A688 01DB6388 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 00A68C 01DB638C 21184300 */  addu        $3, $2, $3
/* 00A690 01DB6390 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00A694 01DB6394 00688244 */  mtc1        $2, $f13
/* 00A698 01DB6398 E201023C */  lui         $2, %hi(CFire)
/* 00A69C 01DB639C 20E04424 */  addiu       $4, $2, %lo(CFire)
/* 00A6A0 01DB63A0 01000524 */  addiu       $5, $0, 0x1
/* 00A6A4 01DB63A4 2836A070 */  paddub      $6, $5, $0
/* 00A6A8 01DB63A8 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 00A6AC 01DB63AC E0954724 */  addiu       $7, $2, %lo(OP_MainCamera)
/* 00A6B0 01DB63B0 9000A827 */  addiu       $8, $29, 0x90
/* 00A6B4 01DB63B4 00006CC4 */  lwc1        $f12, 0x0($3)
/* 00A6B8 01DB63B8 0F000924 */  addiu       $9, $0, 0xF
/* 00A6BC 01DB63BC B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 00A6C0 01DB63C0 00000000 */   nop
/* 00A6C4 01DB63C4 01001026 */  addiu       $16, $16, 0x1
.L01DB63C8_2BBBC8:
/* 00A6C8 01DB63C8 B898828F */  lw          $2, -0x6748($28)
/* 00A6CC 01DB63CC 2A100202 */  slt         $2, $16, $2
/* 00A6D0 01DB63D0 CFFF4014 */  bnez        $2, .L01DB6310_2BBB10
/* 00A6D4 01DB63D4 00000000 */   nop
/* 00A6D8 01DB63D8 C4D9760C */  jal         DrawCloud__Fv
/* 00A6DC 01DB63DC 00000000 */   nop
/* 00A6E0 01DB63E0 10998283 */  lb          $2, -0x66F0($28)
/* 00A6E4 01DB63E4 05004014 */  bnez        $2, .L01DB63FC_2BBBFC
/* 00A6E8 01DB63E8 00000000 */   nop
/* 00A6EC 01DB63EC 8044023C */  lui         $2, (0x44800000 >> 16)
/* 00A6F0 01DB63F0 0C9982AF */  sw          $2, -0x66F4($28)
/* 00A6F4 01DB63F4 01000224 */  addiu       $2, $0, 0x1
/* 00A6F8 01DB63F8 109982A3 */  sb          $2, -0x66F0($28)
.L01DB63FC_2BBBFC:
/* 00A6FC 01DB63FC 18998283 */  lb          $2, -0x66E8($28)
/* 00A700 01DB6400 04004014 */  bnez        $2, .L01DB6414_2BBC14
/* 00A704 01DB6404 00000000 */   nop
/* 00A708 01DB6408 149980AF */  sw          $0, -0x66EC($28)
/* 00A70C 01DB640C 01000224 */  addiu       $2, $0, 0x1
/* 00A710 01DB6410 189982A3 */  sb          $2, -0x66E8($28)
.L01DB6414_2BBC14:
/* 00A714 01DB6414 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 00A718 01DB6418 141B238C */  lw          $3, %lo(CScript__2 + 0x14)($1)
/* 00A71C 01DB641C 01000224 */  addiu       $2, $0, 0x1
/* 00A720 01DB6420 77006214 */  bne         $3, $2, .L01DB6600_2BBE00
/* 00A724 01DB6424 00000000 */   nop
/* 00A728 01DB6428 C701023C */  lui         $2, %hi(TexManager)
/* 00A72C 01DB642C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00A730 01DB6430 D48B858F */  lw          $5, -0x742C($28)
/* 00A734 01DB6434 07000624 */  addiu       $6, $0, 0x7
/* 00A738 01DB6438 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00A73C 01DB643C 00000000 */   nop
/* 00A740 01DB6440 0C9994C7 */  lwc1        $f20, -0x66F4($28)
/* 00A744 01DB6444 8040023C */  lui         $2, (0x40800000 >> 16)
/* 00A748 01DB6448 00008244 */  mtc1        $2, $f0
/* 00A74C 01DB644C 00000000 */  nop
/* 00A750 01DB6450 43A00046 */  div.s       $f1, $f20, $f0
/* 00A754 01DB6454 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00A758 01DB6458 00008244 */  mtc1        $2, $f0
/* 00A75C 01DB645C 00000000 */  nop
/* 00A760 01DB6460 01030146 */  sub.s       $f12, $f0, $f1
/* 00A764 01DB6464 2C44040C */  jal         fptosi
/* 00A768 01DB6468 00000000 */   nop
/* 00A76C 01DB646C 28864070 */  paddub      $16, $2, $0
/* 00A770 01DB6470 02000106 */  bgez        $16, .L01DB647C_2BBC7C
/* 00A774 01DB6474 00000000 */   nop
/* 00A778 01DB6478 28860070 */  paddub      $16, $0, $0
.L01DB647C_2BBC7C:
/* 00A77C 01DB647C B000A0AF */  sw          $0, 0xB0($29)
/* 00A780 01DB6480 B400A0AF */  sw          $0, 0xB4($29)
/* 00A784 01DB6484 80000224 */  addiu       $2, $0, 0x80
/* 00A788 01DB6488 B800A2AF */  sw          $2, 0xB8($29)
/* 00A78C 01DB648C BC00A2AF */  sw          $2, 0xBC($29)
/* 00A790 01DB6490 0043023C */  lui         $2, (0x43000000 >> 16)
/* 00A794 01DB6494 00008244 */  mtc1        $2, $f0
/* 00A798 01DB6498 00000000 */  nop
/* 00A79C 01DB649C 40051446 */  add.s       $f21, $f0, $f20
/* 00A7A0 01DB64A0 06AB0046 */  mov.s       $f12, $f21
/* 00A7A4 01DB64A4 2C44040C */  jal         fptosi
/* 00A7A8 01DB64A8 00000000 */   nop
/* 00A7AC 01DB64AC 06AB0046 */  mov.s       $f12, $f21
/* 00A7B0 01DB64B0 2C44040C */  jal         fptosi
/* 00A7B4 01DB64B4 00000000 */   nop
/* 00A7B8 01DB64B8 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00A7BC 01DB64BC 00008244 */  mtc1        $2, $f0
/* 00A7C0 01DB64C0 00000000 */  nop
/* 00A7C4 01DB64C4 03A50046 */  div.s       $f20, $f20, $f0
/* 00A7C8 01DB64C8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 00A7CC 01DB64CC 00008244 */  mtc1        $2, $f0
/* 00A7D0 01DB64D0 00000000 */  nop
/* 00A7D4 01DB64D4 81051446 */  sub.s       $f22, $f0, $f20
/* 00A7D8 01DB64D8 06B30046 */  mov.s       $f12, $f22
/* 00A7DC 01DB64DC 2C44040C */  jal         fptosi
/* 00A7E0 01DB64E0 00000000 */   nop
/* 00A7E4 01DB64E4 8843023C */  lui         $2, (0x43880000 >> 16)
/* 00A7E8 01DB64E8 00008244 */  mtc1        $2, $f0
/* 00A7EC 01DB64EC 00000000 */  nop
/* 00A7F0 01DB64F0 01031446 */  sub.s       $f12, $f0, $f20
/* 00A7F4 01DB64F4 2C44040C */  jal         fptosi
/* 00A7F8 01DB64F8 00000000 */   nop
/* 00A7FC 01DB64FC A000A2AF */  sw          $2, 0xA0($29)
/* 00A800 01DB6500 06B30046 */  mov.s       $f12, $f22
/* 00A804 01DB6504 2C44040C */  jal         fptosi
/* 00A808 01DB6508 00000000 */   nop
/* 00A80C 01DB650C A400A2AF */  sw          $2, 0xA4($29)
/* 00A810 01DB6510 06AB0046 */  mov.s       $f12, $f21
/* 00A814 01DB6514 2C44040C */  jal         fptosi
/* 00A818 01DB6518 00000000 */   nop
/* 00A81C 01DB651C A800A2AF */  sw          $2, 0xA8($29)
/* 00A820 01DB6520 06AB0046 */  mov.s       $f12, $f21
/* 00A824 01DB6524 2C44040C */  jal         fptosi
/* 00A828 01DB6528 00000000 */   nop
/* 00A82C 01DB652C AC00A2AF */  sw          $2, 0xAC($29)
/* 00A830 01DB6530 A0B8040C */  jal         GetVif1Packet__Fv
/* 00A834 01DB6534 00000000 */   nop
/* 00A838 01DB6538 288E4070 */  paddub      $17, $2, $0
/* 00A83C 01DB653C C701023C */  lui         $2, %hi(TexManager)
/* 00A840 01DB6540 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00A844 01DB6544 DE01023C */  lui         $2, %hi(LIT_654__5)
/* 00A848 01DB6548 B0DD4524 */  addiu       $5, $2, %lo(LIT_654__5)
/* 00A84C 01DB654C FFFF0624 */  addiu       $6, $0, -0x1
/* 00A850 01DB6550 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00A854 01DB6554 00000000 */   nop
/* 00A858 01DB6558 FF000832 */  andi        $8, $16, 0xFF
/* 00A85C 01DB655C 28262072 */  paddub      $4, $17, $0
/* 00A860 01DB6560 282E4070 */  paddub      $5, $2, $0
/* 00A864 01DB6564 A000A627 */  addiu       $6, $29, 0xA0
/* 00A868 01DB6568 B000A727 */  addiu       $7, $29, 0xB0
/* 00A86C 01DB656C C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 00A870 01DB6570 00000000 */   nop
/* 00A874 01DB6574 1499828F */  lw          $2, -0x66EC($28)
/* 00A878 01DB6578 10004014 */  bnez        $2, .L01DB65BC_2BBDBC
/* 00A87C 01DB657C 00000000 */   nop
/* 00A880 01DB6580 0C9982C7 */  lwc1        $f2, -0x66F4($28)
/* 00A884 01DB6584 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00A888 01DB6588 00088244 */  mtc1        $2, $f1
/* 00A88C 01DB658C 00000000 */  nop
/* 00A890 01DB6590 03100146 */  div.s       $f0, $f2, $f1
/* 00A894 01DB6594 01100046 */  sub.s       $f0, $f2, $f0
/* 00A898 01DB6598 0C9980E7 */  swc1        $f0, -0x66F4($28)
/* 00A89C 01DB659C 34000146 */  c.lt.s      $f0, $f1
/* 00A8A0 01DB65A0 00000000 */  nop
/* 00A8A4 01DB65A4 19000045 */  bc1f        .L01DB660C_2BBE0C
/* 00A8A8 01DB65A8 00000000 */   nop
/* 00A8AC 01DB65AC 01000224 */  addiu       $2, $0, 0x1
/* 00A8B0 01DB65B0 149982AF */  sw          $2, -0x66EC($28)
/* 00A8B4 01DB65B4 15000010 */  b           .L01DB660C_2BBE0C
/* 00A8B8 01DB65B8 00000000 */   nop
.L01DB65BC_2BBDBC:
/* 00A8BC 01DB65BC 0C9981C7 */  lwc1        $f1, -0x66F4($28)
/* 00A8C0 01DB65C0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 00A8C4 01DB65C4 00008244 */  mtc1        $2, $f0
/* 00A8C8 01DB65C8 00000000 */  nop
/* 00A8CC 01DB65CC 03080046 */  div.s       $f0, $f1, $f0
/* 00A8D0 01DB65D0 40080046 */  add.s       $f1, $f1, $f0
/* 00A8D4 01DB65D4 0C9981E7 */  swc1        $f1, -0x66F4($28)
/* 00A8D8 01DB65D8 8041023C */  lui         $2, (0x41800000 >> 16)
/* 00A8DC 01DB65DC 00008244 */  mtc1        $2, $f0
/* 00A8E0 01DB65E0 00000000 */  nop
/* 00A8E4 01DB65E4 36080046 */  c.le.s      $f1, $f0
/* 00A8E8 01DB65E8 00000000 */  nop
/* 00A8EC 01DB65EC 07000145 */  bc1t        .L01DB660C_2BBE0C
/* 00A8F0 01DB65F0 00000000 */   nop
/* 00A8F4 01DB65F4 149980AF */  sw          $0, -0x66EC($28)
/* 00A8F8 01DB65F8 04000010 */  b           .L01DB660C_2BBE0C
/* 00A8FC 01DB65FC 00000000 */   nop
.L01DB6600_2BBE00:
/* 00A900 01DB6600 8044023C */  lui         $2, (0x44800000 >> 16)
/* 00A904 01DB6604 0C9982AF */  sw          $2, -0x66F4($28)
/* 00A908 01DB6608 149980AF */  sw          $0, -0x66EC($28)
.L01DB660C_2BBE0C:
/* 00A90C 01DB660C C701023C */  lui         $2, %hi(TexManager)
/* 00A910 01DB6610 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00A914 01DB6614 D48B858F */  lw          $5, -0x742C($28)
/* 00A918 01DB6618 16000624 */  addiu       $6, $0, 0x16
/* 00A91C 01DB661C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00A920 01DB6620 00000000 */   nop
/* 00A924 01DB6624 DE01013C */  lui         $1, %hi(CScript__2)
/* 00A928 01DB6628 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 00A92C 01DB662C 19000324 */  addiu       $3, $0, 0x19
/* 00A930 01DB6630 17008310 */  beq         $4, $3, .L01DB6690_2BBE90
/* 00A934 01DB6634 00000000 */   nop
/* 00A938 01DB6638 18000324 */  addiu       $3, $0, 0x18
/* 00A93C 01DB663C 14008310 */  beq         $4, $3, .L01DB6690_2BBE90
/* 00A940 01DB6640 00000000 */   nop
/* 00A944 01DB6644 0A000324 */  addiu       $3, $0, 0xA
/* 00A948 01DB6648 11008310 */  beq         $4, $3, .L01DB6690_2BBE90
/* 00A94C 01DB664C 00000000 */   nop
/* 00A950 01DB6650 03000324 */  addiu       $3, $0, 0x3
/* 00A954 01DB6654 0E008310 */  beq         $4, $3, .L01DB6690_2BBE90
/* 00A958 01DB6658 00000000 */   nop
/* 00A95C 01DB665C 2F000324 */  addiu       $3, $0, 0x2F
/* 00A960 01DB6660 1D008310 */  beq         $4, $3, .L01DB66D8_2BBED8
/* 00A964 01DB6664 00000000 */   nop
/* 00A968 01DB6668 2D000324 */  addiu       $3, $0, 0x2D
/* 00A96C 01DB666C 1A008310 */  beq         $4, $3, .L01DB66D8_2BBED8
/* 00A970 01DB6670 00000000 */   nop
/* 00A974 01DB6674 2B000324 */  addiu       $3, $0, 0x2B
/* 00A978 01DB6678 17008310 */  beq         $4, $3, .L01DB66D8_2BBED8
/* 00A97C 01DB667C 00000000 */   nop
/* 00A980 01DB6680 15008010 */  beqz        $4, .L01DB66D8_2BBED8
/* 00A984 01DB6684 00000000 */   nop
/* 00A988 01DB6688 0B000010 */  b           .L01DB66B8_2BBEB8
/* 00A98C 01DB668C 00000000 */   nop
.L01DB6690_2BBE90:
/* 00A990 01DB6690 CC00A427 */  addiu       $4, $29, 0xCC
/* 00A994 01DB6694 588A80C7 */  lwc1        $f0, -0x75A8($28)
/* 00A998 01DB6698 000080E4 */  swc1        $f0, 0x0($4)
/* 00A99C 01DB669C 01000524 */  addiu       $5, $0, 0x1
/* 00A9A0 01DB66A0 38000624 */  addiu       $6, $0, 0x38
/* 00A9A4 01DB66A4 283E0070 */  paddub      $7, $0, $0
/* 00A9A8 01DB66A8 B094050C */  jal         DepthOfField__FPfiii
/* 00A9AC 01DB66AC 00000000 */   nop
/* 00A9B0 01DB66B0 09000010 */  b           .L01DB66D8_2BBED8
/* 00A9B4 01DB66B4 00000000 */   nop
.L01DB66B8_2BBEB8:
/* 00A9B8 01DB66B8 C000A427 */  addiu       $4, $29, 0xC0
/* 00A9BC 01DB66BC 608A82DF */  ld          $2, -0x75A0($28)
/* 00A9C0 01DB66C0 000082FC */  sd          $2, 0x0($4)
/* 00A9C4 01DB66C4 02000524 */  addiu       $5, $0, 0x2
/* 00A9C8 01DB66C8 28000624 */  addiu       $6, $0, 0x28
/* 00A9CC 01DB66CC 283E0070 */  paddub      $7, $0, $0
/* 00A9D0 01DB66D0 B094050C */  jal         DepthOfField__FPfiii
/* 00A9D4 01DB66D4 00000000 */   nop
.L01DB66D8_2BBED8:
/* 00A9D8 01DB66D8 5000BF7B */  lq          $31, 0x50($29)
/* 00A9DC 01DB66DC 4000B37B */  lq          $19, 0x40($29)
/* 00A9E0 01DB66E0 3000B27B */  lq          $18, 0x30($29)
/* 00A9E4 01DB66E4 2000B17B */  lq          $17, 0x20($29)
/* 00A9E8 01DB66E8 1000B07B */  lq          $16, 0x10($29)
/* 00A9EC 01DB66EC 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 00A9F0 01DB66F0 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 00A9F4 01DB66F4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00A9F8 01DB66F8 D000BD27 */  addiu       $29, $29, 0xD0
/* 00A9FC 01DB66FC 0800E003 */  jr          $31
/* 00AA00 01DB6700 00000000 */   nop
/* 00AA04 01DB6704 00000000 */  nop
/* 00AA08 01DB6708 00000000 */  nop
/* 00AA0C 01DB670C 00000000 */  nop
