.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CHK_USER_INNER_PRODUCT__FP12RS_STACKDATAi
/* E2320 001E2220 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* E2324 001E2224 5000BF7F */  sq         $31, 0x50($sp)
/* E2328 001E2228 4000B37F */  sq         $19, 0x40($sp)
/* E232C 001E222C 3000B27F */  sq         $18, 0x30($sp)
/* E2330 001E2230 2000B17F */  sq         $17, 0x20($sp)
/* E2334 001E2234 1000B07F */  sq         $16, 0x10($sp)
/* E2338 001E2238 0400B5E7 */  swc1       $f21, 0x4($sp)
/* E233C 001E223C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* E2340 001E2240 2896A070 */  paddub     $18, $5, $0
/* E2344 001E2244 E09C828F */  lw         $2, -0x6320($gp)
/* E2348 001E2248 9000518C */  lw         $17, 0x90($2)
/* E234C 001E224C 28860070 */  paddub     $16, $0, $0
/* E2350 001E2250 08009324 */  addiu      $19, $4, 0x8
/* E2354 001E2254 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E2358 001E2258 00000000 */   nop
/* E235C 001E225C 00008244 */  mtc1       $2, $f0
/* E2360 001E2260 00000000 */  nop
/* E2364 001E2264 60008046 */  cvt.s.w    $f1, $f0
/* E2368 001E2268 9C8180C7 */  lwc1       $f0, -0x7E64($gp)
/* E236C 001E226C 42000146 */  mul.s      $f1, $f0, $f1
/* E2370 001E2270 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E2374 001E2274 00008244 */  mtc1       $2, $f0
/* E2378 001E2278 00000000 */  nop
/* E237C 001E227C 01050146 */  sub.s      $f20, $f0, $f1
/* E2380 001E2280 0100023C */  lui        $2, (0x186A0 >> 16)
/* E2384 001E2284 A0864234 */  ori        $2, $2, (0x186A0 & 0xFFFF)
/* E2388 001E2288 00008244 */  mtc1       $2, $f0
/* E238C 001E228C 00000000 */  nop
/* E2390 001E2290 60058046 */  cvt.s.w    $f21, $f0
/* E2394 001E2294 03000224 */  addiu      $2, $0, 0x3
/* E2398 001E2298 06004216 */  bne        $18, $2, .L001E22B4
/* E239C 001E229C 00000000 */   nop
/* E23A0 001E22A0 28266072 */  paddub     $4, $19, $0
/* E23A4 001E22A4 08009324 */  addiu      $19, $4, 0x8
/* E23A8 001E22A8 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E23AC 001E22AC 00000000 */   nop
/* E23B0 001E22B0 46050046 */  mov.s      $f21, $f0
.L001E22B4:
/* E23B4 001E22B4 8000A427 */  addiu      $4, $sp, 0x80
/* E23B8 001E22B8 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* E23BC 001E22BC 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* E23C0 001E22C0 0C86040C */  jal        sceVu0CopyVector
/* E23C4 001E22C4 00000000 */   nop
/* E23C8 001E22C8 10350224 */  addiu      $2, $0, 0x3510
/* E23CC 001E22CC 18882202 */  mult       $17, $17, $2
/* E23D0 001E22D0 E09C828F */  lw         $2, -0x6320($gp)
/* E23D4 001E22D4 21105100 */  addu       $2, $2, $17
/* E23D8 001E22D8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E23DC 001E22DC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E23E0 001E22E0 21204100 */  addu       $4, $2, $at
/* E23E4 001E22E4 6000A527 */  addiu      $5, $sp, 0x60
/* E23E8 001E22E8 A000998C */  lw         $25, 0xA0($4)
/* E23EC 001E22EC A000398F */  lw         $25, 0xA0($25)
/* E23F0 001E22F0 09F82003 */  jalr       $25
/* E23F4 001E22F4 00000000 */   nop
/* E23F8 001E22F8 E09C828F */  lw         $2, -0x6320($gp)
/* E23FC 001E22FC 21105100 */  addu       $2, $2, $17
/* E2400 001E2300 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E2404 001E2304 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E2408 001E2308 21204100 */  addu       $4, $2, $at
/* E240C 001E230C 7000A527 */  addiu      $5, $sp, 0x70
/* E2410 001E2310 A000998C */  lw         $25, 0xA0($4)
/* E2414 001E2314 5800398F */  lw         $25, 0x58($25)
/* E2418 001E2318 09F82003 */  jalr       $25
/* E241C 001E231C 00000000 */   nop
/* E2420 001E2320 2900023C */  lui        $2, %hi(_738_3)
/* E2424 001E2324 30184224 */  addiu      $2, $2, %lo(_738_3)
/* E2428 001E2328 A000A327 */  addiu      $3, $sp, 0xA0
/* E242C 001E232C 00004278 */  lq         $2, 0x0($2)
/* E2430 001E2330 0000627C */  sq         $2, 0x0($3)
/* E2434 001E2334 B000A427 */  addiu      $4, $sp, 0xB0
/* E2438 001E2338 2A86040C */  jal        sceVu0UnitMatrix
/* E243C 001E233C 00000000 */   nop
/* E2440 001E2340 F000A427 */  addiu      $4, $sp, 0xF0
/* E2444 001E2344 B000A527 */  addiu      $5, $sp, 0xB0
/* E2448 001E2348 7400ACC7 */  lwc1       $f12, 0x74($sp)
/* E244C 001E234C A686040C */  jal        sceVu0RotMatrixY
/* E2450 001E2350 00000000 */   nop
/* E2454 001E2354 A000A427 */  addiu      $4, $sp, 0xA0
/* E2458 001E2358 F000A527 */  addiu      $5, $sp, 0xF0
/* E245C 001E235C 28368070 */  paddub     $6, $4, $0
/* E2460 001E2360 6285040C */  jal        sceVu0ApplyMatrix
/* E2464 001E2364 00000000 */   nop
/* E2468 001E2368 A000A427 */  addiu      $4, $sp, 0xA0
/* E246C 001E236C 282E8070 */  paddub     $5, $4, $0
/* E2470 001E2370 9285040C */  jal        sceVu0Normalize
/* E2474 001E2374 00000000 */   nop
/* E2478 001E2378 6000A1C7 */  lwc1       $f1, 0x60($sp)
/* E247C 001E237C 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* E2480 001E2380 01080046 */  sub.s      $f0, $f1, $f0
/* E2484 001E2384 9000A0E7 */  swc1       $f0, 0x90($sp)
/* E2488 001E2388 6800A1C7 */  lwc1       $f1, 0x68($sp)
/* E248C 001E238C 8800A0C7 */  lwc1       $f0, 0x88($sp)
/* E2490 001E2390 01080046 */  sub.s      $f0, $f1, $f0
/* E2494 001E2394 9800A0E7 */  swc1       $f0, 0x98($sp)
/* E2498 001E2398 9400A0AF */  sw         $0, 0x94($sp)
/* E249C 001E239C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E24A0 001E23A0 9C00A2AF */  sw         $2, 0x9C($sp)
/* E24A4 001E23A4 9000A427 */  addiu      $4, $sp, 0x90
/* E24A8 001E23A8 282E8070 */  paddub     $5, $4, $0
/* E24AC 001E23AC 9285040C */  jal        sceVu0Normalize
/* E24B0 001E23B0 00000000 */   nop
/* E24B4 001E23B4 A000A427 */  addiu      $4, $sp, 0xA0
/* E24B8 001E23B8 9000A527 */  addiu      $5, $sp, 0x90
/* E24BC 001E23BC 8885040C */  jal        sceVu0InnerProduct
/* E24C0 001E23C0 00000000 */   nop
/* E24C4 001E23C4 34001446 */  c.lt.s     $f0, $f20
/* E24C8 001E23C8 00000000 */  nop
/* E24CC 001E23CC 0A000145 */  bc1t       .L001E23F8
/* E24D0 001E23D0 00000000 */   nop
/* E24D4 001E23D4 6000A427 */  addiu      $4, $sp, 0x60
/* E24D8 001E23D8 8000A527 */  addiu      $5, $sp, 0x80
/* E24DC 001E23DC 648D040C */  jal        DistVector__FPfPf
/* E24E0 001E23E0 00000000 */   nop
/* E24E4 001E23E4 34001546 */  c.lt.s     $f0, $f21
/* E24E8 001E23E8 00000000 */  nop
/* E24EC 001E23EC 02000045 */  bc1f       .L001E23F8
/* E24F0 001E23F0 00000000 */   nop
/* E24F4 001E23F4 01001024 */  addiu      $16, $0, 0x1
.L001E23F8:
/* E24F8 001E23F8 28266072 */  paddub     $4, $19, $0
/* E24FC 001E23FC 282E0072 */  paddub     $5, $16, $0
/* E2500 001E2400 B485070C */  jal        SetStack__FP12RS_STACKDATAi_3
/* E2504 001E2404 00000000 */   nop
/* E2508 001E2408 5000BF7B */  lq         $31, 0x50($sp)
/* E250C 001E240C 4000B37B */  lq         $19, 0x40($sp)
/* E2510 001E2410 3000B27B */  lq         $18, 0x30($sp)
/* E2514 001E2414 2000B17B */  lq         $17, 0x20($sp)
/* E2518 001E2418 1000B07B */  lq         $16, 0x10($sp)
/* E251C 001E241C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* E2520 001E2420 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* E2524 001E2424 3001BD27 */  addiu      $sp, $sp, 0x130
/* E2528 001E2428 0800E003 */  jr         $31
/* E252C 001E242C 00000000 */   nop
