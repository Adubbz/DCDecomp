.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VillagerCollision__Fv_2
/* 9EAE0 0019E9E0 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* 9EAE4 0019E9E4 8000BF7F */  sq         $31, 0x80($sp)
/* 9EAE8 0019E9E8 7000B77F */  sq         $23, 0x70($sp)
/* 9EAEC 0019E9EC 6000B67F */  sq         $22, 0x60($sp)
/* 9EAF0 0019E9F0 5000B57F */  sq         $21, 0x50($sp)
/* 9EAF4 0019E9F4 4000B47F */  sq         $20, 0x40($sp)
/* 9EAF8 0019E9F8 3000B37F */  sq         $19, 0x30($sp)
/* 9EAFC 0019E9FC 2000B27F */  sq         $18, 0x20($sp)
/* 9EB00 0019EA00 1000B17F */  sq         $17, 0x10($sp)
/* 9EB04 0019EA04 0000B07F */  sq         $16, 0x0($sp)
/* 9EB08 0019EA08 FFFF1024 */  addiu      $16, $0, -0x1
/* 9EB0C 0019EA0C 99000010 */  b          .L0019EC74
/* 9EB10 0019EA10 00000000 */   nop
.L0019EA14:
/* 9EB14 0019EA14 28960070 */  paddub     $18, $0, $0
/* 9EB18 0019EA18 1F000006 */  bltz       $16, .L0019EA98
/* 9EB1C 0019EA1C 00000000 */   nop
/* 9EB20 0019EA20 40111000 */  sll        $2, $16, 5
/* 9EB24 0019EA24 21185000 */  addu       $3, $2, $16
/* 9EB28 0019EA28 80100300 */  sll        $2, $3, 2
/* 9EB2C 0019EA2C 21106200 */  addu       $2, $3, $2
/* 9EB30 0019EA30 40190200 */  sll        $3, $2, 5
/* 9EB34 0019EA34 D201023C */  lui        $2, %hi(EdVillager)
/* 9EB38 0019EA38 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 9EB3C 0019EA3C 21904300 */  addu       $18, $2, $3
/* 9EB40 0019EA40 80881000 */  sll        $17, $16, 2
/* 9EB44 0019EA44 D401023C */  lui        $2, %hi(D_1D3D244)
/* 9EB48 0019EA48 44D24224 */  addiu      $2, $2, %lo(D_1D3D244)
/* 9EB4C 0019EA4C 21105100 */  addu       $2, $2, $17
/* 9EB50 0019EA50 0000568C */  lw         $22, 0x0($2)
/* 9EB54 0019EA54 28264072 */  paddub     $4, $18, $0
/* 9EB58 0019EA58 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 9EB5C 0019EA5C 00000000 */   nop
/* 9EB60 0019EA60 83004010 */  beqz       $2, .L0019EC70
/* 9EB64 0019EA64 00000000 */   nop
/* 9EB68 0019EA68 28264072 */  paddub     $4, $18, $0
/* 9EB6C 0019EA6C 9000A527 */  addiu      $5, $sp, 0x90
/* 9EB70 0019EA70 A000598E */  lw         $25, 0xA0($18)
/* 9EB74 0019EA74 A000398F */  lw         $25, 0xA0($25)
/* 9EB78 0019EA78 09F82003 */  jalr       $25
/* 9EB7C 0019EA7C 00000000 */   nop
/* 9EB80 0019EA80 D401023C */  lui        $2, %hi(D_1D3D304)
/* 9EB84 0019EA84 04D34224 */  addiu      $2, $2, %lo(D_1D3D304)
/* 9EB88 0019EA88 21105100 */  addu       $2, $2, $17
/* 9EB8C 0019EA8C 0000538C */  lw         $19, 0x0($2)
/* 9EB90 0019EA90 0C000010 */  b          .L0019EAC4
/* 9EB94 0019EA94 00000000 */   nop
.L0019EA98:
/* 9EB98 0019EA98 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9EB9C 0019EA9C 2CD2368C */  lw         $22, -0x2DD4($at)
/* 9EBA0 0019EAA0 AC92848F */  lw         $4, -0x6D54($gp)
/* 9EBA4 0019EAA4 9000A527 */  addiu      $5, $sp, 0x90
/* 9EBA8 0019EAA8 A000998C */  lw         $25, 0xA0($4)
/* 9EBAC 0019EAAC A000398F */  lw         $25, 0xA0($25)
/* 9EBB0 0019EAB0 09F82003 */  jalr       $25
/* 9EBB4 0019EAB4 00000000 */   nop
/* 9EBB8 0019EAB8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 9EBBC 0019EABC 38D2338C */  lw         $19, -0x2DC8($at)
/* 9EBC0 0019EAC0 00000000 */  nop
.L0019EAC4:
/* 9EBC4 0019EAC4 988B828F */  lw         $2, -0x7468($gp)
/* 9EBC8 0019EAC8 080040AC */  sw         $0, 0x8($2)
/* 9EBCC 0019EACC 988B848F */  lw         $4, -0x7468($gp)
/* 9EBD0 0019EAD0 D0070524 */  addiu      $5, $0, 0x7D0
/* 9EBD4 0019EAD4 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 9EBD8 0019EAD8 00000000 */   nop
/* 9EBDC 0019EADC 28A64070 */  paddub     $20, $2, $0
/* 9EBE0 0019EAE0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 9EBE4 0019EAE4 00088244 */  mtc1       $2, $f1
/* 9EBE8 0019EAE8 9000A2C7 */  lwc1       $f2, 0x90($sp)
/* 9EBEC 0019EAEC 00080246 */  add.s      $f0, $f1, $f2
/* 9EBF0 0019EAF0 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* 9EBF4 0019EAF4 01100146 */  sub.s      $f0, $f2, $f1
/* 9EBF8 0019EAF8 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 9EBFC 0019EAFC 9800A2C7 */  lwc1       $f2, 0x98($sp)
/* 9EC00 0019EB00 00080246 */  add.s      $f0, $f1, $f2
/* 9EC04 0019EB04 A800A0E7 */  swc1       $f0, 0xA8($sp)
/* 9EC08 0019EB08 01100146 */  sub.s      $f0, $f2, $f1
/* 9EC0C 0019EB0C B800A0E7 */  swc1       $f0, 0xB8($sp)
/* 9EC10 0019EB10 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 9EC14 0019EB14 A400A2AF */  sw         $2, 0xA4($sp)
/* 9EC18 0019EB18 7AC4023C */  lui        $2, (0xC47A0000 >> 16)
/* 9EC1C 0019EB1C B400A2AF */  sw         $2, 0xB4($sp)
/* 9EC20 0019EB20 04000006 */  bltz       $16, .L0019EB34
/* 9EC24 0019EB24 00000000 */   nop
/* 9EC28 0019EB28 288E4072 */  paddub     $17, $18, $0
/* 9EC2C 0019EB2C 03000010 */  b          .L0019EB3C
/* 9EC30 0019EB30 00000000 */   nop
.L0019EB34:
/* 9EC34 0019EB34 AC92918F */  lw         $17, -0x6D54($gp)
/* 9EC38 0019EB38 00000000 */  nop
.L0019EB3C:
/* 9EC3C 0019EB3C 28262072 */  paddub     $4, $17, $0
/* 9EC40 0019EB40 282E0070 */  paddub     $5, $0, $0
/* 9EC44 0019EB44 88E0040C */  jal        FootSoundEnable__10CCharacterFi
/* 9EC48 0019EB48 00000000 */   nop
/* 9EC4C 0019EB4C 28268072 */  paddub     $4, $20, $0
/* 9EC50 0019EB50 A000A527 */  addiu      $5, $sp, 0xA0
/* 9EC54 0019EB54 487A060C */  jal        GetCollision__FP6CCPolyP7CBoxVu0_2
/* 9EC58 0019EB58 00000000 */   nop
/* 9EC5C 0019EB5C 28AE4070 */  paddub     $21, $2, $0
/* 9EC60 0019EB60 2D01A12A */  slti       $at, $21, 0x12D
/* 9EC64 0019EB64 06002014 */  bnez       $at, .L0019EB80
/* 9EC68 0019EB68 00000000 */   nop
/* 9EC6C 0019EB6C 2A00023C */  lui        $2, %hi(_1369)
/* 9EC70 0019EB70 30B34424 */  addiu      $4, $2, %lo(_1369)
/* 9EC74 0019EB74 282EA072 */  paddub     $5, $21, $0
/* 9EC78 0019EB78 A611040C */  jal        printf
/* 9EC7C 0019EB7C 00000000 */   nop
.L0019EB80:
/* 9EC80 0019EB80 2800A01A */  blez       $21, .L0019EC24
/* 9EC84 0019EB84 00000000 */   nop
/* 9EC88 0019EB88 9400B727 */  addiu      $23, $sp, 0x94
/* 9EC8C 0019EB8C 0000E1C6 */  lwc1       $f1, 0x0($23)
/* 9EC90 0019EB90 A041023C */  lui        $2, (0x41A00000 >> 16)
/* 9EC94 0019EB94 00008244 */  mtc1       $2, $f0
/* 9EC98 0019EB98 00000000 */  nop
/* 9EC9C 0019EB9C 00080046 */  add.s      $f0, $f1, $f0
/* 9ECA0 0019EBA0 0000E0E6 */  swc1       $f0, 0x0($23)
/* 9ECA4 0019EBA4 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 9ECA8 0019EBA8 00608244 */  mtc1       $2, $f12
/* 9ECAC 0019EBAC 9000A427 */  addiu      $4, $sp, 0x90
/* 9ECB0 0019EBB0 D000A527 */  addiu      $5, $sp, 0xD0
/* 9ECB4 0019EBB4 C000A627 */  addiu      $6, $sp, 0xC0
/* 9ECB8 0019EBB8 283E8072 */  paddub     $7, $20, $0
/* 9ECBC 0019EBBC 2846A072 */  paddub     $8, $21, $0
/* 9ECC0 0019EBC0 284E0070 */  paddub     $9, $0, $0
/* 9ECC4 0019EBC4 EC2A050C */  jal        GetFootPoly__FPffP6CCPolyPfP6CCPolyii
/* 9ECC8 0019EBC8 00000000 */   nop
/* 9ECCC 0019EBCC 12004010 */  beqz       $2, .L0019EC18
/* 9ECD0 0019EBD0 00000000 */   nop
/* 9ECD4 0019EBD4 9000A427 */  addiu      $4, $sp, 0x90
/* 9ECD8 0019EBD8 C000A527 */  addiu      $5, $sp, 0xC0
/* 9ECDC 0019EBDC 0C86040C */  jal        sceVu0CopyVector
/* 9ECE0 0019EBE0 00000000 */   nop
/* 9ECE4 0019EBE4 28262072 */  paddub     $4, $17, $0
/* 9ECE8 0019EBE8 282E6072 */  paddub     $5, $19, $0
/* 9ECEC 0019EBEC 88E0040C */  jal        FootSoundEnable__10CCharacterFi
/* 9ECF0 0019EBF0 00000000 */   nop
/* 9ECF4 0019EBF4 01000324 */  addiu      $3, $0, 0x1
/* 9ECF8 0019EBF8 0B006316 */  bne        $19, $3, .L0019EC28
/* 9ECFC 0019EBFC 00000000 */   nop
/* 9ED00 0019EC00 1201A587 */  lh         $5, 0x112($sp)
/* 9ED04 0019EC04 28262072 */  paddub     $4, $17, $0
/* 9ED08 0019EC08 84E0040C */  jal        SetFootSoundID__10CCharacterFi
/* 9ED0C 0019EC0C 00000000 */   nop
/* 9ED10 0019EC10 05000010 */  b          .L0019EC28
/* 9ED14 0019EC14 00000000 */   nop
.L0019EC18:
/* 9ED18 0019EC18 0000E0AE */  sw         $0, 0x0($23)
/* 9ED1C 0019EC1C 02000010 */  b          .L0019EC28
/* 9ED20 0019EC20 00000000 */   nop
.L0019EC24:
/* 9ED24 0019EC24 9400A0AF */  sw         $0, 0x94($sp)
.L0019EC28:
/* 9ED28 0019EC28 1100C012 */  beqz       $22, .L0019EC70
/* 9ED2C 0019EC2C 00000000 */   nop
/* 9ED30 0019EC30 09000006 */  bltz       $16, .L0019EC58
/* 9ED34 0019EC34 00000000 */   nop
/* 9ED38 0019EC38 28264072 */  paddub     $4, $18, $0
/* 9ED3C 0019EC3C 9000A527 */  addiu      $5, $sp, 0x90
/* 9ED40 0019EC40 A000598E */  lw         $25, 0xA0($18)
/* 9ED44 0019EC44 1400398F */  lw         $25, 0x14($25)
/* 9ED48 0019EC48 09F82003 */  jalr       $25
/* 9ED4C 0019EC4C 00000000 */   nop
/* 9ED50 0019EC50 07000010 */  b          .L0019EC70
/* 9ED54 0019EC54 00000000 */   nop
.L0019EC58:
/* 9ED58 0019EC58 AC92848F */  lw         $4, -0x6D54($gp)
/* 9ED5C 0019EC5C 9000A527 */  addiu      $5, $sp, 0x90
/* 9ED60 0019EC60 A000998C */  lw         $25, 0xA0($4)
/* 9ED64 0019EC64 1400398F */  lw         $25, 0x14($25)
/* 9ED68 0019EC68 09F82003 */  jalr       $25
/* 9ED6C 0019EC6C 00000000 */   nop
.L0019EC70:
/* 9ED70 0019EC70 01001026 */  addiu      $16, $16, 0x1
.L0019EC74:
/* 9ED74 0019EC74 0A00032A */  slti       $3, $16, 0xA
/* 9ED78 0019EC78 66FF6014 */  bnez       $3, .L0019EA14
/* 9ED7C 0019EC7C 00000000 */   nop
/* 9ED80 0019EC80 8000BF7B */  lq         $31, 0x80($sp)
/* 9ED84 0019EC84 7000B77B */  lq         $23, 0x70($sp)
/* 9ED88 0019EC88 6000B67B */  lq         $22, 0x60($sp)
/* 9ED8C 0019EC8C 5000B57B */  lq         $21, 0x50($sp)
/* 9ED90 0019EC90 4000B47B */  lq         $20, 0x40($sp)
/* 9ED94 0019EC94 3000B37B */  lq         $19, 0x30($sp)
/* 9ED98 0019EC98 2000B27B */  lq         $18, 0x20($sp)
/* 9ED9C 0019EC9C 1000B17B */  lq         $17, 0x10($sp)
/* 9EDA0 0019ECA0 0000B07B */  lq         $16, 0x0($sp)
/* 9EDA4 0019ECA4 2001BD27 */  addiu      $sp, $sp, 0x120
/* 9EDA8 0019ECA8 0800E003 */  jr         $31
/* 9EDAC 0019ECAC 00000000 */   nop
