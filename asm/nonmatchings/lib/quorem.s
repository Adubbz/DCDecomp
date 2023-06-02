.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel quorem
/* 478 00100378 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 47C 0010037C 2D70A000 */  daddu      $14, $5, $0
/* 480 00100380 4000B4FF */  sd         $20, 0x40($sp)
/* 484 00100384 7000BFFF */  sd         $31, 0x70($sp)
/* 488 00100388 2DA08000 */  daddu      $20, $4, $0
/* 48C 0010038C 6000B6FF */  sd         $22, 0x60($sp)
/* 490 00100390 5000B5FF */  sd         $21, 0x50($sp)
/* 494 00100394 3000B3FF */  sd         $19, 0x30($sp)
/* 498 00100398 2000B2FF */  sd         $18, 0x20($sp)
/* 49C 0010039C 1000B1FF */  sd         $17, 0x10($sp)
/* 4A0 001003A0 0000B0FF */  sd         $16, 0x0($sp)
/* 4A4 001003A4 1000D08D */  lw         $16, 0x10($14)
/* 4A8 001003A8 1000828E */  lw         $2, 0x10($20)
/* 4AC 001003AC 2A105000 */  slt        $2, $2, $16
/* 4B0 001003B0 6C004014 */  bnez       $2, .L00100564
/* 4B4 001003B4 2D100000 */   daddu     $2, $0, $0
/* 4B8 001003B8 FFFF1026 */  addiu      $16, $16, -0x1
/* 4BC 001003BC 1400CB25 */  addiu      $11, $14, 0x14
/* 4C0 001003C0 80381000 */  sll        $7, $16, 2
/* 4C4 001003C4 14009126 */  addiu      $17, $20, 0x14
/* 4C8 001003C8 21986701 */  addu       $19, $11, $7
/* 4CC 001003CC 21402702 */  addu       $8, $17, $7
/* 4D0 001003D0 0000628E */  lw         $2, 0x0($19)
/* 4D4 001003D4 00000D8D */  lw         $13, 0x0($8)
/* 4D8 001003D8 2D502002 */  daddu      $10, $17, $0
/* 4DC 001003DC 01004224 */  addiu      $2, $2, 0x1
/* 4E0 001003E0 1B00A201 */  divu       $0, $13, $2
/* 4E4 001003E4 01004050 */  beql       $2, $0, .L001003EC
/* 4E8 001003E8 CD010000 */   break     0, 7
.L001003EC:
/* 4EC 001003EC 12A80000 */  mflo       $21
/* 4F0 001003F0 2D90A002 */  daddu      $18, $21, $0
/* 4F4 001003F4 2A004012 */  beqz       $18, .L001004A0
/* 4F8 001003F8 2DB06001 */   daddu     $22, $11, $0
/* 4FC 001003FC 2D600000 */  daddu      $12, $0, $0
/* 500 00100400 2D180000 */  daddu      $3, $0, $0
/* 504 00100404 00000000 */  nop
.L00100408:
/* 508 00100408 0000648D */  lw         $4, 0x0($11)
/* 50C 0010040C 0000468D */  lw         $6, 0x0($10)
/* 510 00100410 04006B25 */  addiu      $11, $11, 0x4
/* 514 00100414 FFFF8230 */  andi       $2, $4, 0xFFFF
/* 518 00100418 2B386B02 */  sltu       $7, $19, $11
/* 51C 0010041C 18285200 */  mult       $5, $2, $18
/* 520 00100420 02240400 */  srl        $4, $4, 16
/* 524 00100424 18209200 */  mult       $4, $4, $18
/* 528 00100428 2110A300 */  addu       $2, $5, $3
/* 52C 0010042C FFFF4530 */  andi       $5, $2, 0xFFFF
/* 530 00100430 FFFFC330 */  andi       $3, $6, 0xFFFF
/* 534 00100434 02140200 */  srl        $2, $2, 16
/* 538 00100438 23186500 */  subu       $3, $3, $5
/* 53C 0010043C 21488200 */  addu       $9, $4, $2
/* 540 00100440 21186C00 */  addu       $3, $3, $12
/* 544 00100444 02340600 */  srl        $6, $6, 16
/* 548 00100448 FFFF2231 */  andi       $2, $9, 0xFFFF
/* 54C 0010044C 03640300 */  sra        $12, $3, 16
/* 550 00100450 2330C200 */  subu       $6, $6, $2
/* 554 00100454 2128CC00 */  addu       $5, $6, $12
/* 558 00100458 000043A5 */  sh         $3, 0x0($10)
/* 55C 0010045C 020045A5 */  sh         $5, 0x2($10)
/* 560 00100460 021C0900 */  srl        $3, $9, 16
/* 564 00100464 03640500 */  sra        $12, $5, 16
/* 568 00100468 E7FFE010 */  beqz       $7, .L00100408
/* 56C 0010046C 04004A25 */   addiu     $10, $10, 0x4
/* 570 00100470 0C00A015 */  bnez       $13, .L001004A4
/* 574 00100474 2D28C001 */   daddu     $5, $14, $0
/* 578 00100478 02000010 */  b          .L00100484
/* 57C 0010047C FCFF0825 */   addiu     $8, $8, -0x4
.L00100480:
/* 580 00100480 FFFF1026 */  addiu      $16, $16, -0x1
.L00100484:
/* 584 00100484 2B102802 */  sltu       $2, $17, $8
/* 588 00100488 05004050 */  beql       $2, $0, .L001004A0
/* 58C 0010048C 100090AE */   sw        $16, 0x10($20)
/* 590 00100490 0000028D */  lw         $2, 0x0($8)
/* 594 00100494 FAFF4010 */  beqz       $2, .L00100480
/* 598 00100498 FCFF0825 */   addiu     $8, $8, -0x4
/* 59C 0010049C 100090AE */  sw         $16, 0x10($20)
.L001004A0:
/* 5A0 001004A0 2D28C001 */  daddu      $5, $14, $0
.L001004A4:
/* 5A4 001004A4 E60F040C */  jal        __mcmp
/* 5A8 001004A8 2D208002 */   daddu     $4, $20, $0
/* 5AC 001004AC 2C004004 */  bltz       $2, .L00100560
/* 5B0 001004B0 2D58C002 */   daddu     $11, $22, $0
/* 5B4 001004B4 0100B226 */  addiu      $18, $21, 0x1
/* 5B8 001004B8 2D600000 */  daddu      $12, $0, $0
/* 5BC 001004BC 2D180000 */  daddu      $3, $0, $0
/* 5C0 001004C0 2D502002 */  daddu      $10, $17, $0
/* 5C4 001004C4 80381000 */  sll        $7, $16, 2
.L001004C8:
/* 5C8 001004C8 0000648D */  lw         $4, 0x0($11)
/* 5CC 001004CC 0000458D */  lw         $5, 0x0($10)
/* 5D0 001004D0 04006B25 */  addiu      $11, $11, 0x4
/* 5D4 001004D4 FFFF8230 */  andi       $2, $4, 0xFFFF
/* 5D8 001004D8 02340400 */  srl        $6, $4, 16
/* 5DC 001004DC 21104300 */  addu       $2, $2, $3
/* 5E0 001004E0 FFFF4430 */  andi       $4, $2, 0xFFFF
/* 5E4 001004E4 FFFFA330 */  andi       $3, $5, 0xFFFF
/* 5E8 001004E8 02140200 */  srl        $2, $2, 16
/* 5EC 001004EC 23186400 */  subu       $3, $3, $4
/* 5F0 001004F0 2148C200 */  addu       $9, $6, $2
/* 5F4 001004F4 21186C00 */  addu       $3, $3, $12
/* 5F8 001004F8 FFFF2231 */  andi       $2, $9, 0xFFFF
/* 5FC 001004FC 022C0500 */  srl        $5, $5, 16
/* 600 00100500 03640300 */  sra        $12, $3, 16
/* 604 00100504 2328A200 */  subu       $5, $5, $2
/* 608 00100508 2128AC00 */  addu       $5, $5, $12
/* 60C 0010050C 000043A5 */  sh         $3, 0x0($10)
/* 610 00100510 020045A5 */  sh         $5, 0x2($10)
/* 614 00100514 021C0900 */  srl        $3, $9, 16
/* 618 00100518 03640500 */  sra        $12, $5, 16
/* 61C 0010051C 2B106B02 */  sltu       $2, $19, $11
/* 620 00100520 E9FF4010 */  beqz       $2, .L001004C8
/* 624 00100524 04004A25 */   addiu     $10, $10, 0x4
/* 628 00100528 21402702 */  addu       $8, $17, $7
/* 62C 0010052C 0000028D */  lw         $2, 0x0($8)
/* 630 00100530 0C004014 */  bnez       $2, .L00100564
/* 634 00100534 2D104002 */   daddu     $2, $18, $0
/* 638 00100538 02000010 */  b          .L00100544
/* 63C 0010053C FCFF0825 */   addiu     $8, $8, -0x4
.L00100540:
/* 640 00100540 FFFF1026 */  addiu      $16, $16, -0x1
.L00100544:
/* 644 00100544 2B102802 */  sltu       $2, $17, $8
/* 648 00100548 05004050 */  beql       $2, $0, .L00100560
/* 64C 0010054C 100090AE */   sw        $16, 0x10($20)
/* 650 00100550 0000028D */  lw         $2, 0x0($8)
/* 654 00100554 FAFF4050 */  beql       $2, $0, .L00100540
/* 658 00100558 FCFF0825 */   addiu     $8, $8, -0x4
/* 65C 0010055C 100090AE */  sw         $16, 0x10($20)
.L00100560:
/* 660 00100560 2D104002 */  daddu      $2, $18, $0
.L00100564:
/* 664 00100564 7000BFDF */  ld         $31, 0x70($sp)
/* 668 00100568 6000B6DF */  ld         $22, 0x60($sp)
/* 66C 0010056C 5000B5DF */  ld         $21, 0x50($sp)
/* 670 00100570 4000B4DF */  ld         $20, 0x40($sp)
/* 674 00100574 3000B3DF */  ld         $19, 0x30($sp)
/* 678 00100578 2000B2DF */  ld         $18, 0x20($sp)
/* 67C 0010057C 1000B1DF */  ld         $17, 0x10($sp)
/* 680 00100580 0000B0DF */  ld         $16, 0x0($sp)
/* 684 00100584 0800E003 */  jr         $31
/* 688 00100588 8000BD27 */   addiu     $sp, $sp, 0x80
/* 68C 0010058C 00000000 */  nop