.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingPickUpPoly__FP6CCPoly
/* A93A0 001A92A0 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* A93A4 001A92A4 4000BF7F */  sq         $31, 0x40($sp)
/* A93A8 001A92A8 3000B37F */  sq         $19, 0x30($sp)
/* A93AC 001A92AC 2000B27F */  sq         $18, 0x20($sp)
/* A93B0 001A92B0 1000B17F */  sq         $17, 0x10($sp)
/* A93B4 001A92B4 0000B07F */  sq         $16, 0x0($sp)
/* A93B8 001A92B8 289E8070 */  paddub     $19, $4, $0
/* A93BC 001A92BC D000A427 */  addiu      $4, $sp, 0xD0
/* A93C0 001A92C0 D501023C */  lui        $2, %hi(D_1D549E0)
/* A93C4 001A92C4 E0494524 */  addiu      $5, $2, %lo(D_1D549E0)
/* A93C8 001A92C8 0C86040C */  jal        sceVu0CopyVector
/* A93CC 001A92CC 00000000 */   nop
/* A93D0 001A92D0 E000A427 */  addiu      $4, $sp, 0xE0
/* A93D4 001A92D4 D501023C */  lui        $2, %hi(fishing_rect)
/* A93D8 001A92D8 D0494524 */  addiu      $5, $2, %lo(fishing_rect)
/* A93DC 001A92DC 0C86040C */  jal        sceVu0CopyVector
/* A93E0 001A92E0 00000000 */   nop
/* A93E4 001A92E4 28260070 */  paddub     $4, $0, $0
/* A93E8 001A92E8 18000010 */  b          .L001A934C
/* A93EC 001A92EC 00000000 */   nop
.L001A92F0:
/* A93F0 001A92F0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A93F4 001A92F4 00190400 */  sll        $3, $4, 4
/* A93F8 001A92F8 21187D00 */  addu       $3, $3, $sp
/* A93FC 001A92FC 5C0062AC */  sw         $2, 0x5C($3)
/* A9400 001A9300 01008230 */  andi       $2, $4, 0x1
/* A9404 001A9304 2B100200 */  sltu       $2, $0, $2
/* A9408 001A9308 00110200 */  sll        $2, $2, 4
/* A940C 001A930C 21105D00 */  addu       $2, $2, $sp
/* A9410 001A9310 D00040C4 */  lwc1       $f0, 0xD0($2)
/* A9414 001A9314 500060E4 */  swc1       $f0, 0x50($3)
/* A9418 001A9318 02008230 */  andi       $2, $4, 0x2
/* A941C 001A931C 2B100200 */  sltu       $2, $0, $2
/* A9420 001A9320 00110200 */  sll        $2, $2, 4
/* A9424 001A9324 21105D00 */  addu       $2, $2, $sp
/* A9428 001A9328 D40040C4 */  lwc1       $f0, 0xD4($2)
/* A942C 001A932C 540060E4 */  swc1       $f0, 0x54($3)
/* A9430 001A9330 04008230 */  andi       $2, $4, 0x4
/* A9434 001A9334 2B100200 */  sltu       $2, $0, $2
/* A9438 001A9338 00110200 */  sll        $2, $2, 4
/* A943C 001A933C 21105D00 */  addu       $2, $2, $sp
/* A9440 001A9340 D80040C4 */  lwc1       $f0, 0xD8($2)
/* A9444 001A9344 580060E4 */  swc1       $f0, 0x58($3)
/* A9448 001A9348 01008424 */  addiu      $4, $4, 0x1
.L001A934C:
/* A944C 001A934C 08008228 */  slti       $2, $4, 0x8
/* A9450 001A9350 E7FF4014 */  bnez       $2, .L001A92F0
/* A9454 001A9354 00000000 */   nop
/* A9458 001A9358 2700023C */  lui        $2, %hi(_498_3)
/* A945C 001A935C 00AF4624 */  addiu      $6, $2, %lo(_498_3)
/* A9460 001A9360 F000A527 */  addiu      $5, $sp, 0xF0
/* A9464 001A9364 03000424 */  addiu      $4, $0, 0x3
.L001A9368:
/* A9468 001A9368 0000C378 */  lq         $3, 0x0($6)
/* A946C 001A936C 1000C278 */  lq         $2, 0x10($6)
/* A9470 001A9370 2000C624 */  addiu      $6, $6, 0x20
/* A9474 001A9374 FFFF8424 */  addiu      $4, $4, -0x1
/* A9478 001A9378 0000A37C */  sq         $3, 0x0($5)
/* A947C 001A937C 1000A27C */  sq         $2, 0x10($5)
/* A9480 001A9380 2000A524 */  addiu      $5, $5, 0x20
/* A9484 001A9384 F8FF801C */  bgtz       $4, .L001A9368
/* A9488 001A9388 00000000 */   nop
/* A948C 001A938C 28860070 */  paddub     $16, $0, $0
/* A9490 001A9390 26000010 */  b          .L001A942C
/* A9494 001A9394 00000000 */   nop
.L001A9398:
/* A9498 001A9398 80101000 */  sll        $2, $16, 2
/* A949C 001A939C 21105000 */  addu       $2, $2, $16
/* A94A0 001A93A0 00110200 */  sll        $2, $2, 4
/* A94A4 001A93A4 21886202 */  addu       $17, $19, $2
/* A94A8 001A93A8 28262072 */  paddub     $4, $17, $0
/* A94AC 001A93AC 282E0070 */  paddub     $5, $0, $0
/* A94B0 001A93B0 50000624 */  addiu      $6, $0, 0x50
/* A94B4 001A93B4 5A0D040C */  jal        memset
/* A94B8 001A93B8 00000000 */   nop
/* A94BC 001A93BC 28960070 */  paddub     $18, $0, $0
/* A94C0 001A93C0 10000010 */  b          .L001A9404
/* A94C4 001A93C4 00000000 */   nop
.L001A93C8:
/* A94C8 001A93C8 00111200 */  sll        $2, $18, 4
/* A94CC 001A93CC 21202202 */  addu       $4, $17, $2
/* A94D0 001A93D0 40101000 */  sll        $2, $16, 1
/* A94D4 001A93D4 21105000 */  addu       $2, $2, $16
/* A94D8 001A93D8 80100200 */  sll        $2, $2, 2
/* A94DC 001A93DC 21185D00 */  addu       $3, $2, $sp
/* A94E0 001A93E0 80101200 */  sll        $2, $18, 2
/* A94E4 001A93E4 21104300 */  addu       $2, $2, $3
/* A94E8 001A93E8 F000428C */  lw         $2, 0xF0($2)
/* A94EC 001A93EC 00110200 */  sll        $2, $2, 4
/* A94F0 001A93F0 21105D00 */  addu       $2, $2, $sp
/* A94F4 001A93F4 50004524 */  addiu      $5, $2, 0x50
/* A94F8 001A93F8 0C86040C */  jal        sceVu0CopyVector
/* A94FC 001A93FC 00000000 */   nop
/* A9500 001A9400 01005226 */  addiu      $18, $18, 0x1
.L001A9404:
/* A9504 001A9404 0300422A */  slti       $2, $18, 0x3
/* A9508 001A9408 EFFF4014 */  bnez       $2, .L001A93C8
/* A950C 001A940C 00000000 */   nop
/* A9510 001A9410 30002426 */  addiu      $4, $17, 0x30
/* A9514 001A9414 282E2072 */  paddub     $5, $17, $0
/* A9518 001A9418 10002626 */  addiu      $6, $17, 0x10
/* A951C 001A941C 20002726 */  addiu      $7, $17, 0x20
/* A9520 001A9420 408C040C */  jal        PlaneNormal__FPfPfPfPf
/* A9524 001A9424 00000000 */   nop
/* A9528 001A9428 01001026 */  addiu      $16, $16, 0x1
.L001A942C:
/* A952C 001A942C 0800022A */  slti       $2, $16, 0x8
/* A9530 001A9430 D9FF4014 */  bnez       $2, .L001A9398
/* A9534 001A9434 00000000 */   nop
/* A9538 001A9438 08000224 */  addiu      $2, $0, 0x8
/* A953C 001A943C 4000BF7B */  lq         $31, 0x40($sp)
/* A9540 001A9440 3000B37B */  lq         $19, 0x30($sp)
/* A9544 001A9444 2000B27B */  lq         $18, 0x20($sp)
/* A9548 001A9448 1000B17B */  lq         $17, 0x10($sp)
/* A954C 001A944C 0000B07B */  lq         $16, 0x0($sp)
/* A9550 001A9450 5001BD27 */  addiu      $sp, $sp, 0x150
/* A9554 001A9454 0800E003 */  jr         $31
/* A9558 001A9458 00000000 */   nop
/* A955C 001A945C 00000000 */  nop
