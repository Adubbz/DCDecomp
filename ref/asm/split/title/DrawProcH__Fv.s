.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawProcH__Fv
/* 024BE0 01DD08E0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 024BE4 01DD08E4 3000BF7F */  sq          $31, 0x30($29)
/* 024BE8 01DD08E8 2000B17F */  sq          $17, 0x20($29)
/* 024BEC 01DD08EC 1000B07F */  sq          $16, 0x10($29)
/* 024BF0 01DD08F0 C701023C */  lui         $2, %hi(TexManager)
/* 024BF4 01DD08F4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024BF8 01DD08F8 D48B858F */  lw          $5, -0x742C($28)
/* 024BFC 01DD08FC 0A000624 */  addiu       $6, $0, 0xA
/* 024C00 01DD0900 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024C04 01DD0904 00000000 */   nop
/* 024C08 01DD0908 E201023C */  lui         $2, %hi(OP_GroundMap)
/* 024C0C 01DD090C 30BA4424 */  addiu       $4, $2, %lo(OP_GroundMap)
/* 024C10 01DD0910 700E050C */  jal         Draw__4CMapFv
/* 024C14 01DD0914 00000000 */   nop
/* 024C18 01DD0918 E201023C */  lui         $2, %hi(OP_BuildingMap)
/* 024C1C 01DD091C 50A44424 */  addiu       $4, $2, %lo(OP_BuildingMap)
/* 024C20 01DD0920 700E050C */  jal         Draw__4CMapFv
/* 024C24 01DD0924 00000000 */   nop
/* 024C28 01DD0928 E301013C */  lui         $1, %hi(CScript + 0xCC)
/* 024C2C 01DD092C 8CEA2290 */  lbu         $2, %lo(CScript + 0xCC)($1)
/* 024C30 01DD0930 15004010 */  beqz        $2, .L01DD0988_2D6188
/* 024C34 01DD0934 00000000 */   nop
/* 024C38 01DD0938 E401013C */  lui         $1, %hi(CharaTex + 0x3)
/* 024C3C 01DD093C 13D02680 */  lb          $6, %lo(CharaTex + 0x3)($1)
/* 024C40 01DD0940 C701023C */  lui         $2, %hi(TexManager)
/* 024C44 01DD0944 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024C48 01DD0948 D48B858F */  lw          $5, -0x742C($28)
/* 024C4C 01DD094C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024C50 01DD0950 00000000 */   nop
/* 024C54 01DD0954 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 024C58 01DD0958 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 024C5C 01DD095C 4CE1040C */  jal         Step__10CCharacterFv
/* 024C60 01DD0960 00000000 */   nop
/* 024C64 01DD0964 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 024C68 01DD0968 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 024C6C 01DD096C 282E0070 */  paddub      $5, $0, $0
/* 024C70 01DD0970 94E3040C */  jal         ClothStep__10CCharacterFi
/* 024C74 01DD0974 00000000 */   nop
/* 024C78 01DD0978 DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 024C7C 01DD097C F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 024C80 01DD0980 C4E4040C */  jal         Draw__10CCharacterFv
/* 024C84 01DD0984 00000000 */   nop
.L01DD0988_2D6188:
/* 024C88 01DD0988 C701023C */  lui         $2, %hi(TexManager)
/* 024C8C 01DD098C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024C90 01DD0990 D48B858F */  lw          $5, -0x742C($28)
/* 024C94 01DD0994 17000624 */  addiu       $6, $0, 0x17
/* 024C98 01DD0998 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024C9C 01DD099C 00000000 */   nop
/* 024CA0 01DD09A0 C701023C */  lui         $2, %hi(TexManager)
/* 024CA4 01DD09A4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024CA8 01DD09A8 DE01023C */  lui         $2, %hi(LIT_1137)
/* 024CAC 01DD09AC 88044524 */  addiu       $5, $2, %lo(LIT_1137)
/* 024CB0 01DD09B0 FFFF0624 */  addiu       $6, $0, -0x1
/* 024CB4 01DD09B4 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 024CB8 01DD09B8 00000000 */   nop
/* 024CBC 01DD09BC 280044DC */  ld          $4, 0x28($2)
/* 024CC0 01DD09C0 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 024CC4 01DD09C4 00000000 */   nop
/* 024CC8 01DD09C8 28860070 */  paddub      $16, $0, $0
/* 024CCC 01DD09CC 18000010 */  b           .L01DD0A30_2D6230
/* 024CD0 01DD09D0 00000000 */   nop
.L01DD09D4_2D61D4:
/* 024CD4 01DD09D4 40101000 */  sll         $2, $16, 1
/* 024CD8 01DD09D8 21105000 */  addu        $2, $2, $16
/* 024CDC 01DD09DC 80100200 */  sll         $2, $2, 2
/* 024CE0 01DD09E0 21105000 */  addu        $2, $2, $16
/* 024CE4 01DD09E4 80180200 */  sll         $3, $2, 2
/* 024CE8 01DD09E8 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 024CEC 01DD09EC F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 024CF0 01DD09F0 21104300 */  addu        $2, $2, $3
/* 024CF4 01DD09F4 00004290 */  lbu         $2, 0x0($2)
/* 024CF8 01DD09F8 0C004010 */  beqz        $2, .L01DD0A2C_2D622C
/* 024CFC 01DD09FC 00000000 */   nop
/* 024D00 01DD0A00 B0110224 */  addiu       $2, $0, 0x11B0
/* 024D04 01DD0A04 18180202 */  mult        $3, $16, $2
/* 024D08 01DD0A08 DF01023C */  lui         $2, %hi(Chara__3)
/* 024D0C 01DD0A0C E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 024D10 01DD0A10 21884300 */  addu        $17, $2, $3
/* 024D14 01DD0A14 28262072 */  paddub      $4, $17, $0
/* 024D18 01DD0A18 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 024D1C 01DD0A1C 00000000 */   nop
/* 024D20 01DD0A20 28262072 */  paddub      $4, $17, $0
/* 024D24 01DD0A24 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 024D28 01DD0A28 00000000 */   nop
.L01DD0A2C_2D622C:
/* 024D2C 01DD0A2C 01001026 */  addiu       $16, $16, 0x1
.L01DD0A30_2D6230:
/* 024D30 01DD0A30 0900022A */  slti        $2, $16, 0x9
/* 024D34 01DD0A34 E7FF4014 */  bnez        $2, .L01DD09D4_2D61D4
/* 024D38 01DD0A38 00000000 */   nop
/* 024D3C 01DD0A3C 34000424 */  addiu       $4, $0, 0x34
/* 024D40 01DD0A40 CCC2040C */  jal         MGEndDrawShadow__FUc
/* 024D44 01DD0A44 00000000 */   nop
/* 024D48 01DD0A48 28860070 */  paddub      $16, $0, $0
/* 024D4C 01DD0A4C 28000010 */  b           .L01DD0AF0_2D62F0
/* 024D50 01DD0A50 00000000 */   nop
.L01DD0A54_2D6254:
/* 024D54 01DD0A54 03000224 */  addiu       $2, $0, 0x3
/* 024D58 01DD0A58 24000212 */  beq         $16, $2, .L01DD0AEC_2D62EC
/* 024D5C 01DD0A5C 00000000 */   nop
/* 024D60 01DD0A60 40101000 */  sll         $2, $16, 1
/* 024D64 01DD0A64 21105000 */  addu        $2, $2, $16
/* 024D68 01DD0A68 80100200 */  sll         $2, $2, 2
/* 024D6C 01DD0A6C 21105000 */  addu        $2, $2, $16
/* 024D70 01DD0A70 80180200 */  sll         $3, $2, 2
/* 024D74 01DD0A74 E301023C */  lui         $2, %hi(CScript + 0x30)
/* 024D78 01DD0A78 F0E94224 */  addiu       $2, $2, %lo(CScript + 0x30)
/* 024D7C 01DD0A7C 21104300 */  addu        $2, $2, $3
/* 024D80 01DD0A80 00004290 */  lbu         $2, 0x0($2)
/* 024D84 01DD0A84 19004010 */  beqz        $2, .L01DD0AEC_2D62EC
/* 024D88 01DD0A88 00000000 */   nop
/* 024D8C 01DD0A8C E401023C */  lui         $2, %hi(CharaTex)
/* 024D90 01DD0A90 10D04224 */  addiu       $2, $2, %lo(CharaTex)
/* 024D94 01DD0A94 21105000 */  addu        $2, $2, $16
/* 024D98 01DD0A98 00004680 */  lb          $6, 0x0($2)
/* 024D9C 01DD0A9C C701023C */  lui         $2, %hi(TexManager)
/* 024DA0 01DD0AA0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024DA4 01DD0AA4 D48B858F */  lw          $5, -0x742C($28)
/* 024DA8 01DD0AA8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024DAC 01DD0AAC 00000000 */   nop
/* 024DB0 01DD0AB0 B0110224 */  addiu       $2, $0, 0x11B0
/* 024DB4 01DD0AB4 18180202 */  mult        $3, $16, $2
/* 024DB8 01DD0AB8 DF01023C */  lui         $2, %hi(Chara__3)
/* 024DBC 01DD0ABC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 024DC0 01DD0AC0 21884300 */  addu        $17, $2, $3
/* 024DC4 01DD0AC4 28262072 */  paddub      $4, $17, $0
/* 024DC8 01DD0AC8 4CE1040C */  jal         Step__10CCharacterFv
/* 024DCC 01DD0ACC 00000000 */   nop
/* 024DD0 01DD0AD0 28262072 */  paddub      $4, $17, $0
/* 024DD4 01DD0AD4 282E0070 */  paddub      $5, $0, $0
/* 024DD8 01DD0AD8 94E3040C */  jal         ClothStep__10CCharacterFi
/* 024DDC 01DD0ADC 00000000 */   nop
/* 024DE0 01DD0AE0 28262072 */  paddub      $4, $17, $0
/* 024DE4 01DD0AE4 C4E4040C */  jal         Draw__10CCharacterFv
/* 024DE8 01DD0AE8 00000000 */   nop
.L01DD0AEC_2D62EC:
/* 024DEC 01DD0AEC 01001026 */  addiu       $16, $16, 0x1
.L01DD0AF0_2D62F0:
/* 024DF0 01DD0AF0 0900022A */  slti        $2, $16, 0x9
/* 024DF4 01DD0AF4 D7FF4014 */  bnez        $2, .L01DD0A54_2D6254
/* 024DF8 01DD0AF8 00000000 */   nop
/* 024DFC 01DD0AFC A0B8040C */  jal         GetVif1Packet__Fv
/* 024E00 01DD0B00 00000000 */   nop
/* 024E04 01DD0B04 C701033C */  lui         $3, %hi(TexManager)
/* 024E08 01DD0B08 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 024E0C 01DD0B0C 282E4070 */  paddub      $5, $2, $0
/* 024E10 01DD0B10 28360070 */  paddub      $6, $0, $0
/* 024E14 01DD0B14 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024E18 01DD0B18 00000000 */   nop
/* 024E1C 01DD0B1C C09B838F */  lw          $3, -0x6440($28)
/* 024E20 01DD0B20 B0110224 */  addiu       $2, $0, 0x11B0
/* 024E24 01DD0B24 18186200 */  mult        $3, $3, $2
/* 024E28 01DD0B28 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 024E2C 01DD0B2C ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 024E30 01DD0B30 21104300 */  addu        $2, $2, $3
/* 024E34 01DD0B34 0000428C */  lw          $2, 0x0($2)
/* 024E38 01DD0B38 B09B82AF */  sw          $2, -0x6450($28)
/* 024E3C 01DD0B3C B09B828F */  lw          $2, -0x6450($28)
/* 024E40 01DD0B40 4000A427 */  addiu       $4, $29, 0x40
/* 024E44 01DD0B44 20024524 */  addiu       $5, $2, 0x220
/* 024E48 01DD0B48 0C86040C */  jal         sceVu0CopyVector
/* 024E4C 01DD0B4C 00000000 */   nop
/* 024E50 01DD0B50 E301023C */  lui         $2, %hi(CFire__4)
/* 024E54 01DD0B54 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 024E58 01DD0B58 BC85050C */  jal         FireStep__9CFireOmniFv
/* 024E5C 01DD0B5C 00000000 */   nop
/* 024E60 01DD0B60 E301023C */  lui         $2, %hi(CFire__4)
/* 024E64 01DD0B64 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 024E68 01DD0B68 F085050C */  jal         FireCreate__9CFireOmniFv
/* 024E6C 01DD0B6C 00000000 */   nop
/* 024E70 01DD0B70 28860070 */  paddub      $16, $0, $0
/* 024E74 01DD0B74 31000010 */  b           .L01DD0C3C_2D643C
/* 024E78 01DD0B78 00000000 */   nop
.L01DD0B7C_2D637C:
/* 024E7C 01DD0B7C 00211000 */  sll         $4, $16, 4
/* 024E80 01DD0B80 E201023C */  lui         $2, %hi(OP_FirePosition + 0x8)
/* 024E84 01DD0B84 28D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x8)
/* 024E88 01DD0B88 21184400 */  addu        $3, $2, $4
/* 024E8C 01DD0B8C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 024E90 01DD0B90 00088244 */  mtc1        $2, $f1
/* 024E94 01DD0B94 000060C4 */  lwc1        $f0, 0x0($3)
/* 024E98 01DD0B98 C3000146 */  div.s       $f3, $f0, $f1
/* 024E9C 01DD0B9C E201023C */  lui         $2, %hi(OP_FirePosition + 0x4)
/* 024EA0 01DD0BA0 24D74224 */  addiu       $2, $2, %lo(OP_FirePosition + 0x4)
/* 024EA4 01DD0BA4 21104400 */  addu        $2, $2, $4
/* 024EA8 01DD0BA8 000040C4 */  lwc1        $f0, 0x0($2)
/* 024EAC 01DD0BAC 83000146 */  div.s       $f2, $f0, $f1
/* 024EB0 01DD0BB0 E201023C */  lui         $2, %hi(OP_FirePosition)
/* 024EB4 01DD0BB4 20D74224 */  addiu       $2, $2, %lo(OP_FirePosition)
/* 024EB8 01DD0BB8 21104400 */  addu        $2, $2, $4
/* 024EBC 01DD0BBC 000040C4 */  lwc1        $f0, 0x0($2)
/* 024EC0 01DD0BC0 03000146 */  div.s       $f0, $f0, $f1
/* 024EC4 01DD0BC4 02080046 */  mul.s       $f0, $f1, $f0
/* 024EC8 01DD0BC8 E301013C */  lui         $1, %hi(CFire__4 + 0x20)
/* 024ECC 01DD0BCC A0E920E4 */  swc1        $f0, %lo(CFire__4 + 0x20)($1)
/* 024ED0 01DD0BD0 02080246 */  mul.s       $f0, $f1, $f2
/* 024ED4 01DD0BD4 E301013C */  lui         $1, %hi(CFire__4 + 0x24)
/* 024ED8 01DD0BD8 A4E920E4 */  swc1        $f0, %lo(CFire__4 + 0x24)($1)
/* 024EDC 01DD0BDC 02080346 */  mul.s       $f0, $f1, $f3
/* 024EE0 01DD0BE0 E301013C */  lui         $1, %hi(CFire__4 + 0x28)
/* 024EE4 01DD0BE4 A8E920E4 */  swc1        $f0, %lo(CFire__4 + 0x28)($1)
/* 024EE8 01DD0BE8 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 024EEC 01DD0BEC E301013C */  lui         $1, %hi(CFire__4 + 0x2C)
/* 024EF0 01DD0BF0 ACE922AC */  sw          $2, %lo(CFire__4 + 0x2C)($1)
/* 024EF4 01DD0BF4 7041023C */  lui         $2, (0x41700000 >> 16)
/* 024EF8 01DD0BF8 00688244 */  mtc1        $2, $f13
/* 024EFC 01DD0BFC 80181000 */  sll         $3, $16, 2
/* 024F00 01DD0C00 E201023C */  lui         $2, %hi(OP_FireScale)
/* 024F04 01DD0C04 20DD4224 */  addiu       $2, $2, %lo(OP_FireScale)
/* 024F08 01DD0C08 21184300 */  addu        $3, $2, $3
/* 024F0C 01DD0C0C E301023C */  lui         $2, %hi(CFire__4)
/* 024F10 01DD0C10 80E94424 */  addiu       $4, $2, %lo(CFire__4)
/* 024F14 01DD0C14 01000524 */  addiu       $5, $0, 0x1
/* 024F18 01DD0C18 2836A070 */  paddub      $6, $5, $0
/* 024F1C 01DD0C1C E301023C */  lui         $2, %hi(MainCamera__3)
/* 024F20 01DD0C20 80E64724 */  addiu       $7, $2, %lo(MainCamera__3)
/* 024F24 01DD0C24 4000A827 */  addiu       $8, $29, 0x40
/* 024F28 01DD0C28 00006CC4 */  lwc1        $f12, 0x0($3)
/* 024F2C 01DD0C2C 03000924 */  addiu       $9, $0, 0x3
/* 024F30 01DD0C30 B086050C */  jal         DrawFire__9CFireOmniFiiP7CCameraPffif
/* 024F34 01DD0C34 00000000 */   nop
/* 024F38 01DD0C38 01001026 */  addiu       $16, $16, 0x1
.L01DD0C3C_2D643C:
/* 024F3C 01DD0C3C B898828F */  lw          $2, -0x6748($28)
/* 024F40 01DD0C40 2A100202 */  slt         $2, $16, $2
/* 024F44 01DD0C44 CDFF4014 */  bnez        $2, .L01DD0B7C_2D637C
/* 024F48 01DD0C48 00000000 */   nop
/* 024F4C 01DD0C4C C701023C */  lui         $2, %hi(TexManager)
/* 024F50 01DD0C50 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 024F54 01DD0C54 D48B858F */  lw          $5, -0x742C($28)
/* 024F58 01DD0C58 16000624 */  addiu       $6, $0, 0x16
/* 024F5C 01DD0C5C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 024F60 01DD0C60 00000000 */   nop
/* 024F64 01DD0C64 5800A427 */  addiu       $4, $29, 0x58
/* 024F68 01DD0C68 D08A82DF */  ld          $2, -0x7530($28)
/* 024F6C 01DD0C6C 000082FC */  sd          $2, 0x0($4)
/* 024F70 01DD0C70 02000524 */  addiu       $5, $0, 0x2
/* 024F74 01DD0C74 20000624 */  addiu       $6, $0, 0x20
/* 024F78 01DD0C78 283E0070 */  paddub      $7, $0, $0
/* 024F7C 01DD0C7C B094050C */  jal         DepthOfField__FPfiii
/* 024F80 01DD0C80 00000000 */   nop
/* 024F84 01DD0C84 3000BF7B */  lq          $31, 0x30($29)
/* 024F88 01DD0C88 2000B17B */  lq          $17, 0x20($29)
/* 024F8C 01DD0C8C 1000B07B */  lq          $16, 0x10($29)
/* 024F90 01DD0C90 6000BD27 */  addiu       $29, $29, 0x60
/* 024F94 01DD0C94 0800E003 */  jr          $31
/* 024F98 01DD0C98 00000000 */   nop
/* 024F9C 01DD0C9C 00000000 */  nop
