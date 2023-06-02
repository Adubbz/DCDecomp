.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__14CDngStatusDataFv
/* BF440 001BF340 80FFBD27 */  addiu      $sp, $sp, -0x80
/* BF444 001BF344 1000BF7F */  sq         $31, 0x10($sp)
/* BF448 001BF348 0000B07F */  sq         $16, 0x0($sp)
/* BF44C 001BF34C 28868070 */  paddub     $16, $4, $0
/* BF450 001BF350 FFFF0224 */  addiu      $2, $0, -0x1
/* BF454 001BF354 000082A0 */  sb         $2, 0x0($4)
/* BF458 001BF358 010080A0 */  sb         $0, 0x1($4)
/* BF45C 001BF35C 020082A0 */  sb         $2, 0x2($4)
/* BF460 001BF360 030082A0 */  sb         $2, 0x3($4)
/* BF464 001BF364 040080A0 */  sb         $0, 0x4($4)
/* BF468 001BF368 01000224 */  addiu      $2, $0, 0x1
/* BF46C 001BF36C 050082A0 */  sb         $2, 0x5($4)
/* BF470 001BF370 2700023C */  lui        $2, %hi(_781)
/* BF474 001BF374 50B54224 */  addiu      $2, $2, %lo(_781)
/* BF478 001BF378 2000A427 */  addiu      $4, $sp, 0x20
/* BF47C 001BF37C 00004378 */  lq         $3, 0x0($2)
/* BF480 001BF380 100042DC */  ld         $2, 0x10($2)
/* BF484 001BF384 0000837C */  sq         $3, 0x0($4)
/* BF488 001BF388 100082FC */  sd         $2, 0x10($4)
/* BF48C 001BF38C 2700023C */  lui        $2, %hi(_782)
/* BF490 001BF390 70B54224 */  addiu      $2, $2, %lo(_782)
/* BF494 001BF394 4000A427 */  addiu      $4, $sp, 0x40
/* BF498 001BF398 00004378 */  lq         $3, 0x0($2)
/* BF49C 001BF39C 100042DC */  ld         $2, 0x10($2)
/* BF4A0 001BF3A0 0000837C */  sq         $3, 0x0($4)
/* BF4A4 001BF3A4 100082FC */  sd         $2, 0x10($4)
/* BF4A8 001BF3A8 2700023C */  lui        $2, %hi(_783_2)
/* BF4AC 001BF3AC 90B54224 */  addiu      $2, $2, %lo(_783_2)
/* BF4B0 001BF3B0 6000A427 */  addiu      $4, $sp, 0x60
/* BF4B4 001BF3B4 00004378 */  lq         $3, 0x0($2)
/* BF4B8 001BF3B8 100042DC */  ld         $2, 0x10($2)
/* BF4BC 001BF3BC 0000837C */  sq         $3, 0x0($4)
/* BF4C0 001BF3C0 100082FC */  sd         $2, 0x10($4)
/* BF4C4 001BF3C4 281E0070 */  paddub     $3, $0, $0
/* BF4C8 001BF3C8 26000010 */  b          .L001BF464
/* BF4CC 001BF3CC 00000000 */   nop
.L001BF3D0:
/* BF4D0 001BF3D0 80380300 */  sll        $7, $3, 2
/* BF4D4 001BF3D4 2120FD00 */  addu       $4, $7, $sp
/* BF4D8 001BF3D8 40008284 */  lh         $2, 0x40($4)
/* BF4DC 001BF3DC 40280300 */  sll        $5, $3, 1
/* BF4E0 001BF3E0 2128B000 */  addu       $5, $5, $16
/* BF4E4 001BF3E4 0600A2A4 */  sh         $2, 0x6($5)
/* BF4E8 001BF3E8 1200A2A4 */  sh         $2, 0x12($5)
/* BF4EC 001BF3EC 6000848C */  lw         $4, 0x60($4)
/* BF4F0 001BF3F0 2110F000 */  addu       $2, $7, $16
/* BF4F4 001BF3F4 484344AC */  sw         $4, 0x4348($2)
/* BF4F8 001BF3F8 C84240AC */  sw         $0, 0x42C8($2)
/* BF4FC 001BF3FC E042A0A4 */  sh         $0, 0x42E0($5)
/* BF500 001BF400 FFFF0424 */  addiu      $4, $0, -0x1
/* BF504 001BF404 21107000 */  addu       $2, $3, $16
/* BF508 001BF408 404344A0 */  sb         $4, 0x4340($2)
/* BF50C 001BF40C 28260070 */  paddub     $4, $0, $0
/* BF510 001BF410 0B000010 */  b          .L001BF440
/* BF514 001BF414 00000000 */   nop
.L001BF418:
/* BF518 001BF418 FFFF0624 */  addiu      $6, $0, -0x1
/* BF51C 001BF41C A80A0224 */  addiu      $2, $0, 0xAA8
/* BF520 001BF420 18106200 */  mult       $2, $3, $2
/* BF524 001BF424 21285000 */  addu       $5, $2, $16
/* BF528 001BF428 40110400 */  sll        $2, $4, 5
/* BF52C 001BF42C 23104400 */  subu       $2, $2, $4
/* BF530 001BF430 C0100200 */  sll        $2, $2, 3
/* BF534 001BF434 21104500 */  addu       $2, $2, $5
/* BF538 001BF438 0C4546A4 */  sh         $6, 0x450C($2)
/* BF53C 001BF43C 01008424 */  addiu      $4, $4, 0x1
.L001BF440:
/* BF540 001BF440 0B008228 */  slti       $2, $4, 0xB
/* BF544 001BF444 F4FF4014 */  bnez       $2, .L001BF418
/* BF548 001BF448 00000000 */   nop
/* BF54C 001BF44C F041043C */  lui        $4, (0x41F00000 >> 16)
/* BF550 001BF450 2110F000 */  addu       $2, $7, $16
/* BF554 001BF454 EC4244AC */  sw         $4, 0x42EC($2)
/* BF558 001BF458 044344AC */  sw         $4, 0x4304($2)
/* BF55C 001BF45C 244340AC */  sw         $0, 0x4324($2)
/* BF560 001BF460 01006324 */  addiu      $3, $3, 0x1
.L001BF464:
/* BF564 001BF464 06006228 */  slti       $2, $3, 0x6
/* BF568 001BF468 D9FF4014 */  bnez       $2, .L001BF3D0
/* BF56C 001BF46C 00000000 */   nop
/* BF570 001BF470 404300A2 */  sb         $0, 0x4340($16)
/* BF574 001BF474 28260072 */  paddub     $4, $16, $0
/* BF578 001BF478 02010524 */  addiu      $5, $0, 0x102
/* BF57C 001BF47C 28360070 */  paddub     $6, $0, $0
/* BF580 001BF480 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* BF584 001BF484 00000000 */   nop
/* BF588 001BF488 204300AE */  sw         $0, 0x4320($16)
/* BF58C 001BF48C 01000224 */  addiu      $2, $0, 0x1
/* BF590 001BF490 3C4302AE */  sw         $2, 0x433C($16)
/* BF594 001BF494 1C4300AE */  sw         $0, 0x431C($16)
/* BF598 001BF498 28260070 */  paddub     $4, $0, $0
/* BF59C 001BF49C 05000010 */  b          .L001BF4B4
/* BF5A0 001BF4A0 00000000 */   nop
.L001BF4A4:
/* BF5A4 001BF4A4 FFFF0324 */  addiu      $3, $0, -0x1
/* BF5A8 001BF4A8 21109000 */  addu       $2, $4, $16
/* BF5AC 001BF4AC BF4243A0 */  sb         $3, 0x42BF($2)
/* BF5B0 001BF4B0 01008424 */  addiu      $4, $4, 0x1
.L001BF4B4:
/* BF5B4 001BF4B4 07008228 */  slti       $2, $4, 0x7
/* BF5B8 001BF4B8 FAFF4014 */  bnez       $2, .L001BF4A4
/* BF5BC 001BF4BC 00000000 */   nop
/* BF5C0 001BF4C0 281E0070 */  paddub     $3, $0, $0
/* BF5C4 001BF4C4 12000010 */  b          .L001BF510
/* BF5C8 001BF4C8 00000000 */   nop
.L001BF4CC:
/* BF5CC 001BF4CC 28260070 */  paddub     $4, $0, $0
/* BF5D0 001BF4D0 0B000010 */  b          .L001BF500
/* BF5D4 001BF4D4 00000000 */   nop
.L001BF4D8:
/* BF5D8 001BF4D8 80100300 */  sll        $2, $3, 2
/* BF5DC 001BF4DC 21284300 */  addu       $5, $2, $3
/* BF5E0 001BF4E0 80100500 */  sll        $2, $5, 2
/* BF5E4 001BF4E4 2110A200 */  addu       $2, $5, $2
/* BF5E8 001BF4E8 C0100200 */  sll        $2, $2, 3
/* BF5EC 001BF4EC 21285000 */  addu       $5, $2, $16
/* BF5F0 001BF4F0 40100400 */  sll        $2, $4, 1
/* BF5F4 001BF4F4 21104500 */  addu       $2, $2, $5
/* BF5F8 001BF4F8 983C40A4 */  sh         $0, 0x3C98($2)
/* BF5FC 001BF4FC 01008424 */  addiu      $4, $4, 0x1
.L001BF500:
/* BF600 001BF500 64008228 */  slti       $2, $4, 0x64
/* BF604 001BF504 F4FF4014 */  bnez       $2, .L001BF4D8
/* BF608 001BF508 00000000 */   nop
/* BF60C 001BF50C 01006324 */  addiu      $3, $3, 0x1
.L001BF510:
/* BF610 001BF510 06006228 */  slti       $2, $3, 0x6
/* BF614 001BF514 EDFF4014 */  bnez       $2, .L001BF4CC
/* BF618 001BF518 00000000 */   nop
/* BF61C 001BF51C 281E0070 */  paddub     $3, $0, $0
/* BF620 001BF520 11000010 */  b          .L001BF568
/* BF624 001BF524 00000000 */   nop
.L001BF528:
/* BF628 001BF528 28260070 */  paddub     $4, $0, $0
/* BF62C 001BF52C 0A000010 */  b          .L001BF558
/* BF630 001BF530 00000000 */   nop
.L001BF534:
/* BF634 001BF534 FFFF0624 */  addiu      $6, $0, -0x1
/* BF638 001BF538 80100300 */  sll        $2, $3, 2
/* BF63C 001BF53C 21284300 */  addu       $5, $2, $3
/* BF640 001BF540 80100500 */  sll        $2, $5, 2
/* BF644 001BF544 2110A200 */  addu       $2, $5, $2
/* BF648 001BF548 21105000 */  addu       $2, $2, $16
/* BF64C 001BF54C 21108200 */  addu       $2, $4, $2
/* BF650 001BF550 104246A0 */  sb         $6, 0x4210($2)
/* BF654 001BF554 01008424 */  addiu      $4, $4, 0x1
.L001BF558:
/* BF658 001BF558 19008228 */  slti       $2, $4, 0x19
/* BF65C 001BF55C F5FF4014 */  bnez       $2, .L001BF534
/* BF660 001BF560 00000000 */   nop
/* BF664 001BF564 01006324 */  addiu      $3, $3, 0x1
.L001BF568:
/* BF668 001BF568 06006228 */  slti       $2, $3, 0x6
/* BF66C 001BF56C EEFF4014 */  bnez       $2, .L001BF528
/* BF670 001BF570 00000000 */   nop
/* BF674 001BF574 28260072 */  paddub     $4, $16, $0
/* BF678 001BF578 D8FB060C */  jal        InitResLimmitZone__14CDngStatusDataFv
/* BF67C 001BF57C 00000000 */   nop
/* BF680 001BF580 281E0070 */  paddub     $3, $0, $0
/* BF684 001BF584 1A000010 */  b          .L001BF5F0
/* BF688 001BF588 00000000 */   nop
.L001BF58C:
/* BF68C 001BF58C 28260070 */  paddub     $4, $0, $0
/* BF690 001BF590 13000010 */  b          .L001BF5E0
/* BF694 001BF594 00000000 */   nop
.L001BF598:
/* BF698 001BF598 28460070 */  paddub     $8, $0, $0
/* BF69C 001BF59C 0C000010 */  b          .L001BF5D0
/* BF6A0 001BF5A0 00000000 */   nop
.L001BF5A4:
/* BF6A4 001BF5A4 FFFF0724 */  addiu      $7, $0, -0x1
/* BF6A8 001BF5A8 80280300 */  sll        $5, $3, 2
/* BF6AC 001BF5AC 2128A300 */  addu       $5, $5, $3
/* BF6B0 001BF5B0 002A0500 */  sll        $5, $5, 8
/* BF6B4 001BF5B4 2130B000 */  addu       $6, $5, $16
/* BF6B8 001BF5B8 40290400 */  sll        $5, $4, 5
/* BF6BC 001BF5BC 2130A600 */  addu       $6, $5, $6
/* BF6C0 001BF5C0 80280800 */  sll        $5, $8, 2
/* BF6C4 001BF5C4 2128A600 */  addu       $5, $5, $6
/* BF6C8 001BF5C8 7802A7AC */  sw         $7, 0x278($5)
/* BF6CC 001BF5CC 01000825 */  addiu      $8, $8, 0x1
.L001BF5D0:
/* BF6D0 001BF5D0 08000529 */  slti       $5, $8, 0x8
/* BF6D4 001BF5D4 F3FFA014 */  bnez       $5, .L001BF5A4
/* BF6D8 001BF5D8 00000000 */   nop
/* BF6DC 001BF5DC 01008424 */  addiu      $4, $4, 0x1
.L001BF5E0:
/* BF6E0 001BF5E0 28008528 */  slti       $5, $4, 0x28
/* BF6E4 001BF5E4 ECFFA014 */  bnez       $5, .L001BF598
/* BF6E8 001BF5E8 00000000 */   nop
/* BF6EC 001BF5EC 01006324 */  addiu      $3, $3, 0x1
.L001BF5F0:
/* BF6F0 001BF5F0 06006428 */  slti       $4, $3, 0x6
/* BF6F4 001BF5F4 E5FF8014 */  bnez       $4, .L001BF58C
/* BF6F8 001BF5F8 00000000 */   nop
/* BF6FC 001BF5FC 281E0070 */  paddub     $3, $0, $0
/* BF700 001BF600 15000010 */  b          .L001BF658
/* BF704 001BF604 00000000 */   nop
.L001BF608:
/* BF708 001BF608 28260070 */  paddub     $4, $0, $0
/* BF70C 001BF60C 0E000010 */  b          .L001BF648
/* BF710 001BF610 00000000 */   nop
.L001BF614:
/* BF714 001BF614 FFFF0724 */  addiu      $7, $0, -0x1
/* BF718 001BF618 00290300 */  sll        $5, $3, 4
/* BF71C 001BF61C 2330A300 */  subu       $6, $5, $3
/* BF720 001BF620 80280600 */  sll        $5, $6, 2
/* BF724 001BF624 2128C500 */  addu       $5, $6, $5
/* BF728 001BF628 00290500 */  sll        $5, $5, 4
/* BF72C 001BF62C 2130B000 */  addu       $6, $5, $16
/* BF730 001BF630 40280400 */  sll        $5, $4, 1
/* BF734 001BF634 2128A400 */  addu       $5, $5, $4
/* BF738 001BF638 80280500 */  sll        $5, $5, 2
/* BF73C 001BF63C 2128A600 */  addu       $5, $5, $6
/* BF740 001BF640 7820A7AC */  sw         $7, 0x2078($5)
/* BF744 001BF644 01008424 */  addiu      $4, $4, 0x1
.L001BF648:
/* BF748 001BF648 64008528 */  slti       $5, $4, 0x64
/* BF74C 001BF64C F1FFA014 */  bnez       $5, .L001BF614
/* BF750 001BF650 00000000 */   nop
/* BF754 001BF654 01006324 */  addiu      $3, $3, 0x1
.L001BF658:
/* BF758 001BF658 06006428 */  slti       $4, $3, 0x6
/* BF75C 001BF65C EAFF8014 */  bnez       $4, .L001BF608
/* BF760 001BF660 00000000 */   nop
/* BF764 001BF664 464300A6 */  sh         $0, 0x4346($16)
/* BF768 001BF668 60430626 */  addiu      $6, $16, 0x4360
/* BF76C 001BF66C 32000324 */  addiu      $3, $0, 0x32
/* BF770 001BF670 604303A2 */  sb         $3, 0x4360($16)
/* BF774 001BF674 FFFF0324 */  addiu      $3, $0, -0x1
/* BF778 001BF678 624303A6 */  sh         $3, 0x4362($16)
/* BF77C 001BF67C 644303A6 */  sh         $3, 0x4364($16)
/* BF780 001BF680 664303A6 */  sh         $3, 0x4366($16)
/* BF784 001BF684 281E0070 */  paddub     $3, $0, $0
/* BF788 001BF688 07000010 */  b          .L001BF6A8
/* BF78C 001BF68C 00000000 */   nop
.L001BF690:
/* BF790 001BF690 FFFF0524 */  addiu      $5, $0, -0x1
/* BF794 001BF694 40200300 */  sll        $4, $3, 1
/* BF798 001BF698 21208600 */  addu       $4, $4, $6
/* BF79C 001BF69C 0E0085A4 */  sh         $5, 0xE($4)
/* BF7A0 001BF6A0 DC0080A4 */  sh         $0, 0xDC($4)
/* BF7A4 001BF6A4 01006324 */  addiu      $3, $3, 0x1
.L001BF6A8:
/* BF7A8 001BF6A8 67006428 */  slti       $4, $3, 0x67
/* BF7AC 001BF6AC F8FF8014 */  bnez       $4, .L001BF690
/* BF7B0 001BF6B0 00000000 */   nop
/* BF7B4 001BF6B4 282E0070 */  paddub     $5, $0, $0
/* BF7B8 001BF6B8 08000010 */  b          .L001BF6DC
/* BF7BC 001BF6BC 00000000 */   nop
.L001BF6C0:
/* BF7C0 001BF6C0 FFFF0424 */  addiu      $4, $0, -0x1
/* BF7C4 001BF6C4 40190500 */  sll        $3, $5, 5
/* BF7C8 001BF6C8 21187000 */  addu       $3, $3, $16
/* BF7CC 001BF6CC 0100013C */  lui        $at, (0x10000 >> 16)
/* BF7D0 001BF6D0 21086100 */  addu       $at, $3, $at
/* BF7D4 001BF6D4 FC8424A4 */  sh         $4, -0x7B04($at)
/* BF7D8 001BF6D8 0100A524 */  addiu      $5, $5, 0x1
.L001BF6DC:
/* BF7DC 001BF6DC 2B00A328 */  slti       $3, $5, 0x2B
/* BF7E0 001BF6E0 F7FF6014 */  bnez       $3, .L001BF6C0
/* BF7E4 001BF6E4 00000000 */   nop
/* BF7E8 001BF6E8 1000BF7B */  lq         $31, 0x10($sp)
/* BF7EC 001BF6EC 0000B07B */  lq         $16, 0x0($sp)
/* BF7F0 001BF6F0 8000BD27 */  addiu      $sp, $sp, 0x80
/* BF7F4 001BF6F4 0800E003 */  jr         $31
/* BF7F8 001BF6F8 00000000 */   nop
/* BF7FC 001BF6FC 00000000 */  nop
