.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopCancelGoodReturn2__Fv
/* ED090 001ECF90 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* ED094 001ECF94 9000BF7F */  sq         $31, 0x90($sp)
/* ED098 001ECF98 8000BE7F */  sq         $fp, 0x80($sp)
/* ED09C 001ECF9C 7000B77F */  sq         $23, 0x70($sp)
/* ED0A0 001ECFA0 6000B67F */  sq         $22, 0x60($sp)
/* ED0A4 001ECFA4 5000B57F */  sq         $21, 0x50($sp)
/* ED0A8 001ECFA8 4000B47F */  sq         $20, 0x40($sp)
/* ED0AC 001ECFAC 3000B37F */  sq         $19, 0x30($sp)
/* ED0B0 001ECFB0 2000B27F */  sq         $18, 0x20($sp)
/* ED0B4 001ECFB4 1000B17F */  sq         $17, 0x10($sp)
/* ED0B8 001ECFB8 0000B07F */  sq         $16, 0x0($sp)
/* ED0BC 001ECFBC FFFF1024 */  addiu      $16, $0, -0x1
/* ED0C0 001ECFC0 BC00B0AF */  sw         $16, 0xBC($sp)
/* ED0C4 001ECFC4 8494838F */  lw         $3, -0x6B7C($gp)
/* ED0C8 001ECFC8 04057624 */  addiu      $22, $3, 0x504
/* ED0CC 001ECFCC F87FD626 */  addiu      $22, $22, 0x7FF8
/* ED0D0 001ECFD0 60436324 */  addiu      $3, $3, 0x4360
/* ED0D4 001ECFD4 A000A3AF */  sw         $3, 0xA0($sp)
/* ED0D8 001ECFD8 28360070 */  paddub     $6, $0, $0
/* ED0DC 001ECFDC 1D000010 */  b          .L001ED054
/* ED0E0 001ECFE0 00000000 */   nop
.L001ECFE4:
/* ED0E4 001ECFE4 80400600 */  sll        $8, $6, 2
/* ED0E8 001ECFE8 9494838F */  lw         $3, -0x6B6C($gp)
/* ED0EC 001ECFEC 21186800 */  addu       $3, $3, $8
/* ED0F0 001ECFF0 0000648C */  lw         $4, 0x0($3)
/* ED0F4 001ECFF4 01000324 */  addiu      $3, $0, 0x1
/* ED0F8 001ECFF8 15008314 */  bne        $4, $3, .L001ED050
/* ED0FC 001ECFFC 00000000 */   nop
/* ED100 001ED000 01001026 */  addiu      $16, $16, 0x1
/* ED104 001ED004 40200600 */  sll        $4, $6, 1
/* ED108 001ED008 A000A38F */  lw         $3, 0xA0($sp)
/* ED10C 001ED00C 21288300 */  addu       $5, $4, $3
/* ED110 001ED010 0E00A484 */  lh         $4, 0xE($5)
/* ED114 001ED014 80191000 */  sll        $3, $16, 6
/* ED118 001ED018 23187000 */  subu       $3, $3, $16
/* ED11C 001ED01C 80380300 */  sll        $7, $3, 2
/* ED120 001ED020 A494838F */  lw         $3, -0x6B5C($gp)
/* ED124 001ED024 21186700 */  addu       $3, $3, $7
/* ED128 001ED028 000064A4 */  sh         $4, 0x0($3)
/* ED12C 001ED02C DC00A484 */  lh         $4, 0xDC($5)
/* ED130 001ED030 A494838F */  lw         $3, -0x6B5C($gp)
/* ED134 001ED034 2118E300 */  addu       $3, $7, $3
/* ED138 001ED038 040064AC */  sw         $4, 0x4($3)
/* ED13C 001ED03C 0E00A0A4 */  sh         $0, 0xE($5)
/* ED140 001ED040 DC00A0A4 */  sh         $0, 0xDC($5)
/* ED144 001ED044 9494838F */  lw         $3, -0x6B6C($gp)
/* ED148 001ED048 21186800 */  addu       $3, $3, $8
/* ED14C 001ED04C 000060AC */  sw         $0, 0x0($3)
.L001ED050:
/* ED150 001ED050 0100C624 */  addiu      $6, $6, 0x1
.L001ED054:
/* ED154 001ED054 6400C328 */  slti       $3, $6, 0x64
/* ED158 001ED058 E2FF6014 */  bnez       $3, .L001ECFE4
/* ED15C 001ED05C 00000000 */   nop
/* ED160 001ED060 28960070 */  paddub     $18, $0, $0
/* ED164 001ED064 35000010 */  b          .L001ED13C
/* ED168 001ED068 00000000 */   nop
.L001ED06C:
/* ED16C 001ED06C 80981200 */  sll        $19, $18, 2
/* ED170 001ED070 9894838F */  lw         $3, -0x6B68($gp)
/* ED174 001ED074 21187300 */  addu       $3, $3, $19
/* ED178 001ED078 0000648C */  lw         $4, 0x0($3)
/* ED17C 001ED07C 01000324 */  addiu      $3, $0, 0x1
/* ED180 001ED080 2D008314 */  bne        $4, $3, .L001ED138
/* ED184 001ED084 00000000 */   nop
/* ED188 001ED088 0A000324 */  addiu      $3, $0, 0xA
/* ED18C 001ED08C 1A004302 */  div        $0, $18, $3
/* ED190 001ED090 02006014 */  bnez       $3, .L001ED09C
/* ED194 001ED094 00000000 */   nop
/* ED198 001ED098 CD010000 */  break      0, 7
.L001ED09C:
/* ED19C 001ED09C 12200000 */  mflo       $4
/* ED1A0 001ED0A0 0A000324 */  addiu      $3, $0, 0xA
/* ED1A4 001ED0A4 1A004302 */  div        $0, $18, $3
/* ED1A8 001ED0A8 00000000 */  nop
/* ED1AC 001ED0AC 00000000 */  nop
/* ED1B0 001ED0B0 10280000 */  mfhi       $5
/* ED1B4 001ED0B4 8494868F */  lw         $6, -0x6B7C($gp)
/* ED1B8 001ED0B8 A80A0324 */  addiu      $3, $0, 0xAA8
/* ED1BC 001ED0BC 18188300 */  mult       $3, $4, $3
/* ED1C0 001ED0C0 2118C300 */  addu       $3, $6, $3
/* ED1C4 001ED0C4 0C456424 */  addiu      $4, $3, 0x450C
/* ED1C8 001ED0C8 40190500 */  sll        $3, $5, 5
/* ED1CC 001ED0CC 23186500 */  subu       $3, $3, $5
/* ED1D0 001ED0D0 C0180300 */  sll        $3, $3, 3
/* ED1D4 001ED0D4 21888300 */  addu       $17, $4, $3
/* ED1D8 001ED0D8 00002486 */  lh         $4, 0x0($17)
/* ED1DC 001ED0DC 01018328 */  slti       $3, $4, 0x101
/* ED1E0 001ED0E0 15006014 */  bnez       $3, .L001ED138
/* ED1E4 001ED0E4 00000000 */   nop
/* ED1E8 001ED0E8 01001026 */  addiu      $16, $16, 0x1
/* ED1EC 001ED0EC 80111000 */  sll        $2, $16, 6
/* ED1F0 001ED0F0 23105000 */  subu       $2, $2, $16
/* ED1F4 001ED0F4 80180200 */  sll        $3, $2, 2
/* ED1F8 001ED0F8 A494828F */  lw         $2, -0x6B5C($gp)
/* ED1FC 001ED0FC 21104300 */  addu       $2, $2, $3
/* ED200 001ED100 000044A4 */  sh         $4, 0x0($2)
/* ED204 001ED104 A494828F */  lw         $2, -0x6B5C($gp)
/* ED208 001ED108 21104300 */  addu       $2, $2, $3
/* ED20C 001ED10C 04004424 */  addiu      $4, $2, 0x4
/* ED210 001ED110 282E2072 */  paddub     $5, $17, $0
/* ED214 001ED114 F8000624 */  addiu      $6, $0, 0xF8
/* ED218 001ED118 EC0C040C */  jal        memcpy
/* ED21C 001ED11C 00000000 */   nop
/* ED220 001ED120 28262072 */  paddub     $4, $17, $0
/* ED224 001ED124 1CB9080C */  jal        InitHaveWep__FP11WEAPON_HAVE
/* ED228 001ED128 00000000 */   nop
/* ED22C 001ED12C 9894838F */  lw         $3, -0x6B68($gp)
/* ED230 001ED130 21187300 */  addu       $3, $3, $19
/* ED234 001ED134 000060AC */  sw         $0, 0x0($3)
.L001ED138:
/* ED238 001ED138 01005226 */  addiu      $18, $18, 0x1
.L001ED13C:
/* ED23C 001ED13C 3C00432A */  slti       $3, $18, 0x3C
/* ED240 001ED140 CAFF6014 */  bnez       $3, .L001ED06C
/* ED244 001ED144 00000000 */   nop
/* ED248 001ED148 288E0070 */  paddub     $17, $0, $0
/* ED24C 001ED14C 22000010 */  b          .L001ED1D8
/* ED250 001ED150 00000000 */   nop
.L001ED154:
/* ED254 001ED154 80981100 */  sll        $19, $17, 2
/* ED258 001ED158 9C94838F */  lw         $3, -0x6B64($gp)
/* ED25C 001ED15C 21187300 */  addu       $3, $3, $19
/* ED260 001ED160 0000648C */  lw         $4, 0x0($3)
/* ED264 001ED164 01000324 */  addiu      $3, $0, 0x1
/* ED268 001ED168 1A008314 */  bne        $4, $3, .L001ED1D4
/* ED26C 001ED16C 00000000 */   nop
/* ED270 001ED170 1800C012 */  beqz       $22, .L001ED1D4
/* ED274 001ED174 00000000 */   nop
/* ED278 001ED178 01001026 */  addiu      $16, $16, 0x1
/* ED27C 001ED17C 40111100 */  sll        $2, $17, 5
/* ED280 001ED180 2190C202 */  addu       $18, $22, $2
/* ED284 001ED184 00004386 */  lh         $3, 0x0($18)
/* ED288 001ED188 80111000 */  sll        $2, $16, 6
/* ED28C 001ED18C 23105000 */  subu       $2, $2, $16
/* ED290 001ED190 80200200 */  sll        $4, $2, 2
/* ED294 001ED194 A494828F */  lw         $2, -0x6B5C($gp)
/* ED298 001ED198 21104400 */  addu       $2, $2, $4
/* ED29C 001ED19C 000043A4 */  sh         $3, 0x0($2)
/* ED2A0 001ED1A0 A494828F */  lw         $2, -0x6B5C($gp)
/* ED2A4 001ED1A4 21104400 */  addu       $2, $2, $4
/* ED2A8 001ED1A8 04004424 */  addiu      $4, $2, 0x4
/* ED2AC 001ED1AC 282E4072 */  paddub     $5, $18, $0
/* ED2B0 001ED1B0 20000624 */  addiu      $6, $0, 0x20
/* ED2B4 001ED1B4 EC0C040C */  jal        memcpy
/* ED2B8 001ED1B8 00000000 */   nop
/* ED2BC 001ED1BC 28264072 */  paddub     $4, $18, $0
/* ED2C0 001ED1C0 2CB9080C */  jal        InitHaveAttach__FP11ATTACH_LIST
/* ED2C4 001ED1C4 00000000 */   nop
/* ED2C8 001ED1C8 9C94838F */  lw         $3, -0x6B64($gp)
/* ED2CC 001ED1CC 21187300 */  addu       $3, $3, $19
/* ED2D0 001ED1D0 000060AC */  sw         $0, 0x0($3)
.L001ED1D4:
/* ED2D4 001ED1D4 01003126 */  addiu      $17, $17, 0x1
.L001ED1D8:
/* ED2D8 001ED1D8 2800232A */  slti       $3, $17, 0x28
/* ED2DC 001ED1DC DDFF6014 */  bnez       $3, .L001ED154
/* ED2E0 001ED1E0 00000000 */   nop
/* ED2E4 001ED1E4 289E0070 */  paddub     $19, $0, $0
/* ED2E8 001ED1E8 67000010 */  b          .L001ED388
/* ED2EC 001ED1EC 00000000 */   nop
.L001ED1F0:
/* ED2F0 001ED1F0 80F01300 */  sll        $fp, $19, 2
/* ED2F4 001ED1F4 9094838F */  lw         $3, -0x6B70($gp)
/* ED2F8 001ED1F8 21187E00 */  addu       $3, $3, $fp
/* ED2FC 001ED1FC 0000648C */  lw         $4, 0x0($3)
/* ED300 001ED200 02000324 */  addiu      $3, $0, 0x2
/* ED304 001ED204 5F008314 */  bne        $4, $3, .L001ED384
/* ED308 001ED208 00000000 */   nop
/* ED30C 001ED20C 80191300 */  sll        $3, $19, 6
/* ED310 001ED210 23187300 */  subu       $3, $3, $19
/* ED314 001ED214 80A80300 */  sll        $21, $3, 2
/* ED318 001ED218 A094838F */  lw         $3, -0x6B60($gp)
/* ED31C 001ED21C 21187500 */  addu       $3, $3, $21
/* ED320 001ED220 00007484 */  lh         $20, 0x0($3)
/* ED324 001ED224 5100832A */  slti       $3, $20, 0x51
/* ED328 001ED228 56006014 */  bnez       $3, .L001ED384
/* ED32C 001ED22C 00000000 */   nop
/* ED330 001ED230 28268072 */  paddub     $4, $20, $0
/* ED334 001ED234 BC00A527 */  addiu      $5, $sp, 0xBC
/* ED338 001ED238 70C5080C */  jal        GetBoardSpace__FiPi
/* ED33C 001ED23C 00000000 */   nop
/* ED340 001ED240 28964070 */  paddub     $18, $2, $0
/* ED344 001ED244 4F004006 */  bltz       $18, .L001ED384
/* ED348 001ED248 00000000 */   nop
/* ED34C 001ED24C BC00A38F */  lw         $3, 0xBC($sp)
/* ED350 001ED250 02000224 */  addiu      $2, $0, 0x2
/* ED354 001ED254 32006210 */  beq        $3, $2, .L001ED320
/* ED358 001ED258 00000000 */   nop
/* ED35C 001ED25C 01000224 */  addiu      $2, $0, 0x1
/* ED360 001ED260 10006210 */  beq        $3, $2, .L001ED2A4
/* ED364 001ED264 00000000 */   nop
/* ED368 001ED268 03006010 */  beqz       $3, .L001ED278
/* ED36C 001ED26C 00000000 */   nop
/* ED370 001ED270 37000010 */  b          .L001ED350
/* ED374 001ED274 00000000 */   nop
.L001ED278:
/* ED378 001ED278 40181200 */  sll        $3, $18, 1
/* ED37C 001ED27C A000A28F */  lw         $2, 0xA0($sp)
/* ED380 001ED280 21186200 */  addu       $3, $3, $2
/* ED384 001ED284 0E0074A4 */  sh         $20, 0xE($3)
/* ED388 001ED288 A094828F */  lw         $2, -0x6B60($gp)
/* ED38C 001ED28C 2110A202 */  addu       $2, $21, $2
/* ED390 001ED290 04004284 */  lh         $2, 0x4($2)
/* ED394 001ED294 DC0062A4 */  sh         $2, 0xDC($3)
/* ED398 001ED298 9494978F */  lw         $23, -0x6B6C($gp)
/* ED39C 001ED29C 2C000010 */  b          .L001ED350
/* ED3A0 001ED2A0 00000000 */   nop
.L001ED2A4:
/* ED3A4 001ED2A4 0A000224 */  addiu      $2, $0, 0xA
/* ED3A8 001ED2A8 1A004202 */  div        $0, $18, $2
/* ED3AC 001ED2AC 02004014 */  bnez       $2, .L001ED2B8
/* ED3B0 001ED2B0 00000000 */   nop
/* ED3B4 001ED2B4 CD010000 */  break      0, 7
.L001ED2B8:
/* ED3B8 001ED2B8 12200000 */  mflo       $4
/* ED3BC 001ED2BC 0A000224 */  addiu      $2, $0, 0xA
/* ED3C0 001ED2C0 1A004202 */  div        $0, $18, $2
/* ED3C4 001ED2C4 00000000 */  nop
/* ED3C8 001ED2C8 00000000 */  nop
/* ED3CC 001ED2CC 10280000 */  mfhi       $5
/* ED3D0 001ED2D0 8494838F */  lw         $3, -0x6B7C($gp)
/* ED3D4 001ED2D4 A80A0224 */  addiu      $2, $0, 0xAA8
/* ED3D8 001ED2D8 18108200 */  mult       $2, $4, $2
/* ED3DC 001ED2DC 21106200 */  addu       $2, $3, $2
/* ED3E0 001ED2E0 0C454324 */  addiu      $3, $2, 0x450C
/* ED3E4 001ED2E4 40110500 */  sll        $2, $5, 5
/* ED3E8 001ED2E8 23104500 */  subu       $2, $2, $5
/* ED3EC 001ED2EC C0100200 */  sll        $2, $2, 3
/* ED3F0 001ED2F0 21886200 */  addu       $17, $3, $2
/* ED3F4 001ED2F4 A094828F */  lw         $2, -0x6B60($gp)
/* ED3F8 001ED2F8 21105500 */  addu       $2, $2, $21
/* ED3FC 001ED2FC 28262072 */  paddub     $4, $17, $0
/* ED400 001ED300 04004524 */  addiu      $5, $2, 0x4
/* ED404 001ED304 F8000624 */  addiu      $6, $0, 0xF8
/* ED408 001ED308 EC0C040C */  jal        memcpy
/* ED40C 001ED30C 00000000 */   nop
/* ED410 001ED310 000034A6 */  sh         $20, 0x0($17)
/* ED414 001ED314 9894978F */  lw         $23, -0x6B68($gp)
/* ED418 001ED318 0D000010 */  b          .L001ED350
/* ED41C 001ED31C 00000000 */   nop
.L001ED320:
/* ED420 001ED320 40111200 */  sll        $2, $18, 5
/* ED424 001ED324 2188C202 */  addu       $17, $22, $2
/* ED428 001ED328 A094828F */  lw         $2, -0x6B60($gp)
/* ED42C 001ED32C 21105500 */  addu       $2, $2, $21
/* ED430 001ED330 28262072 */  paddub     $4, $17, $0
/* ED434 001ED334 04004524 */  addiu      $5, $2, 0x4
/* ED438 001ED338 20000624 */  addiu      $6, $0, 0x20
/* ED43C 001ED33C EC0C040C */  jal        memcpy
/* ED440 001ED340 00000000 */   nop
/* ED444 001ED344 000034A6 */  sh         $20, 0x0($17)
/* ED448 001ED348 9C94978F */  lw         $23, -0x6B64($gp)
/* ED44C 001ED34C 00000000 */  nop
.L001ED350:
/* ED450 001ED350 02000324 */  addiu      $3, $0, 0x2
/* ED454 001ED354 80101200 */  sll        $2, $18, 2
/* ED458 001ED358 2110E202 */  addu       $2, $23, $2
/* ED45C 001ED35C 000043AC */  sw         $3, 0x0($2)
/* ED460 001ED360 A094828F */  lw         $2, -0x6B60($gp)
/* ED464 001ED364 21205500 */  addu       $4, $2, $21
/* ED468 001ED368 282E0070 */  paddub     $5, $0, $0
/* ED46C 001ED36C FC000624 */  addiu      $6, $0, 0xFC
/* ED470 001ED370 5A0D040C */  jal        memset
/* ED474 001ED374 00000000 */   nop
/* ED478 001ED378 9094838F */  lw         $3, -0x6B70($gp)
/* ED47C 001ED37C 21187E00 */  addu       $3, $3, $fp
/* ED480 001ED380 000060AC */  sw         $0, 0x0($3)
.L001ED384:
/* ED484 001ED384 01007326 */  addiu      $19, $19, 0x1
.L001ED388:
/* ED488 001ED388 1E00632A */  slti       $3, $19, 0x1E
/* ED48C 001ED38C 98FF6014 */  bnez       $3, .L001ED1F0
/* ED490 001ED390 00000000 */   nop
/* ED494 001ED394 288E0070 */  paddub     $17, $0, $0
/* ED498 001ED398 28960070 */  paddub     $18, $0, $0
/* ED49C 001ED39C 24000010 */  b          .L001ED430
/* ED4A0 001ED3A0 00000000 */   nop
.L001ED3A4:
/* ED4A4 001ED3A4 80191200 */  sll        $3, $18, 6
/* ED4A8 001ED3A8 23187200 */  subu       $3, $3, $18
/* ED4AC 001ED3AC 80980300 */  sll        $19, $3, 2
/* ED4B0 001ED3B0 A094838F */  lw         $3, -0x6B60($gp)
/* ED4B4 001ED3B4 21187300 */  addu       $3, $3, $19
/* ED4B8 001ED3B8 00006384 */  lh         $3, 0x0($3)
/* ED4BC 001ED3BC 51006128 */  slti       $at, $3, 0x51
/* ED4C0 001ED3C0 1A002010 */  beqz       $at, .L001ED42C
/* ED4C4 001ED3C4 00000000 */   nop
/* ED4C8 001ED3C8 2A081102 */  slt        $at, $16, $17
/* ED4CC 001ED3CC 1B002014 */  bnez       $at, .L001ED43C
/* ED4D0 001ED3D0 00000000 */   nop
/* ED4D4 001ED3D4 01000424 */  addiu      $4, $0, 0x1
/* ED4D8 001ED3D8 80181200 */  sll        $3, $18, 2
/* ED4DC 001ED3DC 9094828F */  lw         $2, -0x6B70($gp)
/* ED4E0 001ED3E0 21104300 */  addu       $2, $2, $3
/* ED4E4 001ED3E4 000044AC */  sw         $4, 0x0($2)
/* ED4E8 001ED3E8 A094828F */  lw         $2, -0x6B60($gp)
/* ED4EC 001ED3EC 21205300 */  addu       $4, $2, $19
/* ED4F0 001ED3F0 80111100 */  sll        $2, $17, 6
/* ED4F4 001ED3F4 23105100 */  subu       $2, $2, $17
/* ED4F8 001ED3F8 80A00200 */  sll        $20, $2, 2
/* ED4FC 001ED3FC A494828F */  lw         $2, -0x6B5C($gp)
/* ED500 001ED400 21285400 */  addu       $5, $2, $20
/* ED504 001ED404 FC000624 */  addiu      $6, $0, 0xFC
/* ED508 001ED408 EC0C040C */  jal        memcpy
/* ED50C 001ED40C 00000000 */   nop
/* ED510 001ED410 A494838F */  lw         $3, -0x6B5C($gp)
/* ED514 001ED414 21187400 */  addu       $3, $3, $20
/* ED518 001ED418 00006484 */  lh         $4, 0x0($3)
/* ED51C 001ED41C A094838F */  lw         $3, -0x6B60($gp)
/* ED520 001ED420 21187300 */  addu       $3, $3, $19
/* ED524 001ED424 000064A4 */  sh         $4, 0x0($3)
/* ED528 001ED428 01003126 */  addiu      $17, $17, 0x1
.L001ED42C:
/* ED52C 001ED42C 01005226 */  addiu      $18, $18, 0x1
.L001ED430:
/* ED530 001ED430 1E00432A */  slti       $3, $18, 0x1E
/* ED534 001ED434 DBFF6014 */  bnez       $3, .L001ED3A4
/* ED538 001ED438 00000000 */   nop
.L001ED43C:
/* ED53C 001ED43C 9000BF7B */  lq         $31, 0x90($sp)
/* ED540 001ED440 8000BE7B */  lq         $fp, 0x80($sp)
/* ED544 001ED444 7000B77B */  lq         $23, 0x70($sp)
/* ED548 001ED448 6000B67B */  lq         $22, 0x60($sp)
/* ED54C 001ED44C 5000B57B */  lq         $21, 0x50($sp)
/* ED550 001ED450 4000B47B */  lq         $20, 0x40($sp)
/* ED554 001ED454 3000B37B */  lq         $19, 0x30($sp)
/* ED558 001ED458 2000B27B */  lq         $18, 0x20($sp)
/* ED55C 001ED45C 1000B17B */  lq         $17, 0x10($sp)
/* ED560 001ED460 0000B07B */  lq         $16, 0x0($sp)
/* ED564 001ED464 C000BD27 */  addiu      $sp, $sp, 0xC0
/* ED568 001ED468 0800E003 */  jr         $31
/* ED56C 001ED46C 00000000 */   nop
