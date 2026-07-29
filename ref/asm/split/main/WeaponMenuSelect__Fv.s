.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponMenuSelect__Fv
/* 0FCEF0 001FCDF0 10FFBD27 */  addiu       $29, $29, -0xF0
/* 0FCEF4 001FCDF4 8000BF7F */  sq          $31, 0x80($29)
/* 0FCEF8 001FCDF8 7000B77F */  sq          $23, 0x70($29)
/* 0FCEFC 001FCDFC 6000B67F */  sq          $22, 0x60($29)
/* 0FCF00 001FCE00 5000B57F */  sq          $21, 0x50($29)
/* 0FCF04 001FCE04 4000B47F */  sq          $20, 0x40($29)
/* 0FCF08 001FCE08 3000B37F */  sq          $19, 0x30($29)
/* 0FCF0C 001FCE0C 2000B27F */  sq          $18, 0x20($29)
/* 0FCF10 001FCE10 1000B17F */  sq          $17, 0x10($29)
/* 0FCF14 001FCE14 0000B07F */  sq          $16, 0x0($29)
/* 0FCF18 001FCE18 FFFF0424 */  addiu       $4, $0, -0x1
/* 0FCF1C 001FCE1C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FCF20 001FCE20 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FCF24 001FCE24 02000224 */  addiu       $2, $0, 0x2
/* 0FCF28 001FCE28 09006210 */  beq         $3, $2, .L001FCE50
/* 0FCF2C 001FCE2C 00000000 */   nop
/* 0FCF30 001FCE30 01000224 */  addiu       $2, $0, 0x1
/* 0FCF34 001FCE34 03006210 */  beq         $3, $2, .L001FCE44
/* 0FCF38 001FCE38 00000000 */   nop
/* 0FCF3C 001FCE3C 05000010 */  b           .L001FCE54
/* 0FCF40 001FCE40 00000000 */   nop
.L001FCE44:
/* 0FCF44 001FCE44 28260070 */  paddub      $4, $0, $0
/* 0FCF48 001FCE48 02000010 */  b           .L001FCE54
/* 0FCF4C 001FCE4C 00000000 */   nop
.L001FCE50:
/* 0FCF50 001FCE50 01000424 */  addiu       $4, $0, 0x1
.L001FCE54:
/* 0FCF54 001FCE54 D8DB070C */  jal         ToFromSelect__Fi
/* 0FCF58 001FCE58 00000000 */   nop
/* 0FCF5C 001FCE5C 28864070 */  paddub      $16, $2, $0
/* 0FCF60 001FCE60 0495848F */  lw          $4, -0x6AFC($28)
/* 0FCF64 001FCE64 01000324 */  addiu       $3, $0, 0x1
/* 0FCF68 001FCE68 33008310 */  beq         $4, $3, .L001FCF38
/* 0FCF6C 001FCE6C 00000000 */   nop
/* 0FCF70 001FCE70 03008010 */  beqz        $4, .L001FCE80
/* 0FCF74 001FCE74 00000000 */   nop
/* 0FCF78 001FCE78 38000010 */  b           .L001FCF5C
/* 0FCF7C 001FCE7C 00000000 */   nop
.L001FCE80:
/* 0FCF80 001FCE80 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E0)
/* 0FCF84 001FCE84 C0BB2380 */  lb          $3, %lo(MenuWepLevelUp + 0x12E0)($1)
/* 0FCF88 001FCE88 19006014 */  bnez        $3, .L001FCEF0
/* 0FCF8C 001FCE8C 00000000 */   nop
/* 0FCF90 001FCE90 8CFB040C */  jal         ReadBGSync__Fv
/* 0FCF94 001FCE94 00000000 */   nop
/* 0FCF98 001FCE98 13004014 */  bnez        $2, .L001FCEE8
/* 0FCF9C 001FCE9C 00000000 */   nop
/* 0FCFA0 001FCEA0 0495838F */  lw          $3, -0x6AFC($28)
/* 0FCFA4 001FCEA4 2D006014 */  bnez        $3, .L001FCF5C
/* 0FCFA8 001FCEA8 00000000 */   nop
/* 0FCFAC 001FCEAC DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FCFB0 001FCEB0 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FCFB4 001FCEB4 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FCFB8 001FCEB8 74EA2680 */  lb          $6, %lo(WepMenu + 0x4)($1)
/* 0FCFBC 001FCEBC 0095858F */  lw          $5, -0x6B00($28)
/* 0FCFC0 001FCEC0 3035080C */  jal         EnterWeaponModel__Fiii
/* 0FCFC4 001FCEC4 00000000 */   nop
/* 0FCFC8 001FCEC8 049582AF */  sw          $2, -0x6AFC($28)
/* 0FCFCC 001FCECC 28D6070C */  jal         BtlMenuTexBlockEnter__Fv
/* 0FCFD0 001FCED0 00000000 */   nop
/* 0FCFD4 001FCED4 0C9580AF */  sw          $0, -0x6AF4($28)
/* 0FCFD8 001FCED8 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FCFDC 001FCEDC 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
/* 0FCFE0 001FCEE0 03000010 */  b           .L001FCEF0
/* 0FCFE4 001FCEE4 00000000 */   nop
.L001FCEE8:
/* 0FCFE8 001FCEE8 D4030010 */  b           .L001FDE3C
/* 0FCFEC 001FCEEC 00000000 */   nop
.L001FCEF0:
/* 0FCFF0 001FCEF0 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E0)
/* 0FCFF4 001FCEF4 C0BB2480 */  lb          $4, %lo(MenuWepLevelUp + 0x12E0)($1)
/* 0FCFF8 001FCEF8 01000324 */  addiu       $3, $0, 0x1
/* 0FCFFC 001FCEFC 17008314 */  bne         $4, $3, .L001FCF5C
/* 0FD000 001FCF00 00000000 */   nop
/* 0FD004 001FCF04 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FD008 001FCF08 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FD00C 001FCF0C 0095858F */  lw          $5, -0x6B00($28)
/* 0FD010 001FCF10 4C36080C */  jal         WeaponModelBuildFunc__Fii
/* 0FD014 001FCF14 00000000 */   nop
/* 0FD018 001FCF18 0C9580AF */  sw          $0, -0x6AF4($28)
/* 0FD01C 001FCF1C DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E0)
/* 0FD020 001FCF20 C0BB20A0 */  sb          $0, %lo(MenuWepLevelUp + 0x12E0)($1)
/* 0FD024 001FCF24 0495838F */  lw          $3, -0x6AFC($28)
/* 0FD028 001FCF28 01006324 */  addiu       $3, $3, 0x1
/* 0FD02C 001FCF2C 049583AF */  sw          $3, -0x6AFC($28)
/* 0FD030 001FCF30 0A000010 */  b           .L001FCF5C
/* 0FD034 001FCF34 00000000 */   nop
.L001FCF38:
/* 0FD038 001FCF38 0C95838F */  lw          $3, -0x6AF4($28)
/* 0FD03C 001FCF3C 01006324 */  addiu       $3, $3, 0x1
/* 0FD040 001FCF40 0C9583AF */  sw          $3, -0x6AF4($28)
/* 0FD044 001FCF44 0C95838F */  lw          $3, -0x6AF4($28)
/* 0FD048 001FCF48 04006128 */  slti        $1, $3, 0x4
/* 0FD04C 001FCF4C 03002014 */  bnez        $1, .L001FCF5C
/* 0FD050 001FCF50 00000000 */   nop
/* 0FD054 001FCF54 02000324 */  addiu       $3, $0, 0x2
/* 0FD058 001FCF58 049583AF */  sw          $3, -0x6AFC($28)
.L001FCF5C:
/* 0FD05C 001FCF5C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD060 001FCF60 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD064 001FCF64 08006010 */  beqz        $3, .L001FCF88
/* 0FD068 001FCF68 00000000 */   nop
/* 0FD06C 001FCF6C DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD070 001FCF70 80EA238C */  lw          $3, %lo(WepMenu + 0x10)($1)
/* 0FD074 001FCF74 01006324 */  addiu       $3, $3, 0x1
/* 0FD078 001FCF78 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD07C 001FCF7C 80EA23AC */  sw          $3, %lo(WepMenu + 0x10)($1)
/* 0FD080 001FCF80 03000010 */  b           .L001FCF90
/* 0FD084 001FCF84 00000000 */   nop
.L001FCF88:
/* 0FD088 001FCF88 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD08C 001FCF8C 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
.L001FCF90:
/* 0FD090 001FCF90 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD094 001FCF94 7CEA2584 */  lh          $5, %lo(WepMenu + 0xC)($1)
/* 0FD098 001FCF98 0F00A12C */  sltiu       $1, $5, 0xF
/* 0FD09C 001FCF9C AA012010 */  beqz        $1, .L001FD648$b
/* 0FD0A0 001FCFA0 00000000 */   nop
/* 0FD0A4 001FCFA4 2A00033C */  lui         $3, %hi(LIT_2806__2)
/* 0FD0A8 001FCFA8 60D96424 */  addiu       $4, $3, %lo(LIT_2806__2)
/* 0FD0AC 001FCFAC 80180500 */  sll         $3, $5, 2
/* 0FD0B0 001FCFB0 21186400 */  addu        $3, $3, $4
/* 0FD0B4 001FCFB4 0000638C */  lw          $3, 0x0($3)
/* 0FD0B8 001FCFB8 08006000 */  jr          $3
/* 0FD0BC 001FCFBC 00000000 */   nop
jlabel .L001FCFC0
.L001FCFC0$b:
/* 0FD0C0 001FCFC0 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD0C4 001FCFC4 80EA20C4 */  lwc1        $f0, %lo(WepMenu + 0x10)($1)
/* 0FD0C8 001FCFC8 60008046 */  cvt.s.w     $f1, $f0
/* 0FD0CC 001FCFCC 9041033C */  lui         $3, (0x41900000 >> 16)
/* 0FD0D0 001FCFD0 00008344 */  mtc1        $3, $f0
/* 0FD0D4 001FCFD4 00000000 */  nop
/* 0FD0D8 001FCFD8 36080046 */  c.le.s      $f1, $f0
/* 0FD0DC 001FCFDC 00000000 */  nop
/* 0FD0E0 001FCFE0 99010145 */  bc1t        .L001FD648$b
/* 0FD0E4 001FCFE4 00000000 */   nop
/* 0FD0E8 001FCFE8 97010012 */  beqz        $16, .L001FD648$b
/* 0FD0EC 001FCFEC 00000000 */   nop
/* 0FD0F0 001FCFF0 0495838F */  lw          $3, -0x6AFC($28)
/* 0FD0F4 001FCFF4 94016010 */  beqz        $3, .L001FD648$b
/* 0FD0F8 001FCFF8 00000000 */   nop
/* 0FD0FC 001FCFFC 02000324 */  addiu       $3, $0, 0x2
/* 0FD100 001FD000 208883AF */  sw          $3, -0x77E0($28)
/* 0FD104 001FD004 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD108 001FD008 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD10C 001FD00C DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD110 001FD010 80EA20AC */  sw          $0, %lo(WepMenu + 0x10)($1)
/* 0FD114 001FD014 8C010010 */  b           .L001FD648$b
/* 0FD118 001FD018 00000000 */   nop
jlabel .L001FD01C
.L001FD01C$b:
/* 0FD11C 001FD01C DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD120 001FD020 80EA238C */  lw          $3, %lo(WepMenu + 0x10)($1)
/* 0FD124 001FD024 15006128 */  slti        $1, $3, 0x15
/* 0FD128 001FD028 87012014 */  bnez        $1, .L001FD648$b
/* 0FD12C 001FD02C 00000000 */   nop
/* 0FD130 001FD030 85010012 */  beqz        $16, .L001FD648$b
/* 0FD134 001FD034 00000000 */   nop
/* 0FD138 001FD038 C8F2070C */  jal         ExitWeaponMenuSelect__Fv
/* 0FD13C 001FD03C 00000000 */   nop
/* 0FD140 001FD040 81010010 */  b           .L001FD648$b
/* 0FD144 001FD044 00000000 */   nop
jlabel .L001FD048
.L001FD048$b:
/* 0FD148 001FD048 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1300)
/* 0FD14C 001FD04C E0BB2384 */  lh          $3, %lo(MenuWepLevelUp + 0x1300)($1)
/* 0FD150 001FD050 7D016014 */  bnez        $3, .L001FD648$b
/* 0FD154 001FD054 00000000 */   nop
/* 0FD158 001FD058 CC01023C */  lui         $2, %hi(GamePad)
/* 0FD15C 001FD05C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD160 001FD060 60000524 */  addiu       $5, $0, 0x60
/* 0FD164 001FD064 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD168 001FD068 00000000 */   nop
/* 0FD16C 001FD06C 76014010 */  beqz        $2, .L001FD648$b
/* 0FD170 001FD070 00000000 */   nop
/* 0FD174 001FD074 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1314)
/* 0FD178 001FD078 F4BB2484 */  lh          $4, %lo(MenuWepLevelUp + 0x1314)($1)
/* 0FD17C 001FD07C 06000324 */  addiu       $3, $0, 0x6
/* 0FD180 001FD080 0A008310 */  beq         $4, $3, .L001FD0AC
/* 0FD184 001FD084 00000000 */   nop
/* 0FD188 001FD088 03000324 */  addiu       $3, $0, 0x3
/* 0FD18C 001FD08C 07008310 */  beq         $4, $3, .L001FD0AC
/* 0FD190 001FD090 00000000 */   nop
/* 0FD194 001FD094 09000324 */  addiu       $3, $0, 0x9
/* 0FD198 001FD098 04008310 */  beq         $4, $3, .L001FD0AC
/* 0FD19C 001FD09C 00000000 */   nop
/* 0FD1A0 001FD0A0 0B000324 */  addiu       $3, $0, 0xB
/* 0FD1A4 001FD0A4 68018314 */  bne         $4, $3, .L001FD648$b
/* 0FD1A8 001FD0A8 00000000 */   nop
.L001FD0AC:
/* 0FD1AC 001FD0AC DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12D4)
/* 0FD1B0 001FD0B0 B4BB308C */  lw          $16, %lo(MenuWepLevelUp + 0x12D4)($1)
/* 0FD1B4 001FD0B4 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD1B8 001FD0B8 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD1BC 001FD0BC 0A000224 */  addiu       $2, $0, 0xA
/* 0FD1C0 001FD0C0 3E006210 */  beq         $3, $2, .L001FD1BC
/* 0FD1C4 001FD0C4 00000000 */   nop
/* 0FD1C8 001FD0C8 09000224 */  addiu       $2, $0, 0x9
/* 0FD1CC 001FD0CC 3B006210 */  beq         $3, $2, .L001FD1BC
/* 0FD1D0 001FD0D0 00000000 */   nop
/* 0FD1D4 001FD0D4 08000224 */  addiu       $2, $0, 0x8
/* 0FD1D8 001FD0D8 22006210 */  beq         $3, $2, .L001FD164
/* 0FD1DC 001FD0DC 00000000 */   nop
/* 0FD1E0 001FD0E0 07000224 */  addiu       $2, $0, 0x7
/* 0FD1E4 001FD0E4 03006210 */  beq         $3, $2, .L001FD0F4
/* 0FD1E8 001FD0E8 00000000 */   nop
/* 0FD1EC 001FD0EC 33000010 */  b           .L001FD1BC
/* 0FD1F0 001FD0F0 00000000 */   nop
.L001FD0F4:
/* 0FD1F4 001FD0F4 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FD1F8 001FD0F8 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FD1FC 001FD0FC DCD9080C */  jal         SetLevelUpWeaponData__14CWeaponLevelUpFv
/* 0FD200 001FD100 00000000 */   nop
/* 0FD204 001FD104 02000286 */  lh          $2, 0x2($16)
/* 0FD208 001FD108 01004224 */  addiu       $2, $2, 0x1
/* 0FD20C 001FD10C 020002A6 */  sh          $2, 0x2($16)
/* 0FD210 001FD110 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E8)
/* 0FD214 001FD114 C8BB2384 */  lh          $3, %lo(MenuWepLevelUp + 0x12E8)($1)
/* 0FD218 001FD118 F000028E */  lw          $2, 0xF0($16)
/* 0FD21C 001FD11C 21104300 */  addu        $2, $2, $3
/* 0FD220 001FD120 F00002AE */  sw          $2, 0xF0($16)
/* 0FD224 001FD124 288E0070 */  paddub      $17, $0, $0
/* 0FD228 001FD128 09000010 */  b           .L001FD150
/* 0FD22C 001FD12C 00000000 */   nop
.L001FD130:
/* 0FD230 001FD130 40111100 */  sll         $2, $17, 5
/* 0FD234 001FD134 21100202 */  addu        $2, $16, $2
/* 0FD238 001FD138 28004424 */  addiu       $4, $2, 0x28
/* 0FD23C 001FD13C 282E0070 */  paddub      $5, $0, $0
/* 0FD240 001FD140 20000624 */  addiu       $6, $0, 0x20
/* 0FD244 001FD144 5A0D040C */  jal         memset
/* 0FD248 001FD148 00000000 */   nop
/* 0FD24C 001FD14C 01003126 */  addiu       $17, $17, 0x1
.L001FD150:
/* 0FD250 001FD150 0600222A */  slti        $2, $17, 0x6
/* 0FD254 001FD154 F6FF4014 */  bnez        $2, .L001FD130
/* 0FD258 001FD158 00000000 */   nop
/* 0FD25C 001FD15C 17000010 */  b           .L001FD1BC
/* 0FD260 001FD160 00000000 */   nop
.L001FD164:
/* 0FD264 001FD164 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FD268 001FD168 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FD26C 001FD16C D494828F */  lw          $2, -0x6B2C($28)
/* 0FD270 001FD170 21108200 */  addu        $2, $4, $2
/* 0FD274 001FD174 40434380 */  lb          $3, 0x4340($2)
/* 0FD278 001FD178 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FD27C 001FD17C 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FD280 001FD180 0A004310 */  beq         $2, $3, .L001FD1AC
/* 0FD284 001FD184 00000000 */   nop
/* 0FD288 001FD188 40110300 */  sll         $2, $3, 5
/* 0FD28C 001FD18C 23104300 */  subu        $2, $2, $3
/* 0FD290 001FD190 C0180200 */  sll         $3, $2, 3
/* 0FD294 001FD194 1495828F */  lw          $2, -0x6AEC($28)
/* 0FD298 001FD198 21104300 */  addu        $2, $2, $3
/* 0FD29C 001FD19C 00004284 */  lh          $2, 0x0($2)
/* 0FD2A0 001FD1A0 01014128 */  slti        $1, $2, 0x101
/* 0FD2A4 001FD1A4 03002010 */  beqz        $1, .L001FD1B4
/* 0FD2A8 001FD1A8 00000000 */   nop
.L001FD1AC:
/* 0FD2AC 001FD1AC EC2F080C */  jal         EquipDefaultWeapon__Fi
/* 0FD2B0 001FD1B0 00000000 */   nop
.L001FD1B4:
/* 0FD2B4 001FD1B4 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x12E1)
/* 0FD2B8 001FD1B8 C1BB20A0 */  sb          $0, %lo(MenuWepLevelUp + 0x12E1)($1)
.L001FD1BC:
/* 0FD2BC 001FD1BC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD2C0 001FD1C0 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD2C4 001FD1C4 0A000224 */  addiu       $2, $0, 0xA
/* 0FD2C8 001FD1C8 0A006210 */  beq         $3, $2, .L001FD1F4
/* 0FD2CC 001FD1CC 00000000 */   nop
/* 0FD2D0 001FD1D0 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1316)
/* 0FD2D4 001FD1D4 F6BB2584 */  lh          $5, %lo(MenuWepLevelUp + 0x1316)($1)
/* 0FD2D8 001FD1D8 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1318)
/* 0FD2DC 001FD1DC F8BB2684 */  lh          $6, %lo(MenuWepLevelUp + 0x1318)($1)
/* 0FD2E0 001FD1E0 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FD2E4 001FD1E4 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FD2E8 001FD1E8 07000724 */  addiu       $7, $0, 0x7
/* 0FD2EC 001FD1EC ACDB080C */  jal         SetSnd__14CWeaponLevelUpFiii
/* 0FD2F0 001FD1F0 00000000 */   nop
.L001FD1F4:
/* 0FD2F4 001FD1F4 DB01023C */  lui         $2, %hi(MenuWepLevelUp)
/* 0FD2F8 001FD1F8 E0A84424 */  addiu       $4, $2, %lo(MenuWepLevelUp)
/* 0FD2FC 001FD1FC 7CD8080C */  jal         Initialize__14CWeaponLevelUpFv
/* 0FD300 001FD200 00000000 */   nop
/* 0FD304 001FD204 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD308 001FD208 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD30C 001FD20C 0E010010 */  b           .L001FD648$b
/* 0FD310 001FD210 00000000 */   nop
jlabel .L001FD214
.L001FD214$b:
/* 0FD314 001FD214 CC01023C */  lui         $2, %hi(GamePad)
/* 0FD318 001FD218 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD31C 001FD21C 60000524 */  addiu       $5, $0, 0x60
/* 0FD320 001FD220 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD324 001FD224 00000000 */   nop
/* 0FD328 001FD228 07014010 */  beqz        $2, .L001FD648$b
/* 0FD32C 001FD22C 00000000 */   nop
/* 0FD330 001FD230 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD334 001FD234 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD338 001FD238 FFFF0324 */  addiu       $3, $0, -0x1
/* 0FD33C 001FD23C DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FD340 001FD240 78EA23A0 */  sb          $3, %lo(WepMenu + 0x8)($1)
/* 0FD344 001FD244 00010010 */  b           .L001FD648$b
/* 0FD348 001FD248 00000000 */   nop
jlabel .L001FD24C
.L001FD24C$b:
/* 0FD34C 001FD24C CC01023C */  lui         $2, %hi(GamePad)
/* 0FD350 001FD250 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD354 001FD254 60000524 */  addiu       $5, $0, 0x60
/* 0FD358 001FD258 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD35C 001FD25C 00000000 */   nop
/* 0FD360 001FD260 F9004010 */  beqz        $2, .L001FD648$b
/* 0FD364 001FD264 00000000 */   nop
/* 0FD368 001FD268 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD36C 001FD26C 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD370 001FD270 F5000010 */  b           .L001FD648$b
/* 0FD374 001FD274 00000000 */   nop
jlabel .L001FD278
.L001FD278$b:
/* 0FD378 001FD278 CC01023C */  lui         $2, %hi(GamePad)
/* 0FD37C 001FD27C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD380 001FD280 40000524 */  addiu       $5, $0, 0x40
/* 0FD384 001FD284 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD388 001FD288 00000000 */   nop
/* 0FD38C 001FD28C 2A004010 */  beqz        $2, .L001FD338
/* 0FD390 001FD290 00000000 */   nop
/* 0FD394 001FD294 C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FD398 001FD298 00000000 */   nop
/* 0FD39C 001FD29C 28864070 */  paddub      $16, $2, $0
/* 0FD3A0 001FD2A0 00004484 */  lh          $4, 0x0($2)
/* 0FD3A4 001FD2A4 70CF070C */  jal         IsDefaultWeapon__Fi
/* 0FD3A8 001FD2A8 00000000 */   nop
/* 0FD3AC 001FD2AC 2A084000 */  slt         $1, $2, $0
/* 0FD3B0 001FD2B0 09002014 */  bnez        $1, .L001FD2D8
/* 0FD3B4 001FD2B4 00000000 */   nop
/* 0FD3B8 001FD2B8 02000424 */  addiu       $4, $0, 0x2
/* 0FD3BC 001FD2BC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD3C0 001FD2C0 00000000 */   nop
/* 0FD3C4 001FD2C4 0E000324 */  addiu       $3, $0, 0xE
/* 0FD3C8 001FD2C8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD3CC 001FD2CC 7CEA23A4 */  sh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD3D0 001FD2D0 25000010 */  b           .L001FD368
/* 0FD3D4 001FD2D4 00000000 */   nop
.L001FD2D8:
/* 0FD3D8 001FD2D8 00000386 */  lh          $3, 0x0($16)
/* 0FD3DC 001FD2DC 0C010224 */  addiu       $2, $0, 0x10C
/* 0FD3E0 001FD2E0 0D006214 */  bne         $3, $2, .L001FD318
/* 0FD3E4 001FD2E4 00000000 */   nop
/* 0FD3E8 001FD2E8 E02F080C */  jal         GetMenuHebikiriFlag__Fv
/* 0FD3EC 001FD2EC 00000000 */   nop
/* 0FD3F0 001FD2F0 09004014 */  bnez        $2, .L001FD318
/* 0FD3F4 001FD2F4 00000000 */   nop
/* 0FD3F8 001FD2F8 0E000224 */  addiu       $2, $0, 0xE
/* 0FD3FC 001FD2FC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD400 001FD300 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FD404 001FD304 02000424 */  addiu       $4, $0, 0x2
/* 0FD408 001FD308 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD40C 001FD30C 00000000 */   nop
/* 0FD410 001FD310 15000010 */  b           .L001FD368
/* 0FD414 001FD314 00000000 */   nop
.L001FD318:
/* 0FD418 001FD318 0D000224 */  addiu       $2, $0, 0xD
/* 0FD41C 001FD31C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD420 001FD320 7CEA22A4 */  sh          $2, %lo(WepMenu + 0xC)($1)
/* 0FD424 001FD324 01000424 */  addiu       $4, $0, 0x1
/* 0FD428 001FD328 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD42C 001FD32C 00000000 */   nop
/* 0FD430 001FD330 0D000010 */  b           .L001FD368
/* 0FD434 001FD334 00000000 */   nop
.L001FD338:
/* 0FD438 001FD338 CC01023C */  lui         $2, %hi(GamePad)
/* 0FD43C 001FD33C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD440 001FD340 20800534 */  ori         $5, $0, 0x8020
/* 0FD444 001FD344 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD448 001FD348 00000000 */   nop
/* 0FD44C 001FD34C 06004010 */  beqz        $2, .L001FD368
/* 0FD450 001FD350 00000000 */   nop
/* 0FD454 001FD354 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD458 001FD358 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD45C 001FD35C 28260070 */  paddub      $4, $0, $0
/* 0FD460 001FD360 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD464 001FD364 00000000 */   nop
.L001FD368:
/* 0FD468 001FD368 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD46C 001FD36C 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD470 001FD370 B5006014 */  bnez        $3, .L001FD648$b
/* 0FD474 001FD374 00000000 */   nop
/* 0FD478 001FD378 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD47C 001FD37C 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FD480 001FD380 B1000010 */  b           .L001FD648$b
/* 0FD484 001FD384 00000000 */   nop
jlabel .L001FD388
.L001FD388$b:
/* 0FD488 001FD388 CC01023C */  lui         $2, %hi(GamePad)
/* 0FD48C 001FD38C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD490 001FD390 00500524 */  addiu       $5, $0, 0x5000
/* 0FD494 001FD394 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD498 001FD398 00000000 */   nop
/* 0FD49C 001FD39C 0F004010 */  beqz        $2, .L001FD3DC
/* 0FD4A0 001FD3A0 00000000 */   nop
/* 0FD4A4 001FD3A4 DA01013C */  lui         $1, %hi(WepMenu + 0x9)
/* 0FD4A8 001FD3A8 79EA2280 */  lb          $2, %lo(WepMenu + 0x9)($1)
/* 0FD4AC 001FD3AC 05004010 */  beqz        $2, .L001FD3C4
/* 0FD4B0 001FD3B0 00000000 */   nop
/* 0FD4B4 001FD3B4 DA01013C */  lui         $1, %hi(WepMenu + 0x9)
/* 0FD4B8 001FD3B8 79EA20A0 */  sb          $0, %lo(WepMenu + 0x9)($1)
/* 0FD4BC 001FD3BC 04000010 */  b           .L001FD3D0
/* 0FD4C0 001FD3C0 00000000 */   nop
.L001FD3C4:
/* 0FD4C4 001FD3C4 01000224 */  addiu       $2, $0, 0x1
/* 0FD4C8 001FD3C8 DA01013C */  lui         $1, %hi(WepMenu + 0x9)
/* 0FD4CC 001FD3CC 79EA22A0 */  sb          $2, %lo(WepMenu + 0x9)($1)
.L001FD3D0:
/* 0FD4D0 001FD3D0 28260070 */  paddub      $4, $0, $0
/* 0FD4D4 001FD3D4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD4D8 001FD3D8 00000000 */   nop
.L001FD3DC:
/* 0FD4DC 001FD3DC CC01023C */  lui         $2, %hi(GamePad)
/* 0FD4E0 001FD3E0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD4E4 001FD3E4 40000524 */  addiu       $5, $0, 0x40
/* 0FD4E8 001FD3E8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD4EC 001FD3EC 00000000 */   nop
/* 0FD4F0 001FD3F0 32004010 */  beqz        $2, .L001FD4BC
/* 0FD4F4 001FD3F4 00000000 */   nop
/* 0FD4F8 001FD3F8 DA01013C */  lui         $1, %hi(WepMenu + 0x9)
/* 0FD4FC 001FD3FC 79EA2280 */  lb          $2, %lo(WepMenu + 0x9)($1)
/* 0FD500 001FD400 27004014 */  bnez        $2, .L001FD4A0
/* 0FD504 001FD404 00000000 */   nop
/* 0FD508 001FD408 C0CF070C */  jal         GetNowSelectWeapon__Fv
/* 0FD50C 001FD40C 00000000 */   nop
/* 0FD510 001FD410 28864070 */  paddub      $16, $2, $0
/* 0FD514 001FD414 00004484 */  lh          $4, 0x0($2)
/* 0FD518 001FD418 70CF070C */  jal         IsDefaultWeapon__Fi
/* 0FD51C 001FD41C 00000000 */   nop
/* 0FD520 001FD420 2A084000 */  slt         $1, $2, $0
/* 0FD524 001FD424 06002014 */  bnez        $1, .L001FD440
/* 0FD528 001FD428 00000000 */   nop
/* 0FD52C 001FD42C 02000424 */  addiu       $4, $0, 0x2
/* 0FD530 001FD430 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD534 001FD434 00000000 */   nop
/* 0FD538 001FD438 2C000010 */  b           .L001FD4EC
/* 0FD53C 001FD43C 00000000 */   nop
.L001FD440:
/* 0FD540 001FD440 28260072 */  paddub      $4, $16, $0
/* 0FD544 001FD444 1CB9080C */  jal         InitHaveWep__FP11WEAPON_HAVE
/* 0FD548 001FD448 00000000 */   nop
/* 0FD54C 001FD44C 01000424 */  addiu       $4, $0, 0x1
/* 0FD550 001FD450 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD554 001FD454 00000000 */   nop
/* 0FD558 001FD458 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD55C 001FD45C 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD560 001FD460 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FD564 001FD464 75EA2480 */  lb          $4, %lo(WepMenu + 0x5)($1)
/* 0FD568 001FD468 D494828F */  lw          $2, -0x6B2C($28)
/* 0FD56C 001FD46C 21108200 */  addu        $2, $4, $2
/* 0FD570 001FD470 40434380 */  lb          $3, 0x4340($2)
/* 0FD574 001FD474 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FD578 001FD478 74EA2280 */  lb          $2, %lo(WepMenu + 0x4)($1)
/* 0FD57C 001FD47C 03004314 */  bne         $2, $3, .L001FD48C
/* 0FD580 001FD480 00000000 */   nop
/* 0FD584 001FD484 EC2F080C */  jal         EquipDefaultWeapon__Fi
/* 0FD588 001FD488 00000000 */   nop
.L001FD48C:
/* 0FD58C 001FD48C 01000424 */  addiu       $4, $0, 0x1
/* 0FD590 001FD490 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD594 001FD494 00000000 */   nop
/* 0FD598 001FD498 14000010 */  b           .L001FD4EC
/* 0FD59C 001FD49C 00000000 */   nop
.L001FD4A0:
/* 0FD5A0 001FD4A0 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD5A4 001FD4A4 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD5A8 001FD4A8 02000424 */  addiu       $4, $0, 0x2
/* 0FD5AC 001FD4AC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD5B0 001FD4B0 00000000 */   nop
/* 0FD5B4 001FD4B4 0D000010 */  b           .L001FD4EC
/* 0FD5B8 001FD4B8 00000000 */   nop
.L001FD4BC:
/* 0FD5BC 001FD4BC CC01023C */  lui         $2, %hi(GamePad)
/* 0FD5C0 001FD4C0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FD5C4 001FD4C4 20800534 */  ori         $5, $0, 0x8020
/* 0FD5C8 001FD4C8 1CAE040C */  jal         Down__8CGamePadFi
/* 0FD5CC 001FD4CC 00000000 */   nop
/* 0FD5D0 001FD4D0 06004010 */  beqz        $2, .L001FD4EC
/* 0FD5D4 001FD4D4 00000000 */   nop
/* 0FD5D8 001FD4D8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD5DC 001FD4DC 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
/* 0FD5E0 001FD4E0 28260070 */  paddub      $4, $0, $0
/* 0FD5E4 001FD4E4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD5E8 001FD4E8 00000000 */   nop
.L001FD4EC:
/* 0FD5EC 001FD4EC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD5F0 001FD4F0 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FD5F4 001FD4F4 54006014 */  bnez        $3, .L001FD648$b
/* 0FD5F8 001FD4F8 00000000 */   nop
/* 0FD5FC 001FD4FC DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD600 001FD500 90EA20AC */  sw          $0, %lo(WepMenu + 0x20)($1)
/* 0FD604 001FD504 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FD608 001FD508 72EA20A4 */  sh          $0, %lo(WepMenu + 0x2)($1)
/* 0FD60C 001FD50C 4E000010 */  b           .L001FD648$b
/* 0FD610 001FD510 00000000 */   nop
jlabel .L001FD514
.L001FD514$b:
/* 0FD614 001FD514 789581C7 */  lwc1        $f1, -0x6A88($28)
/* 0FD618 001FD518 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0FD61C 001FD51C 34080046 */  c.lt.s      $f1, $f0
/* 0FD620 001FD520 00000000 */  nop
/* 0FD624 001FD524 03000145 */  bc1t        .L001FD534$b
/* 0FD628 001FD528 00000000 */   nop
/* 0FD62C 001FD52C DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD630 001FD530 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
jlabel .L001FD534
.L001FD534$b:
/* 0FD634 001FD534 DA01013C */  lui         $1, %hi(WepMenu + 0x10)
/* 0FD638 001FD538 80EA238C */  lw          $3, %lo(WepMenu + 0x10)($1)
/* 0FD63C 001FD53C 1A006328 */  slti        $3, $3, 0x1A
/* 0FD640 001FD540 03006014 */  bnez        $3, .L001FD550$b
/* 0FD644 001FD544 00000000 */   nop
/* 0FD648 001FD548 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD64C 001FD54C 7CEA20A4 */  sh          $0, %lo(WepMenu + 0xC)($1)
jlabel .L001FD550
.L001FD550$b:
/* 0FD650 001FD550 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FD654 001FD554 74EA3080 */  lb          $16, %lo(WepMenu + 0x4)($1)
/* 0FD658 001FD558 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD65C 001FD55C 90EA318C */  lw          $17, %lo(WepMenu + 0x20)($1)
/* 0FD660 001FD560 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FD664 001FD564 72EA3484 */  lh          $20, %lo(WepMenu + 0x2)($1)
/* 0FD668 001FD568 DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FD66C 001FD56C 75EA3280 */  lb          $18, %lo(WepMenu + 0x5)($1)
/* 0FD670 001FD570 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FD674 001FD574 77EA3380 */  lb          $19, %lo(WepMenu + 0x7)($1)
/* 0FD678 001FD578 0C00812E */  sltiu       $1, $20, 0xC
/* 0FD67C 001FD57C 1B002010 */  beqz        $1, .L001FD5EC
/* 0FD680 001FD580 00000000 */   nop
/* 0FD684 001FD584 2A00033C */  lui         $3, %hi(LIT_2807__2)
/* 0FD688 001FD588 30D96424 */  addiu       $4, $3, %lo(LIT_2807__2)
/* 0FD68C 001FD58C 80181400 */  sll         $3, $20, 2
/* 0FD690 001FD590 21186400 */  addu        $3, $3, $4
/* 0FD694 001FD594 0000638C */  lw          $3, 0x0($3)
/* 0FD698 001FD598 08006000 */  jr          $3
/* 0FD69C 001FD59C 00000000 */   nop
jlabel .L001FD5A0
.L001FD5A0$b:
/* 0FD6A0 001FD5A0 1834080C */  jal         GetMenuCharaEffectReadFlag__Fv
/* 0FD6A4 001FD5A4 00000000 */   nop
/* 0FD6A8 001FD5A8 0A004010 */  beqz        $2, .L001FD5D4
/* 0FD6AC 001FD5AC 00000000 */   nop
/* 0FD6B0 001FD5B0 8CFB040C */  jal         ReadBGSync__Fv
/* 0FD6B4 001FD5B4 00000000 */   nop
/* 0FD6B8 001FD5B8 0C004014 */  bnez        $2, .L001FD5EC
/* 0FD6BC 001FD5BC 00000000 */   nop
/* 0FD6C0 001FD5C0 28260070 */  paddub      $4, $0, $0
/* 0FD6C4 001FD5C4 1434080C */  jal         SetMenuCharaEffectReadFlag__Fi
/* 0FD6C8 001FD5C8 00000000 */   nop
/* 0FD6CC 001FD5CC 07000010 */  b           .L001FD5EC
/* 0FD6D0 001FD5D0 00000000 */   nop
.L001FD5D4:
/* 0FD6D4 001FD5D4 C8F7070C */  jal         WeaponSelectKey__Fv
/* 0FD6D8 001FD5D8 00000000 */   nop
/* 0FD6DC 001FD5DC 03000010 */  b           .L001FD5EC
/* 0FD6E0 001FD5E0 00000000 */   nop
jlabel .L001FD5E4
.L001FD5E4$b:
/* 0FD6E4 001FD5E4 14FE070C */  jal         WeaponMenuAttachModeKey__Fv
/* 0FD6E8 001FD5E8 00000000 */   nop
.L001FD5EC:
/* 0FD6EC 001FD5EC DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FD6F0 001FD5F0 74EA2380 */  lb          $3, %lo(WepMenu + 0x4)($1)
/* 0FD6F4 001FD5F4 11000316 */  bne         $16, $3, .L001FD63C
/* 0FD6F8 001FD5F8 00000000 */   nop
/* 0FD6FC 001FD5FC DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FD700 001FD600 72EA2384 */  lh          $3, %lo(WepMenu + 0x2)($1)
/* 0FD704 001FD604 05008316 */  bne         $20, $3, .L001FD61C
/* 0FD708 001FD608 00000000 */   nop
/* 0FD70C 001FD60C DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD710 001FD610 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FD714 001FD614 09002316 */  bne         $17, $3, .L001FD63C
/* 0FD718 001FD618 00000000 */   nop
.L001FD61C:
/* 0FD71C 001FD61C DA01013C */  lui         $1, %hi(WepMenu + 0x5)
/* 0FD720 001FD620 75EA2380 */  lb          $3, %lo(WepMenu + 0x5)($1)
/* 0FD724 001FD624 05004316 */  bne         $18, $3, .L001FD63C
/* 0FD728 001FD628 00000000 */   nop
/* 0FD72C 001FD62C DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FD730 001FD630 77EA2380 */  lb          $3, %lo(WepMenu + 0x7)($1)
/* 0FD734 001FD634 04006312 */  beq         $19, $3, .L001FD648$b
/* 0FD738 001FD638 00000000 */   nop
.L001FD63C:
/* 0FD73C 001FD63C 28260070 */  paddub      $4, $0, $0
/* 0FD740 001FD640 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FD744 001FD644 00000000 */   nop
jlabel .L001FD648
.L001FD648$b:
/* 0FD748 001FD648 28860070 */  paddub      $16, $0, $0
/* 0FD74C 001FD64C FFFF1224 */  addiu       $18, $0, -0x1
/* 0FD750 001FD650 0DFE0624 */  addiu       $6, $0, -0x1F3
/* 0FD754 001FD654 289E0070 */  paddub      $19, $0, $0
/* 0FD758 001FD658 D494838F */  lw          $3, -0x6B2C($28)
/* 0FD75C 001FD65C 04057524 */  addiu       $21, $3, 0x504
/* 0FD760 001FD660 F87FB526 */  addiu       $21, $21, 0x7FF8
/* 0FD764 001FD664 DA01013C */  lui         $1, %hi(WepMenu + 0x4)
/* 0FD768 001FD668 74EA2480 */  lb          $4, %lo(WepMenu + 0x4)($1)
/* 0FD76C 001FD66C 40190400 */  sll         $3, $4, 5
/* 0FD770 001FD670 23186400 */  subu        $3, $3, $4
/* 0FD774 001FD674 C0200300 */  sll         $4, $3, 3
/* 0FD778 001FD678 1495838F */  lw          $3, -0x6AEC($28)
/* 0FD77C 001FD67C 21A06400 */  addu        $20, $3, $4
/* 0FD780 001FD680 05008012 */  beqz        $20, .L001FD698
/* 0FD784 001FD684 00000000 */   nop
/* 0FD788 001FD688 00008486 */  lh          $4, 0x0($20)
/* 0FD78C 001FD68C 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0FD790 001FD690 00000000 */   nop
/* 0FD794 001FD694 28364070 */  paddub      $6, $2, $0
.L001FD698:
/* 0FD798 001FD698 2900033C */  lui         $3, %hi(LIT_2612__2)
/* 0FD79C 001FD69C C0326324 */  addiu       $3, $3, %lo(LIT_2612__2)
/* 0FD7A0 001FD6A0 A000A527 */  addiu       $5, $29, 0xA0
/* 0FD7A4 001FD6A4 00006478 */  lq          $4, 0x0($3)
/* 0FD7A8 001FD6A8 100063DC */  ld          $3, 0x10($3)
/* 0FD7AC 001FD6AC 0000A47C */  sq          $4, 0x0($5)
/* 0FD7B0 001FD6B0 1000A3FC */  sd          $3, 0x10($5)
/* 0FD7B4 001FD6B4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD7B8 001FD6B8 90EA2384 */  lh          $3, %lo(WepMenu + 0x20)($1)
/* 0FD7BC 001FD6BC 68006324 */  addiu       $3, $3, 0x68
/* 0FD7C0 001FD6C0 A200A3A7 */  sh          $3, 0xA2($29)
/* 0FD7C4 001FD6C4 DA01013C */  lui         $1, %hi(WepMenu + 0x7)
/* 0FD7C8 001FD6C8 77EA2380 */  lb          $3, %lo(WepMenu + 0x7)($1)
/* 0FD7CC 001FD6CC 82006424 */  addiu       $4, $3, 0x82
/* 0FD7D0 001FD6D0 A400A4A7 */  sh          $4, 0xA4($29)
/* 0FD7D4 001FD6D4 F401C424 */  addiu       $4, $6, 0x1F4
/* 0FD7D8 001FD6D8 A600A4A7 */  sh          $4, 0xA6($29)
/* 0FD7DC 001FD6DC A800A4A7 */  sh          $4, 0xA8($29)
/* 0FD7E0 001FD6E0 AA00A4A7 */  sh          $4, 0xAA($29)
/* 0FD7E4 001FD6E4 AC00A4A7 */  sh          $4, 0xAC($29)
/* 0FD7E8 001FD6E8 DA01013C */  lui         $1, %hi(WepMenu + 0x178)
/* 0FD7EC 001FD6EC E8EB2480 */  lb          $4, %lo(WepMenu + 0x178)($1)
/* 0FD7F0 001FD6F0 02008624 */  addiu       $6, $4, 0x2
/* 0FD7F4 001FD6F4 80280600 */  sll         $5, $6, 2
/* 0FD7F8 001FD6F8 2128A600 */  addu        $5, $5, $6
/* 0FD7FC 001FD6FC 40280500 */  sll         $5, $5, 1
/* 0FD800 001FD700 6400A624 */  addiu       $6, $5, 0x64
/* 0FD804 001FD704 DA01013C */  lui         $1, %hi(WepMenu + 0x179)
/* 0FD808 001FD708 E9EB2580 */  lb          $5, %lo(WepMenu + 0x179)($1)
/* 0FD80C 001FD70C 2130A600 */  addu        $6, $5, $6
/* 0FD810 001FD710 B600A6A7 */  sh          $6, 0xB6($29)
/* 0FD814 001FD714 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FD818 001FD718 72EA2A84 */  lh          $10, %lo(WepMenu + 0x2)($1)
/* 0FD81C 001FD71C 40300A00 */  sll         $6, $10, 1
/* 0FD820 001FD720 2148DD00 */  addu        $9, $6, $29
/* 0FD824 001FD724 A0003185 */  lh          $17, 0xA0($9)
/* 0FD828 001FD728 03004629 */  slti        $6, $10, 0x3
/* 0FD82C 001FD72C 1400C014 */  bnez        $6, .L001FD780
/* 0FD830 001FD730 00000000 */   nop
/* 0FD834 001FD734 08004129 */  slti        $1, $10, 0x8
/* 0FD838 001FD738 11002010 */  beqz        $1, .L001FD780
/* 0FD83C 001FD73C 00000000 */   nop
/* 0FD840 001FD740 2900063C */  lui         $6, %hi(LIT_2616)
/* 0FD844 001FD744 D832C624 */  addiu       $6, $6, %lo(LIT_2616)
/* 0FD848 001FD748 D800A827 */  addiu       $8, $29, 0xD8
/* 0FD84C 001FD74C 0000C7DC */  ld          $7, 0x0($6)
/* 0FD850 001FD750 0800C684 */  lh          $6, 0x8($6)
/* 0FD854 001FD754 000007FD */  sd          $7, 0x0($8)
/* 0FD858 001FD758 080006A5 */  sh          $6, 0x8($8)
/* 0FD85C 001FD75C D2003085 */  lh          $16, 0xD2($9)
/* 0FD860 001FD760 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1302)
/* 0FD864 001FD764 E2BB2784 */  lh          $7, %lo(MenuWepLevelUp + 0x1302)($1)
/* 0FD868 001FD768 FFFF0624 */  addiu       $6, $0, -0x1
/* 0FD86C 001FD76C 0400E610 */  beq         $7, $6, .L001FD780
/* 0FD870 001FD770 00000000 */   nop
/* 0FD874 001FD774 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0FD878 001FD778 4C22308C */  lw          $16, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0FD87C 001FD77C 00000000 */  nop
.L001FD780:
/* 0FD880 001FD780 0C00412D */  sltiu       $1, $10, 0xC
/* 0FD884 001FD784 D1002010 */  beqz        $1, .L001FDACC$b
/* 0FD888 001FD788 00000000 */   nop
/* 0FD88C 001FD78C 2A00063C */  lui         $6, %hi(LIT_2808__2)
/* 0FD890 001FD790 00D9C724 */  addiu       $7, $6, %lo(LIT_2808__2)
/* 0FD894 001FD794 80300A00 */  sll         $6, $10, 2
/* 0FD898 001FD798 2130C700 */  addu        $6, $6, $7
/* 0FD89C 001FD79C 0000C68C */  lw          $6, 0x0($6)
/* 0FD8A0 001FD7A0 0800C000 */  jr          $6
/* 0FD8A4 001FD7A4 00000000 */   nop
jlabel .L001FD7A8
.L001FD7A8$b:
/* 0FD8A8 001FD7A8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FD8AC 001FD7AC 7CEA2484 */  lh          $4, %lo(WepMenu + 0xC)($1)
/* 0FD8B0 001FD7B0 0E000324 */  addiu       $3, $0, 0xE
/* 0FD8B4 001FD7B4 09008310 */  beq         $4, $3, .L001FD7DC
/* 0FD8B8 001FD7B8 00000000 */   nop
/* 0FD8BC 001FD7BC 0D000324 */  addiu       $3, $0, 0xD
/* 0FD8C0 001FD7C0 06008310 */  beq         $4, $3, .L001FD7DC
/* 0FD8C4 001FD7C4 00000000 */   nop
/* 0FD8C8 001FD7C8 0C000324 */  addiu       $3, $0, 0xC
/* 0FD8CC 001FD7CC 03008310 */  beq         $4, $3, .L001FD7DC
/* 0FD8D0 001FD7D0 00000000 */   nop
/* 0FD8D4 001FD7D4 BD000010 */  b           .L001FDACC$b
/* 0FD8D8 001FD7D8 00000000 */   nop
.L001FD7DC:
/* 0FD8DC 001FD7DC A4001124 */  addiu       $17, $0, 0xA4
/* 0FD8E0 001FD7E0 BA000010 */  b           .L001FDACC$b
/* 0FD8E4 001FD7E4 00000000 */   nop
jlabel .L001FD7E8
.L001FD7E8$b:
/* 0FD8E8 001FD7E8 9000A427 */  addiu       $4, $29, 0x90
/* 0FD8EC 001FD7EC 282E8072 */  paddub      $5, $20, $0
/* 0FD8F0 001FD7F0 20D5080C */  jal         EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* 0FD8F4 001FD7F4 00000000 */   nop
/* 0FD8F8 001FD7F8 28AE0070 */  paddub      $21, $0, $0
/* 0FD8FC 001FD7FC 11000010 */  b           .L001FD844
/* 0FD900 001FD800 00000000 */   nop
.L001FD804:
/* 0FD904 001FD804 7443070C */  jal         GetCommonItemInfo__Fi
/* 0FD908 001FD808 00000000 */   nop
/* 0FD90C 001FD80C 09004010 */  beqz        $2, .L001FD834
/* 0FD910 001FD810 00000000 */   nop
/* 0FD914 001FD814 06004384 */  lh          $3, 0x6($2)
/* 0FD918 001FD818 0000C3A6 */  sh          $3, 0x0($22)
/* 0FD91C 001FD81C 2118FD02 */  addu        $3, $23, $29
/* 0FD920 001FD820 92006384 */  lh          $3, 0x92($3)
/* 0FD924 001FD824 03006014 */  bnez        $3, .L001FD834
/* 0FD928 001FD828 00000000 */   nop
/* 0FD92C 001FD82C 02000324 */  addiu       $3, $0, 0x2
/* 0FD930 001FD830 0000C3A6 */  sh          $3, 0x0($22)
.L001FD834:
/* 0FD934 001FD834 0100B526 */  addiu       $21, $21, 0x1
/* 0FD938 001FD838 0500A12A */  slti        $1, $21, 0x5
/* 0FD93C 001FD83C 08002010 */  beqz        $1, .L001FD860
/* 0FD940 001FD840 00000000 */   nop
.L001FD844:
/* 0FD944 001FD844 80B81500 */  sll         $23, $21, 2
/* 0FD948 001FD848 2118FD02 */  addu        $3, $23, $29
/* 0FD94C 001FD84C 90007624 */  addiu       $22, $3, 0x90
/* 0FD950 001FD850 0000C486 */  lh          $4, 0x0($22)
/* 0FD954 001FD854 FFFF0324 */  addiu       $3, $0, -0x1
/* 0FD958 001FD858 EAFF8314 */  bne         $4, $3, .L001FD804
/* 0FD95C 001FD85C 00000000 */   nop
.L001FD860:
/* 0FD960 001FD860 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FD964 001FD864 72EA2484 */  lh          $4, %lo(WepMenu + 0x2)($1)
/* 0FD968 001FD868 05000324 */  addiu       $3, $0, 0x5
/* 0FD96C 001FD86C 97008314 */  bne         $4, $3, .L001FDACC$b
/* 0FD970 001FD870 00000000 */   nop
/* 0FD974 001FD874 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD978 001FD878 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FD97C 001FD87C 80180300 */  sll         $3, $3, 2
/* 0FD980 001FD880 21187D00 */  addu        $3, $3, $29
/* 0FD984 001FD884 92006484 */  lh          $4, 0x92($3)
/* 0FD988 001FD888 04008010 */  beqz        $4, .L001FD89C
/* 0FD98C 001FD88C 00000000 */   nop
/* 0FD990 001FD890 AE001124 */  addiu       $17, $0, 0xAE
/* 0FD994 001FD894 90007284 */  lh          $18, 0x90($3)
/* 0FD998 001FD898 00000000 */  nop
.L001FD89C:
/* 0FD99C 001FD89C 3C1C0400 */  dsll32      $3, $4, 16
/* 0FD9A0 001FD8A0 3F1C0300 */  dsra32      $3, $3, 16
/* 0FD9A4 001FD8A4 89006014 */  bnez        $3, .L001FDACC$b
/* 0FD9A8 001FD8A8 00000000 */   nop
/* 0FD9AC 001FD8AC AD001124 */  addiu       $17, $0, 0xAD
/* 0FD9B0 001FD8B0 86000010 */  b           .L001FDACC$b
/* 0FD9B4 001FD8B4 00000000 */   nop
jlabel .L001FD8B8
.L001FD8B8$b:
/* 0FD9B8 001FD8B8 00008486 */  lh          $4, 0x0($20)
/* 0FD9BC 001FD8BC 01018328 */  slti        $3, $4, 0x101
/* 0FD9C0 001FD8C0 82006014 */  bnez        $3, .L001FDACC$b
/* 0FD9C4 001FD8C4 00000000 */   nop
/* 0FD9C8 001FD8C8 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0FD9CC 001FD8CC 00000000 */   nop
/* 0FD9D0 001FD8D0 F4015124 */  addiu       $17, $2, 0x1F4
/* 0FD9D4 001FD8D4 02009386 */  lh          $19, 0x2($20)
/* 0FD9D8 001FD8D8 7C000010 */  b           .L001FDACC$b
/* 0FD9DC 001FD8DC 00000000 */   nop
jlabel .L001FD8E0
.L001FD8E0$b:
/* 0FD9E0 001FD8E0 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FD9E4 001FD8E4 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FD9E8 001FD8E8 40110200 */  sll         $2, $2, 5
/* 0FD9EC 001FD8EC 21185400 */  addu        $3, $2, $20
/* 0FD9F0 001FD8F0 28007584 */  lh          $21, 0x28($3)
/* 0FD9F4 001FD8F4 5100A22A */  slti        $2, $21, 0x51
/* 0FD9F8 001FD8F8 13004014 */  bnez        $2, .L001FD948
/* 0FD9FC 001FD8FC 00000000 */   nop
/* 0FDA00 001FD900 F401B126 */  addiu       $17, $21, 0x1F4
/* 0FDA04 001FD904 28006424 */  addiu       $4, $3, 0x28
/* 0FDA08 001FD908 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0FDA0C 001FD90C 00000000 */   nop
/* 0FDA10 001FD910 289E4070 */  paddub      $19, $2, $0
/* 0FDA14 001FD914 5A000324 */  addiu       $3, $0, 0x5A
/* 0FDA18 001FD918 6C00A316 */  bne         $21, $3, .L001FDACC$b
/* 0FDA1C 001FD91C 00000000 */   nop
/* 0FDA20 001FD920 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FDA24 001FD924 90EA228C */  lw          $2, %lo(WepMenu + 0x20)($1)
/* 0FDA28 001FD928 40110200 */  sll         $2, $2, 5
/* 0FDA2C 001FD92C 21105400 */  addu        $2, $2, $20
/* 0FDA30 001FD930 2A004484 */  lh          $4, 0x2A($2)
/* 0FDA34 001FD934 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0FDA38 001FD938 00000000 */   nop
/* 0FDA3C 001FD93C 28964070 */  paddub      $18, $2, $0
/* 0FDA40 001FD940 62000010 */  b           .L001FDACC$b
/* 0FDA44 001FD944 00000000 */   nop
.L001FD948:
/* 0FDA48 001FD948 00008486 */  lh          $4, 0x0($20)
/* 0FDA4C 001FD94C D443070C */  jal         GetWeaponData__Fi
/* 0FDA50 001FD950 00000000 */   nop
/* 0FDA54 001FD954 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FDA58 001FD958 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FDA5C 001FD95C 21186200 */  addu        $3, $3, $2
/* 0FDA60 001FD960 0B006480 */  lb          $4, 0xB($3)
/* 0FDA64 001FD964 02000324 */  addiu       $3, $0, 0x2
/* 0FDA68 001FD968 04008314 */  bne         $4, $3, .L001FD97C
/* 0FDA6C 001FD96C 00000000 */   nop
/* 0FDA70 001FD970 70001124 */  addiu       $17, $0, 0x70
/* 0FDA74 001FD974 55000010 */  b           .L001FDACC$b
/* 0FDA78 001FD978 00000000 */   nop
.L001FD97C:
/* 0FDA7C 001FD97C 71001124 */  addiu       $17, $0, 0x71
/* 0FDA80 001FD980 52000010 */  b           .L001FDACC$b
/* 0FDA84 001FD984 00000000 */   nop
jlabel .L001FD988
.L001FD988$b:
/* 0FDA88 001FD988 16008482 */  lb          $4, 0x16($20)
/* 0FDA8C 001FD98C 3C1E0300 */  dsll32      $3, $3, 24
/* 0FDA90 001FD990 3F1E0300 */  dsra32      $3, $3, 24
/* 0FDA94 001FD994 4D008314 */  bne         $4, $3, .L001FDACC$b
/* 0FDA98 001FD998 00000000 */   nop
/* 0FDA9C 001FD99C 15003126 */  addiu       $17, $17, 0x15
/* 0FDAA0 001FD9A0 4A000010 */  b           .L001FDACC$b
/* 0FDAA4 001FD9A4 00000000 */   nop
jlabel .L001FD9A8
.L001FD9A8$b:
/* 0FDAA8 001FD9A8 3C260400 */  dsll32      $4, $4, 24
/* 0FDAAC 001FD9AC 3F260400 */  dsra32      $4, $4, 24
/* 0FDAB0 001FD9B0 01000324 */  addiu       $3, $0, 0x1
/* 0FDAB4 001FD9B4 45008314 */  bne         $4, $3, .L001FDACC$b
/* 0FDAB8 001FD9B8 00000000 */   nop
/* 0FDABC 001FD9BC 16008482 */  lb          $4, 0x16($20)
/* 0FDAC0 001FD9C0 3C1E0500 */  dsll32      $3, $5, 24
/* 0FDAC4 001FD9C4 3F1E0300 */  dsra32      $3, $3, 24
/* 0FDAC8 001FD9C8 40008314 */  bne         $4, $3, .L001FDACC$b
/* 0FDACC 001FD9CC 00000000 */   nop
/* 0FDAD0 001FD9D0 15003126 */  addiu       $17, $17, 0x15
/* 0FDAD4 001FD9D4 3D000010 */  b           .L001FDACC$b
/* 0FDAD8 001FD9D8 00000000 */   nop
jlabel .L001FD9DC
.L001FD9DC$b:
/* 0FDADC 001FD9DC DA01013C */  lui         $1, %hi(WepMenu + 0x1C)
/* 0FDAE0 001FD9E0 8CEA248C */  lw          $4, %lo(WepMenu + 0x1C)($1)
/* 0FDAE4 001FD9E4 02000324 */  addiu       $3, $0, 0x2
/* 0FDAE8 001FD9E8 37008310 */  beq         $4, $3, .L001FDAC8
/* 0FDAEC 001FD9EC 00000000 */   nop
/* 0FDAF0 001FD9F0 01000324 */  addiu       $3, $0, 0x1
/* 0FDAF4 001FD9F4 03008310 */  beq         $4, $3, .L001FDA04
/* 0FDAF8 001FD9F8 00000000 */   nop
/* 0FDAFC 001FD9FC 33000010 */  b           .L001FDACC$b
/* 0FDB00 001FDA00 00000000 */   nop
.L001FDA04:
/* 0FDB04 001FDA04 7495838F */  lw          $3, -0x6A8C($28)
/* 0FDB08 001FDA08 10006484 */  lh          $4, 0x10($3)
/* 0FDB0C 001FDA0C 51008328 */  slti        $3, $4, 0x51
/* 0FDB10 001FDA10 13006014 */  bnez        $3, .L001FDA60
/* 0FDB14 001FDA14 00000000 */   nop
/* 0FDB18 001FDA18 F4019124 */  addiu       $17, $4, 0x1F4
/* 0FDB1C 001FDA1C DA01023C */  lui         $2, %hi(WepMenu + 0x150)
/* 0FDB20 001FDA20 C0EB4424 */  addiu       $4, $2, %lo(WepMenu + 0x150)
/* 0FDB24 001FDA24 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0FDB28 001FDA28 00000000 */   nop
/* 0FDB2C 001FDA2C 289E4070 */  paddub      $19, $2, $0
/* 0FDB30 001FDA30 7495838F */  lw          $3, -0x6A8C($28)
/* 0FDB34 001FDA34 10006484 */  lh          $4, 0x10($3)
/* 0FDB38 001FDA38 5A000324 */  addiu       $3, $0, 0x5A
/* 0FDB3C 001FDA3C 23008314 */  bne         $4, $3, .L001FDACC$b
/* 0FDB40 001FDA40 00000000 */   nop
/* 0FDB44 001FDA44 DA01013C */  lui         $1, %hi(WepMenu + 0x152)
/* 0FDB48 001FDA48 C2EB2484 */  lh          $4, %lo(WepMenu + 0x152)($1)
/* 0FDB4C 001FDA4C 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0FDB50 001FDA50 00000000 */   nop
/* 0FDB54 001FDA54 28964070 */  paddub      $18, $2, $0
/* 0FDB58 001FDA58 1C000010 */  b           .L001FDACC$b
/* 0FDB5C 001FDA5C 00000000 */   nop
.L001FDA60:
/* 0FDB60 001FDA60 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FDB64 001FDA64 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FDB68 001FDA68 40190300 */  sll         $3, $3, 5
/* 0FDB6C 001FDA6C 2120A302 */  addu        $4, $21, $3
/* 0FDB70 001FDA70 00008584 */  lh          $5, 0x0($4)
/* 0FDB74 001FDA74 5100A328 */  slti        $3, $5, 0x51
/* 0FDB78 001FDA78 14006014 */  bnez        $3, .L001FDACC$b
/* 0FDB7C 001FDA7C 00000000 */   nop
/* 0FDB80 001FDA80 F401B124 */  addiu       $17, $5, 0x1F4
/* 0FDB84 001FDA84 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0FDB88 001FDA88 00000000 */   nop
/* 0FDB8C 001FDA8C 289E4070 */  paddub      $19, $2, $0
/* 0FDB90 001FDA90 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FDB94 001FDA94 90EA238C */  lw          $3, %lo(WepMenu + 0x20)($1)
/* 0FDB98 001FDA98 40190300 */  sll         $3, $3, 5
/* 0FDB9C 001FDA9C 2128A302 */  addu        $5, $21, $3
/* 0FDBA0 001FDAA0 0000A484 */  lh          $4, 0x0($5)
/* 0FDBA4 001FDAA4 5A000324 */  addiu       $3, $0, 0x5A
/* 0FDBA8 001FDAA8 08008314 */  bne         $4, $3, .L001FDACC$b
/* 0FDBAC 001FDAAC 00000000 */   nop
/* 0FDBB0 001FDAB0 0200A484 */  lh          $4, 0x2($5)
/* 0FDBB4 001FDAB4 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0FDBB8 001FDAB8 00000000 */   nop
/* 0FDBBC 001FDABC 28964070 */  paddub      $18, $2, $0
/* 0FDBC0 001FDAC0 02000010 */  b           .L001FDACC$b
/* 0FDBC4 001FDAC4 00000000 */   nop
.L001FDAC8:
/* 0FDBC8 001FDAC8 BE001124 */  addiu       $17, $0, 0xBE
jlabel .L001FDACC
.L001FDACC$b:
/* 0FDBCC 001FDACC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FDBD0 001FDAD0 7CEA2684 */  lh          $6, %lo(WepMenu + 0xC)($1)
/* 0FDBD4 001FDAD4 0B000324 */  addiu       $3, $0, 0xB
/* 0FDBD8 001FDAD8 0E00C314 */  bne         $6, $3, .L001FDB14
/* 0FDBDC 001FDADC 00000000 */   nop
/* 0FDBE0 001FDAE0 2900033C */  lui         $3, %hi(LIT_2679)
/* 0FDBE4 001FDAE4 F0326324 */  addiu       $3, $3, %lo(LIT_2679)
/* 0FDBE8 001FDAE8 C000A527 */  addiu       $5, $29, 0xC0
/* 0FDBEC 001FDAEC 00006478 */  lq          $4, 0x0($3)
/* 0FDBF0 001FDAF0 100063C4 */  lwc1        $f3, 0x10($3)
/* 0FDBF4 001FDAF4 0000A47C */  sq          $4, 0x0($5)
/* 0FDBF8 001FDAF8 1000A3E4 */  swc1        $f3, 0x10($5)
/* 0FDBFC 001FDAFC DA01013C */  lui         $1, %hi(WepMenu + 0x8)
/* 0FDC00 001FDB00 78EA2380 */  lb          $3, %lo(WepMenu + 0x8)($1)
/* 0FDC04 001FDB04 40180300 */  sll         $3, $3, 1
/* 0FDC08 001FDB08 21187D00 */  addu        $3, $3, $29
/* 0FDC0C 001FDB0C C0007084 */  lh          $16, 0xC0($3)
/* 0FDC10 001FDB10 00000000 */  nop
.L001FDB14:
/* 0FDC14 001FDB14 0D000324 */  addiu       $3, $0, 0xD
/* 0FDC18 001FDB18 0200C314 */  bne         $6, $3, .L001FDB24
/* 0FDC1C 001FDB1C 00000000 */   nop
/* 0FDC20 001FDB20 A5001024 */  addiu       $16, $0, 0xA5
.L001FDB24:
/* 0FDC24 001FDB24 0E000324 */  addiu       $3, $0, 0xE
/* 0FDC28 001FDB28 0B00C314 */  bne         $6, $3, .L001FDB58
/* 0FDC2C 001FDB2C 00000000 */   nop
/* 0FDC30 001FDB30 A6001024 */  addiu       $16, $0, 0xA6
/* 0FDC34 001FDB34 00008486 */  lh          $4, 0x0($20)
/* 0FDC38 001FDB38 0C010324 */  addiu       $3, $0, 0x10C
/* 0FDC3C 001FDB3C 06008314 */  bne         $4, $3, .L001FDB58
/* 0FDC40 001FDB40 00000000 */   nop
/* 0FDC44 001FDB44 E02F080C */  jal         GetMenuHebikiriFlag__Fv
/* 0FDC48 001FDB48 00000000 */   nop
/* 0FDC4C 001FDB4C 02004014 */  bnez        $2, .L001FDB58
/* 0FDC50 001FDB50 00000000 */   nop
/* 0FDC54 001FDB54 A7001024 */  addiu       $16, $0, 0xA7
.L001FDB58:
/* 0FDC58 001FDB58 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0FDC5C 001FDB5C 0C3A248C */  lw          $4, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0FDC60 001FDB60 0F009114 */  bne         $4, $17, .L001FDBA0
/* 0FDC64 001FDB64 00000000 */   nop
/* 0FDC68 001FDB68 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0FDC6C 001FDB6C 783A258C */  lw          $5, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0FDC70 001FDB70 0B00B314 */  bne         $5, $19, .L001FDBA0
/* 0FDC74 001FDB74 00000000 */   nop
/* 0FDC78 001FDB78 4E020324 */  addiu       $3, $0, 0x24E
/* 0FDC7C 001FDB7C 1C008314 */  bne         $4, $3, .L001FDBF0
/* 0FDC80 001FDB80 00000000 */   nop
/* 0FDC84 001FDB84 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0FDC88 001FDB88 303A248C */  lw          $4, %lo(CommonMenuMes2 + 0x16E0)($1)
/* 0FDC8C 001FDB8C 64004326 */  addiu       $3, $18, 0x64
/* 0FDC90 001FDB90 03008314 */  bne         $4, $3, .L001FDBA0
/* 0FDC94 001FDB94 00000000 */   nop
/* 0FDC98 001FDB98 1500B310 */  beq         $5, $19, .L001FDBF0
/* 0FDC9C 001FDB9C 00000000 */   nop
.L001FDBA0:
/* 0FDCA0 001FDBA0 01000224 */  addiu       $2, $0, 0x1
/* 0FDCA4 001FDBA4 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x172C)
/* 0FDCA8 001FDBA8 7C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x172C)($1)
/* 0FDCAC 001FDBAC DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1730)
/* 0FDCB0 001FDBB0 803A20AC */  sw          $0, %lo(CommonMenuMes2 + 0x1730)($1)
/* 0FDCB4 001FDBB4 0400401A */  blez        $18, .L001FDBC8
/* 0FDCB8 001FDBB8 00000000 */   nop
/* 0FDCBC 001FDBBC 64004226 */  addiu       $2, $18, 0x64
/* 0FDCC0 001FDBC0 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0FDCC4 001FDBC4 303A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16E0)($1)
.L001FDBC8:
/* 0FDCC8 001FDBC8 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0FDCCC 001FDBCC 783A33AC */  sw          $19, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0FDCD0 001FDBD0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0FDCD4 001FDBD4 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0FDCD8 001FDBD8 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0FDCDC 001FDBDC DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0FDCE0 001FDBE0 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0FDCE4 001FDBE4 282E2072 */  paddub      $5, $17, $0
/* 0FDCE8 001FDBE8 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0FDCEC 001FDBEC 00000000 */   nop
.L001FDBF0:
/* 0FDCF0 001FDBF0 281E0070 */  paddub      $3, $0, $0
/* 0FDCF4 001FDBF4 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FDCF8 001FDBF8 72EA2484 */  lh          $4, %lo(WepMenu + 0x2)($1)
/* 0FDCFC 001FDBFC 05000524 */  addiu       $5, $0, 0x5
/* 0FDD00 001FDC00 04008510 */  beq         $4, $5, .L001FDC14
/* 0FDD04 001FDC04 00000000 */   nop
/* 0FDD08 001FDC08 07000524 */  addiu       $5, $0, 0x7
/* 0FDD0C 001FDC0C 2D008514 */  bne         $4, $5, .L001FDCC4
/* 0FDD10 001FDC10 00000000 */   nop
.L001FDC14:
/* 0FDD14 001FDC14 283E0070 */  paddub      $7, $0, $0
/* 0FDD18 001FDC18 25000010 */  b           .L001FDCB0
/* 0FDD1C 001FDC1C 00000000 */   nop
.L001FDC20:
/* 0FDD20 001FDC20 80400700 */  sll         $8, $7, 2
/* 0FDD24 001FDC24 DA01053C */  lui         $5, %hi(CommonMenuMes1 + 0x16E0)
/* 0FDD28 001FDC28 7022A524 */  addiu       $5, $5, %lo(CommonMenuMes1 + 0x16E0)
/* 0FDD2C 001FDC2C 2150A800 */  addu        $10, $5, $8
/* 0FDD30 001FDC30 00004685 */  lh          $6, 0x0($10)
/* 0FDD34 001FDC34 40280700 */  sll         $5, $7, 1
/* 0FDD38 001FDC38 2128BD00 */  addu        $5, $5, $29
/* 0FDD3C 001FDC3C E800A524 */  addiu       $5, $5, 0xE8
/* 0FDD40 001FDC40 0000A6A4 */  sh          $6, 0x0($5)
/* 0FDD44 001FDC44 0000A684 */  lh          $6, 0x0($5)
/* 0FDD48 001FDC48 21281D01 */  addu        $5, $8, $29
/* 0FDD4C 001FDC4C 9000AB84 */  lh          $11, 0x90($5)
/* 0FDD50 001FDC50 64006925 */  addiu       $9, $11, 0x64
/* 0FDD54 001FDC54 0500C910 */  beq         $6, $9, .L001FDC6C
/* 0FDD58 001FDC58 00000000 */   nop
/* 0FDD5C 001FDC5C 6500C128 */  slti        $1, $6, 0x65
/* 0FDD60 001FDC60 02002014 */  bnez        $1, .L001FDC6C
/* 0FDD64 001FDC64 00000000 */   nop
/* 0FDD68 001FDC68 01000324 */  addiu       $3, $0, 0x1
.L001FDC6C:
/* 0FDD6C 001FDC6C 21281D01 */  addu        $5, $8, $29
/* 0FDD70 001FDC70 9200A684 */  lh          $6, 0x92($5)
/* 0FDD74 001FDC74 01000524 */  addiu       $5, $0, 0x1
/* 0FDD78 001FDC78 0400C514 */  bne         $6, $5, .L001FDC8C
/* 0FDD7C 001FDC7C 00000000 */   nop
/* 0FDD80 001FDC80 000049AD */  sw          $9, 0x0($10)
/* 0FDD84 001FDC84 05000010 */  b           .L001FDC9C
/* 0FDD88 001FDC88 00000000 */   nop
.L001FDC8C:
/* 0FDD8C 001FDC8C 0300C014 */  bnez        $6, .L001FDC9C
/* 0FDD90 001FDC90 00000000 */   nop
/* 0FDD94 001FDC94 02000524 */  addiu       $5, $0, 0x2
/* 0FDD98 001FDC98 000045AD */  sw          $5, 0x0($10)
.L001FDC9C:
/* 0FDD9C 001FDC9C 0300601D */  bgtz        $11, .L001FDCAC
/* 0FDDA0 001FDCA0 00000000 */   nop
/* 0FDDA4 001FDCA4 FFFF0524 */  addiu       $5, $0, -0x1
/* 0FDDA8 001FDCA8 000045AD */  sw          $5, 0x0($10)
.L001FDCAC:
/* 0FDDAC 001FDCAC 0100E724 */  addiu       $7, $7, 0x1
.L001FDCB0:
/* 0FDDB0 001FDCB0 0300E528 */  slti        $5, $7, 0x3
/* 0FDDB4 001FDCB4 DAFFA014 */  bnez        $5, .L001FDC20
/* 0FDDB8 001FDCB8 00000000 */   nop
/* 0FDDBC 001FDCBC 21000010 */  b           .L001FDD44
/* 0FDDC0 001FDCC0 00000000 */   nop
.L001FDCC4:
/* 0FDDC4 001FDCC4 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1302)
/* 0FDDC8 001FDCC8 E2BB2684 */  lh          $6, %lo(MenuWepLevelUp + 0x1302)($1)
/* 0FDDCC 001FDCCC FFFF0524 */  addiu       $5, $0, -0x1
/* 0FDDD0 001FDCD0 1C00C514 */  bne         $6, $5, .L001FDD44
/* 0FDDD4 001FDCD4 00000000 */   nop
/* 0FDDD8 001FDCD8 28460070 */  paddub      $8, $0, $0
/* 0FDDDC 001FDCDC 16000010 */  b           .L001FDD38
/* 0FDDE0 001FDCE0 00000000 */   nop
.L001FDCE4:
/* 0FDDE4 001FDCE4 FFFF0724 */  addiu       $7, $0, -0x1
/* 0FDDE8 001FDCE8 80300800 */  sll         $6, $8, 2
/* 0FDDEC 001FDCEC DA01053C */  lui         $5, %hi(CommonMenuMes1 + 0x16E0)
/* 0FDDF0 001FDCF0 7022A524 */  addiu       $5, $5, %lo(CommonMenuMes1 + 0x16E0)
/* 0FDDF4 001FDCF4 2128A600 */  addu        $5, $5, $6
/* 0FDDF8 001FDCF8 0000A7AC */  sw          $7, 0x0($5)
/* 0FDDFC 001FDCFC 0D000005 */  bltz        $8, .L001FDD34
/* 0FDE00 001FDD00 00000000 */   nop
/* 0FDE04 001FDD04 0A000129 */  slti        $1, $8, 0xA
/* 0FDE08 001FDD08 0A002010 */  beqz        $1, .L001FDD34
/* 0FDE0C 001FDD0C 00000000 */   nop
/* 0FDE10 001FDD10 C0300800 */  sll         $6, $8, 3
/* 0FDE14 001FDD14 DA01053C */  lui         $5, %hi(CommonMenuMes1 + 0x1750)
/* 0FDE18 001FDD18 E022A524 */  addiu       $5, $5, %lo(CommonMenuMes1 + 0x1750)
/* 0FDE1C 001FDD1C 2128A600 */  addu        $5, $5, $6
/* 0FDE20 001FDD20 0000A7AC */  sw          $7, 0x0($5)
/* 0FDE24 001FDD24 DA01053C */  lui         $5, %hi(CommonMenuMes1 + 0x1754)
/* 0FDE28 001FDD28 E422A524 */  addiu       $5, $5, %lo(CommonMenuMes1 + 0x1754)
/* 0FDE2C 001FDD2C 2128A600 */  addu        $5, $5, $6
/* 0FDE30 001FDD30 0000A7AC */  sw          $7, 0x0($5)
.L001FDD34:
/* 0FDE34 001FDD34 01000825 */  addiu       $8, $8, 0x1
.L001FDD38:
/* 0FDE38 001FDD38 04000529 */  slti        $5, $8, 0x4
/* 0FDE3C 001FDD3C E9FFA014 */  bnez        $5, .L001FDCE4
/* 0FDE40 001FDD40 00000000 */   nop
.L001FDD44:
/* 0FDE44 001FDD44 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0FDE48 001FDD48 4C22278C */  lw          $7, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0FDE4C 001FDD4C 0600F010 */  beq         $7, $16, .L001FDD68
/* 0FDE50 001FDD50 00000000 */   nop
/* 0FDE54 001FDD54 DB01013C */  lui         $1, %hi(MenuWepLevelUp + 0x1302)
/* 0FDE58 001FDD58 E2BB2684 */  lh          $6, %lo(MenuWepLevelUp + 0x1302)($1)
/* 0FDE5C 001FDD5C FFFF0524 */  addiu       $5, $0, -0x1
/* 0FDE60 001FDD60 1E00C510 */  beq         $6, $5, .L001FDDDC
/* 0FDE64 001FDD64 00000000 */   nop
.L001FDD68:
/* 0FDE68 001FDD68 05000524 */  addiu       $5, $0, 0x5
/* 0FDE6C 001FDD6C 04008510 */  beq         $4, $5, .L001FDD80
/* 0FDE70 001FDD70 00000000 */   nop
/* 0FDE74 001FDD74 07000524 */  addiu       $5, $0, 0x7
/* 0FDE78 001FDD78 03008514 */  bne         $4, $5, .L001FDD88
/* 0FDE7C 001FDD7C 00000000 */   nop
.L001FDD80:
/* 0FDE80 001FDD80 16006014 */  bnez        $3, .L001FDDDC
/* 0FDE84 001FDD84 00000000 */   nop
.L001FDD88:
/* 0FDE88 001FDD88 0600F010 */  beq         $7, $16, .L001FDDA4
/* 0FDE8C 001FDD8C 00000000 */   nop
/* 0FDE90 001FDD90 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FDE94 001FDD94 7CEA2484 */  lh          $4, %lo(WepMenu + 0xC)($1)
/* 0FDE98 001FDD98 0B000324 */  addiu       $3, $0, 0xB
/* 0FDE9C 001FDD9C 0F008310 */  beq         $4, $3, .L001FDDDC
/* 0FDEA0 001FDDA0 00000000 */   nop
.L001FDDA4:
/* 0FDEA4 001FDDA4 0600F010 */  beq         $7, $16, .L001FDDC0
/* 0FDEA8 001FDDA8 00000000 */   nop
/* 0FDEAC 001FDDAC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FDEB0 001FDDB0 7CEA2484 */  lh          $4, %lo(WepMenu + 0xC)($1)
/* 0FDEB4 001FDDB4 0D000324 */  addiu       $3, $0, 0xD
/* 0FDEB8 001FDDB8 08008310 */  beq         $4, $3, .L001FDDDC
/* 0FDEBC 001FDDBC 00000000 */   nop
.L001FDDC0:
/* 0FDEC0 001FDDC0 1E00F010 */  beq         $7, $16, .L001FDE3C
/* 0FDEC4 001FDDC4 00000000 */   nop
/* 0FDEC8 001FDDC8 DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FDECC 001FDDCC 7CEA2484 */  lh          $4, %lo(WepMenu + 0xC)($1)
/* 0FDED0 001FDDD0 0E000324 */  addiu       $3, $0, 0xE
/* 0FDED4 001FDDD4 19008314 */  bne         $4, $3, .L001FDE3C
/* 0FDED8 001FDDD8 00000000 */   nop
.L001FDDDC:
/* 0FDEDC 001FDDDC DA01013C */  lui         $1, %hi(WepMenu + 0xC)
/* 0FDEE0 001FDDE0 7CEA2384 */  lh          $3, %lo(WepMenu + 0xC)($1)
/* 0FDEE4 001FDDE4 0E000224 */  addiu       $2, $0, 0xE
/* 0FDEE8 001FDDE8 09006210 */  beq         $3, $2, .L001FDE10
/* 0FDEEC 001FDDEC 00000000 */   nop
/* 0FDEF0 001FDDF0 0D000224 */  addiu       $2, $0, 0xD
/* 0FDEF4 001FDDF4 06006210 */  beq         $3, $2, .L001FDE10
/* 0FDEF8 001FDDF8 00000000 */   nop
/* 0FDEFC 001FDDFC 0B000224 */  addiu       $2, $0, 0xB
/* 0FDF00 001FDE00 03006210 */  beq         $3, $2, .L001FDE10
/* 0FDF04 001FDE04 00000000 */   nop
/* 0FDF08 001FDE08 04000010 */  b           .L001FDE1C
/* 0FDF0C 001FDE0C 00000000 */   nop
.L001FDE10:
/* 0FDF10 001FDE10 01000224 */  addiu       $2, $0, 0x1
/* 0FDF14 001FDE14 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x98)
/* 0FDF18 001FDE18 280C22AC */  sw          $2, %lo(CommonMenuMes1 + 0x98)($1)
.L001FDE1C:
/* 0FDF1C 001FDE1C FFFF0224 */  addiu       $2, $0, -0x1
/* 0FDF20 001FDE20 DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0FDF24 001FDE24 4C2222AC */  sw          $2, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0FDF28 001FDE28 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0FDF2C 001FDE2C 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0FDF30 001FDE30 282E0072 */  paddub      $5, $16, $0
/* 0FDF34 001FDE34 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0FDF38 001FDE38 00000000 */   nop
.L001FDE3C:
/* 0FDF3C 001FDE3C 8000BF7B */  lq          $31, 0x80($29)
/* 0FDF40 001FDE40 7000B77B */  lq          $23, 0x70($29)
/* 0FDF44 001FDE44 6000B67B */  lq          $22, 0x60($29)
/* 0FDF48 001FDE48 5000B57B */  lq          $21, 0x50($29)
/* 0FDF4C 001FDE4C 4000B47B */  lq          $20, 0x40($29)
/* 0FDF50 001FDE50 3000B37B */  lq          $19, 0x30($29)
/* 0FDF54 001FDE54 2000B27B */  lq          $18, 0x20($29)
/* 0FDF58 001FDE58 1000B17B */  lq          $17, 0x10($29)
/* 0FDF5C 001FDE5C 0000B07B */  lq          $16, 0x0($29)
/* 0FDF60 001FDE60 F000BD27 */  addiu       $29, $29, 0xF0
/* 0FDF64 001FDE64 0800E003 */  jr          $31
/* 0FDF68 001FDE68 00000000 */   nop
/* 0FDF6C 001FDE6C 00000000 */  nop
