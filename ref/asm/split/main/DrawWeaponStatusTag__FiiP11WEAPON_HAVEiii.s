.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
/* 0FA1B0 001FA0B0 40FEBD27 */  addiu       $29, $29, -0x1C0
/* 0FA1B4 001FA0B4 A000BF7F */  sq          $31, 0xA0($29)
/* 0FA1B8 001FA0B8 9000BE7F */  sq          $30, 0x90($29)
/* 0FA1BC 001FA0BC 8000B77F */  sq          $23, 0x80($29)
/* 0FA1C0 001FA0C0 7000B67F */  sq          $22, 0x70($29)
/* 0FA1C4 001FA0C4 6000B57F */  sq          $21, 0x60($29)
/* 0FA1C8 001FA0C8 5000B47F */  sq          $20, 0x50($29)
/* 0FA1CC 001FA0CC 4000B37F */  sq          $19, 0x40($29)
/* 0FA1D0 001FA0D0 3000B27F */  sq          $18, 0x30($29)
/* 0FA1D4 001FA0D4 2000B17F */  sq          $17, 0x20($29)
/* 0FA1D8 001FA0D8 1000B07F */  sq          $16, 0x10($29)
/* 0FA1DC 001FA0DC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0FA1E0 001FA0E0 BC00A4AF */  sw          $4, 0xBC($29)
/* 0FA1E4 001FA0E4 B800A5AF */  sw          $5, 0xB8($29)
/* 0FA1E8 001FA0E8 28AEC070 */  paddub      $21, $6, $0
/* 0FA1EC 001FA0EC 28B6E070 */  paddub      $22, $7, $0
/* 0FA1F0 001FA0F0 28A62071 */  paddub      $20, $9, $0
/* 0FA1F4 001FA0F4 28860070 */  paddub      $16, $0, $0
/* 0FA1F8 001FA0F8 01000224 */  addiu       $2, $0, 0x1
/* 0FA1FC 001FA0FC 0500C216 */  bne         $22, $2, .L001FA114
/* 0FA200 001FA100 00000000 */   nop
/* 0FA204 001FA104 28260071 */  paddub      $4, $8, $0
/* 0FA208 001FA108 D443070C */  jal         GetWeaponData__Fi
/* 0FA20C 001FA10C 00000000 */   nop
/* 0FA210 001FA110 28864070 */  paddub      $16, $2, $0
.L001FA114:
/* 0FA214 001FA114 2900023C */  lui         $2, %hi(LIT_1909)
/* 0FA218 001FA118 90304224 */  addiu       $2, $2, %lo(LIT_1909)
/* 0FA21C 001FA11C C000A327 */  addiu       $3, $29, 0xC0
/* 0FA220 001FA120 00004278 */  lq          $2, 0x0($2)
/* 0FA224 001FA124 0000627C */  sq          $2, 0x0($3)
/* 0FA228 001FA128 BC00A28F */  lw          $2, 0xBC($29)
/* 0FA22C 001FA12C 4B004224 */  addiu       $2, $2, 0x4B
/* 0FA230 001FA130 C000A2AF */  sw          $2, 0xC0($29)
/* 0FA234 001FA134 B800A28F */  lw          $2, 0xB8($29)
/* 0FA238 001FA138 30004224 */  addiu       $2, $2, 0x30
/* 0FA23C 001FA13C C400B727 */  addiu       $23, $29, 0xC4
/* 0FA240 001FA140 0000E2AE */  sw          $2, 0x0($23)
/* 0FA244 001FA144 BC01A227 */  addiu       $2, $29, 0x1BC
/* 0FA248 001FA148 788880C7 */  lwc1        $f0, -0x7788($28)
/* 0FA24C 001FA14C 000040E4 */  swc1        $f0, 0x0($2)
/* 0FA250 001FA150 1000B4C6 */  lwc1        $f20, 0x10($21)
/* 0FA254 001FA154 06A30046 */  mov.s       $f12, $f20
/* 0FA258 001FA158 2C44040C */  jal         fptosi
/* 0FA25C 001FA15C 00000000 */   nop
/* 0FA260 001FA160 BC01A2A7 */  sh          $2, 0x1BC($29)
/* 0FA264 001FA164 0C00B386 */  lh          $19, 0xC($21)
/* 0FA268 001FA168 BE01B3A7 */  sh          $19, 0x1BE($29)
/* 0FA26C 001FA16C C000B18F */  lw          $17, 0xC0($29)
/* 0FA270 001FA170 0000F28E */  lw          $18, 0x0($23)
/* 0FA274 001FA174 06A30046 */  mov.s       $f12, $f20
/* 0FA278 001FA178 2C44040C */  jal         fptosi
/* 0FA27C 001FA17C 00000000 */   nop
/* 0FA280 001FA180 B400A2AF */  sw          $2, 0xB4($29)
/* 0FA284 001FA184 00008244 */  mtc1        $2, $f0
/* 0FA288 001FA188 00000000 */  nop
/* 0FA28C 001FA18C 20008046 */  cvt.s.w     $f0, $f0
/* 0FA290 001FA190 34001446 */  c.lt.s      $f0, $f20
/* 0FA294 001FA194 00000000 */  nop
/* 0FA298 001FA198 08000045 */  bc1f        .L001FA1BC
/* 0FA29C 001FA19C 00000000 */   nop
/* 0FA2A0 001FA1A0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0FA2A4 001FA1A4 00008244 */  mtc1        $2, $f0
/* 0FA2A8 001FA1A8 00000000 */  nop
/* 0FA2AC 001FA1AC 00031446 */  add.s       $f12, $f0, $f20
/* 0FA2B0 001FA1B0 2C44040C */  jal         fptosi
/* 0FA2B4 001FA1B4 00000000 */   nop
/* 0FA2B8 001FA1B8 B400A2AF */  sw          $2, 0xB4($29)
.L001FA1BC:
/* 0FA2BC 001FA1BC 80111300 */  sll         $2, $19, 6
/* 0FA2C0 001FA1C0 23105300 */  subu        $2, $2, $19
/* 0FA2C4 001FA1C4 40180200 */  sll         $3, $2, 1
/* 0FA2C8 001FA1C8 63000224 */  addiu       $2, $0, 0x63
/* 0FA2CC 001FA1CC 1A006200 */  div         $0, $3, $2
/* 0FA2D0 001FA1D0 02004014 */  bnez        $2, .L001FA1DC
/* 0FA2D4 001FA1D4 00000000 */   nop
/* 0FA2D8 001FA1D8 CD010000 */  break       0, 7
.L001FA1DC:
/* 0FA2DC 001FA1DC 12180000 */  mflo        $3
/* 0FA2E0 001FA1E0 B400A28F */  lw          $2, 0xB4($29)
/* 0FA2E4 001FA1E4 18104300 */  mult        $2, $2, $3
/* 0FA2E8 001FA1E8 1A005300 */  div         $0, $2, $19
/* 0FA2EC 001FA1EC 02006016 */  bnez        $19, .L001FA1F8
/* 0FA2F0 001FA1F0 00000000 */   nop
/* 0FA2F4 001FA1F4 CD010000 */  break       0, 7
.L001FA1F8:
/* 0FA2F8 001FA1F8 12F00000 */  mflo        $30
/* 0FA2FC 001FA1FC 7E00C22B */  slti        $2, $30, 0x7E
/* 0FA300 001FA200 02004014 */  bnez        $2, .L001FA20C
/* 0FA304 001FA204 00000000 */   nop
/* 0FA308 001FA208 7E001E24 */  addiu       $30, $0, 0x7E
.L001FA20C:
/* 0FA30C 001FA20C C000A28F */  lw          $2, 0xC0($29)
/* 0FA310 001FA210 00110200 */  sll         $2, $2, 4
/* 0FA314 001FA214 3001A2AF */  sw          $2, 0x130($29)
/* 0FA318 001FA218 43101200 */  sra         $2, $18, 1
/* 0FA31C 001FA21C 00110200 */  sll         $2, $2, 4
/* 0FA320 001FA220 3401A2AF */  sw          $2, 0x134($29)
/* 0FA324 001FA224 00110300 */  sll         $2, $3, 4
/* 0FA328 001FA228 3801A2AF */  sw          $2, 0x138($29)
/* 0FA32C 001FA22C 40000224 */  addiu       $2, $0, 0x40
/* 0FA330 001FA230 3C01A2AF */  sw          $2, 0x13C($29)
/* 0FA334 001FA234 FF008832 */  andi        $8, $20, 0xFF
/* 0FA338 001FA238 3001A427 */  addiu       $4, $29, 0x130
/* 0FA33C 001FA23C 4F000524 */  addiu       $5, $0, 0x4F
/* 0FA340 001FA240 2836A070 */  paddub      $6, $5, $0
/* 0FA344 001FA244 283EA070 */  paddub      $7, $5, $0
/* 0FA348 001FA248 9CBE040C */  jal         MGFillBox__FRC8CRect_i_UcUcUcUc
/* 0FA34C 001FA24C 00000000 */   nop
/* 0FA350 001FA250 19000424 */  addiu       $4, $0, 0x19
/* 0FA354 001FA254 B8CF070C */  jal         GetGradationColorInfo2__Fi
/* 0FA358 001FA258 00000000 */   nop
/* 0FA35C 001FA25C D000A427 */  addiu       $4, $29, 0xD0
/* 0FA360 001FA260 282E4070 */  paddub      $5, $2, $0
/* 0FA364 001FA264 10000624 */  addiu       $6, $0, 0x10
/* 0FA368 001FA268 EC0C040C */  jal         memcpy
/* 0FA36C 001FA26C 00000000 */   nop
/* 0FA370 001FA270 DF00B4A3 */  sb          $20, 0xDF($29)
/* 0FA374 001FA274 DB00B4A3 */  sb          $20, 0xDB($29)
/* 0FA378 001FA278 D700B4A3 */  sb          $20, 0xD7($29)
/* 0FA37C 001FA27C D300B4A3 */  sb          $20, 0xD3($29)
/* 0FA380 001FA280 C000A28F */  lw          $2, 0xC0($29)
/* 0FA384 001FA284 4001A2AF */  sw          $2, 0x140($29)
/* 0FA388 001FA288 4401B2AF */  sw          $18, 0x144($29)
/* 0FA38C 001FA28C 4801BEAF */  sw          $30, 0x148($29)
/* 0FA390 001FA290 08000224 */  addiu       $2, $0, 0x8
/* 0FA394 001FA294 4C01A2AF */  sw          $2, 0x14C($29)
/* 0FA398 001FA298 4001A427 */  addiu       $4, $29, 0x140
/* 0FA39C 001FA29C D000A527 */  addiu       $5, $29, 0xD0
/* 0FA3A0 001FA2A0 D400A627 */  addiu       $6, $29, 0xD4
/* 0FA3A4 001FA2A4 D800A727 */  addiu       $7, $29, 0xD8
/* 0FA3A8 001FA2A8 DC00A827 */  addiu       $8, $29, 0xDC
/* 0FA3AC 001FA2AC F4B4080C */  jal         DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 0FA3B0 001FA2B0 00000000 */   nop
/* 0FA3B4 001FA2B4 CC00BE27 */  addiu       $30, $29, 0xCC
/* 0FA3B8 001FA2B8 0000C28F */  lw          $2, 0x0($30)
/* 0FA3BC 001FA2BC 21904202 */  addu        $18, $18, $2
/* 0FA3C0 001FA2C0 28266072 */  paddub      $4, $19, $0
/* 0FA3C4 001FA2C4 C0B7080C */  jal         GetNumberKeta__Fi
/* 0FA3C8 001FA2C8 00000000 */   nop
/* 0FA3CC 001FA2CC FFFF4224 */  addiu       $2, $2, -0x1
/* 0FA3D0 001FA2D0 04000010 */  b           .L001FA2E4
/* 0FA3D4 001FA2D4 00000000 */   nop
.L001FA2D8:
/* 0FA3D8 001FA2D8 C800A38F */  lw          $3, 0xC8($29)
/* 0FA3DC 001FA2DC 21882302 */  addu        $17, $17, $3
/* 0FA3E0 001FA2E0 FFFF4224 */  addiu       $2, $2, -0x1
.L001FA2E4:
/* 0FA3E4 001FA2E4 FCFF401C */  bgtz        $2, .L001FA2D8
/* 0FA3E8 001FA2E8 00000000 */   nop
/* 0FA3EC 001FA2EC 0C00A486 */  lh          $4, 0xC($21)
/* 0FA3F0 001FA2F0 282E2072 */  paddub      $5, $17, $0
/* 0FA3F4 001FA2F4 28364072 */  paddub      $6, $18, $0
/* 0FA3F8 001FA2F8 2C95878F */  lw          $7, -0x6AD4($28)
/* 0FA3FC 001FA2FC 2900023C */  lui         $2, %hi(WeaponVolumeNumberRect)
/* 0FA400 001FA300 70304824 */  addiu       $8, $2, %lo(WeaponVolumeNumberRect)
/* 0FA404 001FA304 01000924 */  addiu       $9, $0, 0x1
/* 0FA408 001FA308 28568072 */  paddub      $10, $20, $0
/* 0FA40C 001FA30C 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0FA410 001FA310 00000000 */   nop
/* 0FA414 001FA314 2900013C */  lui         $1, %hi(WeaponVolumeNumberRect + 0x4)
/* 0FA418 001FA318 7430238C */  lw          $3, %lo(WeaponVolumeNumberRect + 0x4)($1)
/* 0FA41C 001FA31C 2900013C */  lui         $1, %hi(WeaponVolumeNumberRect)
/* 0FA420 001FA320 7030228C */  lw          $2, %lo(WeaponVolumeNumberRect)($1)
/* 0FA424 001FA324 78004224 */  addiu       $2, $2, 0x78
/* 0FA428 001FA328 6001A2AF */  sw          $2, 0x160($29)
/* 0FA42C 001FA32C 6401A3AF */  sw          $3, 0x164($29)
/* 0FA430 001FA330 0C000324 */  addiu       $3, $0, 0xC
/* 0FA434 001FA334 6801A3AF */  sw          $3, 0x168($29)
/* 0FA438 001FA338 6C01A3AF */  sw          $3, 0x16C($29)
/* 0FA43C 001FA33C E0FF2226 */  addiu       $2, $17, -0x20
/* 0FA440 001FA340 5001A2AF */  sw          $2, 0x150($29)
/* 0FA444 001FA344 5401B2AF */  sw          $18, 0x154($29)
/* 0FA448 001FA348 5801A3AF */  sw          $3, 0x158($29)
/* 0FA44C 001FA34C 0B000224 */  addiu       $2, $0, 0xB
/* 0FA450 001FA350 5C01A2AF */  sw          $2, 0x15C($29)
/* 0FA454 001FA354 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FA458 001FA358 5001A527 */  addiu       $5, $29, 0x150
/* 0FA45C 001FA35C 6001A627 */  addiu       $6, $29, 0x160
/* 0FA460 001FA360 283E8072 */  paddub      $7, $20, $0
/* 0FA464 001FA364 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FA468 001FA368 00000000 */   nop
/* 0FA46C 001FA36C E0FF2526 */  addiu       $5, $17, -0x20
/* 0FA470 001FA370 B400A48F */  lw          $4, 0xB4($29)
/* 0FA474 001FA374 28364072 */  paddub      $6, $18, $0
/* 0FA478 001FA378 2C95878F */  lw          $7, -0x6AD4($28)
/* 0FA47C 001FA37C 2900023C */  lui         $2, %hi(WeaponVolumeNumberRect)
/* 0FA480 001FA380 70304824 */  addiu       $8, $2, %lo(WeaponVolumeNumberRect)
/* 0FA484 001FA384 01000924 */  addiu       $9, $0, 0x1
/* 0FA488 001FA388 28568072 */  paddub      $10, $20, $0
/* 0FA48C 001FA38C 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0FA490 001FA390 00000000 */   nop
/* 0FA494 001FA394 0000E28E */  lw          $2, 0x0($23)
/* 0FA498 001FA398 18004224 */  addiu       $2, $2, 0x18
/* 0FA49C 001FA39C 0000E2AE */  sw          $2, 0x0($23)
/* 0FA4A0 001FA3A0 C000B18F */  lw          $17, 0xC0($29)
/* 0FA4A4 001FA3A4 0000F28E */  lw          $18, 0x0($23)
/* 0FA4A8 001FA3A8 2826A072 */  paddub      $4, $21, $0
/* 0FA4AC 001FA3AC 20C8080C */  jal         GetWeaponMaxExp__FP11WEAPON_HAVE
/* 0FA4B0 001FA3B0 00000000 */   nop
/* 0FA4B4 001FA3B4 289E4070 */  paddub      $19, $2, $0
/* 0FA4B8 001FA3B8 1400A286 */  lh          $2, 0x14($21)
/* 0FA4BC 001FA3BC C0110200 */  sll         $2, $2, 7
/* 0FA4C0 001FA3C0 1A005300 */  div         $0, $2, $19
/* 0FA4C4 001FA3C4 02006016 */  bnez        $19, .L001FA3D0
/* 0FA4C8 001FA3C8 00000000 */   nop
/* 0FA4CC 001FA3CC CD010000 */  break       0, 7
.L001FA3D0:
/* 0FA4D0 001FA3D0 12200000 */  mflo        $4
/* 0FA4D4 001FA3D4 7F008128 */  slti        $1, $4, 0x7F
/* 0FA4D8 001FA3D8 02002014 */  bnez        $1, .L001FA3E4
/* 0FA4DC 001FA3DC 00000000 */   nop
/* 0FA4E0 001FA3E0 7E000424 */  addiu       $4, $0, 0x7E
.L001FA3E4:
/* 0FA4E4 001FA3E4 00010224 */  addiu       $2, $0, 0x100
/* 0FA4E8 001FA3E8 8001A2AF */  sw          $2, 0x180($29)
/* 0FA4EC 001FA3EC 78000224 */  addiu       $2, $0, 0x78
/* 0FA4F0 001FA3F0 8401A2AF */  sw          $2, 0x184($29)
/* 0FA4F4 001FA3F4 08000324 */  addiu       $3, $0, 0x8
/* 0FA4F8 001FA3F8 8801A3AF */  sw          $3, 0x188($29)
/* 0FA4FC 001FA3FC 8C01A3AF */  sw          $3, 0x18C($29)
/* 0FA500 001FA400 C000A28F */  lw          $2, 0xC0($29)
/* 0FA504 001FA404 7001A2AF */  sw          $2, 0x170($29)
/* 0FA508 001FA408 7401B2AF */  sw          $18, 0x174($29)
/* 0FA50C 001FA40C 7801A4AF */  sw          $4, 0x178($29)
/* 0FA510 001FA410 7C01A3AF */  sw          $3, 0x17C($29)
/* 0FA514 001FA414 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FA518 001FA418 7001A527 */  addiu       $5, $29, 0x170
/* 0FA51C 001FA41C 8001A627 */  addiu       $6, $29, 0x180
/* 0FA520 001FA420 283E8072 */  paddub      $7, $20, $0
/* 0FA524 001FA424 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FA528 001FA428 00000000 */   nop
/* 0FA52C 001FA42C 0000C28F */  lw          $2, 0x0($30)
/* 0FA530 001FA430 21904202 */  addu        $18, $18, $2
/* 0FA534 001FA434 28266072 */  paddub      $4, $19, $0
/* 0FA538 001FA438 C0B7080C */  jal         GetNumberKeta__Fi
/* 0FA53C 001FA43C 00000000 */   nop
/* 0FA540 001FA440 06000010 */  b           .L001FA45C
/* 0FA544 001FA444 00000000 */   nop
.L001FA448:
/* 0FA548 001FA448 2900013C */  lui         $1, %hi(WeaponVolumeNumberRect + 0x8)
/* 0FA54C 001FA44C 7830238C */  lw          $3, %lo(WeaponVolumeNumberRect + 0x8)($1)
/* 0FA550 001FA450 40180300 */  sll         $3, $3, 1
/* 0FA554 001FA454 21882302 */  addu        $17, $17, $3
/* 0FA558 001FA458 FFFF4224 */  addiu       $2, $2, -0x1
.L001FA45C:
/* 0FA55C 001FA45C 02004128 */  slti        $1, $2, 0x2
/* 0FA560 001FA460 F9FF2010 */  beqz        $1, .L001FA448
/* 0FA564 001FA464 00000000 */   nop
/* 0FA568 001FA468 28266072 */  paddub      $4, $19, $0
/* 0FA56C 001FA46C 282E2072 */  paddub      $5, $17, $0
/* 0FA570 001FA470 28364072 */  paddub      $6, $18, $0
/* 0FA574 001FA474 2C95878F */  lw          $7, -0x6AD4($28)
/* 0FA578 001FA478 2900023C */  lui         $2, %hi(WeaponVolumeNumberRect)
/* 0FA57C 001FA47C 70304824 */  addiu       $8, $2, %lo(WeaponVolumeNumberRect)
/* 0FA580 001FA480 01000924 */  addiu       $9, $0, 0x1
/* 0FA584 001FA484 28568072 */  paddub      $10, $20, $0
/* 0FA588 001FA488 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0FA58C 001FA48C 00000000 */   nop
/* 0FA590 001FA490 288E4070 */  paddub      $17, $2, $0
/* 0FA594 001FA494 2900013C */  lui         $1, %hi(WeaponVolumeNumberRect + 0x4)
/* 0FA598 001FA498 7430238C */  lw          $3, %lo(WeaponVolumeNumberRect + 0x4)($1)
/* 0FA59C 001FA49C 2900013C */  lui         $1, %hi(WeaponVolumeNumberRect)
/* 0FA5A0 001FA4A0 7030228C */  lw          $2, %lo(WeaponVolumeNumberRect)($1)
/* 0FA5A4 001FA4A4 78004224 */  addiu       $2, $2, 0x78
/* 0FA5A8 001FA4A8 A001A2AF */  sw          $2, 0x1A0($29)
/* 0FA5AC 001FA4AC A401A3AF */  sw          $3, 0x1A4($29)
/* 0FA5B0 001FA4B0 0C000324 */  addiu       $3, $0, 0xC
/* 0FA5B4 001FA4B4 A801A3AF */  sw          $3, 0x1A8($29)
/* 0FA5B8 001FA4B8 AC01A3AF */  sw          $3, 0x1AC($29)
/* 0FA5BC 001FA4BC F5FF2226 */  addiu       $2, $17, -0xB
/* 0FA5C0 001FA4C0 9001A2AF */  sw          $2, 0x190($29)
/* 0FA5C4 001FA4C4 9401B2AF */  sw          $18, 0x194($29)
/* 0FA5C8 001FA4C8 9801A3AF */  sw          $3, 0x198($29)
/* 0FA5CC 001FA4CC 0B000224 */  addiu       $2, $0, 0xB
/* 0FA5D0 001FA4D0 9C01A2AF */  sw          $2, 0x19C($29)
/* 0FA5D4 001FA4D4 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FA5D8 001FA4D8 9001A527 */  addiu       $5, $29, 0x190
/* 0FA5DC 001FA4DC A001A627 */  addiu       $6, $29, 0x1A0
/* 0FA5E0 001FA4E0 283E8072 */  paddub      $7, $20, $0
/* 0FA5E4 001FA4E4 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FA5E8 001FA4E8 00000000 */   nop
/* 0FA5EC 001FA4EC 1400A486 */  lh          $4, 0x14($21)
/* 0FA5F0 001FA4F0 F5FF2526 */  addiu       $5, $17, -0xB
/* 0FA5F4 001FA4F4 28364072 */  paddub      $6, $18, $0
/* 0FA5F8 001FA4F8 2C95878F */  lw          $7, -0x6AD4($28)
/* 0FA5FC 001FA4FC 2900023C */  lui         $2, %hi(WeaponVolumeNumberRect)
/* 0FA600 001FA500 70304824 */  addiu       $8, $2, %lo(WeaponVolumeNumberRect)
/* 0FA604 001FA504 02000924 */  addiu       $9, $0, 0x2
/* 0FA608 001FA508 28568072 */  paddub      $10, $20, $0
/* 0FA60C 001FA50C 705F080C */  jal         DrawMenuNumber__FiiiP8CTexture4RECTii
/* 0FA610 001FA510 00000000 */   nop
/* 0FA614 001FA514 2900023C */  lui         $2, %hi(LIT_1925)
/* 0FA618 001FA518 A0304224 */  addiu       $2, $2, %lo(LIT_1925)
/* 0FA61C 001FA51C E000A327 */  addiu       $3, $29, 0xE0
/* 0FA620 001FA520 00004278 */  lq          $2, 0x0($2)
/* 0FA624 001FA524 0000627C */  sq          $2, 0x0($3)
/* 0FA628 001FA528 0400A286 */  lh          $2, 0x4($21)
/* 0FA62C 001FA52C E000A2AF */  sw          $2, 0xE0($29)
/* 0FA630 001FA530 0600A286 */  lh          $2, 0x6($21)
/* 0FA634 001FA534 E400A2AF */  sw          $2, 0xE4($29)
/* 0FA638 001FA538 0800A286 */  lh          $2, 0x8($21)
/* 0FA63C 001FA53C E800A2AF */  sw          $2, 0xE8($29)
/* 0FA640 001FA540 0A00A286 */  lh          $2, 0xA($21)
/* 0FA644 001FA544 EC00A2AF */  sw          $2, 0xEC($29)
/* 0FA648 001FA548 2900023C */  lui         $2, %hi(LIT_1926)
/* 0FA64C 001FA54C B0304224 */  addiu       $2, $2, %lo(LIT_1926)
/* 0FA650 001FA550 F000A327 */  addiu       $3, $29, 0xF0
/* 0FA654 001FA554 00004278 */  lq          $2, 0x0($2)
/* 0FA658 001FA558 0000627C */  sq          $2, 0x0($3)
/* 0FA65C 001FA55C 2900023C */  lui         $2, %hi(LIT_1927)
/* 0FA660 001FA560 C0304224 */  addiu       $2, $2, %lo(LIT_1927)
/* 0FA664 001FA564 0001A327 */  addiu       $3, $29, 0x100
/* 0FA668 001FA568 00004278 */  lq          $2, 0x0($2)
/* 0FA66C 001FA56C 0000627C */  sq          $2, 0x0($3)
/* 0FA670 001FA570 01000224 */  addiu       $2, $0, 0x1
/* 0FA674 001FA574 0B00C216 */  bne         $22, $2, .L001FA5A4
/* 0FA678 001FA578 00000000 */   nop
/* 0FA67C 001FA57C 09000012 */  beqz        $16, .L001FA5A4
/* 0FA680 001FA580 00000000 */   nop
/* 0FA684 001FA584 02000286 */  lh          $2, 0x2($16)
/* 0FA688 001FA588 0001A2AF */  sw          $2, 0x100($29)
/* 0FA68C 001FA58C 04000286 */  lh          $2, 0x4($16)
/* 0FA690 001FA590 0401A2AF */  sw          $2, 0x104($29)
/* 0FA694 001FA594 06000286 */  lh          $2, 0x6($16)
/* 0FA698 001FA598 0801A2AF */  sw          $2, 0x108($29)
/* 0FA69C 001FA59C 08000286 */  lh          $2, 0x8($16)
/* 0FA6A0 001FA5A0 0C01A2AF */  sw          $2, 0x10C($29)
.L001FA5A4:
/* 0FA6A4 001FA5A4 0000A486 */  lh          $4, 0x0($21)
/* 0FA6A8 001FA5A8 D443070C */  jal         GetWeaponData__Fi
/* 0FA6AC 001FA5AC 00000000 */   nop
/* 0FA6B0 001FA5B0 2900033C */  lui         $3, %hi(LIT_1931)
/* 0FA6B4 001FA5B4 D0306324 */  addiu       $3, $3, %lo(LIT_1931)
/* 0FA6B8 001FA5B8 1001A427 */  addiu       $4, $29, 0x110
/* 0FA6BC 001FA5BC 00006378 */  lq          $3, 0x0($3)
/* 0FA6C0 001FA5C0 0000837C */  sq          $3, 0x0($4)
/* 0FA6C4 001FA5C4 44004384 */  lh          $3, 0x44($2)
/* 0FA6C8 001FA5C8 1001A3AF */  sw          $3, 0x110($29)
/* 0FA6CC 001FA5CC 46004284 */  lh          $2, 0x46($2)
/* 0FA6D0 001FA5D0 1C01A2AF */  sw          $2, 0x11C($29)
/* 0FA6D4 001FA5D4 1400C016 */  bnez        $22, .L001FA628
/* 0FA6D8 001FA5D8 00000000 */   nop
/* 0FA6DC 001FA5DC 28860070 */  paddub      $16, $0, $0
/* 0FA6E0 001FA5E0 0E000010 */  b           .L001FA61C
/* 0FA6E4 001FA5E4 00000000 */   nop
.L001FA5E8:
/* 0FA6E8 001FA5E8 01000526 */  addiu       $5, $16, 0x1
/* 0FA6EC 001FA5EC 2826A072 */  paddub      $4, $21, $0
/* 0FA6F0 001FA5F0 5C96080C */  jal         GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* 0FA6F4 001FA5F4 00000000 */   nop
/* 0FA6F8 001FA5F8 80181000 */  sll         $3, $16, 2
/* 0FA6FC 001FA5FC 21187D00 */  addu        $3, $3, $29
/* 0FA700 001FA600 F0006324 */  addiu       $3, $3, 0xF0
/* 0FA704 001FA604 000062AC */  sw          $2, 0x0($3)
/* 0FA708 001FA608 0000628C */  lw          $2, 0x0($3)
/* 0FA70C 001FA60C 02004104 */  bgez        $2, .L001FA618
/* 0FA710 001FA610 00000000 */   nop
/* 0FA714 001FA614 000060AC */  sw          $0, 0x0($3)
.L001FA618:
/* 0FA718 001FA618 01001026 */  addiu       $16, $16, 0x1
.L001FA61C:
/* 0FA71C 001FA61C 0400022A */  slti        $2, $16, 0x4
/* 0FA720 001FA620 F1FF4014 */  bnez        $2, .L001FA5E8
/* 0FA724 001FA624 00000000 */   nop
.L001FA628:
/* 0FA728 001FA628 2826A072 */  paddub      $4, $21, $0
/* 0FA72C 001FA62C 7433080C */  jal         GetNowWeaponRate__FP11WEAPON_HAVE
/* 0FA730 001FA630 00000000 */   nop
/* 0FA734 001FA634 06050046 */  mov.s       $f20, $f0
/* 0FA738 001FA638 01000324 */  addiu       $3, $0, 0x1
/* 0FA73C 001FA63C 0300C316 */  bne         $22, $3, .L001FA64C
/* 0FA740 001FA640 00000000 */   nop
/* 0FA744 001FA644 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0FA748 001FA648 00A08344 */  mtc1        $3, $f20
.L001FA64C:
/* 0FA74C 001FA64C 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0FA750 001FA650 00008344 */  mtc1        $3, $f0
/* 0FA754 001FA654 00000000 */  nop
/* 0FA758 001FA658 36A00046 */  c.le.s      $f20, $f0
/* 0FA75C 001FA65C 00000000 */  nop
/* 0FA760 001FA660 0E000145 */  bc1t        .L001FA69C
/* 0FA764 001FA664 00000000 */   nop
/* 0FA768 001FA668 1001A0C7 */  lwc1        $f0, 0x110($29)
/* 0FA76C 001FA66C 20008046 */  cvt.s.w     $f0, $f0
/* 0FA770 001FA670 02031446 */  mul.s       $f12, $f0, $f20
/* 0FA774 001FA674 2C44040C */  jal         fptosi
/* 0FA778 001FA678 00000000 */   nop
/* 0FA77C 001FA67C 1001A2AF */  sw          $2, 0x110($29)
/* 0FA780 001FA680 1C01B027 */  addiu       $16, $29, 0x11C
/* 0FA784 001FA684 000000C6 */  lwc1        $f0, 0x0($16)
/* 0FA788 001FA688 20008046 */  cvt.s.w     $f0, $f0
/* 0FA78C 001FA68C 02031446 */  mul.s       $f12, $f0, $f20
/* 0FA790 001FA690 2C44040C */  jal         fptosi
/* 0FA794 001FA694 00000000 */   nop
/* 0FA798 001FA698 000002AE */  sw          $2, 0x0($16)
.L001FA69C:
/* 0FA79C 001FA69C 2900033C */  lui         $3, %hi(LIT_1945)
/* 0FA7A0 001FA6A0 E0306324 */  addiu       $3, $3, %lo(LIT_1945)
/* 0FA7A4 001FA6A4 2001A627 */  addiu       $6, $29, 0x120
/* 0FA7A8 001FA6A8 00006378 */  lq          $3, 0x0($3)
/* 0FA7AC 001FA6AC 0000C37C */  sq          $3, 0x0($6)
/* 0FA7B0 001FA6B0 BC00A38F */  lw          $3, 0xBC($29)
/* 0FA7B4 001FA6B4 4A006324 */  addiu       $3, $3, 0x4A
/* 0FA7B8 001FA6B8 2001A3AF */  sw          $3, 0x120($29)
/* 0FA7BC 001FA6BC B800A38F */  lw          $3, 0xB8($29)
/* 0FA7C0 001FA6C0 60006324 */  addiu       $3, $3, 0x60
/* 0FA7C4 001FA6C4 2401B527 */  addiu       $21, $29, 0x124
/* 0FA7C8 001FA6C8 0000A3AE */  sw          $3, 0x0($21)
/* 0FA7CC 001FA6CC 2900033C */  lui         $3, %hi(LIT_1946)
/* 0FA7D0 001FA6D0 F0306724 */  addiu       $7, $3, %lo(LIT_1946)
/* 0FA7D4 001FA6D4 B001A627 */  addiu       $6, $29, 0x1B0
/* 0FA7D8 001FA6D8 0000E3DC */  ld          $3, 0x0($7)
/* 0FA7DC 001FA6DC 0800E0C4 */  lwc1        $f0, 0x8($7)
/* 0FA7E0 001FA6E0 0000C3FC */  sd          $3, 0x0($6)
/* 0FA7E4 001FA6E4 0800C0E4 */  swc1        $f0, 0x8($6)
/* 0FA7E8 001FA6E8 64000324 */  addiu       $3, $0, 0x64
/* 0FA7EC 001FA6EC B001A3AF */  sw          $3, 0x1B0($29)
/* 0FA7F0 001FA6F0 28860070 */  paddub      $16, $0, $0
/* 0FA7F4 001FA6F4 4B000010 */  b           .L001FA824
/* 0FA7F8 001FA6F8 00000000 */   nop
.L001FA6FC:
/* 0FA7FC 001FA6FC 28BE0070 */  paddub      $23, $0, $0
/* 0FA800 001FA700 80881000 */  sll         $17, $16, 2
/* 0FA804 001FA704 21103D02 */  addu        $2, $17, $29
/* 0FA808 001FA708 E000538C */  lw          $19, 0xE0($2)
/* 0FA80C 001FA70C F000428C */  lw          $2, 0xF0($2)
/* 0FA810 001FA710 21106202 */  addu        $2, $19, $2
/* 0FA814 001FA714 B401B227 */  addiu       $18, $29, 0x1B4
/* 0FA818 001FA718 000042AE */  sw          $2, 0x0($18)
/* 0FA81C 001FA71C 000040C6 */  lwc1        $f0, 0x0($18)
/* 0FA820 001FA720 20008046 */  cvt.s.w     $f0, $f0
/* 0FA824 001FA724 02031446 */  mul.s       $f12, $f0, $f20
/* 0FA828 001FA728 2C44040C */  jal         fptosi
/* 0FA82C 001FA72C 00000000 */   nop
/* 0FA830 001FA730 000042AE */  sw          $2, 0x0($18)
/* 0FA834 001FA734 0000438E */  lw          $3, 0x0($18)
/* 0FA838 001FA738 21103D02 */  addu        $2, $17, $29
/* 0FA83C 001FA73C 1001468C */  lw          $6, 0x110($2)
/* 0FA840 001FA740 2A106600 */  slt         $2, $3, $6
/* 0FA844 001FA744 03004014 */  bnez        $2, .L001FA754
/* 0FA848 001FA748 00000000 */   nop
/* 0FA84C 001FA74C 000046AE */  sw          $6, 0x0($18)
/* 0FA850 001FA750 01001724 */  addiu       $23, $0, 0x1
.L001FA754:
/* 0FA854 001FA754 B801A327 */  addiu       $3, $29, 0x1B8
/* 0FA858 001FA758 000073AC */  sw          $19, 0x0($3)
/* 0FA85C 001FA75C 0000628C */  lw          $2, 0x0($3)
/* 0FA860 001FA760 2A104600 */  slt         $2, $2, $6
/* 0FA864 001FA764 02004014 */  bnez        $2, .L001FA770
/* 0FA868 001FA768 00000000 */   nop
/* 0FA86C 001FA76C 000066AC */  sw          $6, 0x0($3)
.L001FA770:
/* 0FA870 001FA770 0000428E */  lw          $2, 0x0($18)
/* 0FA874 001FA774 C0110200 */  sll         $2, $2, 7
/* 0FA878 001FA778 00008244 */  mtc1        $2, $f0
/* 0FA87C 001FA77C 00000000 */  nop
/* 0FA880 001FA780 60008046 */  cvt.s.w     $f1, $f0
/* 0FA884 001FA784 B001A0C7 */  lwc1        $f0, 0x1B0($29)
/* 0FA888 001FA788 20008046 */  cvt.s.w     $f0, $f0
/* 0FA88C 001FA78C 030B0046 */  div.s       $f12, $f1, $f0
/* 0FA890 001FA790 2C44040C */  jal         fptosi
/* 0FA894 001FA794 00000000 */   nop
/* 0FA898 001FA798 81004128 */  slti        $1, $2, 0x81
/* 0FA89C 001FA79C 02002014 */  bnez        $1, .L001FA7A8
/* 0FA8A0 001FA7A0 00000000 */   nop
/* 0FA8A4 001FA7A4 80000224 */  addiu       $2, $0, 0x80
.L001FA7A8:
/* 0FA8A8 001FA7A8 21183D02 */  addu        $3, $17, $29
/* 0FA8AC 001FA7AC 0001638C */  lw          $3, 0x100($3)
/* 0FA8B0 001FA7B0 23887300 */  subu        $17, $3, $19
/* 0FA8B4 001FA7B4 2001A48F */  lw          $4, 0x120($29)
/* 0FA8B8 001FA7B8 0000A58E */  lw          $5, 0x0($21)
/* 0FA8BC 001FA7BC 28364070 */  paddub      $6, $2, $0
/* 0FA8C0 001FA7C0 283EE072 */  paddub      $7, $23, $0
/* 0FA8C4 001FA7C4 90E7070C */  jal         DrawWeaponStatusWaku__Fiiii
/* 0FA8C8 001FA7C8 00000000 */   nop
/* 0FA8CC 001FA7CC 03000726 */  addiu       $7, $16, 0x3
/* 0FA8D0 001FA7D0 2001A427 */  addiu       $4, $29, 0x120
/* 0FA8D4 001FA7D4 80000524 */  addiu       $5, $0, 0x80
/* 0FA8D8 001FA7D8 B001A627 */  addiu       $6, $29, 0x1B0
/* 0FA8DC 001FA7DC 28468072 */  paddub      $8, $20, $0
/* 0FA8E0 001FA7E0 284EC072 */  paddub      $9, $22, $0
/* 0FA8E4 001FA7E4 28562072 */  paddub      $10, $17, $0
/* 0FA8E8 001FA7E8 08E7070C */  jal         WepStatusVolumeDraw__F4RECTiPiiiii
/* 0FA8EC 001FA7EC 00000000 */   nop
/* 0FA8F0 001FA7F0 0800E012 */  beqz        $23, .L001FA814
/* 0FA8F4 001FA7F4 00000000 */   nop
/* 0FA8F8 001FA7F8 2001A28F */  lw          $2, 0x120($29)
/* 0FA8FC 001FA7FC 04004424 */  addiu       $4, $2, 0x4
/* 0FA900 001FA800 0000A28E */  lw          $2, 0x0($21)
/* 0FA904 001FA804 03004524 */  addiu       $5, $2, 0x3
/* 0FA908 001FA808 80000624 */  addiu       $6, $0, 0x80
/* 0FA90C 001FA80C ACE7070C */  jal         DrawLimmitMax__Fiii
/* 0FA910 001FA810 00000000 */   nop
.L001FA814:
/* 0FA914 001FA814 0000A38E */  lw          $3, 0x0($21)
/* 0FA918 001FA818 10006324 */  addiu       $3, $3, 0x10
/* 0FA91C 001FA81C 0000A3AE */  sw          $3, 0x0($21)
/* 0FA920 001FA820 01001026 */  addiu       $16, $16, 0x1
.L001FA824:
/* 0FA924 001FA824 0400032A */  slti        $3, $16, 0x4
/* 0FA928 001FA828 B4FF6014 */  bnez        $3, .L001FA6FC
/* 0FA92C 001FA82C 00000000 */   nop
/* 0FA930 001FA830 A000BF7B */  lq          $31, 0xA0($29)
/* 0FA934 001FA834 9000BE7B */  lq          $30, 0x90($29)
/* 0FA938 001FA838 8000B77B */  lq          $23, 0x80($29)
/* 0FA93C 001FA83C 7000B67B */  lq          $22, 0x70($29)
/* 0FA940 001FA840 6000B57B */  lq          $21, 0x60($29)
/* 0FA944 001FA844 5000B47B */  lq          $20, 0x50($29)
/* 0FA948 001FA848 4000B37B */  lq          $19, 0x40($29)
/* 0FA94C 001FA84C 3000B27B */  lq          $18, 0x30($29)
/* 0FA950 001FA850 2000B17B */  lq          $17, 0x20($29)
/* 0FA954 001FA854 1000B07B */  lq          $16, 0x10($29)
/* 0FA958 001FA858 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0FA95C 001FA85C C001BD27 */  addiu       $29, $29, 0x1C0
/* 0FA960 001FA860 0800E003 */  jr          $31
/* 0FA964 001FA864 00000000 */   nop
/* 0FA968 001FA868 00000000 */  nop
/* 0FA96C 001FA86C 00000000 */  nop
