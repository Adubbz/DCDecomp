.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ExitWeaponMenuSelect__Fv
/* 0FCC20 001FCB20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0FCC24 001FCB24 0000BF7F */  sq          $31, 0x0($29)
/* 0FCC28 001FCB28 D494828F */  lw          $2, -0x6B2C($28)
/* 0FCC2C 001FCB2C 04004480 */  lb          $4, 0x4($2)
/* 0FCC30 001FCB30 D894828F */  lw          $2, -0x6B28($28)
/* 0FCC34 001FCB34 09004014 */  bnez        $2, .L001FCB5C
/* 0FCC38 001FCB38 00000000 */   nop
/* 0FCC3C 001FCB3C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FCC40 001FCB40 75EA2280 */  lb          $2, %lo(WepMenu + 0x5)($1)
/* 0FCC44 001FCB44 05008214 */  bne         $4, $2, .L001FCB5C
/* 0FCC48 001FCB48 00000000 */   nop
/* 0FCC4C 001FCB4C 0095858F */  lw          $5, -0x6B00($28)
/* 0FCC50 001FCB50 E494868F */  lw          $6, -0x6B1C($28)
/* 0FCC54 001FCB54 5837080C */  jal         DngWeaponEquipModelBuild__FiiP1
/* 0FCC58 001FCB58 00000000 */   nop
.L001FCB5C:
/* 0FCC5C 001FCB5C C701023C */  lui         $2, %hi(TexManager)
/* 0FCC60 001FCB60 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0FCC64 001FCB64 0095858F */  lw          $5, -0x6B00($28)
/* 0FCC68 001FCB68 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 0FCC6C 001FCB6C 00000000 */   nop
/* 0FCC70 001FCB70 C701023C */  lui         $2, %hi(TexManager)
/* 0FCC74 001FCB74 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0FCC78 001FCB78 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 0FCC7C 001FCB7C 00000000 */   nop
/* 0FCC80 001FCB80 28D6070C */  jal         BtlMenuTexBlockEnter__Fv
/* 0FCC84 001FCB84 00000000 */   nop
/* 0FCC88 001FCB88 12000224 */  addiu       $2, $0, 0x12
/* 0FCC8C 001FCB8C 208882AF */  sw          $2, -0x77E0($28)
/* 0FCC90 001FCB90 46000224 */  addiu       $2, $0, 0x46
/* 0FCC94 001FCB94 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x18)
/* 0FCC98 001FCB98 283B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x18)($1)
/* 0FCC9C 001FCB9C 0A000224 */  addiu       $2, $0, 0xA
/* 0FCCA0 001FCBA0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1C)
/* 0FCCA4 001FCBA4 2C3B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x1C)($1)
/* 0FCCA8 001FCBA8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x20)
/* 0FCCAC 001FCBAC 303B20AC */  sw          $0, %lo(CommonMenuMes3 + 0x20)($1)
/* 0FCCB0 001FCBB0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x24)
/* 0FCCB4 001FCBB4 343B20AC */  sw          $0, %lo(CommonMenuMes3 + 0x24)($1)
/* 0FCCB8 001FCBB8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x28)
/* 0FCCBC 001FCBBC 383B20AC */  sw          $0, %lo(CommonMenuMes3 + 0x28)($1)
/* 0FCCC0 001FCBC0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x90)
/* 0FCCC4 001FCBC4 A03B20AC */  sw          $0, %lo(CommonMenuMes3 + 0x90)($1)
/* 0FCCC8 001FCBC8 01000224 */  addiu       $2, $0, 0x1
/* 0FCCCC 001FCBCC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x94)
/* 0FCCD0 001FCBD0 A43B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x94)($1)
/* 0FCCD4 001FCBD4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xA8)
/* 0FCCD8 001FCBD8 B83B20C4 */  lwc1        $f0, %lo(CommonMenuMes3 + 0xA8)($1)
/* 0FCCDC 001FCBDC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xA4)
/* 0FCCE0 001FCBE0 B43B20E4 */  swc1        $f0, %lo(CommonMenuMes3 + 0xA4)($1)
/* 0FCCE4 001FCBE4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xAC)
/* 0FCCE8 001FCBE8 BC3B20AC */  sw          $0, %lo(CommonMenuMes3 + 0xAC)($1)
/* 0FCCEC 001FCBEC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xB4)
/* 0FCCF0 001FCBF0 C43B20AC */  sw          $0, %lo(CommonMenuMes3 + 0xB4)($1)
/* 0FCCF4 001FCBF4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xB8)
/* 0FCCF8 001FCBF8 C83B20AC */  sw          $0, %lo(CommonMenuMes3 + 0xB8)($1)
/* 0FCCFC 001FCBFC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xBC)
/* 0FCD00 001FCC00 CC3B20AC */  sw          $0, %lo(CommonMenuMes3 + 0xBC)($1)
/* 0FCD04 001FCC04 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xC0)
/* 0FCD08 001FCC08 D03B20AC */  sw          $0, %lo(CommonMenuMes3 + 0xC0)($1)
/* 0FCD0C 001FCC0C DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0FCD10 001FCC10 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0FCD14 001FCC14 643D050C */  jal         InitMesWinTbl__6ClsMesFv
/* 0FCD18 001FCC18 00000000 */   nop
/* 0FCD1C 001FCC1C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16A8)
/* 0FCD20 001FCC20 B851228C */  lw          $2, %lo(CommonMenuMes3 + 0x16A8)($1)
/* 0FCD24 001FCC24 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16AC)
/* 0FCD28 001FCC28 BC5122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16AC)($1)
/* 0FCD2C 001FCC2C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16B0)
/* 0FCD30 001FCC30 C05120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16B0)($1)
/* 0FCD34 001FCC34 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16B4)
/* 0FCD38 001FCC38 C45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16B4)($1)
/* 0FCD3C 001FCC3C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16B8)
/* 0FCD40 001FCC40 C85120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16B8)($1)
/* 0FCD44 001FCC44 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FCD48 001FCC48 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16BC)
/* 0FCD4C 001FCC4C CC5122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16BC)($1)
/* 0FCD50 001FCC50 80000224 */  addiu       $2, $0, 0x80
/* 0FCD54 001FCC54 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16D4)
/* 0FCD58 001FCC58 E45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16D4)($1)
/* 0FCD5C 001FCC5C 282E0070 */  paddub      $5, $0, $0
/* 0FCD60 001FCC60 08000010 */  b           .L001FCC84
/* 0FCD64 001FCC64 00000000 */   nop
.L001FCC68:
/* 0FCD68 001FCC68 FFFF0424 */  addiu       $4, $0, -0x1
/* 0FCD6C 001FCC6C 80180500 */  sll         $3, $5, 2
/* 0FCD70 001FCC70 DA01023C */  lui         $2, %hi(CommonMenuMes3 + 0x16E0)
/* 0FCD74 001FCC74 F0514224 */  addiu       $2, $2, %lo(CommonMenuMes3 + 0x16E0)
/* 0FCD78 001FCC78 21104300 */  addu        $2, $2, $3
/* 0FCD7C 001FCC7C 000044AC */  sw          $4, 0x0($2)
/* 0FCD80 001FCC80 0100A524 */  addiu       $5, $5, 0x1
.L001FCC84:
/* 0FCD84 001FCC84 0A00A228 */  slti        $2, $5, 0xA
/* 0FCD88 001FCC88 F7FF4014 */  bnez        $2, .L001FCC68
/* 0FCD8C 001FCC8C 00000000 */   nop
/* 0FCD90 001FCC90 28260070 */  paddub      $4, $0, $0
/* 0FCD94 001FCC94 07000010 */  b           .L001FCCB4
/* 0FCD98 001FCC98 00000000 */   nop
.L001FCC9C:
/* 0FCD9C 001FCC9C 80180400 */  sll         $3, $4, 2
/* 0FCDA0 001FCCA0 DA01023C */  lui         $2, %hi(CommonMenuMes3 + 0x1708)
/* 0FCDA4 001FCCA4 18524224 */  addiu       $2, $2, %lo(CommonMenuMes3 + 0x1708)
/* 0FCDA8 001FCCA8 21104300 */  addu        $2, $2, $3
/* 0FCDAC 001FCCAC 000040AC */  sw          $0, 0x0($2)
/* 0FCDB0 001FCCB0 01008424 */  addiu       $4, $4, 0x1
.L001FCCB4:
/* 0FCDB4 001FCCB4 08008228 */  slti        $2, $4, 0x8
/* 0FCDB8 001FCCB8 F8FF4014 */  bnez        $2, .L001FCC9C
/* 0FCDBC 001FCCBC 00000000 */   nop
/* 0FCDC0 001FCCC0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1728)
/* 0FCDC4 001FCCC4 385220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1728)($1)
/* 0FCDC8 001FCCC8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x172C)
/* 0FCDCC 001FCCCC 3C5220AC */  sw          $0, %lo(CommonMenuMes3 + 0x172C)($1)
/* 0FCDD0 001FCCD0 01000224 */  addiu       $2, $0, 0x1
/* 0FCDD4 001FCCD4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1730)
/* 0FCDD8 001FCCD8 405222AC */  sw          $2, %lo(CommonMenuMes3 + 0x1730)($1)
/* 0FCDDC 001FCCDC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1734)
/* 0FCDE0 001FCCE0 445220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1734)($1)
/* 0FCDE4 001FCCE4 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FCDE8 001FCCE8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1738)
/* 0FCDEC 001FCCEC 485222AC */  sw          $2, %lo(CommonMenuMes3 + 0x1738)($1)
/* 0FCDF0 001FCCF0 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x173C)
/* 0FCDF4 001FCCF4 4C5222AC */  sw          $2, %lo(CommonMenuMes3 + 0x173C)($1)
/* 0FCDF8 001FCCF8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1740)
/* 0FCDFC 001FCCFC 505222AC */  sw          $2, %lo(CommonMenuMes3 + 0x1740)($1)
/* 0FCE00 001FCD00 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1744)
/* 0FCE04 001FCD04 545220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1744)($1)
/* 0FCE08 001FCD08 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1748)
/* 0FCE0C 001FCD0C 585220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1748)($1)
/* 0FCE10 001FCD10 28260070 */  paddub      $4, $0, $0
/* 0FCE14 001FCD14 0C000010 */  b           .L001FCD48
/* 0FCE18 001FCD18 00000000 */   nop
.L001FCD1C:
/* 0FCE1C 001FCD1C FFFF0324 */  addiu       $3, $0, -0x1
/* 0FCE20 001FCD20 C0280400 */  sll         $5, $4, 3
/* 0FCE24 001FCD24 DA01023C */  lui         $2, %hi(CommonMenuMes3 + 0x1750)
/* 0FCE28 001FCD28 60524224 */  addiu       $2, $2, %lo(CommonMenuMes3 + 0x1750)
/* 0FCE2C 001FCD2C 21104500 */  addu        $2, $2, $5
/* 0FCE30 001FCD30 000043AC */  sw          $3, 0x0($2)
/* 0FCE34 001FCD34 DA01023C */  lui         $2, %hi(CommonMenuMes3 + 0x1754)
/* 0FCE38 001FCD38 64524224 */  addiu       $2, $2, %lo(CommonMenuMes3 + 0x1754)
/* 0FCE3C 001FCD3C 21104500 */  addu        $2, $2, $5
/* 0FCE40 001FCD40 000043AC */  sw          $3, 0x0($2)
/* 0FCE44 001FCD44 01008424 */  addiu       $4, $4, 0x1
.L001FCD48:
/* 0FCE48 001FCD48 0A008228 */  slti        $2, $4, 0xA
/* 0FCE4C 001FCD4C F3FF4014 */  bnez        $2, .L001FCD1C
/* 0FCE50 001FCD50 00000000 */   nop
/* 0FCE54 001FCD54 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0FCE58 001FCD58 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0FCE5C 001FCD5C 01000524 */  addiu       $5, $0, 0x1
/* 0FCE60 001FCD60 9836050C */  jal         Preset__6ClsMesFi
/* 0FCE64 001FCD64 00000000 */   nop
/* 0FCE68 001FCD68 1C88848F */  lw          $4, -0x77E4($28)
/* 0FCE6C 001FCD6C FFFF0524 */  addiu       $5, $0, -0x1
/* 0FCE70 001FCD70 24B0080C */  jal         GetMenuCommonFontW__Fii
/* 0FCE74 001FCD74 00000000 */   nop
/* 0FCE78 001FCD78 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x8)
/* 0FCE7C 001FCD7C 183B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x8)($1)
/* 0FCE80 001FCD80 16000224 */  addiu       $2, $0, 0x16
/* 0FCE84 001FCD84 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0xC)
/* 0FCE88 001FCD88 1C3B22AC */  sw          $2, %lo(CommonMenuMes3 + 0xC)($1)
/* 0FCE8C 001FCD8C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x1734)
/* 0FCE90 001FCD90 445220AC */  sw          $0, %lo(CommonMenuMes3 + 0x1734)($1)
/* 0FCE94 001FCD94 01000224 */  addiu       $2, $0, 0x1
/* 0FCE98 001FCD98 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x1730)
/* 0FCE9C 001FCD9C 006A22AC */  sw          $2, %lo(AtoraNameMes + 0x1730)($1)
/* 0FCEA0 001FCDA0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x1734)
/* 0FCEA4 001FCDA4 046A20AC */  sw          $0, %lo(AtoraNameMes + 0x1734)($1)
/* 0FCEA8 001FCDA8 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x16DC)
/* 0FCEAC 001FCDAC AC6920AC */  sw          $0, %lo(AtoraNameMes + 0x16DC)($1)
/* 0FCEB0 001FCDB0 1C88848F */  lw          $4, -0x77E4($28)
/* 0FCEB4 001FCDB4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0FCEB8 001FCDB8 24B0080C */  jal         GetMenuCommonFontW__Fii
/* 0FCEBC 001FCDBC 00000000 */   nop
/* 0FCEC0 001FCDC0 DA01013C */  lui         $1, %hi(AtoraNameMes + 0x8)
/* 0FCEC4 001FCDC4 D85222AC */  sw          $2, %lo(AtoraNameMes + 0x8)($1)
/* 0FCEC8 001FCDC8 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x1734)
/* 0FCECC 001FCDCC C42220AC */  sw          $0, %lo(CommonMenuMes1 + 0x1734)($1)
/* 0FCED0 001FCDD0 80DC070C */  jal         ForBackMenu__Fv
/* 0FCED4 001FCDD4 00000000 */   nop
/* 0FCED8 001FCDD8 208880AF */  sw          $0, -0x77E0($28)
/* 0FCEDC 001FCDDC 0000BF7B */  lq          $31, 0x0($29)
/* 0FCEE0 001FCDE0 1000BD27 */  addiu       $29, $29, 0x10
/* 0FCEE4 001FCDE4 0800E003 */  jr          $31
/* 0FCEE8 001FCDE8 00000000 */   nop
/* 0FCEEC 001FCDEC 00000000 */  nop
