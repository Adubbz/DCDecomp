.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VillagerCollision__Fv
/* 7FAA0 0017F9A0 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* 7FAA4 0017F9A4 8000BF7F */  sq         $31, 0x80($sp)
/* 7FAA8 0017F9A8 7000B77F */  sq         $23, 0x70($sp)
/* 7FAAC 0017F9AC 6000B67F */  sq         $22, 0x60($sp)
/* 7FAB0 0017F9B0 5000B57F */  sq         $21, 0x50($sp)
/* 7FAB4 0017F9B4 4000B47F */  sq         $20, 0x40($sp)
/* 7FAB8 0017F9B8 3000B37F */  sq         $19, 0x30($sp)
/* 7FABC 0017F9BC 2000B27F */  sq         $18, 0x20($sp)
/* 7FAC0 0017F9C0 1000B17F */  sq         $17, 0x10($sp)
/* 7FAC4 0017F9C4 0000B07F */  sq         $16, 0x0($sp)
/* 7FAC8 0017F9C8 FFFF1024 */  addiu      $16, $0, -0x1
/* 7FACC 0017F9CC C4000010 */  b          .L0017FCE0
/* 7FAD0 0017F9D0 00000000 */   nop
.L0017F9D4:
/* 7FAD4 0017F9D4 28960070 */  paddub     $18, $0, $0
/* 7FAD8 0017F9D8 1F000006 */  bltz       $16, .L0017FA58
/* 7FADC 0017F9DC 00000000 */   nop
/* 7FAE0 0017F9E0 40111000 */  sll        $2, $16, 5
/* 7FAE4 0017F9E4 21185000 */  addu       $3, $2, $16
/* 7FAE8 0017F9E8 80100300 */  sll        $2, $3, 2
/* 7FAEC 0017F9EC 21106200 */  addu       $2, $3, $2
/* 7FAF0 0017F9F0 40190200 */  sll        $3, $2, 5
/* 7FAF4 0017F9F4 D201023C */  lui        $2, %hi(EdVillager)
/* 7FAF8 0017F9F8 905B4224 */  addiu      $2, $2, %lo(EdVillager)
/* 7FAFC 0017F9FC 21904300 */  addu       $18, $2, $3
/* 7FB00 0017FA00 80881000 */  sll        $17, $16, 2
/* 7FB04 0017FA04 D401023C */  lui        $2, %hi(D_1D3D244)
/* 7FB08 0017FA08 44D24224 */  addiu      $2, $2, %lo(D_1D3D244)
/* 7FB0C 0017FA0C 21105100 */  addu       $2, $2, $17
/* 7FB10 0017FA10 0000578C */  lw         $23, 0x0($2)
/* 7FB14 0017FA14 28264072 */  paddub     $4, $18, $0
/* 7FB18 0017FA18 9C59050C */  jal        CheckDraw__12CNPCharacterFv
/* 7FB1C 0017FA1C 00000000 */   nop
/* 7FB20 0017FA20 AE004010 */  beqz       $2, .L0017FCDC
/* 7FB24 0017FA24 00000000 */   nop
/* 7FB28 0017FA28 28264072 */  paddub     $4, $18, $0
/* 7FB2C 0017FA2C 9000A527 */  addiu      $5, $sp, 0x90
/* 7FB30 0017FA30 A000598E */  lw         $25, 0xA0($18)
/* 7FB34 0017FA34 A000398F */  lw         $25, 0xA0($25)
/* 7FB38 0017FA38 09F82003 */  jalr       $25
/* 7FB3C 0017FA3C 00000000 */   nop
/* 7FB40 0017FA40 D401023C */  lui        $2, %hi(D_1D3D304)
/* 7FB44 0017FA44 04D34224 */  addiu      $2, $2, %lo(D_1D3D304)
/* 7FB48 0017FA48 21105100 */  addu       $2, $2, $17
/* 7FB4C 0017FA4C 0000538C */  lw         $19, 0x0($2)
/* 7FB50 0017FA50 0C000010 */  b          .L0017FA84
/* 7FB54 0017FA54 00000000 */   nop
.L0017FA58:
/* 7FB58 0017FA58 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7FB5C 0017FA5C 2CD2378C */  lw         $23, -0x2DD4($at)
/* 7FB60 0017FA60 6487848F */  lw         $4, -0x789C($gp)
/* 7FB64 0017FA64 9000A527 */  addiu      $5, $sp, 0x90
/* 7FB68 0017FA68 A000998C */  lw         $25, 0xA0($4)
/* 7FB6C 0017FA6C A000398F */  lw         $25, 0xA0($25)
/* 7FB70 0017FA70 09F82003 */  jalr       $25
/* 7FB74 0017FA74 00000000 */   nop
/* 7FB78 0017FA78 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 7FB7C 0017FA7C 38D2338C */  lw         $19, -0x2DC8($at)
/* 7FB80 0017FA80 00000000 */  nop
.L0017FA84:
/* 7FB84 0017FA84 988B828F */  lw         $2, -0x7468($gp)
/* 7FB88 0017FA88 080040AC */  sw         $0, 0x8($2)
/* 7FB8C 0017FA8C 988B848F */  lw         $4, -0x7468($gp)
/* 7FB90 0017FA90 D0070524 */  addiu      $5, $0, 0x7D0
/* 7FB94 0017FA94 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 7FB98 0017FA98 00000000 */   nop
/* 7FB9C 0017FA9C 28B64070 */  paddub     $22, $2, $0
/* 7FBA0 0017FAA0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7FBA4 0017FAA4 00088244 */  mtc1       $2, $f1
/* 7FBA8 0017FAA8 9000A2C7 */  lwc1       $f2, 0x90($sp)
/* 7FBAC 0017FAAC 00080246 */  add.s      $f0, $f1, $f2
/* 7FBB0 0017FAB0 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* 7FBB4 0017FAB4 01100146 */  sub.s      $f0, $f2, $f1
/* 7FBB8 0017FAB8 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* 7FBBC 0017FABC 9800A2C7 */  lwc1       $f2, 0x98($sp)
/* 7FBC0 0017FAC0 00080246 */  add.s      $f0, $f1, $f2
/* 7FBC4 0017FAC4 A800A0E7 */  swc1       $f0, 0xA8($sp)
/* 7FBC8 0017FAC8 01100146 */  sub.s      $f0, $f2, $f1
/* 7FBCC 0017FACC B800A0E7 */  swc1       $f0, 0xB8($sp)
/* 7FBD0 0017FAD0 9400B527 */  addiu      $21, $sp, 0x94
/* 7FBD4 0017FAD4 0000A3C6 */  lwc1       $f3, 0x0($21)
/* 7FBD8 0017FAD8 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 7FBDC 0017FADC 00108244 */  mtc1       $2, $f2
/* 7FBE0 0017FAE0 00000000 */  nop
/* 7FBE4 0017FAE4 00100346 */  add.s      $f0, $f2, $f3
/* 7FBE8 0017FAE8 2041023C */  lui        $2, (0x41200000 >> 16)
/* 7FBEC 0017FAEC 00088244 */  mtc1       $2, $f1
/* 7FBF0 0017FAF0 00000000 */  nop
/* 7FBF4 0017FAF4 00080046 */  add.s      $f0, $f1, $f0
/* 7FBF8 0017FAF8 A400A0E7 */  swc1       $f0, 0xA4($sp)
/* 7FBFC 0017FAFC 01180246 */  sub.s      $f0, $f3, $f2
/* 7FC00 0017FB00 00080046 */  add.s      $f0, $f1, $f0
/* 7FC04 0017FB04 B400A0E7 */  swc1       $f0, 0xB4($sp)
/* 7FC08 0017FB08 04000006 */  bltz       $16, .L0017FB1C
/* 7FC0C 0017FB0C 00000000 */   nop
/* 7FC10 0017FB10 288E4072 */  paddub     $17, $18, $0
/* 7FC14 0017FB14 03000010 */  b          .L0017FB24
/* 7FC18 0017FB18 00000000 */   nop
.L0017FB1C:
/* 7FC1C 0017FB1C 6487918F */  lw         $17, -0x789C($gp)
/* 7FC20 0017FB20 00000000 */  nop
.L0017FB24:
/* 7FC24 0017FB24 01000224 */  addiu      $2, $0, 0x1
/* 7FC28 0017FB28 05006216 */  bne        $19, $2, .L0017FB40
/* 7FC2C 0017FB2C 00000000 */   nop
/* 7FC30 0017FB30 28262072 */  paddub     $4, $17, $0
/* 7FC34 0017FB34 282E0070 */  paddub     $5, $0, $0
/* 7FC38 0017FB38 88E0040C */  jal        FootSoundEnable__10CCharacterFi
/* 7FC3C 0017FB3C 00000000 */   nop
.L0017FB40:
/* 7FC40 0017FB40 2826C072 */  paddub     $4, $22, $0
/* 7FC44 0017FB44 A000A527 */  addiu      $5, $sp, 0xA0
/* 7FC48 0017FB48 FCFC050C */  jal        GetCollision__FP6CCPolyP7CBoxVu0
/* 7FC4C 0017FB4C 00000000 */   nop
/* 7FC50 0017FB50 28A64070 */  paddub     $20, $2, $0
/* 7FC54 0017FB54 C900812A */  slti       $at, $20, 0xC9
/* 7FC58 0017FB58 06002014 */  bnez       $at, .L0017FB74
/* 7FC5C 0017FB5C 00000000 */   nop
/* 7FC60 0017FB60 2A00023C */  lui        $2, %hi(_2533)
/* 7FC64 0017FB64 90AC4424 */  addiu      $4, $2, %lo(_2533)
/* 7FC68 0017FB68 282E8072 */  paddub     $5, $20, $0
/* 7FC6C 0017FB6C A611040C */  jal        printf
/* 7FC70 0017FB70 00000000 */   nop
.L0017FB74:
/* 7FC74 0017FB74 4600801A */  blez       $20, .L0017FC90
/* 7FC78 0017FB78 00000000 */   nop
/* 7FC7C 0017FB7C 0000A1C6 */  lwc1       $f1, 0x0($21)
/* 7FC80 0017FB80 A041023C */  lui        $2, (0x41A00000 >> 16)
/* 7FC84 0017FB84 00008244 */  mtc1       $2, $f0
/* 7FC88 0017FB88 00000000 */  nop
/* 7FC8C 0017FB8C 00080046 */  add.s      $f0, $f1, $f0
/* 7FC90 0017FB90 0000A0E6 */  swc1       $f0, 0x0($21)
/* 7FC94 0017FB94 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 7FC98 0017FB98 00608244 */  mtc1       $2, $f12
/* 7FC9C 0017FB9C 9000A427 */  addiu      $4, $sp, 0x90
/* 7FCA0 0017FBA0 D000A527 */  addiu      $5, $sp, 0xD0
/* 7FCA4 0017FBA4 C000A627 */  addiu      $6, $sp, 0xC0
/* 7FCA8 0017FBA8 283EC072 */  paddub     $7, $22, $0
/* 7FCAC 0017FBAC 28468072 */  paddub     $8, $20, $0
/* 7FCB0 0017FBB0 284E0070 */  paddub     $9, $0, $0
/* 7FCB4 0017FBB4 EC2A050C */  jal        GetFootPoly__FPffP6CCPolyPfP6CCPolyii
/* 7FCB8 0017FBB8 00000000 */   nop
/* 7FCBC 0017FBBC 31004010 */  beqz       $2, .L0017FC84
/* 7FCC0 0017FBC0 00000000 */   nop
/* 7FCC4 0017FBC4 9000A427 */  addiu      $4, $sp, 0x90
/* 7FCC8 0017FBC8 C000A527 */  addiu      $5, $sp, 0xC0
/* 7FCCC 0017FBCC 0C86040C */  jal        sceVu0CopyVector
/* 7FCD0 0017FBD0 00000000 */   nop
/* 7FCD4 0017FBD4 28262072 */  paddub     $4, $17, $0
/* 7FCD8 0017FBD8 282E6072 */  paddub     $5, $19, $0
/* 7FCDC 0017FBDC 88E0040C */  jal        FootSoundEnable__10CCharacterFi
/* 7FCE0 0017FBE0 00000000 */   nop
/* 7FCE4 0017FBE4 01000224 */  addiu      $2, $0, 0x1
/* 7FCE8 0017FBE8 05006216 */  bne        $19, $2, .L0017FC00
/* 7FCEC 0017FBEC 00000000 */   nop
/* 7FCF0 0017FBF0 1201A587 */  lh         $5, 0x112($sp)
/* 7FCF4 0017FBF4 28262072 */  paddub     $4, $17, $0
/* 7FCF8 0017FBF8 84E0040C */  jal        SetFootSoundID__10CCharacterFi
/* 7FCFC 0017FBFC 00000000 */   nop
.L0017FC00:
/* 7FD00 0017FC00 6090828F */  lw         $2, -0x6FA0($gp)
/* 7FD04 0017FC04 B00C2426 */  addiu      $4, $17, 0xCB0
/* 7FD08 0017FC08 A0094524 */  addiu      $5, $2, 0x9A0
/* 7FD0C 0017FC0C 0C86040C */  jal        sceVu0CopyVector
/* 7FD10 0017FC10 00000000 */   nop
/* 7FD14 0017FC14 6090828F */  lw         $2, -0x6FA0($gp)
/* 7FD18 0017FC18 C00C2426 */  addiu      $4, $17, 0xCC0
/* 7FD1C 0017FC1C B0094524 */  addiu      $5, $2, 0x9B0
/* 7FD20 0017FC20 0C86040C */  jal        sceVu0CopyVector
/* 7FD24 0017FC24 00000000 */   nop
/* 7FD28 0017FC28 FFFF0324 */  addiu      $3, $0, -0x1
/* 7FD2C 0017FC2C A00C23AE */  sw         $3, 0xCA0($17)
/* 7FD30 0017FC30 9C0C20AE */  sw         $0, 0xC9C($17)
/* 7FD34 0017FC34 1401A487 */  lh         $4, 0x114($sp)
/* 7FD38 0017FC38 04000324 */  addiu      $3, $0, 0x4
/* 7FD3C 0017FC3C 0D008310 */  beq        $4, $3, .L0017FC74
/* 7FD40 0017FC40 00000000 */   nop
/* 7FD44 0017FC44 03000324 */  addiu      $3, $0, 0x3
/* 7FD48 0017FC48 0A008310 */  beq        $4, $3, .L0017FC74
/* 7FD4C 0017FC4C 00000000 */   nop
/* 7FD50 0017FC50 02000324 */  addiu      $3, $0, 0x2
/* 7FD54 0017FC54 03008310 */  beq        $4, $3, .L0017FC64
/* 7FD58 0017FC58 00000000 */   nop
/* 7FD5C 0017FC5C 0D000010 */  b          .L0017FC94
/* 7FD60 0017FC60 00000000 */   nop
.L0017FC64:
/* 7FD64 0017FC64 01000324 */  addiu      $3, $0, 0x1
/* 7FD68 0017FC68 9C0C23AE */  sw         $3, 0xC9C($17)
/* 7FD6C 0017FC6C 09000010 */  b          .L0017FC94
/* 7FD70 0017FC70 00000000 */   nop
.L0017FC74:
/* 7FD74 0017FC74 FDFF8324 */  addiu      $3, $4, -0x3
/* 7FD78 0017FC78 A00C23AE */  sw         $3, 0xCA0($17)
/* 7FD7C 0017FC7C 05000010 */  b          .L0017FC94
/* 7FD80 0017FC80 00000000 */   nop
.L0017FC84:
/* 7FD84 0017FC84 0000A0AE */  sw         $0, 0x0($21)
/* 7FD88 0017FC88 02000010 */  b          .L0017FC94
/* 7FD8C 0017FC8C 00000000 */   nop
.L0017FC90:
/* 7FD90 0017FC90 0000A0AE */  sw         $0, 0x0($21)
.L0017FC94:
/* 7FD94 0017FC94 1100E012 */  beqz       $23, .L0017FCDC
/* 7FD98 0017FC98 00000000 */   nop
/* 7FD9C 0017FC9C 09000006 */  bltz       $16, .L0017FCC4
/* 7FDA0 0017FCA0 00000000 */   nop
/* 7FDA4 0017FCA4 28264072 */  paddub     $4, $18, $0
/* 7FDA8 0017FCA8 9000A527 */  addiu      $5, $sp, 0x90
/* 7FDAC 0017FCAC A000598E */  lw         $25, 0xA0($18)
/* 7FDB0 0017FCB0 1400398F */  lw         $25, 0x14($25)
/* 7FDB4 0017FCB4 09F82003 */  jalr       $25
/* 7FDB8 0017FCB8 00000000 */   nop
/* 7FDBC 0017FCBC 07000010 */  b          .L0017FCDC
/* 7FDC0 0017FCC0 00000000 */   nop
.L0017FCC4:
/* 7FDC4 0017FCC4 6487848F */  lw         $4, -0x789C($gp)
/* 7FDC8 0017FCC8 9000A527 */  addiu      $5, $sp, 0x90
/* 7FDCC 0017FCCC A000998C */  lw         $25, 0xA0($4)
/* 7FDD0 0017FCD0 1400398F */  lw         $25, 0x14($25)
/* 7FDD4 0017FCD4 09F82003 */  jalr       $25
/* 7FDD8 0017FCD8 00000000 */   nop
.L0017FCDC:
/* 7FDDC 0017FCDC 01001026 */  addiu      $16, $16, 0x1
.L0017FCE0:
/* 7FDE0 0017FCE0 0A00032A */  slti       $3, $16, 0xA
/* 7FDE4 0017FCE4 3BFF6014 */  bnez       $3, .L0017F9D4
/* 7FDE8 0017FCE8 00000000 */   nop
/* 7FDEC 0017FCEC 8000BF7B */  lq         $31, 0x80($sp)
/* 7FDF0 0017FCF0 7000B77B */  lq         $23, 0x70($sp)
/* 7FDF4 0017FCF4 6000B67B */  lq         $22, 0x60($sp)
/* 7FDF8 0017FCF8 5000B57B */  lq         $21, 0x50($sp)
/* 7FDFC 0017FCFC 4000B47B */  lq         $20, 0x40($sp)
/* 7FE00 0017FD00 3000B37B */  lq         $19, 0x30($sp)
/* 7FE04 0017FD04 2000B27B */  lq         $18, 0x20($sp)
/* 7FE08 0017FD08 1000B17B */  lq         $17, 0x10($sp)
/* 7FE0C 0017FD0C 0000B07B */  lq         $16, 0x0($sp)
/* 7FE10 0017FD10 2001BD27 */  addiu      $sp, $sp, 0x120
/* 7FE14 0017FD14 0800E003 */  jr         $31
/* 7FE18 0017FD18 00000000 */   nop
/* 7FE1C 0017FD1C 00000000 */  nop
