.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DebugItemGetKey__Fv
/* 12B340 0022B240 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12B344 0022B244 3000BF7F */  sq         $31, 0x30($sp)
/* 12B348 0022B248 2000B27F */  sq         $18, 0x20($sp)
/* 12B34C 0022B24C 1000B17F */  sq         $17, 0x10($sp)
/* 12B350 0022B250 0000B07F */  sq         $16, 0x0($sp)
/* 12B354 0022B254 28860070 */  paddub     $16, $0, $0
/* 12B358 0022B258 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B35C 0022B25C C08F318C */  lw         $17, -0x7040($at)
/* 12B360 0022B260 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B364 0022B264 C48F328C */  lw         $18, -0x703C($at)
/* 12B368 0022B268 CC01023C */  lui        $2, %hi(GamePad)
/* 12B36C 0022B26C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B370 0022B270 00100524 */  addiu      $5, $0, 0x1000
/* 12B374 0022B274 1CAE040C */  jal        Down__8CGamePadFi
/* 12B378 0022B278 00000000 */   nop
/* 12B37C 0022B27C 06004010 */  beqz       $2, .L0022B298
/* 12B380 0022B280 00000000 */   nop
/* 12B384 0022B284 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B388 0022B288 C08F228C */  lw         $2, -0x7040($at)
/* 12B38C 0022B28C F8FF4224 */  addiu      $2, $2, -0x8
/* 12B390 0022B290 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B394 0022B294 C08F22AC */  sw         $2, -0x7040($at)
.L0022B298:
/* 12B398 0022B298 CC01023C */  lui        $2, %hi(GamePad)
/* 12B39C 0022B29C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B3A0 0022B2A0 00400524 */  addiu      $5, $0, 0x4000
/* 12B3A4 0022B2A4 1CAE040C */  jal        Down__8CGamePadFi
/* 12B3A8 0022B2A8 00000000 */   nop
/* 12B3AC 0022B2AC 06004010 */  beqz       $2, .L0022B2C8
/* 12B3B0 0022B2B0 00000000 */   nop
/* 12B3B4 0022B2B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B3B8 0022B2B8 C08F228C */  lw         $2, -0x7040($at)
/* 12B3BC 0022B2BC 08004224 */  addiu      $2, $2, 0x8
/* 12B3C0 0022B2C0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B3C4 0022B2C4 C08F22AC */  sw         $2, -0x7040($at)
.L0022B2C8:
/* 12B3C8 0022B2C8 CC01023C */  lui        $2, %hi(GamePad)
/* 12B3CC 0022B2CC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B3D0 0022B2D0 00200524 */  addiu      $5, $0, 0x2000
/* 12B3D4 0022B2D4 1CAE040C */  jal        Down__8CGamePadFi
/* 12B3D8 0022B2D8 00000000 */   nop
/* 12B3DC 0022B2DC 06004010 */  beqz       $2, .L0022B2F8
/* 12B3E0 0022B2E0 00000000 */   nop
/* 12B3E4 0022B2E4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B3E8 0022B2E8 C08F228C */  lw         $2, -0x7040($at)
/* 12B3EC 0022B2EC 01004224 */  addiu      $2, $2, 0x1
/* 12B3F0 0022B2F0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B3F4 0022B2F4 C08F22AC */  sw         $2, -0x7040($at)
.L0022B2F8:
/* 12B3F8 0022B2F8 CC01023C */  lui        $2, %hi(GamePad)
/* 12B3FC 0022B2FC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B400 0022B300 00800534 */  ori        $5, $0, 0x8000
/* 12B404 0022B304 1CAE040C */  jal        Down__8CGamePadFi
/* 12B408 0022B308 00000000 */   nop
/* 12B40C 0022B30C 06004010 */  beqz       $2, .L0022B328
/* 12B410 0022B310 00000000 */   nop
/* 12B414 0022B314 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B418 0022B318 C08F228C */  lw         $2, -0x7040($at)
/* 12B41C 0022B31C FFFF4224 */  addiu      $2, $2, -0x1
/* 12B420 0022B320 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B424 0022B324 C08F22AC */  sw         $2, -0x7040($at)
.L0022B328:
/* 12B428 0022B328 CC01023C */  lui        $2, %hi(GamePad)
/* 12B42C 0022B32C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B430 0022B330 00010524 */  addiu      $5, $0, 0x100
/* 12B434 0022B334 1CAE040C */  jal        Down__8CGamePadFi
/* 12B438 0022B338 00000000 */   nop
/* 12B43C 0022B33C 15004010 */  beqz       $2, .L0022B394
/* 12B440 0022B340 00000000 */   nop
/* 12B444 0022B344 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B448 0022B348 C88F228C */  lw         $2, -0x7038($at)
/* 12B44C 0022B34C 05004010 */  beqz       $2, .L0022B364
/* 12B450 0022B350 00000000 */   nop
/* 12B454 0022B354 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B458 0022B358 C88F20AC */  sw         $0, -0x7038($at)
/* 12B45C 0022B35C 04000010 */  b          .L0022B370
/* 12B460 0022B360 00000000 */   nop
.L0022B364:
/* 12B464 0022B364 01000224 */  addiu      $2, $0, 0x1
/* 12B468 0022B368 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B46C 0022B36C C88F22AC */  sw         $2, -0x7038($at)
.L0022B370:
/* 12B470 0022B370 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B474 0022B374 C08F248C */  lw         $4, -0x7040($at)
/* 12B478 0022B378 7CAC080C */  jal        ConvDebugSelectToExcelListNo__Fi
/* 12B47C 0022B37C 00000000 */   nop
/* 12B480 0022B380 28264070 */  paddub     $4, $2, $0
/* 12B484 0022B384 E494858F */  lw         $5, -0x6B1C($gp)
/* 12B488 0022B388 0CAB080C */  jal        InitItemPolygonView__FiP1
/* 12B48C 0022B38C 00000000 */   nop
/* 12B490 0022B390 9C9782AF */  sw         $2, -0x6864($gp)
.L0022B394:
/* 12B494 0022B394 CC01023C */  lui        $2, %hi(GamePad)
/* 12B498 0022B398 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B49C 0022B39C 05000524 */  addiu      $5, $0, 0x5
/* 12B4A0 0022B3A0 1CAE040C */  jal        Down__8CGamePadFi
/* 12B4A4 0022B3A4 00000000 */   nop
/* 12B4A8 0022B3A8 06004010 */  beqz       $2, .L0022B3C4
/* 12B4AC 0022B3AC 00000000 */   nop
/* 12B4B0 0022B3B0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B4B4 0022B3B4 C08F228C */  lw         $2, -0x7040($at)
/* 12B4B8 0022B3B8 C0FF4224 */  addiu      $2, $2, -0x40
/* 12B4BC 0022B3BC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B4C0 0022B3C0 C08F22AC */  sw         $2, -0x7040($at)
.L0022B3C4:
/* 12B4C4 0022B3C4 CC01023C */  lui        $2, %hi(GamePad)
/* 12B4C8 0022B3C8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B4CC 0022B3CC 0A000524 */  addiu      $5, $0, 0xA
/* 12B4D0 0022B3D0 1CAE040C */  jal        Down__8CGamePadFi
/* 12B4D4 0022B3D4 00000000 */   nop
/* 12B4D8 0022B3D8 06004010 */  beqz       $2, .L0022B3F4
/* 12B4DC 0022B3DC 00000000 */   nop
/* 12B4E0 0022B3E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B4E4 0022B3E4 C08F228C */  lw         $2, -0x7040($at)
/* 12B4E8 0022B3E8 40004224 */  addiu      $2, $2, 0x40
/* 12B4EC 0022B3EC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B4F0 0022B3F0 C08F22AC */  sw         $2, -0x7040($at)
.L0022B3F4:
/* 12B4F4 0022B3F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B4F8 0022B3F8 C08F228C */  lw         $2, -0x7040($at)
/* 12B4FC 0022B3FC 04004104 */  bgez       $2, .L0022B410
/* 12B500 0022B400 00000000 */   nop
/* 12B504 0022B404 40014224 */  addiu      $2, $2, 0x140
/* 12B508 0022B408 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B50C 0022B40C C08F22AC */  sw         $2, -0x7040($at)
.L0022B410:
/* 12B510 0022B410 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B514 0022B414 C08F228C */  lw         $2, -0x7040($at)
/* 12B518 0022B418 40014128 */  slti       $at, $2, 0x140
/* 12B51C 0022B41C 04002014 */  bnez       $at, .L0022B430
/* 12B520 0022B420 00000000 */   nop
/* 12B524 0022B424 C0FE4224 */  addiu      $2, $2, -0x140
/* 12B528 0022B428 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B52C 0022B42C C08F22AC */  sw         $2, -0x7040($at)
.L0022B430:
/* 12B530 0022B430 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B534 0022B434 C08F228C */  lw         $2, -0x7040($at)
/* 12B538 0022B438 83110200 */  sra        $2, $2, 6
/* 12B53C 0022B43C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B540 0022B440 C48F22AC */  sw         $2, -0x703C($at)
/* 12B544 0022B444 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B548 0022B448 C08F228C */  lw         $2, -0x7040($at)
/* 12B54C 0022B44C 05002216 */  bne        $17, $2, .L0022B464
/* 12B550 0022B450 00000000 */   nop
/* 12B554 0022B454 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B558 0022B458 C48F228C */  lw         $2, -0x703C($at)
/* 12B55C 0022B45C 04004212 */  beq        $18, $2, .L0022B470
/* 12B560 0022B460 00000000 */   nop
.L0022B464:
/* 12B564 0022B464 28260070 */  paddub     $4, $0, $0
/* 12B568 0022B468 BCB3080C */  jal        ComMenuSePlay__Fi
/* 12B56C 0022B46C 00000000 */   nop
.L0022B470:
/* 12B570 0022B470 CC01023C */  lui        $2, %hi(GamePad)
/* 12B574 0022B474 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B578 0022B478 40000524 */  addiu      $5, $0, 0x40
/* 12B57C 0022B47C 1CAE040C */  jal        Down__8CGamePadFi
/* 12B580 0022B480 00000000 */   nop
/* 12B584 0022B484 14004010 */  beqz       $2, .L0022B4D8
/* 12B588 0022B488 00000000 */   nop
/* 12B58C 0022B48C 01000424 */  addiu      $4, $0, 0x1
/* 12B590 0022B490 BCB3080C */  jal        ComMenuSePlay__Fi
/* 12B594 0022B494 00000000 */   nop
/* 12B598 0022B498 BE11040C */  jal        rand
/* 12B59C 0022B49C 00000000 */   nop
/* 12B5A0 0022B4A0 03000324 */  addiu      $3, $0, 0x3
/* 12B5A4 0022B4A4 1A004300 */  div        $0, $2, $3
/* 12B5A8 0022B4A8 00000000 */  nop
/* 12B5AC 0022B4AC 00000000 */  nop
/* 12B5B0 0022B4B0 10100000 */  mfhi       $2
/* 12B5B4 0022B4B4 01004624 */  addiu      $6, $2, 0x1
/* 12B5B8 0022B4B8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12B5BC 0022B4BC C08F248C */  lw         $4, -0x7040($at)
/* 12B5C0 0022B4C0 7CAC080C */  jal        ConvDebugSelectToExcelListNo__Fi
/* 12B5C4 0022B4C4 00000000 */   nop
/* 12B5C8 0022B4C8 D494848F */  lw         $4, -0x6B2C($gp)
/* 12B5CC 0022B4CC 282E4070 */  paddub     $5, $2, $0
/* 12B5D0 0022B4D0 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* 12B5D4 0022B4D4 00000000 */   nop
.L0022B4D8:
/* 12B5D8 0022B4D8 CC01023C */  lui        $2, %hi(GamePad)
/* 12B5DC 0022B4DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B5E0 0022B4E0 20000524 */  addiu      $5, $0, 0x20
/* 12B5E4 0022B4E4 1CAE040C */  jal        Down__8CGamePadFi
/* 12B5E8 0022B4E8 00000000 */   nop
/* 12B5EC 0022B4EC 07004010 */  beqz       $2, .L0022B50C
/* 12B5F0 0022B4F0 00000000 */   nop
/* 12B5F4 0022B4F4 FFFF1024 */  addiu      $16, $0, -0x1
/* 12B5F8 0022B4F8 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 12B5FC 0022B4FC 0C3A30AC */  sw         $16, (0x1DA3A0C & 0xFFFF)($at)
/* 12B600 0022B500 02000424 */  addiu      $4, $0, 0x2
/* 12B604 0022B504 BCB3080C */  jal        ComMenuSePlay__Fi
/* 12B608 0022B508 00000000 */   nop
.L0022B50C:
/* 12B60C 0022B50C CC01023C */  lui        $2, %hi(GamePad)
/* 12B610 0022B510 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12B614 0022B514 40000524 */  addiu      $5, $0, 0x40
/* 12B618 0022B518 2CAE040C */  jal        Down2__8CGamePadFi
/* 12B61C 0022B51C 00000000 */   nop
/* 12B620 0022B520 1B004010 */  beqz       $2, .L0022B590
/* 12B624 0022B524 00000000 */   nop
/* 12B628 0022B528 01011124 */  addiu      $17, $0, 0x101
/* 12B62C 0022B52C 12000010 */  b          .L0022B578
/* 12B630 0022B530 00000000 */   nop
.L0022B534:
/* 12B634 0022B534 28262072 */  paddub     $4, $17, $0
/* 12B638 0022B538 D443070C */  jal        GetWeaponData__Fi
/* 12B63C 0022B53C 00000000 */   nop
/* 12B640 0022B540 0C004010 */  beqz       $2, .L0022B574
/* 12B644 0022B544 00000000 */   nop
/* 12B648 0022B548 38004384 */  lh         $3, 0x38($2)
/* 12B64C 0022B54C 09006010 */  beqz       $3, .L0022B574
/* 12B650 0022B550 00000000 */   nop
/* 12B654 0022B554 01000224 */  addiu      $2, $0, 0x1
/* 12B658 0022B558 06006210 */  beq        $3, $2, .L0022B574
/* 12B65C 0022B55C 00000000 */   nop
/* 12B660 0022B560 D494848F */  lw         $4, -0x6B2C($gp)
/* 12B664 0022B564 282E2072 */  paddub     $5, $17, $0
/* 12B668 0022B568 28360070 */  paddub     $6, $0, $0
/* 12B66C 0022B56C 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* 12B670 0022B570 00000000 */   nop
.L0022B574:
/* 12B674 0022B574 01003126 */  addiu      $17, $17, 0x1
.L0022B578:
/* 12B678 0022B578 7901222A */  slti       $2, $17, 0x179
/* 12B67C 0022B57C EDFF4014 */  bnez       $2, .L0022B534
/* 12B680 0022B580 00000000 */   nop
/* 12B684 0022B584 01000424 */  addiu      $4, $0, 0x1
/* 12B688 0022B588 BCB3080C */  jal        ComMenuSePlay__Fi
/* 12B68C 0022B58C 00000000 */   nop
.L0022B590:
/* 12B690 0022B590 28160072 */  paddub     $2, $16, $0
/* 12B694 0022B594 3000BF7B */  lq         $31, 0x30($sp)
/* 12B698 0022B598 2000B27B */  lq         $18, 0x20($sp)
/* 12B69C 0022B59C 1000B17B */  lq         $17, 0x10($sp)
/* 12B6A0 0022B5A0 0000B07B */  lq         $16, 0x0($sp)
/* 12B6A4 0022B5A4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12B6A8 0022B5A8 0800E003 */  jr         $31
/* 12B6AC 0022B5AC 00000000 */   nop
