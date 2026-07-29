.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawDancer__Fv
/* 015D00 01DC1A00 30FFBD27 */  addiu       $29, $29, -0xD0
/* 015D04 01DC1A04 4000BF7F */  sq          $31, 0x40($29)
/* 015D08 01DC1A08 3000B27F */  sq          $18, 0x30($29)
/* 015D0C 01DC1A0C 2000B17F */  sq          $17, 0x20($29)
/* 015D10 01DC1A10 1000B07F */  sq          $16, 0x10($29)
/* 015D14 01DC1A14 0000B4E7 */  swc1        $f20, 0x0($29)
/* 015D18 01DC1A18 DE01013C */  lui         $1, %hi(CScript__2 + 0x40C)
/* 015D1C 01DC1A1C 0C1F2390 */  lbu         $3, %lo(CScript__2 + 0x40C)($1)
/* 015D20 01DC1A20 C1006010 */  beqz        $3, .L01DC1D28_2C7528
/* 015D24 01DC1A24 00000000 */   nop
/* 015D28 01DC1A28 E101013C */  lui         $1, %hi(CharaTex__2 + 0x13)
/* 015D2C 01DC1A2C C3952680 */  lb          $6, %lo(CharaTex__2 + 0x13)($1)
/* 015D30 01DC1A30 C701023C */  lui         $2, %hi(TexManager)
/* 015D34 01DC1A34 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015D38 01DC1A38 D48B858F */  lw          $5, -0x742C($28)
/* 015D3C 01DC1A3C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015D40 01DC1A40 00000000 */   nop
/* 015D44 01DC1A44 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xC7DC)
/* 015D48 01DC1A48 AC4F228C */  lw          $2, %lo(MainMonstorUnit + 0xC7DC)($1)
/* 015D4C 01DC1A4C E301013C */  lui         $1, %hi(CharaF)
/* 015D50 01DC1A50 70D222AC */  sw          $2, %lo(CharaF)($1)
/* 015D54 01DC1A54 0498838F */  lw          $3, -0x67FC($28)
/* 015D58 01DC1A58 B0110224 */  addiu       $2, $0, 0x11B0
/* 015D5C 01DC1A5C 18186200 */  mult        $3, $3, $2
/* 015D60 01DC1A60 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 015D64 01DC1A64 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 015D68 01DC1A68 21104300 */  addu        $2, $2, $3
/* 015D6C 01DC1A6C 0000448C */  lw          $4, 0x0($2)
/* 015D70 01DC1A70 DE01023C */  lui         $2, %hi(LIT_1594__2)
/* 015D74 01DC1A74 48F94524 */  addiu       $5, $2, %lo(LIT_1594__2)
/* 015D78 01DC1A78 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015D7C 01DC1A7C 00000000 */   nop
/* 015D80 01DC1A80 28264070 */  paddub      $4, $2, $0
/* 015D84 01DC1A84 48008010 */  beqz        $4, .L01DC1BA8_2C73A8
/* 015D88 01DC1A88 00000000 */   nop
/* 015D8C 01DC1A8C 5000A527 */  addiu       $5, $29, 0x50
/* 015D90 01DC1A90 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 015D94 01DC1A94 00000000 */   nop
/* 015D98 01DC1A98 7000ACC7 */  lwc1        $f12, 0x70($29)
/* 015D9C 01DC1A9C 7800ADC7 */  lwc1        $f13, 0x78($29)
/* 015DA0 01DC1AA0 5077040C */  jal         atan2f
/* 015DA4 01DC1AA4 00000000 */   nop
/* 015DA8 01DC1AA8 00708044 */  mtc1        $0, $f14
/* 015DAC 01DC1AAC 00000000 */  nop
/* 015DB0 01DC1AB0 06730046 */  mov.s       $f12, $f14
/* 015DB4 01DC1AB4 E301013C */  lui         $1, %hi(CharaF)
/* 015DB8 01DC1AB8 70D2248C */  lw          $4, %lo(CharaF)($1)
/* 015DBC 01DC1ABC 46030046 */  mov.s       $f13, $f0
/* 015DC0 01DC1AC0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 015DC4 01DC1AC4 00000000 */   nop
/* 015DC8 01DC1AC8 8000B227 */  addiu       $18, $29, 0x80
/* 015DCC 01DC1ACC 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015DD0 01DC1AD0 8400B127 */  addiu       $17, $29, 0x84
/* 015DD4 01DC1AD4 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015DD8 01DC1AD8 8800B027 */  addiu       $16, $29, 0x88
/* 015DDC 01DC1ADC 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015DE0 01DC1AE0 E301013C */  lui         $1, %hi(CharaF)
/* 015DE4 01DC1AE4 70D2248C */  lw          $4, %lo(CharaF)($1)
/* 015DE8 01DC1AE8 A09F040C */  jal         SetPosition__6CFrameFfff
/* 015DEC 01DC1AEC 00000000 */   nop
/* 015DF0 01DC1AF0 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015DF4 01DC1AF4 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015DF8 01DC1AF8 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015DFC 01DC1AFC 28260070 */  paddub      $4, $0, $0
/* 015E00 01DC1B00 6C0D770C */  jal         LightSet__Ffffi
/* 015E04 01DC1B04 00000000 */   nop
/* 015E08 01DC1B08 E301013C */  lui         $1, %hi(CharaF)
/* 015E0C 01DC1B0C 70D2248C */  lw          $4, %lo(CharaF)($1)
/* 015E10 01DC1B10 60BB040C */  jal         MGDraw__FP6CFrame
/* 015E14 01DC1B14 00000000 */   nop
/* 015E18 01DC1B18 E301013C */  lui         $1, %hi(CharaF)
/* 015E1C 01DC1B1C 70D2248C */  lw          $4, %lo(CharaF)($1)
/* 015E20 01DC1B20 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 015E24 01DC1B24 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 015E28 01DC1B28 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015E2C 01DC1B2C 00000000 */   nop
/* 015E30 01DC1B30 28264070 */  paddub      $4, $2, $0
/* 015E34 01DC1B34 0A008010 */  beqz        $4, .L01DC1B60_2C7360
/* 015E38 01DC1B38 00000000 */   nop
/* 015E3C 01DC1B3C 5000A527 */  addiu       $5, $29, 0x50
/* 015E40 01DC1B40 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 015E44 01DC1B44 00000000 */   nop
/* 015E48 01DC1B48 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015E4C 01DC1B4C 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015E50 01DC1B50 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015E54 01DC1B54 0A000424 */  addiu       $4, $0, 0xA
/* 015E58 01DC1B58 D808770C */  jal         DrawShadow__Fifff
/* 015E5C 01DC1B5C 00000000 */   nop
.L01DC1B60_2C7360:
/* 015E60 01DC1B60 E301013C */  lui         $1, %hi(CharaF)
/* 015E64 01DC1B64 70D2248C */  lw          $4, %lo(CharaF)($1)
/* 015E68 01DC1B68 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 015E6C 01DC1B6C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 015E70 01DC1B70 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015E74 01DC1B74 00000000 */   nop
/* 015E78 01DC1B78 28264070 */  paddub      $4, $2, $0
/* 015E7C 01DC1B7C 0A008010 */  beqz        $4, .L01DC1BA8_2C73A8
/* 015E80 01DC1B80 00000000 */   nop
/* 015E84 01DC1B84 5000A527 */  addiu       $5, $29, 0x50
/* 015E88 01DC1B88 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 015E8C 01DC1B8C 00000000 */   nop
/* 015E90 01DC1B90 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015E94 01DC1B94 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015E98 01DC1B98 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015E9C 01DC1B9C 0B000424 */  addiu       $4, $0, 0xB
/* 015EA0 01DC1BA0 D808770C */  jal         DrawShadow__Fifff
/* 015EA4 01DC1BA4 00000000 */   nop
.L01DC1BA8_2C73A8:
/* 015EA8 01DC1BA8 E101013C */  lui         $1, %hi(CharaTex__2 + 0x13)
/* 015EAC 01DC1BAC C3952680 */  lb          $6, %lo(CharaTex__2 + 0x13)($1)
/* 015EB0 01DC1BB0 C701023C */  lui         $2, %hi(TexManager)
/* 015EB4 01DC1BB4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 015EB8 01DC1BB8 D48B858F */  lw          $5, -0x742C($28)
/* 015EBC 01DC1BBC 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 015EC0 01DC1BC0 00000000 */   nop
/* 015EC4 01DC1BC4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xC7DC)
/* 015EC8 01DC1BC8 AC4F228C */  lw          $2, %lo(MainMonstorUnit + 0xC7DC)($1)
/* 015ECC 01DC1BCC E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015ED0 01DC1BD0 74D222AC */  sw          $2, %lo(CharaF + 0x4)($1)
/* 015ED4 01DC1BD4 0498838F */  lw          $3, -0x67FC($28)
/* 015ED8 01DC1BD8 B0110224 */  addiu       $2, $0, 0x11B0
/* 015EDC 01DC1BDC 18186200 */  mult        $3, $3, $2
/* 015EE0 01DC1BE0 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 015EE4 01DC1BE4 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 015EE8 01DC1BE8 21104300 */  addu        $2, $2, $3
/* 015EEC 01DC1BEC 0000448C */  lw          $4, 0x0($2)
/* 015EF0 01DC1BF0 DE01023C */  lui         $2, %hi(LIT_1597__2)
/* 015EF4 01DC1BF4 60F94524 */  addiu       $5, $2, %lo(LIT_1597__2)
/* 015EF8 01DC1BF8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015EFC 01DC1BFC 00000000 */   nop
/* 015F00 01DC1C00 28264070 */  paddub      $4, $2, $0
/* 015F04 01DC1C04 48008010 */  beqz        $4, .L01DC1D28_2C7528
/* 015F08 01DC1C08 00000000 */   nop
/* 015F0C 01DC1C0C 5000A527 */  addiu       $5, $29, 0x50
/* 015F10 01DC1C10 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 015F14 01DC1C14 00000000 */   nop
/* 015F18 01DC1C18 00A08044 */  mtc1        $0, $f20
/* 015F1C 01DC1C1C 7000ACC7 */  lwc1        $f12, 0x70($29)
/* 015F20 01DC1C20 7800ADC7 */  lwc1        $f13, 0x78($29)
/* 015F24 01DC1C24 5077040C */  jal         atan2f
/* 015F28 01DC1C28 00000000 */   nop
/* 015F2C 01DC1C2C 86A30046 */  mov.s       $f14, $f20
/* 015F30 01DC1C30 E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015F34 01DC1C34 74D2248C */  lw          $4, %lo(CharaF + 0x4)($1)
/* 015F38 01DC1C38 06A30046 */  mov.s       $f12, $f20
/* 015F3C 01DC1C3C 46030046 */  mov.s       $f13, $f0
/* 015F40 01DC1C40 70A3040C */  jal         SetRotation__6CFrameFfff
/* 015F44 01DC1C44 00000000 */   nop
/* 015F48 01DC1C48 8000B227 */  addiu       $18, $29, 0x80
/* 015F4C 01DC1C4C 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015F50 01DC1C50 8400B127 */  addiu       $17, $29, 0x84
/* 015F54 01DC1C54 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015F58 01DC1C58 8800B027 */  addiu       $16, $29, 0x88
/* 015F5C 01DC1C5C 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015F60 01DC1C60 E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015F64 01DC1C64 74D2248C */  lw          $4, %lo(CharaF + 0x4)($1)
/* 015F68 01DC1C68 A09F040C */  jal         SetPosition__6CFrameFfff
/* 015F6C 01DC1C6C 00000000 */   nop
/* 015F70 01DC1C70 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015F74 01DC1C74 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015F78 01DC1C78 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015F7C 01DC1C7C 28260070 */  paddub      $4, $0, $0
/* 015F80 01DC1C80 6C0D770C */  jal         LightSet__Ffffi
/* 015F84 01DC1C84 00000000 */   nop
/* 015F88 01DC1C88 E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015F8C 01DC1C8C 74D2248C */  lw          $4, %lo(CharaF + 0x4)($1)
/* 015F90 01DC1C90 60BB040C */  jal         MGDraw__FP6CFrame
/* 015F94 01DC1C94 00000000 */   nop
/* 015F98 01DC1C98 E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015F9C 01DC1C9C 74D2248C */  lw          $4, %lo(CharaF + 0x4)($1)
/* 015FA0 01DC1CA0 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 015FA4 01DC1CA4 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 015FA8 01DC1CA8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015FAC 01DC1CAC 00000000 */   nop
/* 015FB0 01DC1CB0 28264070 */  paddub      $4, $2, $0
/* 015FB4 01DC1CB4 0A008010 */  beqz        $4, .L01DC1CE0_2C74E0
/* 015FB8 01DC1CB8 00000000 */   nop
/* 015FBC 01DC1CBC 5000A527 */  addiu       $5, $29, 0x50
/* 015FC0 01DC1CC0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 015FC4 01DC1CC4 00000000 */   nop
/* 015FC8 01DC1CC8 00004CC6 */  lwc1        $f12, 0x0($18)
/* 015FCC 01DC1CCC 00002DC6 */  lwc1        $f13, 0x0($17)
/* 015FD0 01DC1CD0 00000EC6 */  lwc1        $f14, 0x0($16)
/* 015FD4 01DC1CD4 0C000424 */  addiu       $4, $0, 0xC
/* 015FD8 01DC1CD8 D808770C */  jal         DrawShadow__Fifff
/* 015FDC 01DC1CDC 00000000 */   nop
.L01DC1CE0_2C74E0:
/* 015FE0 01DC1CE0 E301013C */  lui         $1, %hi(CharaF + 0x4)
/* 015FE4 01DC1CE4 74D2248C */  lw          $4, %lo(CharaF + 0x4)($1)
/* 015FE8 01DC1CE8 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 015FEC 01DC1CEC 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 015FF0 01DC1CF0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 015FF4 01DC1CF4 00000000 */   nop
/* 015FF8 01DC1CF8 28264070 */  paddub      $4, $2, $0
/* 015FFC 01DC1CFC 0A008010 */  beqz        $4, .L01DC1D28_2C7528
/* 016000 01DC1D00 00000000 */   nop
/* 016004 01DC1D04 5000A527 */  addiu       $5, $29, 0x50
/* 016008 01DC1D08 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01600C 01DC1D0C 00000000 */   nop
/* 016010 01DC1D10 00004CC6 */  lwc1        $f12, 0x0($18)
/* 016014 01DC1D14 00002DC6 */  lwc1        $f13, 0x0($17)
/* 016018 01DC1D18 00000EC6 */  lwc1        $f14, 0x0($16)
/* 01601C 01DC1D1C 0D000424 */  addiu       $4, $0, 0xD
/* 016020 01DC1D20 D808770C */  jal         DrawShadow__Fifff
/* 016024 01DC1D24 00000000 */   nop
.L01DC1D28_2C7528:
/* 016028 01DC1D28 DE01013C */  lui         $1, %hi(CScript__2 + 0x440)
/* 01602C 01DC1D2C 401F2390 */  lbu         $3, %lo(CScript__2 + 0x440)($1)
/* 016030 01DC1D30 61006010 */  beqz        $3, .L01DC1EB8_2C76B8
/* 016034 01DC1D34 00000000 */   nop
/* 016038 01DC1D38 E101013C */  lui         $1, %hi(CharaTex__2 + 0x14)
/* 01603C 01DC1D3C C4952680 */  lb          $6, %lo(CharaTex__2 + 0x14)($1)
/* 016040 01DC1D40 C701023C */  lui         $2, %hi(TexManager)
/* 016044 01DC1D44 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 016048 01DC1D48 D48B858F */  lw          $5, -0x742C($28)
/* 01604C 01DC1D4C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 016050 01DC1D50 00000000 */   nop
/* 016054 01DC1D54 E001013C */  lui         $1, %hi(MainMonstorUnit + 0xD98C)
/* 016058 01DC1D58 5C61228C */  lw          $2, %lo(MainMonstorUnit + 0xD98C)($1)
/* 01605C 01DC1D5C E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 016060 01DC1D60 78D222AC */  sw          $2, %lo(CharaF + 0x8)($1)
/* 016064 01DC1D64 0498838F */  lw          $3, -0x67FC($28)
/* 016068 01DC1D68 B0110224 */  addiu       $2, $0, 0x11B0
/* 01606C 01DC1D6C 18186200 */  mult        $3, $3, $2
/* 016070 01DC1D70 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 016074 01DC1D74 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 016078 01DC1D78 21104300 */  addu        $2, $2, $3
/* 01607C 01DC1D7C 0000448C */  lw          $4, 0x0($2)
/* 016080 01DC1D80 DE01023C */  lui         $2, %hi(LIT_1598__2)
/* 016084 01DC1D84 68F94524 */  addiu       $5, $2, %lo(LIT_1598__2)
/* 016088 01DC1D88 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01608C 01DC1D8C 00000000 */   nop
/* 016090 01DC1D90 28264070 */  paddub      $4, $2, $0
/* 016094 01DC1D94 48008010 */  beqz        $4, .L01DC1EB8_2C76B8
/* 016098 01DC1D98 00000000 */   nop
/* 01609C 01DC1D9C 9000A527 */  addiu       $5, $29, 0x90
/* 0160A0 01DC1DA0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0160A4 01DC1DA4 00000000 */   nop
/* 0160A8 01DC1DA8 B000ACC7 */  lwc1        $f12, 0xB0($29)
/* 0160AC 01DC1DAC B800ADC7 */  lwc1        $f13, 0xB8($29)
/* 0160B0 01DC1DB0 5077040C */  jal         atan2f
/* 0160B4 01DC1DB4 00000000 */   nop
/* 0160B8 01DC1DB8 00708044 */  mtc1        $0, $f14
/* 0160BC 01DC1DBC 00000000 */  nop
/* 0160C0 01DC1DC0 06730046 */  mov.s       $f12, $f14
/* 0160C4 01DC1DC4 E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 0160C8 01DC1DC8 78D2248C */  lw          $4, %lo(CharaF + 0x8)($1)
/* 0160CC 01DC1DCC 46030046 */  mov.s       $f13, $f0
/* 0160D0 01DC1DD0 70A3040C */  jal         SetRotation__6CFrameFfff
/* 0160D4 01DC1DD4 00000000 */   nop
/* 0160D8 01DC1DD8 C000B227 */  addiu       $18, $29, 0xC0
/* 0160DC 01DC1DDC 00004CC6 */  lwc1        $f12, 0x0($18)
/* 0160E0 01DC1DE0 C400B127 */  addiu       $17, $29, 0xC4
/* 0160E4 01DC1DE4 00002DC6 */  lwc1        $f13, 0x0($17)
/* 0160E8 01DC1DE8 C800B027 */  addiu       $16, $29, 0xC8
/* 0160EC 01DC1DEC 00000EC6 */  lwc1        $f14, 0x0($16)
/* 0160F0 01DC1DF0 E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 0160F4 01DC1DF4 78D2248C */  lw          $4, %lo(CharaF + 0x8)($1)
/* 0160F8 01DC1DF8 A09F040C */  jal         SetPosition__6CFrameFfff
/* 0160FC 01DC1DFC 00000000 */   nop
/* 016100 01DC1E00 00004CC6 */  lwc1        $f12, 0x0($18)
/* 016104 01DC1E04 00002DC6 */  lwc1        $f13, 0x0($17)
/* 016108 01DC1E08 00000EC6 */  lwc1        $f14, 0x0($16)
/* 01610C 01DC1E0C 28260070 */  paddub      $4, $0, $0
/* 016110 01DC1E10 6C0D770C */  jal         LightSet__Ffffi
/* 016114 01DC1E14 00000000 */   nop
/* 016118 01DC1E18 E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 01611C 01DC1E1C 78D2248C */  lw          $4, %lo(CharaF + 0x8)($1)
/* 016120 01DC1E20 60BB040C */  jal         MGDraw__FP6CFrame
/* 016124 01DC1E24 00000000 */   nop
/* 016128 01DC1E28 E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 01612C 01DC1E2C 78D2248C */  lw          $4, %lo(CharaF + 0x8)($1)
/* 016130 01DC1E30 DE01023C */  lui         $2, %hi(LIT_1595__2)
/* 016134 01DC1E34 50F94524 */  addiu       $5, $2, %lo(LIT_1595__2)
/* 016138 01DC1E38 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01613C 01DC1E3C 00000000 */   nop
/* 016140 01DC1E40 28264070 */  paddub      $4, $2, $0
/* 016144 01DC1E44 0A008010 */  beqz        $4, .L01DC1E70_2C7670
/* 016148 01DC1E48 00000000 */   nop
/* 01614C 01DC1E4C 9000A527 */  addiu       $5, $29, 0x90
/* 016150 01DC1E50 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 016154 01DC1E54 00000000 */   nop
/* 016158 01DC1E58 00004CC6 */  lwc1        $f12, 0x0($18)
/* 01615C 01DC1E5C 00002DC6 */  lwc1        $f13, 0x0($17)
/* 016160 01DC1E60 00000EC6 */  lwc1        $f14, 0x0($16)
/* 016164 01DC1E64 0E000424 */  addiu       $4, $0, 0xE
/* 016168 01DC1E68 D808770C */  jal         DrawShadow__Fifff
/* 01616C 01DC1E6C 00000000 */   nop
.L01DC1E70_2C7670:
/* 016170 01DC1E70 E301013C */  lui         $1, %hi(CharaF + 0x8)
/* 016174 01DC1E74 78D2248C */  lw          $4, %lo(CharaF + 0x8)($1)
/* 016178 01DC1E78 DE01023C */  lui         $2, %hi(LIT_1596__2)
/* 01617C 01DC1E7C 58F94524 */  addiu       $5, $2, %lo(LIT_1596__2)
/* 016180 01DC1E80 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 016184 01DC1E84 00000000 */   nop
/* 016188 01DC1E88 28264070 */  paddub      $4, $2, $0
/* 01618C 01DC1E8C 0A008010 */  beqz        $4, .L01DC1EB8_2C76B8
/* 016190 01DC1E90 00000000 */   nop
/* 016194 01DC1E94 9000A527 */  addiu       $5, $29, 0x90
/* 016198 01DC1E98 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01619C 01DC1E9C 00000000 */   nop
/* 0161A0 01DC1EA0 00004CC6 */  lwc1        $f12, 0x0($18)
/* 0161A4 01DC1EA4 00002DC6 */  lwc1        $f13, 0x0($17)
/* 0161A8 01DC1EA8 00000EC6 */  lwc1        $f14, 0x0($16)
/* 0161AC 01DC1EAC 0F000424 */  addiu       $4, $0, 0xF
/* 0161B0 01DC1EB0 D808770C */  jal         DrawShadow__Fifff
/* 0161B4 01DC1EB4 00000000 */   nop
.L01DC1EB8_2C76B8:
/* 0161B8 01DC1EB8 4000BF7B */  lq          $31, 0x40($29)
/* 0161BC 01DC1EBC 3000B27B */  lq          $18, 0x30($29)
/* 0161C0 01DC1EC0 2000B17B */  lq          $17, 0x20($29)
/* 0161C4 01DC1EC4 1000B07B */  lq          $16, 0x10($29)
/* 0161C8 01DC1EC8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0161CC 01DC1ECC D000BD27 */  addiu       $29, $29, 0xD0
/* 0161D0 01DC1ED0 0800E003 */  jr          $31
/* 0161D4 01DC1ED4 00000000 */   nop
/* 0161D8 01DC1ED8 00000000 */  nop
/* 0161DC 01DC1EDC 00000000 */  nop
