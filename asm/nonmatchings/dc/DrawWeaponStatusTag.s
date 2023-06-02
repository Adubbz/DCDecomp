.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
/* FA1B0 001FA0B0 40FEBD27 */  addiu      $sp, $sp, -0x1C0
/* FA1B4 001FA0B4 A000BF7F */  sq         $31, 0xA0($sp)
/* FA1B8 001FA0B8 9000BE7F */  sq         $fp, 0x90($sp)
/* FA1BC 001FA0BC 8000B77F */  sq         $23, 0x80($sp)
/* FA1C0 001FA0C0 7000B67F */  sq         $22, 0x70($sp)
/* FA1C4 001FA0C4 6000B57F */  sq         $21, 0x60($sp)
/* FA1C8 001FA0C8 5000B47F */  sq         $20, 0x50($sp)
/* FA1CC 001FA0CC 4000B37F */  sq         $19, 0x40($sp)
/* FA1D0 001FA0D0 3000B27F */  sq         $18, 0x30($sp)
/* FA1D4 001FA0D4 2000B17F */  sq         $17, 0x20($sp)
/* FA1D8 001FA0D8 1000B07F */  sq         $16, 0x10($sp)
/* FA1DC 001FA0DC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* FA1E0 001FA0E0 BC00A4AF */  sw         $4, 0xBC($sp)
/* FA1E4 001FA0E4 B800A5AF */  sw         $5, 0xB8($sp)
/* FA1E8 001FA0E8 28AEC070 */  paddub     $21, $6, $0
/* FA1EC 001FA0EC 28B6E070 */  paddub     $22, $7, $0
/* FA1F0 001FA0F0 28A62071 */  paddub     $20, $9, $0
/* FA1F4 001FA0F4 28860070 */  paddub     $16, $0, $0
/* FA1F8 001FA0F8 01000224 */  addiu      $2, $0, 0x1
/* FA1FC 001FA0FC 0500C216 */  bne        $22, $2, .L001FA114
/* FA200 001FA100 00000000 */   nop
/* FA204 001FA104 28260071 */  paddub     $4, $8, $0
/* FA208 001FA108 D443070C */  jal        GetWeaponData__Fi
/* FA20C 001FA10C 00000000 */   nop
/* FA210 001FA110 28864070 */  paddub     $16, $2, $0
.L001FA114:
/* FA214 001FA114 2900023C */  lui        $2, %hi(_1909)
/* FA218 001FA118 90304224 */  addiu      $2, $2, %lo(_1909)
/* FA21C 001FA11C C000A327 */  addiu      $3, $sp, 0xC0
/* FA220 001FA120 00004278 */  lq         $2, 0x0($2)
/* FA224 001FA124 0000627C */  sq         $2, 0x0($3)
/* FA228 001FA128 BC00A28F */  lw         $2, 0xBC($sp)
/* FA22C 001FA12C 4B004224 */  addiu      $2, $2, 0x4B
/* FA230 001FA130 C000A2AF */  sw         $2, 0xC0($sp)
/* FA234 001FA134 B800A28F */  lw         $2, 0xB8($sp)
/* FA238 001FA138 30004224 */  addiu      $2, $2, 0x30
/* FA23C 001FA13C C400B727 */  addiu      $23, $sp, 0xC4
/* FA240 001FA140 0000E2AE */  sw         $2, 0x0($23)
/* FA244 001FA144 BC01A227 */  addiu      $2, $sp, 0x1BC
/* FA248 001FA148 788880C7 */  lwc1       $f0, -0x7788($gp)
/* FA24C 001FA14C 000040E4 */  swc1       $f0, 0x0($2)
/* FA250 001FA150 1000B4C6 */  lwc1       $f20, 0x10($21)
/* FA254 001FA154 06A30046 */  mov.s      $f12, $f20
/* FA258 001FA158 2C44040C */  jal        fptosi
/* FA25C 001FA15C 00000000 */   nop
/* FA260 001FA160 BC01A2A7 */  sh         $2, 0x1BC($sp)
/* FA264 001FA164 0C00B386 */  lh         $19, 0xC($21)
/* FA268 001FA168 BE01B3A7 */  sh         $19, 0x1BE($sp)
/* FA26C 001FA16C C000B18F */  lw         $17, 0xC0($sp)
/* FA270 001FA170 0000F28E */  lw         $18, 0x0($23)
/* FA274 001FA174 06A30046 */  mov.s      $f12, $f20
/* FA278 001FA178 2C44040C */  jal        fptosi
/* FA27C 001FA17C 00000000 */   nop
/* FA280 001FA180 B400A2AF */  sw         $2, 0xB4($sp)
/* FA284 001FA184 00008244 */  mtc1       $2, $f0
/* FA288 001FA188 00000000 */  nop
/* FA28C 001FA18C 20008046 */  cvt.s.w    $f0, $f0
/* FA290 001FA190 34001446 */  c.lt.s     $f0, $f20
/* FA294 001FA194 00000000 */  nop
/* FA298 001FA198 08000045 */  bc1f       .L001FA1BC
/* FA29C 001FA19C 00000000 */   nop
/* FA2A0 001FA1A0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* FA2A4 001FA1A4 00008244 */  mtc1       $2, $f0
/* FA2A8 001FA1A8 00000000 */  nop
/* FA2AC 001FA1AC 00031446 */  add.s      $f12, $f0, $f20
/* FA2B0 001FA1B0 2C44040C */  jal        fptosi
/* FA2B4 001FA1B4 00000000 */   nop
/* FA2B8 001FA1B8 B400A2AF */  sw         $2, 0xB4($sp)
.L001FA1BC:
/* FA2BC 001FA1BC 80111300 */  sll        $2, $19, 6
/* FA2C0 001FA1C0 23105300 */  subu       $2, $2, $19
/* FA2C4 001FA1C4 40180200 */  sll        $3, $2, 1
/* FA2C8 001FA1C8 63000224 */  addiu      $2, $0, 0x63
/* FA2CC 001FA1CC 1A006200 */  div        $0, $3, $2
/* FA2D0 001FA1D0 02004014 */  bnez       $2, .L001FA1DC
/* FA2D4 001FA1D4 00000000 */   nop
/* FA2D8 001FA1D8 CD010000 */  break      0, 7
.L001FA1DC:
/* FA2DC 001FA1DC 12180000 */  mflo       $3
/* FA2E0 001FA1E0 B400A28F */  lw         $2, 0xB4($sp)
/* FA2E4 001FA1E4 18104300 */  mult       $2, $2, $3
/* FA2E8 001FA1E8 1A005300 */  div        $0, $2, $19
/* FA2EC 001FA1EC 02006016 */  bnez       $19, .L001FA1F8
/* FA2F0 001FA1F0 00000000 */   nop
/* FA2F4 001FA1F4 CD010000 */  break      0, 7
.L001FA1F8:
/* FA2F8 001FA1F8 12F00000 */  mflo       $fp
/* FA2FC 001FA1FC 7E00C22B */  slti       $2, $fp, 0x7E
/* FA300 001FA200 02004014 */  bnez       $2, .L001FA20C
/* FA304 001FA204 00000000 */   nop
/* FA308 001FA208 7E001E24 */  addiu      $fp, $0, 0x7E
.L001FA20C:
/* FA30C 001FA20C C000A28F */  lw         $2, 0xC0($sp)
/* FA310 001FA210 00110200 */  sll        $2, $2, 4
/* FA314 001FA214 3001A2AF */  sw         $2, 0x130($sp)
/* FA318 001FA218 43101200 */  sra        $2, $18, 1
/* FA31C 001FA21C 00110200 */  sll        $2, $2, 4
/* FA320 001FA220 3401A2AF */  sw         $2, 0x134($sp)
/* FA324 001FA224 00110300 */  sll        $2, $3, 4
/* FA328 001FA228 3801A2AF */  sw         $2, 0x138($sp)
/* FA32C 001FA22C 40000224 */  addiu      $2, $0, 0x40
/* FA330 001FA230 3C01A2AF */  sw         $2, 0x13C($sp)
/* FA334 001FA234 FF008832 */  andi       $8, $20, 0xFF
/* FA338 001FA238 3001A427 */  addiu      $4, $sp, 0x130
/* FA33C 001FA23C 4F000524 */  addiu      $5, $0, 0x4F
/* FA340 001FA240 2836A070 */  paddub     $6, $5, $0
/* FA344 001FA244 283EA070 */  paddub     $7, $5, $0
/* FA348 001FA248 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* FA34C 001FA24C 00000000 */   nop
/* FA350 001FA250 19000424 */  addiu      $4, $0, 0x19
/* FA354 001FA254 B8CF070C */  jal        GetGradationColorInfo2__Fi
/* FA358 001FA258 00000000 */   nop
/* FA35C 001FA25C D000A427 */  addiu      $4, $sp, 0xD0
/* FA360 001FA260 282E4070 */  paddub     $5, $2, $0
/* FA364 001FA264 10000624 */  addiu      $6, $0, 0x10
/* FA368 001FA268 EC0C040C */  jal        memcpy
/* FA36C 001FA26C 00000000 */   nop
/* FA370 001FA270 DF00B4A3 */  sb         $20, 0xDF($sp)
/* FA374 001FA274 DB00B4A3 */  sb         $20, 0xDB($sp)
/* FA378 001FA278 D700B4A3 */  sb         $20, 0xD7($sp)
/* FA37C 001FA27C D300B4A3 */  sb         $20, 0xD3($sp)
/* FA380 001FA280 C000A28F */  lw         $2, 0xC0($sp)
/* FA384 001FA284 4001A2AF */  sw         $2, 0x140($sp)
/* FA388 001FA288 4401B2AF */  sw         $18, 0x144($sp)
/* FA38C 001FA28C 4801BEAF */  sw         $fp, 0x148($sp)
/* FA390 001FA290 08000224 */  addiu      $2, $0, 0x8
/* FA394 001FA294 4C01A2AF */  sw         $2, 0x14C($sp)
/* FA398 001FA298 4001A427 */  addiu      $4, $sp, 0x140
/* FA39C 001FA29C D000A527 */  addiu      $5, $sp, 0xD0
/* FA3A0 001FA2A0 D400A627 */  addiu      $6, $sp, 0xD4
/* FA3A4 001FA2A4 D800A727 */  addiu      $7, $sp, 0xD8
/* FA3A8 001FA2A8 DC00A827 */  addiu      $8, $sp, 0xDC
/* FA3AC 001FA2AC F4B4080C */  jal        DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* FA3B0 001FA2B0 00000000 */   nop
/* FA3B4 001FA2B4 CC00BE27 */  addiu      $fp, $sp, 0xCC
/* FA3B8 001FA2B8 0000C28F */  lw         $2, 0x0($fp)
/* FA3BC 001FA2BC 21904202 */  addu       $18, $18, $2
/* FA3C0 001FA2C0 28266072 */  paddub     $4, $19, $0
/* FA3C4 001FA2C4 C0B7080C */  jal        GetNumberKeta__Fi
/* FA3C8 001FA2C8 00000000 */   nop
/* FA3CC 001FA2CC FFFF4224 */  addiu      $2, $2, -0x1
/* FA3D0 001FA2D0 04000010 */  b          .L001FA2E4
/* FA3D4 001FA2D4 00000000 */   nop
.L001FA2D8:
/* FA3D8 001FA2D8 C800A38F */  lw         $3, 0xC8($sp)
/* FA3DC 001FA2DC 21882302 */  addu       $17, $17, $3
/* FA3E0 001FA2E0 FFFF4224 */  addiu      $2, $2, -0x1
.L001FA2E4:
/* FA3E4 001FA2E4 FCFF401C */  bgtz       $2, .L001FA2D8
/* FA3E8 001FA2E8 00000000 */   nop
/* FA3EC 001FA2EC 0C00A486 */  lh         $4, 0xC($21)
/* FA3F0 001FA2F0 282E2072 */  paddub     $5, $17, $0
/* FA3F4 001FA2F4 28364072 */  paddub     $6, $18, $0
/* FA3F8 001FA2F8 2C95878F */  lw         $7, -0x6AD4($gp)
/* FA3FC 001FA2FC 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* FA400 001FA300 70304824 */  addiu      $8, $2, %lo(WeaponVolumeNumberRect)
/* FA404 001FA304 01000924 */  addiu      $9, $0, 0x1
/* FA408 001FA308 28568072 */  paddub     $10, $20, $0
/* FA40C 001FA30C 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* FA410 001FA310 00000000 */   nop
/* FA414 001FA314 2900013C */  lui        $at, (0x293074 >> 16)
/* FA418 001FA318 7430238C */  lw         $3, (0x293074 & 0xFFFF)($at)
/* FA41C 001FA31C 2900013C */  lui        $at, (0x293070 >> 16)
/* FA420 001FA320 7030228C */  lw         $2, (0x293070 & 0xFFFF)($at)
/* FA424 001FA324 78004224 */  addiu      $2, $2, 0x78
/* FA428 001FA328 6001A2AF */  sw         $2, 0x160($sp)
/* FA42C 001FA32C 6401A3AF */  sw         $3, 0x164($sp)
/* FA430 001FA330 0C000324 */  addiu      $3, $0, 0xC
/* FA434 001FA334 6801A3AF */  sw         $3, 0x168($sp)
/* FA438 001FA338 6C01A3AF */  sw         $3, 0x16C($sp)
/* FA43C 001FA33C E0FF2226 */  addiu      $2, $17, -0x20
/* FA440 001FA340 5001A2AF */  sw         $2, 0x150($sp)
/* FA444 001FA344 5401B2AF */  sw         $18, 0x154($sp)
/* FA448 001FA348 5801A3AF */  sw         $3, 0x158($sp)
/* FA44C 001FA34C 0B000224 */  addiu      $2, $0, 0xB
/* FA450 001FA350 5C01A2AF */  sw         $2, 0x15C($sp)
/* FA454 001FA354 2C95848F */  lw         $4, -0x6AD4($gp)
/* FA458 001FA358 5001A527 */  addiu      $5, $sp, 0x150
/* FA45C 001FA35C 6001A627 */  addiu      $6, $sp, 0x160
/* FA460 001FA360 283E8072 */  paddub     $7, $20, $0
/* FA464 001FA364 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FA468 001FA368 00000000 */   nop
/* FA46C 001FA36C E0FF2526 */  addiu      $5, $17, -0x20
/* FA470 001FA370 B400A48F */  lw         $4, 0xB4($sp)
/* FA474 001FA374 28364072 */  paddub     $6, $18, $0
/* FA478 001FA378 2C95878F */  lw         $7, -0x6AD4($gp)
/* FA47C 001FA37C 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* FA480 001FA380 70304824 */  addiu      $8, $2, %lo(WeaponVolumeNumberRect)
/* FA484 001FA384 01000924 */  addiu      $9, $0, 0x1
/* FA488 001FA388 28568072 */  paddub     $10, $20, $0
/* FA48C 001FA38C 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* FA490 001FA390 00000000 */   nop
/* FA494 001FA394 0000E28E */  lw         $2, 0x0($23)
/* FA498 001FA398 18004224 */  addiu      $2, $2, 0x18
/* FA49C 001FA39C 0000E2AE */  sw         $2, 0x0($23)
/* FA4A0 001FA3A0 C000B18F */  lw         $17, 0xC0($sp)
/* FA4A4 001FA3A4 0000F28E */  lw         $18, 0x0($23)
/* FA4A8 001FA3A8 2826A072 */  paddub     $4, $21, $0
/* FA4AC 001FA3AC 20C8080C */  jal        GetWeaponMaxExp__FP11WEAPON_HAVE
/* FA4B0 001FA3B0 00000000 */   nop
/* FA4B4 001FA3B4 289E4070 */  paddub     $19, $2, $0
/* FA4B8 001FA3B8 1400A286 */  lh         $2, 0x14($21)
/* FA4BC 001FA3BC C0110200 */  sll        $2, $2, 7
/* FA4C0 001FA3C0 1A005300 */  div        $0, $2, $19
/* FA4C4 001FA3C4 02006016 */  bnez       $19, .L001FA3D0
/* FA4C8 001FA3C8 00000000 */   nop
/* FA4CC 001FA3CC CD010000 */  break      0, 7
.L001FA3D0:
/* FA4D0 001FA3D0 12200000 */  mflo       $4
/* FA4D4 001FA3D4 7F008128 */  slti       $at, $4, 0x7F
/* FA4D8 001FA3D8 02002014 */  bnez       $at, .L001FA3E4
/* FA4DC 001FA3DC 00000000 */   nop
/* FA4E0 001FA3E0 7E000424 */  addiu      $4, $0, 0x7E
.L001FA3E4:
/* FA4E4 001FA3E4 00010224 */  addiu      $2, $0, 0x100
/* FA4E8 001FA3E8 8001A2AF */  sw         $2, 0x180($sp)
/* FA4EC 001FA3EC 78000224 */  addiu      $2, $0, 0x78
/* FA4F0 001FA3F0 8401A2AF */  sw         $2, 0x184($sp)
/* FA4F4 001FA3F4 08000324 */  addiu      $3, $0, 0x8
/* FA4F8 001FA3F8 8801A3AF */  sw         $3, 0x188($sp)
/* FA4FC 001FA3FC 8C01A3AF */  sw         $3, 0x18C($sp)
/* FA500 001FA400 C000A28F */  lw         $2, 0xC0($sp)
/* FA504 001FA404 7001A2AF */  sw         $2, 0x170($sp)
/* FA508 001FA408 7401B2AF */  sw         $18, 0x174($sp)
/* FA50C 001FA40C 7801A4AF */  sw         $4, 0x178($sp)
/* FA510 001FA410 7C01A3AF */  sw         $3, 0x17C($sp)
/* FA514 001FA414 2C95848F */  lw         $4, -0x6AD4($gp)
/* FA518 001FA418 7001A527 */  addiu      $5, $sp, 0x170
/* FA51C 001FA41C 8001A627 */  addiu      $6, $sp, 0x180
/* FA520 001FA420 283E8072 */  paddub     $7, $20, $0
/* FA524 001FA424 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FA528 001FA428 00000000 */   nop
/* FA52C 001FA42C 0000C28F */  lw         $2, 0x0($fp)
/* FA530 001FA430 21904202 */  addu       $18, $18, $2
/* FA534 001FA434 28266072 */  paddub     $4, $19, $0
/* FA538 001FA438 C0B7080C */  jal        GetNumberKeta__Fi
/* FA53C 001FA43C 00000000 */   nop
/* FA540 001FA440 06000010 */  b          .L001FA45C
/* FA544 001FA444 00000000 */   nop
.L001FA448:
/* FA548 001FA448 2900013C */  lui        $at, (0x293078 >> 16)
/* FA54C 001FA44C 7830238C */  lw         $3, (0x293078 & 0xFFFF)($at)
/* FA550 001FA450 40180300 */  sll        $3, $3, 1
/* FA554 001FA454 21882302 */  addu       $17, $17, $3
/* FA558 001FA458 FFFF4224 */  addiu      $2, $2, -0x1
.L001FA45C:
/* FA55C 001FA45C 02004128 */  slti       $at, $2, 0x2
/* FA560 001FA460 F9FF2010 */  beqz       $at, .L001FA448
/* FA564 001FA464 00000000 */   nop
/* FA568 001FA468 28266072 */  paddub     $4, $19, $0
/* FA56C 001FA46C 282E2072 */  paddub     $5, $17, $0
/* FA570 001FA470 28364072 */  paddub     $6, $18, $0
/* FA574 001FA474 2C95878F */  lw         $7, -0x6AD4($gp)
/* FA578 001FA478 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* FA57C 001FA47C 70304824 */  addiu      $8, $2, %lo(WeaponVolumeNumberRect)
/* FA580 001FA480 01000924 */  addiu      $9, $0, 0x1
/* FA584 001FA484 28568072 */  paddub     $10, $20, $0
/* FA588 001FA488 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* FA58C 001FA48C 00000000 */   nop
/* FA590 001FA490 288E4070 */  paddub     $17, $2, $0
/* FA594 001FA494 2900013C */  lui        $at, (0x293074 >> 16)
/* FA598 001FA498 7430238C */  lw         $3, (0x293074 & 0xFFFF)($at)
/* FA59C 001FA49C 2900013C */  lui        $at, (0x293070 >> 16)
/* FA5A0 001FA4A0 7030228C */  lw         $2, (0x293070 & 0xFFFF)($at)
/* FA5A4 001FA4A4 78004224 */  addiu      $2, $2, 0x78
/* FA5A8 001FA4A8 A001A2AF */  sw         $2, 0x1A0($sp)
/* FA5AC 001FA4AC A401A3AF */  sw         $3, 0x1A4($sp)
/* FA5B0 001FA4B0 0C000324 */  addiu      $3, $0, 0xC
/* FA5B4 001FA4B4 A801A3AF */  sw         $3, 0x1A8($sp)
/* FA5B8 001FA4B8 AC01A3AF */  sw         $3, 0x1AC($sp)
/* FA5BC 001FA4BC F5FF2226 */  addiu      $2, $17, -0xB
/* FA5C0 001FA4C0 9001A2AF */  sw         $2, 0x190($sp)
/* FA5C4 001FA4C4 9401B2AF */  sw         $18, 0x194($sp)
/* FA5C8 001FA4C8 9801A3AF */  sw         $3, 0x198($sp)
/* FA5CC 001FA4CC 0B000224 */  addiu      $2, $0, 0xB
/* FA5D0 001FA4D0 9C01A2AF */  sw         $2, 0x19C($sp)
/* FA5D4 001FA4D4 2C95848F */  lw         $4, -0x6AD4($gp)
/* FA5D8 001FA4D8 9001A527 */  addiu      $5, $sp, 0x190
/* FA5DC 001FA4DC A001A627 */  addiu      $6, $sp, 0x1A0
/* FA5E0 001FA4E0 283E8072 */  paddub     $7, $20, $0
/* FA5E4 001FA4E4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FA5E8 001FA4E8 00000000 */   nop
/* FA5EC 001FA4EC 1400A486 */  lh         $4, 0x14($21)
/* FA5F0 001FA4F0 F5FF2526 */  addiu      $5, $17, -0xB
/* FA5F4 001FA4F4 28364072 */  paddub     $6, $18, $0
/* FA5F8 001FA4F8 2C95878F */  lw         $7, -0x6AD4($gp)
/* FA5FC 001FA4FC 2900023C */  lui        $2, %hi(WeaponVolumeNumberRect)
/* FA600 001FA500 70304824 */  addiu      $8, $2, %lo(WeaponVolumeNumberRect)
/* FA604 001FA504 02000924 */  addiu      $9, $0, 0x2
/* FA608 001FA508 28568072 */  paddub     $10, $20, $0
/* FA60C 001FA50C 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* FA610 001FA510 00000000 */   nop
/* FA614 001FA514 2900023C */  lui        $2, %hi(_1925)
/* FA618 001FA518 A0304224 */  addiu      $2, $2, %lo(_1925)
/* FA61C 001FA51C E000A327 */  addiu      $3, $sp, 0xE0
/* FA620 001FA520 00004278 */  lq         $2, 0x0($2)
/* FA624 001FA524 0000627C */  sq         $2, 0x0($3)
/* FA628 001FA528 0400A286 */  lh         $2, 0x4($21)
/* FA62C 001FA52C E000A2AF */  sw         $2, 0xE0($sp)
/* FA630 001FA530 0600A286 */  lh         $2, 0x6($21)
/* FA634 001FA534 E400A2AF */  sw         $2, 0xE4($sp)
/* FA638 001FA538 0800A286 */  lh         $2, 0x8($21)
/* FA63C 001FA53C E800A2AF */  sw         $2, 0xE8($sp)
/* FA640 001FA540 0A00A286 */  lh         $2, 0xA($21)
/* FA644 001FA544 EC00A2AF */  sw         $2, 0xEC($sp)
/* FA648 001FA548 2900023C */  lui        $2, %hi(_1926)
/* FA64C 001FA54C B0304224 */  addiu      $2, $2, %lo(_1926)
/* FA650 001FA550 F000A327 */  addiu      $3, $sp, 0xF0
/* FA654 001FA554 00004278 */  lq         $2, 0x0($2)
/* FA658 001FA558 0000627C */  sq         $2, 0x0($3)
/* FA65C 001FA55C 2900023C */  lui        $2, %hi(_1927)
/* FA660 001FA560 C0304224 */  addiu      $2, $2, %lo(_1927)
/* FA664 001FA564 0001A327 */  addiu      $3, $sp, 0x100
/* FA668 001FA568 00004278 */  lq         $2, 0x0($2)
/* FA66C 001FA56C 0000627C */  sq         $2, 0x0($3)
/* FA670 001FA570 01000224 */  addiu      $2, $0, 0x1
/* FA674 001FA574 0B00C216 */  bne        $22, $2, .L001FA5A4
/* FA678 001FA578 00000000 */   nop
/* FA67C 001FA57C 09000012 */  beqz       $16, .L001FA5A4
/* FA680 001FA580 00000000 */   nop
/* FA684 001FA584 02000286 */  lh         $2, 0x2($16)
/* FA688 001FA588 0001A2AF */  sw         $2, 0x100($sp)
/* FA68C 001FA58C 04000286 */  lh         $2, 0x4($16)
/* FA690 001FA590 0401A2AF */  sw         $2, 0x104($sp)
/* FA694 001FA594 06000286 */  lh         $2, 0x6($16)
/* FA698 001FA598 0801A2AF */  sw         $2, 0x108($sp)
/* FA69C 001FA59C 08000286 */  lh         $2, 0x8($16)
/* FA6A0 001FA5A0 0C01A2AF */  sw         $2, 0x10C($sp)
.L001FA5A4:
/* FA6A4 001FA5A4 0000A486 */  lh         $4, 0x0($21)
/* FA6A8 001FA5A8 D443070C */  jal        GetWeaponData__Fi
/* FA6AC 001FA5AC 00000000 */   nop
/* FA6B0 001FA5B0 2900033C */  lui        $3, %hi(_1931)
/* FA6B4 001FA5B4 D0306324 */  addiu      $3, $3, %lo(_1931)
/* FA6B8 001FA5B8 1001A427 */  addiu      $4, $sp, 0x110
/* FA6BC 001FA5BC 00006378 */  lq         $3, 0x0($3)
/* FA6C0 001FA5C0 0000837C */  sq         $3, 0x0($4)
/* FA6C4 001FA5C4 44004384 */  lh         $3, 0x44($2)
/* FA6C8 001FA5C8 1001A3AF */  sw         $3, 0x110($sp)
/* FA6CC 001FA5CC 46004284 */  lh         $2, 0x46($2)
/* FA6D0 001FA5D0 1C01A2AF */  sw         $2, 0x11C($sp)
/* FA6D4 001FA5D4 1400C016 */  bnez       $22, .L001FA628
/* FA6D8 001FA5D8 00000000 */   nop
/* FA6DC 001FA5DC 28860070 */  paddub     $16, $0, $0
/* FA6E0 001FA5E0 0E000010 */  b          .L001FA61C
/* FA6E4 001FA5E4 00000000 */   nop
.L001FA5E8:
/* FA6E8 001FA5E8 01000526 */  addiu      $5, $16, 0x1
/* FA6EC 001FA5EC 2826A072 */  paddub     $4, $21, $0
/* FA6F0 001FA5F0 5C96080C */  jal        GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* FA6F4 001FA5F4 00000000 */   nop
/* FA6F8 001FA5F8 80181000 */  sll        $3, $16, 2
/* FA6FC 001FA5FC 21187D00 */  addu       $3, $3, $sp
/* FA700 001FA600 F0006324 */  addiu      $3, $3, 0xF0
/* FA704 001FA604 000062AC */  sw         $2, 0x0($3)
/* FA708 001FA608 0000628C */  lw         $2, 0x0($3)
/* FA70C 001FA60C 02004104 */  bgez       $2, .L001FA618
/* FA710 001FA610 00000000 */   nop
/* FA714 001FA614 000060AC */  sw         $0, 0x0($3)
.L001FA618:
/* FA718 001FA618 01001026 */  addiu      $16, $16, 0x1
.L001FA61C:
/* FA71C 001FA61C 0400022A */  slti       $2, $16, 0x4
/* FA720 001FA620 F1FF4014 */  bnez       $2, .L001FA5E8
/* FA724 001FA624 00000000 */   nop
.L001FA628:
/* FA728 001FA628 2826A072 */  paddub     $4, $21, $0
/* FA72C 001FA62C 7433080C */  jal        GetNowWeaponRate__FP11WEAPON_HAVE
/* FA730 001FA630 00000000 */   nop
/* FA734 001FA634 06050046 */  mov.s      $f20, $f0
/* FA738 001FA638 01000324 */  addiu      $3, $0, 0x1
/* FA73C 001FA63C 0300C316 */  bne        $22, $3, .L001FA64C
/* FA740 001FA640 00000000 */   nop
/* FA744 001FA644 803F033C */  lui        $3, (0x3F800000 >> 16)
/* FA748 001FA648 00A08344 */  mtc1       $3, $f20
.L001FA64C:
/* FA74C 001FA64C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* FA750 001FA650 00008344 */  mtc1       $3, $f0
/* FA754 001FA654 00000000 */  nop
/* FA758 001FA658 36A00046 */  c.le.s     $f20, $f0
/* FA75C 001FA65C 00000000 */  nop
/* FA760 001FA660 0E000145 */  bc1t       .L001FA69C
/* FA764 001FA664 00000000 */   nop
/* FA768 001FA668 1001A0C7 */  lwc1       $f0, 0x110($sp)
/* FA76C 001FA66C 20008046 */  cvt.s.w    $f0, $f0
/* FA770 001FA670 02031446 */  mul.s      $f12, $f0, $f20
/* FA774 001FA674 2C44040C */  jal        fptosi
/* FA778 001FA678 00000000 */   nop
/* FA77C 001FA67C 1001A2AF */  sw         $2, 0x110($sp)
/* FA780 001FA680 1C01B027 */  addiu      $16, $sp, 0x11C
/* FA784 001FA684 000000C6 */  lwc1       $f0, 0x0($16)
/* FA788 001FA688 20008046 */  cvt.s.w    $f0, $f0
/* FA78C 001FA68C 02031446 */  mul.s      $f12, $f0, $f20
/* FA790 001FA690 2C44040C */  jal        fptosi
/* FA794 001FA694 00000000 */   nop
/* FA798 001FA698 000002AE */  sw         $2, 0x0($16)
.L001FA69C:
/* FA79C 001FA69C 2900033C */  lui        $3, %hi(_1945)
/* FA7A0 001FA6A0 E0306324 */  addiu      $3, $3, %lo(_1945)
/* FA7A4 001FA6A4 2001A627 */  addiu      $6, $sp, 0x120
/* FA7A8 001FA6A8 00006378 */  lq         $3, 0x0($3)
/* FA7AC 001FA6AC 0000C37C */  sq         $3, 0x0($6)
/* FA7B0 001FA6B0 BC00A38F */  lw         $3, 0xBC($sp)
/* FA7B4 001FA6B4 4A006324 */  addiu      $3, $3, 0x4A
/* FA7B8 001FA6B8 2001A3AF */  sw         $3, 0x120($sp)
/* FA7BC 001FA6BC B800A38F */  lw         $3, 0xB8($sp)
/* FA7C0 001FA6C0 60006324 */  addiu      $3, $3, 0x60
/* FA7C4 001FA6C4 2401B527 */  addiu      $21, $sp, 0x124
/* FA7C8 001FA6C8 0000A3AE */  sw         $3, 0x0($21)
/* FA7CC 001FA6CC 2900033C */  lui        $3, %hi(_1946)
/* FA7D0 001FA6D0 F0306724 */  addiu      $7, $3, %lo(_1946)
/* FA7D4 001FA6D4 B001A627 */  addiu      $6, $sp, 0x1B0
/* FA7D8 001FA6D8 0000E3DC */  ld         $3, 0x0($7)
/* FA7DC 001FA6DC 0800E0C4 */  lwc1       $f0, 0x8($7)
/* FA7E0 001FA6E0 0000C3FC */  sd         $3, 0x0($6)
/* FA7E4 001FA6E4 0800C0E4 */  swc1       $f0, 0x8($6)
/* FA7E8 001FA6E8 64000324 */  addiu      $3, $0, 0x64
/* FA7EC 001FA6EC B001A3AF */  sw         $3, 0x1B0($sp)
/* FA7F0 001FA6F0 28860070 */  paddub     $16, $0, $0
/* FA7F4 001FA6F4 4B000010 */  b          .L001FA824
/* FA7F8 001FA6F8 00000000 */   nop
.L001FA6FC:
/* FA7FC 001FA6FC 28BE0070 */  paddub     $23, $0, $0
/* FA800 001FA700 80881000 */  sll        $17, $16, 2
/* FA804 001FA704 21103D02 */  addu       $2, $17, $sp
/* FA808 001FA708 E000538C */  lw         $19, 0xE0($2)
/* FA80C 001FA70C F000428C */  lw         $2, 0xF0($2)
/* FA810 001FA710 21106202 */  addu       $2, $19, $2
/* FA814 001FA714 B401B227 */  addiu      $18, $sp, 0x1B4
/* FA818 001FA718 000042AE */  sw         $2, 0x0($18)
/* FA81C 001FA71C 000040C6 */  lwc1       $f0, 0x0($18)
/* FA820 001FA720 20008046 */  cvt.s.w    $f0, $f0
/* FA824 001FA724 02031446 */  mul.s      $f12, $f0, $f20
/* FA828 001FA728 2C44040C */  jal        fptosi
/* FA82C 001FA72C 00000000 */   nop
/* FA830 001FA730 000042AE */  sw         $2, 0x0($18)
/* FA834 001FA734 0000438E */  lw         $3, 0x0($18)
/* FA838 001FA738 21103D02 */  addu       $2, $17, $sp
/* FA83C 001FA73C 1001468C */  lw         $6, 0x110($2)
/* FA840 001FA740 2A106600 */  slt        $2, $3, $6
/* FA844 001FA744 03004014 */  bnez       $2, .L001FA754
/* FA848 001FA748 00000000 */   nop
/* FA84C 001FA74C 000046AE */  sw         $6, 0x0($18)
/* FA850 001FA750 01001724 */  addiu      $23, $0, 0x1
.L001FA754:
/* FA854 001FA754 B801A327 */  addiu      $3, $sp, 0x1B8
/* FA858 001FA758 000073AC */  sw         $19, 0x0($3)
/* FA85C 001FA75C 0000628C */  lw         $2, 0x0($3)
/* FA860 001FA760 2A104600 */  slt        $2, $2, $6
/* FA864 001FA764 02004014 */  bnez       $2, .L001FA770
/* FA868 001FA768 00000000 */   nop
/* FA86C 001FA76C 000066AC */  sw         $6, 0x0($3)
.L001FA770:
/* FA870 001FA770 0000428E */  lw         $2, 0x0($18)
/* FA874 001FA774 C0110200 */  sll        $2, $2, 7
/* FA878 001FA778 00008244 */  mtc1       $2, $f0
/* FA87C 001FA77C 00000000 */  nop
/* FA880 001FA780 60008046 */  cvt.s.w    $f1, $f0
/* FA884 001FA784 B001A0C7 */  lwc1       $f0, 0x1B0($sp)
/* FA888 001FA788 20008046 */  cvt.s.w    $f0, $f0
/* FA88C 001FA78C 030B0046 */  div.s      $f12, $f1, $f0
/* FA890 001FA790 2C44040C */  jal        fptosi
/* FA894 001FA794 00000000 */   nop
/* FA898 001FA798 81004128 */  slti       $at, $2, 0x81
/* FA89C 001FA79C 02002014 */  bnez       $at, .L001FA7A8
/* FA8A0 001FA7A0 00000000 */   nop
/* FA8A4 001FA7A4 80000224 */  addiu      $2, $0, 0x80
.L001FA7A8:
/* FA8A8 001FA7A8 21183D02 */  addu       $3, $17, $sp
/* FA8AC 001FA7AC 0001638C */  lw         $3, 0x100($3)
/* FA8B0 001FA7B0 23887300 */  subu       $17, $3, $19
/* FA8B4 001FA7B4 2001A48F */  lw         $4, 0x120($sp)
/* FA8B8 001FA7B8 0000A58E */  lw         $5, 0x0($21)
/* FA8BC 001FA7BC 28364070 */  paddub     $6, $2, $0
/* FA8C0 001FA7C0 283EE072 */  paddub     $7, $23, $0
/* FA8C4 001FA7C4 90E7070C */  jal        DrawWeaponStatusWaku__Fiiii
/* FA8C8 001FA7C8 00000000 */   nop
/* FA8CC 001FA7CC 03000726 */  addiu      $7, $16, 0x3
/* FA8D0 001FA7D0 2001A427 */  addiu      $4, $sp, 0x120
/* FA8D4 001FA7D4 80000524 */  addiu      $5, $0, 0x80
/* FA8D8 001FA7D8 B001A627 */  addiu      $6, $sp, 0x1B0
/* FA8DC 001FA7DC 28468072 */  paddub     $8, $20, $0
/* FA8E0 001FA7E0 284EC072 */  paddub     $9, $22, $0
/* FA8E4 001FA7E4 28562072 */  paddub     $10, $17, $0
/* FA8E8 001FA7E8 08E7070C */  jal        WepStatusVolumeDraw__F4RECTiPiiiii
/* FA8EC 001FA7EC 00000000 */   nop
/* FA8F0 001FA7F0 0800E012 */  beqz       $23, .L001FA814
/* FA8F4 001FA7F4 00000000 */   nop
/* FA8F8 001FA7F8 2001A28F */  lw         $2, 0x120($sp)
/* FA8FC 001FA7FC 04004424 */  addiu      $4, $2, 0x4
/* FA900 001FA800 0000A28E */  lw         $2, 0x0($21)
/* FA904 001FA804 03004524 */  addiu      $5, $2, 0x3
/* FA908 001FA808 80000624 */  addiu      $6, $0, 0x80
/* FA90C 001FA80C ACE7070C */  jal        DrawLimmitMax__Fiii
/* FA910 001FA810 00000000 */   nop
.L001FA814:
/* FA914 001FA814 0000A38E */  lw         $3, 0x0($21)
/* FA918 001FA818 10006324 */  addiu      $3, $3, 0x10
/* FA91C 001FA81C 0000A3AE */  sw         $3, 0x0($21)
/* FA920 001FA820 01001026 */  addiu      $16, $16, 0x1
.L001FA824:
/* FA924 001FA824 0400032A */  slti       $3, $16, 0x4
/* FA928 001FA828 B4FF6014 */  bnez       $3, .L001FA6FC
/* FA92C 001FA82C 00000000 */   nop
/* FA930 001FA830 A000BF7B */  lq         $31, 0xA0($sp)
/* FA934 001FA834 9000BE7B */  lq         $fp, 0x90($sp)
/* FA938 001FA838 8000B77B */  lq         $23, 0x80($sp)
/* FA93C 001FA83C 7000B67B */  lq         $22, 0x70($sp)
/* FA940 001FA840 6000B57B */  lq         $21, 0x60($sp)
/* FA944 001FA844 5000B47B */  lq         $20, 0x50($sp)
/* FA948 001FA848 4000B37B */  lq         $19, 0x40($sp)
/* FA94C 001FA84C 3000B27B */  lq         $18, 0x30($sp)
/* FA950 001FA850 2000B17B */  lq         $17, 0x20($sp)
/* FA954 001FA854 1000B07B */  lq         $16, 0x10($sp)
/* FA958 001FA858 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* FA95C 001FA85C C001BD27 */  addiu      $sp, $sp, 0x1C0
/* FA960 001FA860 0800E003 */  jr         $31
/* FA964 001FA864 00000000 */   nop
/* FA968 001FA868 00000000 */  nop
/* FA96C 001FA86C 00000000 */  nop
