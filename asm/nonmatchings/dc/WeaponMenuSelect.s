.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuSelect__Fv
/* FCEF0 001FCDF0 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* FCEF4 001FCDF4 8000BF7F */  sq         $31, 0x80($sp)
/* FCEF8 001FCDF8 7000B77F */  sq         $23, 0x70($sp)
/* FCEFC 001FCDFC 6000B67F */  sq         $22, 0x60($sp)
/* FCF00 001FCE00 5000B57F */  sq         $21, 0x50($sp)
/* FCF04 001FCE04 4000B47F */  sq         $20, 0x40($sp)
/* FCF08 001FCE08 3000B37F */  sq         $19, 0x30($sp)
/* FCF0C 001FCE0C 2000B27F */  sq         $18, 0x20($sp)
/* FCF10 001FCE10 1000B17F */  sq         $17, 0x10($sp)
/* FCF14 001FCE14 0000B07F */  sq         $16, 0x0($sp)
/* FCF18 001FCE18 FFFF0424 */  addiu      $4, $0, -0x1
/* FCF1C 001FCE1C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCF20 001FCE20 7CEA2384 */  lh         $3, -0x1584($at)
/* FCF24 001FCE24 02000224 */  addiu      $2, $0, 0x2
/* FCF28 001FCE28 09006210 */  beq        $3, $2, .L001FCE50
/* FCF2C 001FCE2C 00000000 */   nop
/* FCF30 001FCE30 01000224 */  addiu      $2, $0, 0x1
/* FCF34 001FCE34 03006210 */  beq        $3, $2, .L001FCE44
/* FCF38 001FCE38 00000000 */   nop
/* FCF3C 001FCE3C 05000010 */  b          .L001FCE54
/* FCF40 001FCE40 00000000 */   nop
.L001FCE44:
/* FCF44 001FCE44 28260070 */  paddub     $4, $0, $0
/* FCF48 001FCE48 02000010 */  b          .L001FCE54
/* FCF4C 001FCE4C 00000000 */   nop
.L001FCE50:
/* FCF50 001FCE50 01000424 */  addiu      $4, $0, 0x1
.L001FCE54:
/* FCF54 001FCE54 D8DB070C */  jal        ToFromSelect__Fi
/* FCF58 001FCE58 00000000 */   nop
/* FCF5C 001FCE5C 28864070 */  paddub     $16, $2, $0
/* FCF60 001FCE60 0495848F */  lw         $4, -0x6AFC($gp)
/* FCF64 001FCE64 01000324 */  addiu      $3, $0, 0x1
/* FCF68 001FCE68 33008310 */  beq        $4, $3, .L001FCF38
/* FCF6C 001FCE6C 00000000 */   nop
/* FCF70 001FCE70 03008010 */  beqz       $4, .L001FCE80
/* FCF74 001FCE74 00000000 */   nop
/* FCF78 001FCE78 38000010 */  b          .L001FCF5C
/* FCF7C 001FCE7C 00000000 */   nop
.L001FCE80:
/* FCF80 001FCE80 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FCF84 001FCE84 C0BB2380 */  lb         $3, -0x4440($at)
/* FCF88 001FCE88 19006014 */  bnez       $3, .L001FCEF0
/* FCF8C 001FCE8C 00000000 */   nop
/* FCF90 001FCE90 8CFB040C */  jal        ReadBGSync__Fv
/* FCF94 001FCE94 00000000 */   nop
/* FCF98 001FCE98 13004014 */  bnez       $2, .L001FCEE8
/* FCF9C 001FCE9C 00000000 */   nop
/* FCFA0 001FCEA0 0495838F */  lw         $3, -0x6AFC($gp)
/* FCFA4 001FCEA4 2D006014 */  bnez       $3, .L001FCF5C
/* FCFA8 001FCEA8 00000000 */   nop
/* FCFAC 001FCEAC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCFB0 001FCEB0 75EA2480 */  lb         $4, -0x158B($at)
/* FCFB4 001FCEB4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCFB8 001FCEB8 74EA2680 */  lb         $6, -0x158C($at)
/* FCFBC 001FCEBC 0095858F */  lw         $5, -0x6B00($gp)
/* FCFC0 001FCEC0 3035080C */  jal        EnterWeaponModel__Fiii
/* FCFC4 001FCEC4 00000000 */   nop
/* FCFC8 001FCEC8 049582AF */  sw         $2, -0x6AFC($gp)
/* FCFCC 001FCECC 28D6070C */  jal        BtlMenuTexBlockEnter__Fv
/* FCFD0 001FCED0 00000000 */   nop
/* FCFD4 001FCED4 0C9580AF */  sw         $0, -0x6AF4($gp)
/* FCFD8 001FCED8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FCFDC 001FCEDC 80EA20AC */  sw         $0, -0x1580($at)
/* FCFE0 001FCEE0 03000010 */  b          .L001FCEF0
/* FCFE4 001FCEE4 00000000 */   nop
.L001FCEE8:
/* FCFE8 001FCEE8 D4030010 */  b          .L001FDE3C
/* FCFEC 001FCEEC 00000000 */   nop
.L001FCEF0:
/* FCFF0 001FCEF0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FCFF4 001FCEF4 C0BB2480 */  lb         $4, -0x4440($at)
/* FCFF8 001FCEF8 01000324 */  addiu      $3, $0, 0x1
/* FCFFC 001FCEFC 17008314 */  bne        $4, $3, .L001FCF5C
/* FD000 001FCF00 00000000 */   nop
/* FD004 001FCF04 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD008 001FCF08 75EA2480 */  lb         $4, -0x158B($at)
/* FD00C 001FCF0C 0095858F */  lw         $5, -0x6B00($gp)
/* FD010 001FCF10 4C36080C */  jal        WeaponModelBuildFunc__Fii
/* FD014 001FCF14 00000000 */   nop
/* FD018 001FCF18 0C9580AF */  sw         $0, -0x6AF4($gp)
/* FD01C 001FCF1C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD020 001FCF20 C0BB20A0 */  sb         $0, -0x4440($at)
/* FD024 001FCF24 0495838F */  lw         $3, -0x6AFC($gp)
/* FD028 001FCF28 01006324 */  addiu      $3, $3, 0x1
/* FD02C 001FCF2C 049583AF */  sw         $3, -0x6AFC($gp)
/* FD030 001FCF30 0A000010 */  b          .L001FCF5C
/* FD034 001FCF34 00000000 */   nop
.L001FCF38:
/* FD038 001FCF38 0C95838F */  lw         $3, -0x6AF4($gp)
/* FD03C 001FCF3C 01006324 */  addiu      $3, $3, 0x1
/* FD040 001FCF40 0C9583AF */  sw         $3, -0x6AF4($gp)
/* FD044 001FCF44 0C95838F */  lw         $3, -0x6AF4($gp)
/* FD048 001FCF48 04006128 */  slti       $at, $3, 0x4
/* FD04C 001FCF4C 03002014 */  bnez       $at, .L001FCF5C
/* FD050 001FCF50 00000000 */   nop
/* FD054 001FCF54 02000324 */  addiu      $3, $0, 0x2
/* FD058 001FCF58 049583AF */  sw         $3, -0x6AFC($gp)
.L001FCF5C:
/* FD05C 001FCF5C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD060 001FCF60 7CEA2384 */  lh         $3, -0x1584($at)
/* FD064 001FCF64 08006010 */  beqz       $3, .L001FCF88
/* FD068 001FCF68 00000000 */   nop
/* FD06C 001FCF6C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD070 001FCF70 80EA238C */  lw         $3, -0x1580($at)
/* FD074 001FCF74 01006324 */  addiu      $3, $3, 0x1
/* FD078 001FCF78 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD07C 001FCF7C 80EA23AC */  sw         $3, -0x1580($at)
/* FD080 001FCF80 03000010 */  b          .L001FCF90
/* FD084 001FCF84 00000000 */   nop
.L001FCF88:
/* FD088 001FCF88 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD08C 001FCF8C 80EA20AC */  sw         $0, -0x1580($at)
.L001FCF90:
/* FD090 001FCF90 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD094 001FCF94 7CEA2584 */  lh         $5, -0x1584($at)
/* FD098 001FCF98 0F00A12C */  sltiu      $at, $5, 0xF
/* FD09C 001FCF9C AA012010 */  beqz       $at, .L001FD648
/* FD0A0 001FCFA0 00000000 */   nop
/* FD0A4 001FCFA4 2A00033C */  lui        $3, %hi(_2806_2)
/* FD0A8 001FCFA8 60D96424 */  addiu      $4, $3, %lo(_2806_2)
/* FD0AC 001FCFAC 80180500 */  sll        $3, $5, 2
/* FD0B0 001FCFB0 21186400 */  addu       $3, $3, $4
/* FD0B4 001FCFB4 0000638C */  lw         $3, 0x0($3)
/* FD0B8 001FCFB8 08006000 */  jr         $3
/* FD0BC 001FCFBC 00000000 */   nop
/* FD0C0 001FCFC0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD0C4 001FCFC4 80EA20C4 */  lwc1       $f0, -0x1580($at)
/* FD0C8 001FCFC8 60008046 */  cvt.s.w    $f1, $f0
/* FD0CC 001FCFCC 9041033C */  lui        $3, (0x41900000 >> 16)
/* FD0D0 001FCFD0 00008344 */  mtc1       $3, $f0
/* FD0D4 001FCFD4 00000000 */  nop
/* FD0D8 001FCFD8 36080046 */  c.le.s     $f1, $f0
/* FD0DC 001FCFDC 00000000 */  nop
/* FD0E0 001FCFE0 99010145 */  bc1t       .L001FD648
/* FD0E4 001FCFE4 00000000 */   nop
/* FD0E8 001FCFE8 97010012 */  beqz       $16, .L001FD648
/* FD0EC 001FCFEC 00000000 */   nop
/* FD0F0 001FCFF0 0495838F */  lw         $3, -0x6AFC($gp)
/* FD0F4 001FCFF4 94016010 */  beqz       $3, .L001FD648
/* FD0F8 001FCFF8 00000000 */   nop
/* FD0FC 001FCFFC 02000324 */  addiu      $3, $0, 0x2
/* FD100 001FD000 208883AF */  sw         $3, -0x77E0($gp)
/* FD104 001FD004 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD108 001FD008 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD10C 001FD00C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD110 001FD010 80EA20AC */  sw         $0, -0x1580($at)
/* FD114 001FD014 8C010010 */  b          .L001FD648
/* FD118 001FD018 00000000 */   nop
/* FD11C 001FD01C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD120 001FD020 80EA238C */  lw         $3, -0x1580($at)
/* FD124 001FD024 15006128 */  slti       $at, $3, 0x15
/* FD128 001FD028 87012014 */  bnez       $at, .L001FD648
/* FD12C 001FD02C 00000000 */   nop
/* FD130 001FD030 85010012 */  beqz       $16, .L001FD648
/* FD134 001FD034 00000000 */   nop
/* FD138 001FD038 C8F2070C */  jal        ExitWeaponMenuSelect__Fv
/* FD13C 001FD03C 00000000 */   nop
/* FD140 001FD040 81010010 */  b          .L001FD648
/* FD144 001FD044 00000000 */   nop
/* FD148 001FD048 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD14C 001FD04C E0BB2384 */  lh         $3, -0x4420($at)
/* FD150 001FD050 7D016014 */  bnez       $3, .L001FD648
/* FD154 001FD054 00000000 */   nop
/* FD158 001FD058 CC01023C */  lui        $2, %hi(GamePad)
/* FD15C 001FD05C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD160 001FD060 60000524 */  addiu      $5, $0, 0x60
/* FD164 001FD064 1CAE040C */  jal        Down__8CGamePadFi
/* FD168 001FD068 00000000 */   nop
/* FD16C 001FD06C 76014010 */  beqz       $2, .L001FD648
/* FD170 001FD070 00000000 */   nop
/* FD174 001FD074 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD178 001FD078 F4BB2484 */  lh         $4, -0x440C($at)
/* FD17C 001FD07C 06000324 */  addiu      $3, $0, 0x6
/* FD180 001FD080 0A008310 */  beq        $4, $3, .L001FD0AC
/* FD184 001FD084 00000000 */   nop
/* FD188 001FD088 03000324 */  addiu      $3, $0, 0x3
/* FD18C 001FD08C 07008310 */  beq        $4, $3, .L001FD0AC
/* FD190 001FD090 00000000 */   nop
/* FD194 001FD094 09000324 */  addiu      $3, $0, 0x9
/* FD198 001FD098 04008310 */  beq        $4, $3, .L001FD0AC
/* FD19C 001FD09C 00000000 */   nop
/* FD1A0 001FD0A0 0B000324 */  addiu      $3, $0, 0xB
/* FD1A4 001FD0A4 68018314 */  bne        $4, $3, .L001FD648
/* FD1A8 001FD0A8 00000000 */   nop
.L001FD0AC:
/* FD1AC 001FD0AC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD1B0 001FD0B0 B4BB308C */  lw         $16, -0x444C($at)
/* FD1B4 001FD0B4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD1B8 001FD0B8 7CEA2384 */  lh         $3, -0x1584($at)
/* FD1BC 001FD0BC 0A000224 */  addiu      $2, $0, 0xA
/* FD1C0 001FD0C0 3E006210 */  beq        $3, $2, .L001FD1BC
/* FD1C4 001FD0C4 00000000 */   nop
/* FD1C8 001FD0C8 09000224 */  addiu      $2, $0, 0x9
/* FD1CC 001FD0CC 3B006210 */  beq        $3, $2, .L001FD1BC
/* FD1D0 001FD0D0 00000000 */   nop
/* FD1D4 001FD0D4 08000224 */  addiu      $2, $0, 0x8
/* FD1D8 001FD0D8 22006210 */  beq        $3, $2, .L001FD164
/* FD1DC 001FD0DC 00000000 */   nop
/* FD1E0 001FD0E0 07000224 */  addiu      $2, $0, 0x7
/* FD1E4 001FD0E4 03006210 */  beq        $3, $2, .L001FD0F4
/* FD1E8 001FD0E8 00000000 */   nop
/* FD1EC 001FD0EC 33000010 */  b          .L001FD1BC
/* FD1F0 001FD0F0 00000000 */   nop
.L001FD0F4:
/* FD1F4 001FD0F4 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FD1F8 001FD0F8 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FD1FC 001FD0FC DCD9080C */  jal        SetLevelUpWeaponData__14CWeaponLevelUpFv
/* FD200 001FD100 00000000 */   nop
/* FD204 001FD104 02000286 */  lh         $2, 0x2($16)
/* FD208 001FD108 01004224 */  addiu      $2, $2, 0x1
/* FD20C 001FD10C 020002A6 */  sh         $2, 0x2($16)
/* FD210 001FD110 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD214 001FD114 C8BB2384 */  lh         $3, -0x4438($at)
/* FD218 001FD118 F000028E */  lw         $2, 0xF0($16)
/* FD21C 001FD11C 21104300 */  addu       $2, $2, $3
/* FD220 001FD120 F00002AE */  sw         $2, 0xF0($16)
/* FD224 001FD124 288E0070 */  paddub     $17, $0, $0
/* FD228 001FD128 09000010 */  b          .L001FD150
/* FD22C 001FD12C 00000000 */   nop
.L001FD130:
/* FD230 001FD130 40111100 */  sll        $2, $17, 5
/* FD234 001FD134 21100202 */  addu       $2, $16, $2
/* FD238 001FD138 28004424 */  addiu      $4, $2, 0x28
/* FD23C 001FD13C 282E0070 */  paddub     $5, $0, $0
/* FD240 001FD140 20000624 */  addiu      $6, $0, 0x20
/* FD244 001FD144 5A0D040C */  jal        memset
/* FD248 001FD148 00000000 */   nop
/* FD24C 001FD14C 01003126 */  addiu      $17, $17, 0x1
.L001FD150:
/* FD250 001FD150 0600222A */  slti       $2, $17, 0x6
/* FD254 001FD154 F6FF4014 */  bnez       $2, .L001FD130
/* FD258 001FD158 00000000 */   nop
/* FD25C 001FD15C 17000010 */  b          .L001FD1BC
/* FD260 001FD160 00000000 */   nop
.L001FD164:
/* FD264 001FD164 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD268 001FD168 75EA2480 */  lb         $4, -0x158B($at)
/* FD26C 001FD16C D494828F */  lw         $2, -0x6B2C($gp)
/* FD270 001FD170 21108200 */  addu       $2, $4, $2
/* FD274 001FD174 40434380 */  lb         $3, 0x4340($2)
/* FD278 001FD178 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD27C 001FD17C 74EA2280 */  lb         $2, -0x158C($at)
/* FD280 001FD180 0A004310 */  beq        $2, $3, .L001FD1AC
/* FD284 001FD184 00000000 */   nop
/* FD288 001FD188 40110300 */  sll        $2, $3, 5
/* FD28C 001FD18C 23104300 */  subu       $2, $2, $3
/* FD290 001FD190 C0180200 */  sll        $3, $2, 3
/* FD294 001FD194 1495828F */  lw         $2, -0x6AEC($gp)
/* FD298 001FD198 21104300 */  addu       $2, $2, $3
/* FD29C 001FD19C 00004284 */  lh         $2, 0x0($2)
/* FD2A0 001FD1A0 01014128 */  slti       $at, $2, 0x101
/* FD2A4 001FD1A4 03002010 */  beqz       $at, .L001FD1B4
/* FD2A8 001FD1A8 00000000 */   nop
.L001FD1AC:
/* FD2AC 001FD1AC EC2F080C */  jal        EquipDefaultWeapon__Fi
/* FD2B0 001FD1B0 00000000 */   nop
.L001FD1B4:
/* FD2B4 001FD1B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD2B8 001FD1B8 C1BB20A0 */  sb         $0, -0x443F($at)
.L001FD1BC:
/* FD2BC 001FD1BC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD2C0 001FD1C0 7CEA2384 */  lh         $3, -0x1584($at)
/* FD2C4 001FD1C4 0A000224 */  addiu      $2, $0, 0xA
/* FD2C8 001FD1C8 0A006210 */  beq        $3, $2, .L001FD1F4
/* FD2CC 001FD1CC 00000000 */   nop
/* FD2D0 001FD1D0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD2D4 001FD1D4 F6BB2584 */  lh         $5, -0x440A($at)
/* FD2D8 001FD1D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD2DC 001FD1DC F8BB2684 */  lh         $6, -0x4408($at)
/* FD2E0 001FD1E0 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FD2E4 001FD1E4 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FD2E8 001FD1E8 07000724 */  addiu      $7, $0, 0x7
/* FD2EC 001FD1EC ACDB080C */  jal        SetSnd__14CWeaponLevelUpFiii
/* FD2F0 001FD1F0 00000000 */   nop
.L001FD1F4:
/* FD2F4 001FD1F4 DB01023C */  lui        $2, %hi(MenuWepLevelUp)
/* FD2F8 001FD1F8 E0A84424 */  addiu      $4, $2, %lo(MenuWepLevelUp)
/* FD2FC 001FD1FC 7CD8080C */  jal        Initialize__14CWeaponLevelUpFv
/* FD300 001FD200 00000000 */   nop
/* FD304 001FD204 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD308 001FD208 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD30C 001FD20C 0E010010 */  b          .L001FD648
/* FD310 001FD210 00000000 */   nop
/* FD314 001FD214 CC01023C */  lui        $2, %hi(GamePad)
/* FD318 001FD218 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD31C 001FD21C 60000524 */  addiu      $5, $0, 0x60
/* FD320 001FD220 1CAE040C */  jal        Down__8CGamePadFi
/* FD324 001FD224 00000000 */   nop
/* FD328 001FD228 07014010 */  beqz       $2, .L001FD648
/* FD32C 001FD22C 00000000 */   nop
/* FD330 001FD230 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD334 001FD234 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD338 001FD238 FFFF0324 */  addiu      $3, $0, -0x1
/* FD33C 001FD23C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD340 001FD240 78EA23A0 */  sb         $3, -0x1588($at)
/* FD344 001FD244 00010010 */  b          .L001FD648
/* FD348 001FD248 00000000 */   nop
/* FD34C 001FD24C CC01023C */  lui        $2, %hi(GamePad)
/* FD350 001FD250 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD354 001FD254 60000524 */  addiu      $5, $0, 0x60
/* FD358 001FD258 1CAE040C */  jal        Down__8CGamePadFi
/* FD35C 001FD25C 00000000 */   nop
/* FD360 001FD260 F9004010 */  beqz       $2, .L001FD648
/* FD364 001FD264 00000000 */   nop
/* FD368 001FD268 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD36C 001FD26C 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD370 001FD270 F5000010 */  b          .L001FD648
/* FD374 001FD274 00000000 */   nop
/* FD378 001FD278 CC01023C */  lui        $2, %hi(GamePad)
/* FD37C 001FD27C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD380 001FD280 40000524 */  addiu      $5, $0, 0x40
/* FD384 001FD284 1CAE040C */  jal        Down__8CGamePadFi
/* FD388 001FD288 00000000 */   nop
/* FD38C 001FD28C 2A004010 */  beqz       $2, .L001FD338
/* FD390 001FD290 00000000 */   nop
/* FD394 001FD294 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FD398 001FD298 00000000 */   nop
/* FD39C 001FD29C 28864070 */  paddub     $16, $2, $0
/* FD3A0 001FD2A0 00004484 */  lh         $4, 0x0($2)
/* FD3A4 001FD2A4 70CF070C */  jal        IsDefaultWeapon__Fi
/* FD3A8 001FD2A8 00000000 */   nop
/* FD3AC 001FD2AC 2A084000 */  slt        $at, $2, $0
/* FD3B0 001FD2B0 09002014 */  bnez       $at, .L001FD2D8
/* FD3B4 001FD2B4 00000000 */   nop
/* FD3B8 001FD2B8 02000424 */  addiu      $4, $0, 0x2
/* FD3BC 001FD2BC BCB3080C */  jal        ComMenuSePlay__Fi
/* FD3C0 001FD2C0 00000000 */   nop
/* FD3C4 001FD2C4 0E000324 */  addiu      $3, $0, 0xE
/* FD3C8 001FD2C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD3CC 001FD2CC 7CEA23A4 */  sh         $3, -0x1584($at)
/* FD3D0 001FD2D0 25000010 */  b          .L001FD368
/* FD3D4 001FD2D4 00000000 */   nop
.L001FD2D8:
/* FD3D8 001FD2D8 00000386 */  lh         $3, 0x0($16)
/* FD3DC 001FD2DC 0C010224 */  addiu      $2, $0, 0x10C
/* FD3E0 001FD2E0 0D006214 */  bne        $3, $2, .L001FD318
/* FD3E4 001FD2E4 00000000 */   nop
/* FD3E8 001FD2E8 E02F080C */  jal        GetMenuHebikiriFlag__Fv
/* FD3EC 001FD2EC 00000000 */   nop
/* FD3F0 001FD2F0 09004014 */  bnez       $2, .L001FD318
/* FD3F4 001FD2F4 00000000 */   nop
/* FD3F8 001FD2F8 0E000224 */  addiu      $2, $0, 0xE
/* FD3FC 001FD2FC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD400 001FD300 7CEA22A4 */  sh         $2, -0x1584($at)
/* FD404 001FD304 02000424 */  addiu      $4, $0, 0x2
/* FD408 001FD308 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD40C 001FD30C 00000000 */   nop
/* FD410 001FD310 15000010 */  b          .L001FD368
/* FD414 001FD314 00000000 */   nop
.L001FD318:
/* FD418 001FD318 0D000224 */  addiu      $2, $0, 0xD
/* FD41C 001FD31C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD420 001FD320 7CEA22A4 */  sh         $2, -0x1584($at)
/* FD424 001FD324 01000424 */  addiu      $4, $0, 0x1
/* FD428 001FD328 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD42C 001FD32C 00000000 */   nop
/* FD430 001FD330 0D000010 */  b          .L001FD368
/* FD434 001FD334 00000000 */   nop
.L001FD338:
/* FD438 001FD338 CC01023C */  lui        $2, %hi(GamePad)
/* FD43C 001FD33C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD440 001FD340 20800534 */  ori        $5, $0, 0x8020
/* FD444 001FD344 1CAE040C */  jal        Down__8CGamePadFi
/* FD448 001FD348 00000000 */   nop
/* FD44C 001FD34C 06004010 */  beqz       $2, .L001FD368
/* FD450 001FD350 00000000 */   nop
/* FD454 001FD354 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD458 001FD358 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD45C 001FD35C 28260070 */  paddub     $4, $0, $0
/* FD460 001FD360 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD464 001FD364 00000000 */   nop
.L001FD368:
/* FD468 001FD368 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD46C 001FD36C 7CEA2384 */  lh         $3, -0x1584($at)
/* FD470 001FD370 B5006014 */  bnez       $3, .L001FD648
/* FD474 001FD374 00000000 */   nop
/* FD478 001FD378 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD47C 001FD37C 90EA20AC */  sw         $0, -0x1570($at)
/* FD480 001FD380 B1000010 */  b          .L001FD648
/* FD484 001FD384 00000000 */   nop
/* FD488 001FD388 CC01023C */  lui        $2, %hi(GamePad)
/* FD48C 001FD38C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD490 001FD390 00500524 */  addiu      $5, $0, 0x5000
/* FD494 001FD394 1CAE040C */  jal        Down__8CGamePadFi
/* FD498 001FD398 00000000 */   nop
/* FD49C 001FD39C 0F004010 */  beqz       $2, .L001FD3DC
/* FD4A0 001FD3A0 00000000 */   nop
/* FD4A4 001FD3A4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD4A8 001FD3A8 79EA2280 */  lb         $2, -0x1587($at)
/* FD4AC 001FD3AC 05004010 */  beqz       $2, .L001FD3C4
/* FD4B0 001FD3B0 00000000 */   nop
/* FD4B4 001FD3B4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD4B8 001FD3B8 79EA20A0 */  sb         $0, -0x1587($at)
/* FD4BC 001FD3BC 04000010 */  b          .L001FD3D0
/* FD4C0 001FD3C0 00000000 */   nop
.L001FD3C4:
/* FD4C4 001FD3C4 01000224 */  addiu      $2, $0, 0x1
/* FD4C8 001FD3C8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD4CC 001FD3CC 79EA22A0 */  sb         $2, -0x1587($at)
.L001FD3D0:
/* FD4D0 001FD3D0 28260070 */  paddub     $4, $0, $0
/* FD4D4 001FD3D4 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD4D8 001FD3D8 00000000 */   nop
.L001FD3DC:
/* FD4DC 001FD3DC CC01023C */  lui        $2, %hi(GamePad)
/* FD4E0 001FD3E0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD4E4 001FD3E4 40000524 */  addiu      $5, $0, 0x40
/* FD4E8 001FD3E8 1CAE040C */  jal        Down__8CGamePadFi
/* FD4EC 001FD3EC 00000000 */   nop
/* FD4F0 001FD3F0 32004010 */  beqz       $2, .L001FD4BC
/* FD4F4 001FD3F4 00000000 */   nop
/* FD4F8 001FD3F8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD4FC 001FD3FC 79EA2280 */  lb         $2, -0x1587($at)
/* FD500 001FD400 27004014 */  bnez       $2, .L001FD4A0
/* FD504 001FD404 00000000 */   nop
/* FD508 001FD408 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FD50C 001FD40C 00000000 */   nop
/* FD510 001FD410 28864070 */  paddub     $16, $2, $0
/* FD514 001FD414 00004484 */  lh         $4, 0x0($2)
/* FD518 001FD418 70CF070C */  jal        IsDefaultWeapon__Fi
/* FD51C 001FD41C 00000000 */   nop
/* FD520 001FD420 2A084000 */  slt        $at, $2, $0
/* FD524 001FD424 06002014 */  bnez       $at, .L001FD440
/* FD528 001FD428 00000000 */   nop
/* FD52C 001FD42C 02000424 */  addiu      $4, $0, 0x2
/* FD530 001FD430 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD534 001FD434 00000000 */   nop
/* FD538 001FD438 2C000010 */  b          .L001FD4EC
/* FD53C 001FD43C 00000000 */   nop
.L001FD440:
/* FD540 001FD440 28260072 */  paddub     $4, $16, $0
/* FD544 001FD444 1CB9080C */  jal        InitHaveWep__FP11WEAPON_HAVE
/* FD548 001FD448 00000000 */   nop
/* FD54C 001FD44C 01000424 */  addiu      $4, $0, 0x1
/* FD550 001FD450 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD554 001FD454 00000000 */   nop
/* FD558 001FD458 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD55C 001FD45C 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD560 001FD460 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD564 001FD464 75EA2480 */  lb         $4, -0x158B($at)
/* FD568 001FD468 D494828F */  lw         $2, -0x6B2C($gp)
/* FD56C 001FD46C 21108200 */  addu       $2, $4, $2
/* FD570 001FD470 40434380 */  lb         $3, 0x4340($2)
/* FD574 001FD474 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD578 001FD478 74EA2280 */  lb         $2, -0x158C($at)
/* FD57C 001FD47C 03004314 */  bne        $2, $3, .L001FD48C
/* FD580 001FD480 00000000 */   nop
/* FD584 001FD484 EC2F080C */  jal        EquipDefaultWeapon__Fi
/* FD588 001FD488 00000000 */   nop
.L001FD48C:
/* FD58C 001FD48C 01000424 */  addiu      $4, $0, 0x1
/* FD590 001FD490 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD594 001FD494 00000000 */   nop
/* FD598 001FD498 14000010 */  b          .L001FD4EC
/* FD59C 001FD49C 00000000 */   nop
.L001FD4A0:
/* FD5A0 001FD4A0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD5A4 001FD4A4 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD5A8 001FD4A8 02000424 */  addiu      $4, $0, 0x2
/* FD5AC 001FD4AC BCB3080C */  jal        ComMenuSePlay__Fi
/* FD5B0 001FD4B0 00000000 */   nop
/* FD5B4 001FD4B4 0D000010 */  b          .L001FD4EC
/* FD5B8 001FD4B8 00000000 */   nop
.L001FD4BC:
/* FD5BC 001FD4BC CC01023C */  lui        $2, %hi(GamePad)
/* FD5C0 001FD4C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FD5C4 001FD4C4 20800534 */  ori        $5, $0, 0x8020
/* FD5C8 001FD4C8 1CAE040C */  jal        Down__8CGamePadFi
/* FD5CC 001FD4CC 00000000 */   nop
/* FD5D0 001FD4D0 06004010 */  beqz       $2, .L001FD4EC
/* FD5D4 001FD4D4 00000000 */   nop
/* FD5D8 001FD4D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD5DC 001FD4DC 7CEA20A4 */  sh         $0, -0x1584($at)
/* FD5E0 001FD4E0 28260070 */  paddub     $4, $0, $0
/* FD5E4 001FD4E4 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD5E8 001FD4E8 00000000 */   nop
.L001FD4EC:
/* FD5EC 001FD4EC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD5F0 001FD4F0 7CEA2384 */  lh         $3, -0x1584($at)
/* FD5F4 001FD4F4 54006014 */  bnez       $3, .L001FD648
/* FD5F8 001FD4F8 00000000 */   nop
/* FD5FC 001FD4FC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD600 001FD500 90EA20AC */  sw         $0, -0x1570($at)
/* FD604 001FD504 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD608 001FD508 72EA20A4 */  sh         $0, -0x158E($at)
/* FD60C 001FD50C 4E000010 */  b          .L001FD648
/* FD610 001FD510 00000000 */   nop
/* FD614 001FD514 789581C7 */  lwc1       $f1, -0x6A88($gp)
/* FD618 001FD518 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* FD61C 001FD51C 34080046 */  c.lt.s     $f1, $f0
/* FD620 001FD520 00000000 */  nop
/* FD624 001FD524 03000145 */  bc1t       .L001FD534
/* FD628 001FD528 00000000 */   nop
/* FD62C 001FD52C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD630 001FD530 7CEA20A4 */  sh         $0, -0x1584($at)
.L001FD534:
/* FD634 001FD534 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD638 001FD538 80EA238C */  lw         $3, -0x1580($at)
/* FD63C 001FD53C 1A006328 */  slti       $3, $3, 0x1A
/* FD640 001FD540 03006014 */  bnez       $3, .L001FD550
/* FD644 001FD544 00000000 */   nop
/* FD648 001FD548 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD64C 001FD54C 7CEA20A4 */  sh         $0, -0x1584($at)
.L001FD550:
/* FD650 001FD550 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD654 001FD554 74EA3080 */  lb         $16, -0x158C($at)
/* FD658 001FD558 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD65C 001FD55C 90EA318C */  lw         $17, -0x1570($at)
/* FD660 001FD560 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD664 001FD564 72EA3484 */  lh         $20, -0x158E($at)
/* FD668 001FD568 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD66C 001FD56C 75EA3280 */  lb         $18, -0x158B($at)
/* FD670 001FD570 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD674 001FD574 77EA3380 */  lb         $19, -0x1589($at)
/* FD678 001FD578 0C00812E */  sltiu      $at, $20, 0xC
/* FD67C 001FD57C 1B002010 */  beqz       $at, .L001FD5EC
/* FD680 001FD580 00000000 */   nop
/* FD684 001FD584 2A00033C */  lui        $3, %hi(_2807_2)
/* FD688 001FD588 30D96424 */  addiu      $4, $3, %lo(_2807_2)
/* FD68C 001FD58C 80181400 */  sll        $3, $20, 2
/* FD690 001FD590 21186400 */  addu       $3, $3, $4
/* FD694 001FD594 0000638C */  lw         $3, 0x0($3)
/* FD698 001FD598 08006000 */  jr         $3
/* FD69C 001FD59C 00000000 */   nop
/* FD6A0 001FD5A0 1834080C */  jal        GetMenuCharaEffectReadFlag__Fv
/* FD6A4 001FD5A4 00000000 */   nop
/* FD6A8 001FD5A8 0A004010 */  beqz       $2, .L001FD5D4
/* FD6AC 001FD5AC 00000000 */   nop
/* FD6B0 001FD5B0 8CFB040C */  jal        ReadBGSync__Fv
/* FD6B4 001FD5B4 00000000 */   nop
/* FD6B8 001FD5B8 0C004014 */  bnez       $2, .L001FD5EC
/* FD6BC 001FD5BC 00000000 */   nop
/* FD6C0 001FD5C0 28260070 */  paddub     $4, $0, $0
/* FD6C4 001FD5C4 1434080C */  jal        SetMenuCharaEffectReadFlag__Fi
/* FD6C8 001FD5C8 00000000 */   nop
/* FD6CC 001FD5CC 07000010 */  b          .L001FD5EC
/* FD6D0 001FD5D0 00000000 */   nop
.L001FD5D4:
/* FD6D4 001FD5D4 C8F7070C */  jal        WeaponSelectKey__Fv
/* FD6D8 001FD5D8 00000000 */   nop
/* FD6DC 001FD5DC 03000010 */  b          .L001FD5EC
/* FD6E0 001FD5E0 00000000 */   nop
/* FD6E4 001FD5E4 14FE070C */  jal        WeaponMenuAttachModeKey__Fv
/* FD6E8 001FD5E8 00000000 */   nop
.L001FD5EC:
/* FD6EC 001FD5EC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD6F0 001FD5F0 74EA2380 */  lb         $3, -0x158C($at)
/* FD6F4 001FD5F4 11000316 */  bne        $16, $3, .L001FD63C
/* FD6F8 001FD5F8 00000000 */   nop
/* FD6FC 001FD5FC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD700 001FD600 72EA2384 */  lh         $3, -0x158E($at)
/* FD704 001FD604 05008316 */  bne        $20, $3, .L001FD61C
/* FD708 001FD608 00000000 */   nop
/* FD70C 001FD60C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD710 001FD610 90EA238C */  lw         $3, -0x1570($at)
/* FD714 001FD614 09002316 */  bne        $17, $3, .L001FD63C
/* FD718 001FD618 00000000 */   nop
.L001FD61C:
/* FD71C 001FD61C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD720 001FD620 75EA2380 */  lb         $3, -0x158B($at)
/* FD724 001FD624 05004316 */  bne        $18, $3, .L001FD63C
/* FD728 001FD628 00000000 */   nop
/* FD72C 001FD62C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD730 001FD630 77EA2380 */  lb         $3, -0x1589($at)
/* FD734 001FD634 04006312 */  beq        $19, $3, .L001FD648
/* FD738 001FD638 00000000 */   nop
.L001FD63C:
/* FD73C 001FD63C 28260070 */  paddub     $4, $0, $0
/* FD740 001FD640 BCB3080C */  jal        ComMenuSePlay__Fi
/* FD744 001FD644 00000000 */   nop
.L001FD648:
/* FD748 001FD648 28860070 */  paddub     $16, $0, $0
/* FD74C 001FD64C FFFF1224 */  addiu      $18, $0, -0x1
/* FD750 001FD650 0DFE0624 */  addiu      $6, $0, -0x1F3
/* FD754 001FD654 289E0070 */  paddub     $19, $0, $0
/* FD758 001FD658 D494838F */  lw         $3, -0x6B2C($gp)
/* FD75C 001FD65C 04057524 */  addiu      $21, $3, 0x504
/* FD760 001FD660 F87FB526 */  addiu      $21, $21, 0x7FF8
/* FD764 001FD664 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD768 001FD668 74EA2480 */  lb         $4, -0x158C($at)
/* FD76C 001FD66C 40190400 */  sll        $3, $4, 5
/* FD770 001FD670 23186400 */  subu       $3, $3, $4
/* FD774 001FD674 C0200300 */  sll        $4, $3, 3
/* FD778 001FD678 1495838F */  lw         $3, -0x6AEC($gp)
/* FD77C 001FD67C 21A06400 */  addu       $20, $3, $4
/* FD780 001FD680 05008012 */  beqz       $20, .L001FD698
/* FD784 001FD684 00000000 */   nop
/* FD788 001FD688 00008486 */  lh         $4, 0x0($20)
/* FD78C 001FD68C 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* FD790 001FD690 00000000 */   nop
/* FD794 001FD694 28364070 */  paddub     $6, $2, $0
.L001FD698:
/* FD798 001FD698 2900033C */  lui        $3, %hi(_2612_2)
/* FD79C 001FD69C C0326324 */  addiu      $3, $3, %lo(_2612_2)
/* FD7A0 001FD6A0 A000A527 */  addiu      $5, $sp, 0xA0
/* FD7A4 001FD6A4 00006478 */  lq         $4, 0x0($3)
/* FD7A8 001FD6A8 100063DC */  ld         $3, 0x10($3)
/* FD7AC 001FD6AC 0000A47C */  sq         $4, 0x0($5)
/* FD7B0 001FD6B0 1000A3FC */  sd         $3, 0x10($5)
/* FD7B4 001FD6B4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD7B8 001FD6B8 90EA2384 */  lh         $3, -0x1570($at)
/* FD7BC 001FD6BC 68006324 */  addiu      $3, $3, 0x68
/* FD7C0 001FD6C0 A200A3A7 */  sh         $3, 0xA2($sp)
/* FD7C4 001FD6C4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD7C8 001FD6C8 77EA2380 */  lb         $3, -0x1589($at)
/* FD7CC 001FD6CC 82006424 */  addiu      $4, $3, 0x82
/* FD7D0 001FD6D0 A400A4A7 */  sh         $4, 0xA4($sp)
/* FD7D4 001FD6D4 F401C424 */  addiu      $4, $6, 0x1F4
/* FD7D8 001FD6D8 A600A4A7 */  sh         $4, 0xA6($sp)
/* FD7DC 001FD6DC A800A4A7 */  sh         $4, 0xA8($sp)
/* FD7E0 001FD6E0 AA00A4A7 */  sh         $4, 0xAA($sp)
/* FD7E4 001FD6E4 AC00A4A7 */  sh         $4, 0xAC($sp)
/* FD7E8 001FD6E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD7EC 001FD6EC E8EB2480 */  lb         $4, -0x1418($at)
/* FD7F0 001FD6F0 02008624 */  addiu      $6, $4, 0x2
/* FD7F4 001FD6F4 80280600 */  sll        $5, $6, 2
/* FD7F8 001FD6F8 2128A600 */  addu       $5, $5, $6
/* FD7FC 001FD6FC 40280500 */  sll        $5, $5, 1
/* FD800 001FD700 6400A624 */  addiu      $6, $5, 0x64
/* FD804 001FD704 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD808 001FD708 E9EB2580 */  lb         $5, -0x1417($at)
/* FD80C 001FD70C 2130A600 */  addu       $6, $5, $6
/* FD810 001FD710 B600A6A7 */  sh         $6, 0xB6($sp)
/* FD814 001FD714 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD818 001FD718 72EA2A84 */  lh         $10, -0x158E($at)
/* FD81C 001FD71C 40300A00 */  sll        $6, $10, 1
/* FD820 001FD720 2148DD00 */  addu       $9, $6, $sp
/* FD824 001FD724 A0003185 */  lh         $17, 0xA0($9)
/* FD828 001FD728 03004629 */  slti       $6, $10, 0x3
/* FD82C 001FD72C 1400C014 */  bnez       $6, .L001FD780
/* FD830 001FD730 00000000 */   nop
/* FD834 001FD734 08004129 */  slti       $at, $10, 0x8
/* FD838 001FD738 11002010 */  beqz       $at, .L001FD780
/* FD83C 001FD73C 00000000 */   nop
/* FD840 001FD740 2900063C */  lui        $6, %hi(_2616)
/* FD844 001FD744 D832C624 */  addiu      $6, $6, %lo(_2616)
/* FD848 001FD748 D800A827 */  addiu      $8, $sp, 0xD8
/* FD84C 001FD74C 0000C7DC */  ld         $7, 0x0($6)
/* FD850 001FD750 0800C684 */  lh         $6, 0x8($6)
/* FD854 001FD754 000007FD */  sd         $7, 0x0($8)
/* FD858 001FD758 080006A5 */  sh         $6, 0x8($8)
/* FD85C 001FD75C D2003085 */  lh         $16, 0xD2($9)
/* FD860 001FD760 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FD864 001FD764 E2BB2784 */  lh         $7, -0x441E($at)
/* FD868 001FD768 FFFF0624 */  addiu      $6, $0, -0x1
/* FD86C 001FD76C 0400E610 */  beq        $7, $6, .L001FD780
/* FD870 001FD770 00000000 */   nop
/* FD874 001FD774 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* FD878 001FD778 4C22308C */  lw         $16, (0x1DA224C & 0xFFFF)($at)
/* FD87C 001FD77C 00000000 */  nop
.L001FD780:
/* FD880 001FD780 0C00412D */  sltiu      $at, $10, 0xC
/* FD884 001FD784 D1002010 */  beqz       $at, .L001FDACC
/* FD888 001FD788 00000000 */   nop
/* FD88C 001FD78C 2A00063C */  lui        $6, %hi(_2808_2)
/* FD890 001FD790 00D9C724 */  addiu      $7, $6, %lo(_2808_2)
/* FD894 001FD794 80300A00 */  sll        $6, $10, 2
/* FD898 001FD798 2130C700 */  addu       $6, $6, $7
/* FD89C 001FD79C 0000C68C */  lw         $6, 0x0($6)
/* FD8A0 001FD7A0 0800C000 */  jr         $6
/* FD8A4 001FD7A4 00000000 */   nop
/* FD8A8 001FD7A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD8AC 001FD7AC 7CEA2484 */  lh         $4, -0x1584($at)
/* FD8B0 001FD7B0 0E000324 */  addiu      $3, $0, 0xE
/* FD8B4 001FD7B4 09008310 */  beq        $4, $3, .L001FD7DC
/* FD8B8 001FD7B8 00000000 */   nop
/* FD8BC 001FD7BC 0D000324 */  addiu      $3, $0, 0xD
/* FD8C0 001FD7C0 06008310 */  beq        $4, $3, .L001FD7DC
/* FD8C4 001FD7C4 00000000 */   nop
/* FD8C8 001FD7C8 0C000324 */  addiu      $3, $0, 0xC
/* FD8CC 001FD7CC 03008310 */  beq        $4, $3, .L001FD7DC
/* FD8D0 001FD7D0 00000000 */   nop
/* FD8D4 001FD7D4 BD000010 */  b          .L001FDACC
/* FD8D8 001FD7D8 00000000 */   nop
.L001FD7DC:
/* FD8DC 001FD7DC A4001124 */  addiu      $17, $0, 0xA4
/* FD8E0 001FD7E0 BA000010 */  b          .L001FDACC
/* FD8E4 001FD7E4 00000000 */   nop
/* FD8E8 001FD7E8 9000A427 */  addiu      $4, $sp, 0x90
/* FD8EC 001FD7EC 282E8072 */  paddub     $5, $20, $0
/* FD8F0 001FD7F0 20D5080C */  jal        EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* FD8F4 001FD7F4 00000000 */   nop
/* FD8F8 001FD7F8 28AE0070 */  paddub     $21, $0, $0
/* FD8FC 001FD7FC 11000010 */  b          .L001FD844
/* FD900 001FD800 00000000 */   nop
.L001FD804:
/* FD904 001FD804 7443070C */  jal        GetCommonItemInfo__Fi
/* FD908 001FD808 00000000 */   nop
/* FD90C 001FD80C 09004010 */  beqz       $2, .L001FD834
/* FD910 001FD810 00000000 */   nop
/* FD914 001FD814 06004384 */  lh         $3, 0x6($2)
/* FD918 001FD818 0000C3A6 */  sh         $3, 0x0($22)
/* FD91C 001FD81C 2118FD02 */  addu       $3, $23, $sp
/* FD920 001FD820 92006384 */  lh         $3, 0x92($3)
/* FD924 001FD824 03006014 */  bnez       $3, .L001FD834
/* FD928 001FD828 00000000 */   nop
/* FD92C 001FD82C 02000324 */  addiu      $3, $0, 0x2
/* FD930 001FD830 0000C3A6 */  sh         $3, 0x0($22)
.L001FD834:
/* FD934 001FD834 0100B526 */  addiu      $21, $21, 0x1
/* FD938 001FD838 0500A12A */  slti       $at, $21, 0x5
/* FD93C 001FD83C 08002010 */  beqz       $at, .L001FD860
/* FD940 001FD840 00000000 */   nop
.L001FD844:
/* FD944 001FD844 80B81500 */  sll        $23, $21, 2
/* FD948 001FD848 2118FD02 */  addu       $3, $23, $sp
/* FD94C 001FD84C 90007624 */  addiu      $22, $3, 0x90
/* FD950 001FD850 0000C486 */  lh         $4, 0x0($22)
/* FD954 001FD854 FFFF0324 */  addiu      $3, $0, -0x1
/* FD958 001FD858 EAFF8314 */  bne        $4, $3, .L001FD804
/* FD95C 001FD85C 00000000 */   nop
.L001FD860:
/* FD960 001FD860 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD964 001FD864 72EA2484 */  lh         $4, -0x158E($at)
/* FD968 001FD868 05000324 */  addiu      $3, $0, 0x5
/* FD96C 001FD86C 97008314 */  bne        $4, $3, .L001FDACC
/* FD970 001FD870 00000000 */   nop
/* FD974 001FD874 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD978 001FD878 90EA238C */  lw         $3, -0x1570($at)
/* FD97C 001FD87C 80180300 */  sll        $3, $3, 2
/* FD980 001FD880 21187D00 */  addu       $3, $3, $sp
/* FD984 001FD884 92006484 */  lh         $4, 0x92($3)
/* FD988 001FD888 04008010 */  beqz       $4, .L001FD89C
/* FD98C 001FD88C 00000000 */   nop
/* FD990 001FD890 AE001124 */  addiu      $17, $0, 0xAE
/* FD994 001FD894 90007284 */  lh         $18, 0x90($3)
/* FD998 001FD898 00000000 */  nop
.L001FD89C:
/* FD99C 001FD89C 3C1C0400 */  dsll32     $3, $4, 16
/* FD9A0 001FD8A0 3F1C0300 */  dsra32     $3, $3, 16
/* FD9A4 001FD8A4 89006014 */  bnez       $3, .L001FDACC
/* FD9A8 001FD8A8 00000000 */   nop
/* FD9AC 001FD8AC AD001124 */  addiu      $17, $0, 0xAD
/* FD9B0 001FD8B0 86000010 */  b          .L001FDACC
/* FD9B4 001FD8B4 00000000 */   nop
/* FD9B8 001FD8B8 00008486 */  lh         $4, 0x0($20)
/* FD9BC 001FD8BC 01018328 */  slti       $3, $4, 0x101
/* FD9C0 001FD8C0 82006014 */  bnez       $3, .L001FDACC
/* FD9C4 001FD8C4 00000000 */   nop
/* FD9C8 001FD8C8 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* FD9CC 001FD8CC 00000000 */   nop
/* FD9D0 001FD8D0 F4015124 */  addiu      $17, $2, 0x1F4
/* FD9D4 001FD8D4 02009386 */  lh         $19, 0x2($20)
/* FD9D8 001FD8D8 7C000010 */  b          .L001FDACC
/* FD9DC 001FD8DC 00000000 */   nop
/* FD9E0 001FD8E0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FD9E4 001FD8E4 90EA228C */  lw         $2, -0x1570($at)
/* FD9E8 001FD8E8 40110200 */  sll        $2, $2, 5
/* FD9EC 001FD8EC 21185400 */  addu       $3, $2, $20
/* FD9F0 001FD8F0 28007584 */  lh         $21, 0x28($3)
/* FD9F4 001FD8F4 5100A22A */  slti       $2, $21, 0x51
/* FD9F8 001FD8F8 13004014 */  bnez       $2, .L001FD948
/* FD9FC 001FD8FC 00000000 */   nop
/* FDA00 001FD900 F401B126 */  addiu      $17, $21, 0x1F4
/* FDA04 001FD904 28006424 */  addiu      $4, $3, 0x28
/* FDA08 001FD908 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* FDA0C 001FD90C 00000000 */   nop
/* FDA10 001FD910 289E4070 */  paddub     $19, $2, $0
/* FDA14 001FD914 5A000324 */  addiu      $3, $0, 0x5A
/* FDA18 001FD918 6C00A316 */  bne        $21, $3, .L001FDACC
/* FDA1C 001FD91C 00000000 */   nop
/* FDA20 001FD920 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDA24 001FD924 90EA228C */  lw         $2, -0x1570($at)
/* FDA28 001FD928 40110200 */  sll        $2, $2, 5
/* FDA2C 001FD92C 21105400 */  addu       $2, $2, $20
/* FDA30 001FD930 2A004484 */  lh         $4, 0x2A($2)
/* FDA34 001FD934 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* FDA38 001FD938 00000000 */   nop
/* FDA3C 001FD93C 28964070 */  paddub     $18, $2, $0
/* FDA40 001FD940 62000010 */  b          .L001FDACC
/* FDA44 001FD944 00000000 */   nop
.L001FD948:
/* FDA48 001FD948 00008486 */  lh         $4, 0x0($20)
/* FDA4C 001FD94C D443070C */  jal        GetWeaponData__Fi
/* FDA50 001FD950 00000000 */   nop
/* FDA54 001FD954 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDA58 001FD958 90EA238C */  lw         $3, -0x1570($at)
/* FDA5C 001FD95C 21186200 */  addu       $3, $3, $2
/* FDA60 001FD960 0B006480 */  lb         $4, 0xB($3)
/* FDA64 001FD964 02000324 */  addiu      $3, $0, 0x2
/* FDA68 001FD968 04008314 */  bne        $4, $3, .L001FD97C
/* FDA6C 001FD96C 00000000 */   nop
/* FDA70 001FD970 70001124 */  addiu      $17, $0, 0x70
/* FDA74 001FD974 55000010 */  b          .L001FDACC
/* FDA78 001FD978 00000000 */   nop
.L001FD97C:
/* FDA7C 001FD97C 71001124 */  addiu      $17, $0, 0x71
/* FDA80 001FD980 52000010 */  b          .L001FDACC
/* FDA84 001FD984 00000000 */   nop
/* FDA88 001FD988 16008482 */  lb         $4, 0x16($20)
/* FDA8C 001FD98C 3C1E0300 */  dsll32     $3, $3, 24
/* FDA90 001FD990 3F1E0300 */  dsra32     $3, $3, 24
/* FDA94 001FD994 4D008314 */  bne        $4, $3, .L001FDACC
/* FDA98 001FD998 00000000 */   nop
/* FDA9C 001FD99C 15003126 */  addiu      $17, $17, 0x15
/* FDAA0 001FD9A0 4A000010 */  b          .L001FDACC
/* FDAA4 001FD9A4 00000000 */   nop
/* FDAA8 001FD9A8 3C260400 */  dsll32     $4, $4, 24
/* FDAAC 001FD9AC 3F260400 */  dsra32     $4, $4, 24
/* FDAB0 001FD9B0 01000324 */  addiu      $3, $0, 0x1
/* FDAB4 001FD9B4 45008314 */  bne        $4, $3, .L001FDACC
/* FDAB8 001FD9B8 00000000 */   nop
/* FDABC 001FD9BC 16008482 */  lb         $4, 0x16($20)
/* FDAC0 001FD9C0 3C1E0500 */  dsll32     $3, $5, 24
/* FDAC4 001FD9C4 3F1E0300 */  dsra32     $3, $3, 24
/* FDAC8 001FD9C8 40008314 */  bne        $4, $3, .L001FDACC
/* FDACC 001FD9CC 00000000 */   nop
/* FDAD0 001FD9D0 15003126 */  addiu      $17, $17, 0x15
/* FDAD4 001FD9D4 3D000010 */  b          .L001FDACC
/* FDAD8 001FD9D8 00000000 */   nop
/* FDADC 001FD9DC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDAE0 001FD9E0 8CEA248C */  lw         $4, -0x1574($at)
/* FDAE4 001FD9E4 02000324 */  addiu      $3, $0, 0x2
/* FDAE8 001FD9E8 37008310 */  beq        $4, $3, .L001FDAC8
/* FDAEC 001FD9EC 00000000 */   nop
/* FDAF0 001FD9F0 01000324 */  addiu      $3, $0, 0x1
/* FDAF4 001FD9F4 03008310 */  beq        $4, $3, .L001FDA04
/* FDAF8 001FD9F8 00000000 */   nop
/* FDAFC 001FD9FC 33000010 */  b          .L001FDACC
/* FDB00 001FDA00 00000000 */   nop
.L001FDA04:
/* FDB04 001FDA04 7495838F */  lw         $3, -0x6A8C($gp)
/* FDB08 001FDA08 10006484 */  lh         $4, 0x10($3)
/* FDB0C 001FDA0C 51008328 */  slti       $3, $4, 0x51
/* FDB10 001FDA10 13006014 */  bnez       $3, .L001FDA60
/* FDB14 001FDA14 00000000 */   nop
/* FDB18 001FDA18 F4019124 */  addiu      $17, $4, 0x1F4
/* FDB1C 001FDA1C DA01023C */  lui        $2, %hi(D_1D9EBC0)
/* FDB20 001FDA20 C0EB4424 */  addiu      $4, $2, %lo(D_1D9EBC0)
/* FDB24 001FDA24 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* FDB28 001FDA28 00000000 */   nop
/* FDB2C 001FDA2C 289E4070 */  paddub     $19, $2, $0
/* FDB30 001FDA30 7495838F */  lw         $3, -0x6A8C($gp)
/* FDB34 001FDA34 10006484 */  lh         $4, 0x10($3)
/* FDB38 001FDA38 5A000324 */  addiu      $3, $0, 0x5A
/* FDB3C 001FDA3C 23008314 */  bne        $4, $3, .L001FDACC
/* FDB40 001FDA40 00000000 */   nop
/* FDB44 001FDA44 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDB48 001FDA48 C2EB2484 */  lh         $4, -0x143E($at)
/* FDB4C 001FDA4C 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* FDB50 001FDA50 00000000 */   nop
/* FDB54 001FDA54 28964070 */  paddub     $18, $2, $0
/* FDB58 001FDA58 1C000010 */  b          .L001FDACC
/* FDB5C 001FDA5C 00000000 */   nop
.L001FDA60:
/* FDB60 001FDA60 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDB64 001FDA64 90EA238C */  lw         $3, -0x1570($at)
/* FDB68 001FDA68 40190300 */  sll        $3, $3, 5
/* FDB6C 001FDA6C 2120A302 */  addu       $4, $21, $3
/* FDB70 001FDA70 00008584 */  lh         $5, 0x0($4)
/* FDB74 001FDA74 5100A328 */  slti       $3, $5, 0x51
/* FDB78 001FDA78 14006014 */  bnez       $3, .L001FDACC
/* FDB7C 001FDA7C 00000000 */   nop
/* FDB80 001FDA80 F401B124 */  addiu      $17, $5, 0x1F4
/* FDB84 001FDA84 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* FDB88 001FDA88 00000000 */   nop
/* FDB8C 001FDA8C 289E4070 */  paddub     $19, $2, $0
/* FDB90 001FDA90 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDB94 001FDA94 90EA238C */  lw         $3, -0x1570($at)
/* FDB98 001FDA98 40190300 */  sll        $3, $3, 5
/* FDB9C 001FDA9C 2128A302 */  addu       $5, $21, $3
/* FDBA0 001FDAA0 0000A484 */  lh         $4, 0x0($5)
/* FDBA4 001FDAA4 5A000324 */  addiu      $3, $0, 0x5A
/* FDBA8 001FDAA8 08008314 */  bne        $4, $3, .L001FDACC
/* FDBAC 001FDAAC 00000000 */   nop
/* FDBB0 001FDAB0 0200A484 */  lh         $4, 0x2($5)
/* FDBB4 001FDAB4 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* FDBB8 001FDAB8 00000000 */   nop
/* FDBBC 001FDABC 28964070 */  paddub     $18, $2, $0
/* FDBC0 001FDAC0 02000010 */  b          .L001FDACC
/* FDBC4 001FDAC4 00000000 */   nop
.L001FDAC8:
/* FDBC8 001FDAC8 BE001124 */  addiu      $17, $0, 0xBE
.L001FDACC:
/* FDBCC 001FDACC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDBD0 001FDAD0 7CEA2684 */  lh         $6, -0x1584($at)
/* FDBD4 001FDAD4 0B000324 */  addiu      $3, $0, 0xB
/* FDBD8 001FDAD8 0E00C314 */  bne        $6, $3, .L001FDB14
/* FDBDC 001FDADC 00000000 */   nop
/* FDBE0 001FDAE0 2900033C */  lui        $3, %hi(_2679)
/* FDBE4 001FDAE4 F0326324 */  addiu      $3, $3, %lo(_2679)
/* FDBE8 001FDAE8 C000A527 */  addiu      $5, $sp, 0xC0
/* FDBEC 001FDAEC 00006478 */  lq         $4, 0x0($3)
/* FDBF0 001FDAF0 100063C4 */  lwc1       $f3, 0x10($3)
/* FDBF4 001FDAF4 0000A47C */  sq         $4, 0x0($5)
/* FDBF8 001FDAF8 1000A3E4 */  swc1       $f3, 0x10($5)
/* FDBFC 001FDAFC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDC00 001FDB00 78EA2380 */  lb         $3, -0x1588($at)
/* FDC04 001FDB04 40180300 */  sll        $3, $3, 1
/* FDC08 001FDB08 21187D00 */  addu       $3, $3, $sp
/* FDC0C 001FDB0C C0007084 */  lh         $16, 0xC0($3)
/* FDC10 001FDB10 00000000 */  nop
.L001FDB14:
/* FDC14 001FDB14 0D000324 */  addiu      $3, $0, 0xD
/* FDC18 001FDB18 0200C314 */  bne        $6, $3, .L001FDB24
/* FDC1C 001FDB1C 00000000 */   nop
/* FDC20 001FDB20 A5001024 */  addiu      $16, $0, 0xA5
.L001FDB24:
/* FDC24 001FDB24 0E000324 */  addiu      $3, $0, 0xE
/* FDC28 001FDB28 0B00C314 */  bne        $6, $3, .L001FDB58
/* FDC2C 001FDB2C 00000000 */   nop
/* FDC30 001FDB30 A6001024 */  addiu      $16, $0, 0xA6
/* FDC34 001FDB34 00008486 */  lh         $4, 0x0($20)
/* FDC38 001FDB38 0C010324 */  addiu      $3, $0, 0x10C
/* FDC3C 001FDB3C 06008314 */  bne        $4, $3, .L001FDB58
/* FDC40 001FDB40 00000000 */   nop
/* FDC44 001FDB44 E02F080C */  jal        GetMenuHebikiriFlag__Fv
/* FDC48 001FDB48 00000000 */   nop
/* FDC4C 001FDB4C 02004014 */  bnez       $2, .L001FDB58
/* FDC50 001FDB50 00000000 */   nop
/* FDC54 001FDB54 A7001024 */  addiu      $16, $0, 0xA7
.L001FDB58:
/* FDC58 001FDB58 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* FDC5C 001FDB5C 0C3A248C */  lw         $4, (0x1DA3A0C & 0xFFFF)($at)
/* FDC60 001FDB60 0F009114 */  bne        $4, $17, .L001FDBA0
/* FDC64 001FDB64 00000000 */   nop
/* FDC68 001FDB68 DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* FDC6C 001FDB6C 783A258C */  lw         $5, (0x1DA3A78 & 0xFFFF)($at)
/* FDC70 001FDB70 0B00B314 */  bne        $5, $19, .L001FDBA0
/* FDC74 001FDB74 00000000 */   nop
/* FDC78 001FDB78 4E020324 */  addiu      $3, $0, 0x24E
/* FDC7C 001FDB7C 1C008314 */  bne        $4, $3, .L001FDBF0
/* FDC80 001FDB80 00000000 */   nop
/* FDC84 001FDB84 DA01013C */  lui        $at, (0x1DA3A30 >> 16)
/* FDC88 001FDB88 303A248C */  lw         $4, (0x1DA3A30 & 0xFFFF)($at)
/* FDC8C 001FDB8C 64004326 */  addiu      $3, $18, 0x64
/* FDC90 001FDB90 03008314 */  bne        $4, $3, .L001FDBA0
/* FDC94 001FDB94 00000000 */   nop
/* FDC98 001FDB98 1500B310 */  beq        $5, $19, .L001FDBF0
/* FDC9C 001FDB9C 00000000 */   nop
.L001FDBA0:
/* FDCA0 001FDBA0 01000224 */  addiu      $2, $0, 0x1
/* FDCA4 001FDBA4 DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* FDCA8 001FDBA8 7C3A22AC */  sw         $2, (0x1DA3A7C & 0xFFFF)($at)
/* FDCAC 001FDBAC DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* FDCB0 001FDBB0 803A20AC */  sw         $0, (0x1DA3A80 & 0xFFFF)($at)
/* FDCB4 001FDBB4 0400401A */  blez       $18, .L001FDBC8
/* FDCB8 001FDBB8 00000000 */   nop
/* FDCBC 001FDBBC 64004226 */  addiu      $2, $18, 0x64
/* FDCC0 001FDBC0 DA01013C */  lui        $at, (0x1DA3A30 >> 16)
/* FDCC4 001FDBC4 303A22AC */  sw         $2, (0x1DA3A30 & 0xFFFF)($at)
.L001FDBC8:
/* FDCC8 001FDBC8 DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* FDCCC 001FDBCC 783A33AC */  sw         $19, (0x1DA3A78 & 0xFFFF)($at)
/* FDCD0 001FDBD0 FFFF0224 */  addiu      $2, $0, -0x1
/* FDCD4 001FDBD4 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* FDCD8 001FDBD8 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* FDCDC 001FDBDC DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* FDCE0 001FDBE0 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* FDCE4 001FDBE4 282E2072 */  paddub     $5, $17, $0
/* FDCE8 001FDBE8 5441050C */  jal        MakeMesWin__6ClsMesFi
/* FDCEC 001FDBEC 00000000 */   nop
.L001FDBF0:
/* FDCF0 001FDBF0 281E0070 */  paddub     $3, $0, $0
/* FDCF4 001FDBF4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDCF8 001FDBF8 72EA2484 */  lh         $4, -0x158E($at)
/* FDCFC 001FDBFC 05000524 */  addiu      $5, $0, 0x5
/* FDD00 001FDC00 04008510 */  beq        $4, $5, .L001FDC14
/* FDD04 001FDC04 00000000 */   nop
/* FDD08 001FDC08 07000524 */  addiu      $5, $0, 0x7
/* FDD0C 001FDC0C 2D008514 */  bne        $4, $5, .L001FDCC4
/* FDD10 001FDC10 00000000 */   nop
.L001FDC14:
/* FDD14 001FDC14 283E0070 */  paddub     $7, $0, $0
/* FDD18 001FDC18 25000010 */  b          .L001FDCB0
/* FDD1C 001FDC1C 00000000 */   nop
.L001FDC20:
/* FDD20 001FDC20 80400700 */  sll        $8, $7, 2
/* FDD24 001FDC24 DA01053C */  lui        $5, %hi(D_1DA2270)
/* FDD28 001FDC28 7022A524 */  addiu      $5, $5, %lo(D_1DA2270)
/* FDD2C 001FDC2C 2150A800 */  addu       $10, $5, $8
/* FDD30 001FDC30 00004685 */  lh         $6, 0x0($10)
/* FDD34 001FDC34 40280700 */  sll        $5, $7, 1
/* FDD38 001FDC38 2128BD00 */  addu       $5, $5, $sp
/* FDD3C 001FDC3C E800A524 */  addiu      $5, $5, 0xE8
/* FDD40 001FDC40 0000A6A4 */  sh         $6, 0x0($5)
/* FDD44 001FDC44 0000A684 */  lh         $6, 0x0($5)
/* FDD48 001FDC48 21281D01 */  addu       $5, $8, $sp
/* FDD4C 001FDC4C 9000AB84 */  lh         $11, 0x90($5)
/* FDD50 001FDC50 64006925 */  addiu      $9, $11, 0x64
/* FDD54 001FDC54 0500C910 */  beq        $6, $9, .L001FDC6C
/* FDD58 001FDC58 00000000 */   nop
/* FDD5C 001FDC5C 6500C128 */  slti       $at, $6, 0x65
/* FDD60 001FDC60 02002014 */  bnez       $at, .L001FDC6C
/* FDD64 001FDC64 00000000 */   nop
/* FDD68 001FDC68 01000324 */  addiu      $3, $0, 0x1
.L001FDC6C:
/* FDD6C 001FDC6C 21281D01 */  addu       $5, $8, $sp
/* FDD70 001FDC70 9200A684 */  lh         $6, 0x92($5)
/* FDD74 001FDC74 01000524 */  addiu      $5, $0, 0x1
/* FDD78 001FDC78 0400C514 */  bne        $6, $5, .L001FDC8C
/* FDD7C 001FDC7C 00000000 */   nop
/* FDD80 001FDC80 000049AD */  sw         $9, 0x0($10)
/* FDD84 001FDC84 05000010 */  b          .L001FDC9C
/* FDD88 001FDC88 00000000 */   nop
.L001FDC8C:
/* FDD8C 001FDC8C 0300C014 */  bnez       $6, .L001FDC9C
/* FDD90 001FDC90 00000000 */   nop
/* FDD94 001FDC94 02000524 */  addiu      $5, $0, 0x2
/* FDD98 001FDC98 000045AD */  sw         $5, 0x0($10)
.L001FDC9C:
/* FDD9C 001FDC9C 0300601D */  bgtz       $11, .L001FDCAC
/* FDDA0 001FDCA0 00000000 */   nop
/* FDDA4 001FDCA4 FFFF0524 */  addiu      $5, $0, -0x1
/* FDDA8 001FDCA8 000045AD */  sw         $5, 0x0($10)
.L001FDCAC:
/* FDDAC 001FDCAC 0100E724 */  addiu      $7, $7, 0x1
.L001FDCB0:
/* FDDB0 001FDCB0 0300E528 */  slti       $5, $7, 0x3
/* FDDB4 001FDCB4 DAFFA014 */  bnez       $5, .L001FDC20
/* FDDB8 001FDCB8 00000000 */   nop
/* FDDBC 001FDCBC 21000010 */  b          .L001FDD44
/* FDDC0 001FDCC0 00000000 */   nop
.L001FDCC4:
/* FDDC4 001FDCC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FDDC8 001FDCC8 E2BB2684 */  lh         $6, -0x441E($at)
/* FDDCC 001FDCCC FFFF0524 */  addiu      $5, $0, -0x1
/* FDDD0 001FDCD0 1C00C514 */  bne        $6, $5, .L001FDD44
/* FDDD4 001FDCD4 00000000 */   nop
/* FDDD8 001FDCD8 28460070 */  paddub     $8, $0, $0
/* FDDDC 001FDCDC 16000010 */  b          .L001FDD38
/* FDDE0 001FDCE0 00000000 */   nop
.L001FDCE4:
/* FDDE4 001FDCE4 FFFF0724 */  addiu      $7, $0, -0x1
/* FDDE8 001FDCE8 80300800 */  sll        $6, $8, 2
/* FDDEC 001FDCEC DA01053C */  lui        $5, %hi(D_1DA2270)
/* FDDF0 001FDCF0 7022A524 */  addiu      $5, $5, %lo(D_1DA2270)
/* FDDF4 001FDCF4 2128A600 */  addu       $5, $5, $6
/* FDDF8 001FDCF8 0000A7AC */  sw         $7, 0x0($5)
/* FDDFC 001FDCFC 0D000005 */  bltz       $8, .L001FDD34
/* FDE00 001FDD00 00000000 */   nop
/* FDE04 001FDD04 0A000129 */  slti       $at, $8, 0xA
/* FDE08 001FDD08 0A002010 */  beqz       $at, .L001FDD34
/* FDE0C 001FDD0C 00000000 */   nop
/* FDE10 001FDD10 C0300800 */  sll        $6, $8, 3
/* FDE14 001FDD14 DA01053C */  lui        $5, %hi(D_1DA22E0)
/* FDE18 001FDD18 E022A524 */  addiu      $5, $5, %lo(D_1DA22E0)
/* FDE1C 001FDD1C 2128A600 */  addu       $5, $5, $6
/* FDE20 001FDD20 0000A7AC */  sw         $7, 0x0($5)
/* FDE24 001FDD24 DA01053C */  lui        $5, %hi(D_1DA22E4)
/* FDE28 001FDD28 E422A524 */  addiu      $5, $5, %lo(D_1DA22E4)
/* FDE2C 001FDD2C 2128A600 */  addu       $5, $5, $6
/* FDE30 001FDD30 0000A7AC */  sw         $7, 0x0($5)
.L001FDD34:
/* FDE34 001FDD34 01000825 */  addiu      $8, $8, 0x1
.L001FDD38:
/* FDE38 001FDD38 04000529 */  slti       $5, $8, 0x4
/* FDE3C 001FDD3C E9FFA014 */  bnez       $5, .L001FDCE4
/* FDE40 001FDD40 00000000 */   nop
.L001FDD44:
/* FDE44 001FDD44 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* FDE48 001FDD48 4C22278C */  lw         $7, (0x1DA224C & 0xFFFF)($at)
/* FDE4C 001FDD4C 0600F010 */  beq        $7, $16, .L001FDD68
/* FDE50 001FDD50 00000000 */   nop
/* FDE54 001FDD54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FDE58 001FDD58 E2BB2684 */  lh         $6, -0x441E($at)
/* FDE5C 001FDD5C FFFF0524 */  addiu      $5, $0, -0x1
/* FDE60 001FDD60 1E00C510 */  beq        $6, $5, .L001FDDDC
/* FDE64 001FDD64 00000000 */   nop
.L001FDD68:
/* FDE68 001FDD68 05000524 */  addiu      $5, $0, 0x5
/* FDE6C 001FDD6C 04008510 */  beq        $4, $5, .L001FDD80
/* FDE70 001FDD70 00000000 */   nop
/* FDE74 001FDD74 07000524 */  addiu      $5, $0, 0x7
/* FDE78 001FDD78 03008514 */  bne        $4, $5, .L001FDD88
/* FDE7C 001FDD7C 00000000 */   nop
.L001FDD80:
/* FDE80 001FDD80 16006014 */  bnez       $3, .L001FDDDC
/* FDE84 001FDD84 00000000 */   nop
.L001FDD88:
/* FDE88 001FDD88 0600F010 */  beq        $7, $16, .L001FDDA4
/* FDE8C 001FDD8C 00000000 */   nop
/* FDE90 001FDD90 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDE94 001FDD94 7CEA2484 */  lh         $4, -0x1584($at)
/* FDE98 001FDD98 0B000324 */  addiu      $3, $0, 0xB
/* FDE9C 001FDD9C 0F008310 */  beq        $4, $3, .L001FDDDC
/* FDEA0 001FDDA0 00000000 */   nop
.L001FDDA4:
/* FDEA4 001FDDA4 0600F010 */  beq        $7, $16, .L001FDDC0
/* FDEA8 001FDDA8 00000000 */   nop
/* FDEAC 001FDDAC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDEB0 001FDDB0 7CEA2484 */  lh         $4, -0x1584($at)
/* FDEB4 001FDDB4 0D000324 */  addiu      $3, $0, 0xD
/* FDEB8 001FDDB8 08008310 */  beq        $4, $3, .L001FDDDC
/* FDEBC 001FDDBC 00000000 */   nop
.L001FDDC0:
/* FDEC0 001FDDC0 1E00F010 */  beq        $7, $16, .L001FDE3C
/* FDEC4 001FDDC4 00000000 */   nop
/* FDEC8 001FDDC8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDECC 001FDDCC 7CEA2484 */  lh         $4, -0x1584($at)
/* FDED0 001FDDD0 0E000324 */  addiu      $3, $0, 0xE
/* FDED4 001FDDD4 19008314 */  bne        $4, $3, .L001FDE3C
/* FDED8 001FDDD8 00000000 */   nop
.L001FDDDC:
/* FDEDC 001FDDDC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FDEE0 001FDDE0 7CEA2384 */  lh         $3, -0x1584($at)
/* FDEE4 001FDDE4 0E000224 */  addiu      $2, $0, 0xE
/* FDEE8 001FDDE8 09006210 */  beq        $3, $2, .L001FDE10
/* FDEEC 001FDDEC 00000000 */   nop
/* FDEF0 001FDDF0 0D000224 */  addiu      $2, $0, 0xD
/* FDEF4 001FDDF4 06006210 */  beq        $3, $2, .L001FDE10
/* FDEF8 001FDDF8 00000000 */   nop
/* FDEFC 001FDDFC 0B000224 */  addiu      $2, $0, 0xB
/* FDF00 001FDE00 03006210 */  beq        $3, $2, .L001FDE10
/* FDF04 001FDE04 00000000 */   nop
/* FDF08 001FDE08 04000010 */  b          .L001FDE1C
/* FDF0C 001FDE0C 00000000 */   nop
.L001FDE10:
/* FDF10 001FDE10 01000224 */  addiu      $2, $0, 0x1
/* FDF14 001FDE14 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* FDF18 001FDE18 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
.L001FDE1C:
/* FDF1C 001FDE1C FFFF0224 */  addiu      $2, $0, -0x1
/* FDF20 001FDE20 DA01013C */  lui        $at, (0x1DA224C >> 16)
/* FDF24 001FDE24 4C2222AC */  sw         $2, (0x1DA224C & 0xFFFF)($at)
/* FDF28 001FDE28 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* FDF2C 001FDE2C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* FDF30 001FDE30 282E0072 */  paddub     $5, $16, $0
/* FDF34 001FDE34 5441050C */  jal        MakeMesWin__6ClsMesFi
/* FDF38 001FDE38 00000000 */   nop
.L001FDE3C:
/* FDF3C 001FDE3C 8000BF7B */  lq         $31, 0x80($sp)
/* FDF40 001FDE40 7000B77B */  lq         $23, 0x70($sp)
/* FDF44 001FDE44 6000B67B */  lq         $22, 0x60($sp)
/* FDF48 001FDE48 5000B57B */  lq         $21, 0x50($sp)
/* FDF4C 001FDE4C 4000B47B */  lq         $20, 0x40($sp)
/* FDF50 001FDE50 3000B37B */  lq         $19, 0x30($sp)
/* FDF54 001FDE54 2000B27B */  lq         $18, 0x20($sp)
/* FDF58 001FDE58 1000B17B */  lq         $17, 0x10($sp)
/* FDF5C 001FDE5C 0000B07B */  lq         $16, 0x0($sp)
/* FDF60 001FDE60 F000BD27 */  addiu      $sp, $sp, 0xF0
/* FDF64 001FDE64 0800E003 */  jr         $31
/* FDF68 001FDE68 00000000 */   nop
/* FDF6C 001FDE6C 00000000 */  nop
