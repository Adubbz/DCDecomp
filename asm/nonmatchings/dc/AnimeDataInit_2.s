.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF
/* 494A0 001493A0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 494A4 001493A4 9000BF7F */  sq         $31, 0x90($sp)
/* 494A8 001493A8 8000BE7F */  sq         $fp, 0x80($sp)
/* 494AC 001493AC 7000B77F */  sq         $23, 0x70($sp)
/* 494B0 001493B0 6000B67F */  sq         $22, 0x60($sp)
/* 494B4 001493B4 5000B57F */  sq         $21, 0x50($sp)
/* 494B8 001493B8 4000B47F */  sq         $20, 0x40($sp)
/* 494BC 001493BC 3000B37F */  sq         $19, 0x30($sp)
/* 494C0 001493C0 2000B27F */  sq         $18, 0x20($sp)
/* 494C4 001493C4 1000B17F */  sq         $17, 0x10($sp)
/* 494C8 001493C8 0000B07F */  sq         $16, 0x0($sp)
/* 494CC 001493CC 28B68070 */  paddub     $22, $4, $0
/* 494D0 001493D0 28BEC070 */  paddub     $23, $6, $0
/* 494D4 001493D4 28AEE070 */  paddub     $21, $7, $0
/* 494D8 001493D8 0800B18C */  lw         $17, 0x8($5)
/* 494DC 001493DC FFFF1224 */  addiu      $18, $0, -0x1
/* 494E0 001493E0 08A0040C */  jal        GetFrameNum__6CFrameFv
/* 494E4 001493E4 00000000 */   nop
/* 494E8 001493E8 28F64070 */  paddub     $fp, $2, $0
/* 494EC 001493EC 289E0070 */  paddub     $19, $0, $0
/* 494F0 001493F0 1B000010 */  b          .L00149460
/* 494F4 001493F4 00000000 */   nop
.L001493F8:
/* 494F8 001493F8 80101300 */  sll        $2, $19, 2
/* 494FC 001493FC 21105300 */  addu       $2, $2, $19
/* 49500 00149400 C0100200 */  sll        $2, $2, 3
/* 49504 00149404 23105300 */  subu       $2, $2, $19
/* 49508 00149408 00110200 */  sll        $2, $2, 4
/* 4950C 0014940C 2180C202 */  addu       $16, $22, $2
/* 49510 00149410 40101300 */  sll        $2, $19, 1
/* 49514 00149414 21105300 */  addu       $2, $2, $19
/* 49518 00149418 80100200 */  sll        $2, $2, 2
/* 4951C 0014941C 21105300 */  addu       $2, $2, $19
/* 49520 00149420 00110200 */  sll        $2, $2, 4
/* 49524 00149424 21A0A202 */  addu       $20, $21, $2
/* 49528 00149428 10008426 */  addiu      $4, $20, 0x10
/* 4952C 0014942C D0010526 */  addiu      $5, $16, 0x1D0
/* 49530 00149430 1086040C */  jal        sceVu0CopyMatrix
/* 49534 00149434 00000000 */   nop
/* 49538 00149438 1001028E */  lw         $2, 0x110($16)
/* 4953C 0014943C 23185600 */  subu       $3, $2, $22
/* 49540 00149440 70020224 */  addiu      $2, $0, 0x270
/* 49544 00149444 1A006200 */  div        $0, $3, $2
/* 49548 00149448 02004014 */  bnez       $2, .L00149454
/* 4954C 0014944C 00000000 */   nop
/* 49550 00149450 CD010000 */  break      0, 7
.L00149454:
/* 49554 00149454 12100000 */  mflo       $2
/* 49558 00149458 000082AE */  sw         $2, 0x0($20)
/* 4955C 0014945C 01007326 */  addiu      $19, $19, 0x1
.L00149460:
/* 49560 00149460 2A107E02 */  slt        $2, $19, $fp
/* 49564 00149464 E4FF4014 */  bnez       $2, .L001493F8
/* 49568 00149468 00000000 */   nop
/* 4956C 0014946C 82000010 */  b          .L00149678
/* 49570 00149470 00000000 */   nop
.L00149474:
/* 49574 00149474 0800238E */  lw         $3, 0x8($17)
/* 49578 00149478 C8000224 */  addiu      $2, $0, 0xC8
/* 4957C 0014947C 7C006210 */  beq        $3, $2, .L00149670
/* 49580 00149480 00000000 */   nop
/* 49584 00149484 0400248E */  lw         $4, 0x4($17)
/* 49588 00149488 80100400 */  sll        $2, $4, 2
/* 4958C 0014948C 21104400 */  addu       $2, $2, $4
/* 49590 00149490 C0100200 */  sll        $2, $2, 3
/* 49594 00149494 23104400 */  subu       $2, $2, $4
/* 49598 00149498 00110200 */  sll        $2, $2, 4
/* 4959C 0014949C 2110C202 */  addu       $2, $22, $2
/* 495A0 001494A0 1001428C */  lw         $2, 0x110($2)
/* 495A4 001494A4 289E0070 */  paddub     $19, $0, $0
/* 495A8 001494A8 0A000010 */  b          .L001494D4
/* 495AC 001494AC 00000000 */   nop
.L001494B0:
/* 495B0 001494B0 80181300 */  sll        $3, $19, 2
/* 495B4 001494B4 21187300 */  addu       $3, $3, $19
/* 495B8 001494B8 C0180300 */  sll        $3, $3, 3
/* 495BC 001494BC 23187300 */  subu       $3, $3, $19
/* 495C0 001494C0 00190300 */  sll        $3, $3, 4
/* 495C4 001494C4 2118C302 */  addu       $3, $22, $3
/* 495C8 001494C8 05004310 */  beq        $2, $3, .L001494E0
/* 495CC 001494CC 00000000 */   nop
/* 495D0 001494D0 01007326 */  addiu      $19, $19, 0x1
.L001494D4:
/* 495D4 001494D4 2B186402 */  sltu       $3, $19, $4
/* 495D8 001494D8 F5FF6014 */  bnez       $3, .L001494B0
/* 495DC 001494DC 00000000 */   nop
.L001494E0:
/* 495E0 001494E0 0000248E */  lw         $4, 0x0($17)
/* 495E4 001494E4 62004412 */  beq        $18, $4, .L00149670
/* 495E8 001494E8 00000000 */   nop
/* 495EC 001494EC 80100400 */  sll        $2, $4, 2
/* 495F0 001494F0 21104400 */  addu       $2, $2, $4
/* 495F4 001494F4 C0100200 */  sll        $2, $2, 3
/* 495F8 001494F8 23104400 */  subu       $2, $2, $4
/* 495FC 001494FC 00110200 */  sll        $2, $2, 4
/* 49600 00149500 2180C202 */  addu       $16, $22, $2
/* 49604 00149504 1001028E */  lw         $2, 0x110($16)
/* 49608 00149508 289E0070 */  paddub     $19, $0, $0
/* 4960C 0014950C 0A000010 */  b          .L00149538
/* 49610 00149510 00000000 */   nop
.L00149514:
/* 49614 00149514 80181300 */  sll        $3, $19, 2
/* 49618 00149518 21187300 */  addu       $3, $3, $19
/* 4961C 0014951C C0180300 */  sll        $3, $3, 3
/* 49620 00149520 23187300 */  subu       $3, $3, $19
/* 49624 00149524 00190300 */  sll        $3, $3, 4
/* 49628 00149528 2118C302 */  addu       $3, $22, $3
/* 4962C 0014952C 05004310 */  beq        $2, $3, .L00149544
/* 49630 00149530 00000000 */   nop
/* 49634 00149534 01007326 */  addiu      $19, $19, 0x1
.L00149538:
/* 49638 00149538 2B186402 */  sltu       $3, $19, $4
/* 4963C 0014953C F5FF6014 */  bnez       $3, .L00149514
/* 49640 00149540 00000000 */   nop
.L00149544:
/* 49644 00149544 28260072 */  paddub     $4, $16, $0
/* 49648 00149548 88A8040C */  jal        GetVisual__9CFrameVu1Fv
/* 4964C 0014954C 00000000 */   nop
/* 49650 00149550 45004010 */  beqz       $2, .L00149668
/* 49654 00149554 00000000 */   nop
/* 49658 00149558 28264070 */  paddub     $4, $2, $0
/* 4965C 0014955C 0800598C */  lw         $25, 0x8($2)
/* 49660 00149560 1000398F */  lw         $25, 0x10($25)
/* 49664 00149564 09F82003 */  jalr       $25
/* 49668 00149568 00000000 */   nop
/* 4966C 0014956C 28964070 */  paddub     $18, $2, $0
/* 49670 00149570 1000438C */  lw         $3, 0x10($2)
/* 49674 00149574 21804300 */  addu       $16, $2, $3
/* 49678 00149578 0C00428C */  lw         $2, 0xC($2)
/* 4967C 0014957C 00110200 */  sll        $2, $2, 4
/* 49680 00149580 02110200 */  srl        $2, $2, 4
/* 49684 00149584 01004524 */  addiu      $5, $2, 0x1
/* 49688 00149588 2826E072 */  paddub     $4, $23, $0
/* 4968C 0014958C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 49690 00149590 00000000 */   nop
/* 49694 00149594 0000248E */  lw         $4, 0x0($17)
/* 49698 00149598 40180400 */  sll        $3, $4, 1
/* 4969C 0014959C 21186400 */  addu       $3, $3, $4
/* 496A0 001495A0 80180300 */  sll        $3, $3, 2
/* 496A4 001495A4 21186400 */  addu       $3, $3, $4
/* 496A8 001495A8 00190300 */  sll        $3, $3, 4
/* 496AC 001495AC 21187500 */  addu       $3, $3, $21
/* 496B0 001495B0 080062AC */  sw         $2, 0x8($3)
/* 496B4 001495B4 0C00448E */  lw         $4, 0xC($18)
/* 496B8 001495B8 0000238E */  lw         $3, 0x0($17)
/* 496BC 001495BC 40100300 */  sll        $2, $3, 1
/* 496C0 001495C0 21104300 */  addu       $2, $2, $3
/* 496C4 001495C4 80100200 */  sll        $2, $2, 2
/* 496C8 001495C8 21104300 */  addu       $2, $2, $3
/* 496CC 001495CC 00110200 */  sll        $2, $2, 4
/* 496D0 001495D0 21105500 */  addu       $2, $2, $21
/* 496D4 001495D4 040044AC */  sw         $4, 0x4($2)
/* 496D8 001495D8 A000A427 */  addiu      $4, $sp, 0xA0
/* 496DC 001495DC 2A86040C */  jal        sceVu0UnitMatrix
/* 496E0 001495E0 00000000 */   nop
/* 496E4 001495E4 0000238E */  lw         $3, 0x0($17)
/* 496E8 001495E8 40100300 */  sll        $2, $3, 1
/* 496EC 001495EC 21104300 */  addu       $2, $2, $3
/* 496F0 001495F0 80100200 */  sll        $2, $2, 2
/* 496F4 001495F4 21104300 */  addu       $2, $2, $3
/* 496F8 001495F8 00110200 */  sll        $2, $2, 4
/* 496FC 001495FC 2110A202 */  addu       $2, $21, $2
/* 49700 00149600 A000A427 */  addiu      $4, $sp, 0xA0
/* 49704 00149604 10004524 */  addiu      $5, $2, 0x10
/* 49708 00149608 1086040C */  jal        sceVu0CopyMatrix
/* 4970C 0014960C 00000000 */   nop
/* 49710 00149610 289E0070 */  paddub     $19, $0, $0
/* 49714 00149614 10000010 */  b          .L00149658
/* 49718 00149618 00000000 */   nop
.L0014961C:
/* 4971C 0014961C 00291300 */  sll        $5, $19, 4
/* 49720 00149620 0000238E */  lw         $3, 0x0($17)
/* 49724 00149624 40100300 */  sll        $2, $3, 1
/* 49728 00149628 21104300 */  addu       $2, $2, $3
/* 4972C 0014962C 80100200 */  sll        $2, $2, 2
/* 49730 00149630 21104300 */  addu       $2, $2, $3
/* 49734 00149634 00110200 */  sll        $2, $2, 4
/* 49738 00149638 21105500 */  addu       $2, $2, $21
/* 4973C 0014963C 0800428C */  lw         $2, 0x8($2)
/* 49740 00149640 21204500 */  addu       $4, $2, $5
/* 49744 00149644 21300502 */  addu       $6, $16, $5
/* 49748 00149648 A000A527 */  addiu      $5, $sp, 0xA0
/* 4974C 0014964C 6285040C */  jal        sceVu0ApplyMatrix
/* 49750 00149650 00000000 */   nop
/* 49754 00149654 01007326 */  addiu      $19, $19, 0x1
.L00149658:
/* 49758 00149658 0C00428E */  lw         $2, 0xC($18)
/* 4975C 0014965C 2B106202 */  sltu       $2, $19, $2
/* 49760 00149660 EEFF4014 */  bnez       $2, .L0014961C
/* 49764 00149664 00000000 */   nop
.L00149668:
/* 49768 00149668 0000328E */  lw         $18, 0x0($17)
/* 4976C 0014966C 00000000 */  nop
.L00149670:
/* 49770 00149670 1400318E */  lw         $17, 0x14($17)
/* 49774 00149674 00000000 */  nop
.L00149678:
/* 49778 00149678 7EFF2016 */  bnez       $17, .L00149474
/* 4977C 0014967C 00000000 */   nop
/* 49780 00149680 01000224 */  addiu      $2, $0, 0x1
/* 49784 00149684 9000BF7B */  lq         $31, 0x90($sp)
/* 49788 00149688 8000BE7B */  lq         $fp, 0x80($sp)
/* 4978C 0014968C 7000B77B */  lq         $23, 0x70($sp)
/* 49790 00149690 6000B67B */  lq         $22, 0x60($sp)
/* 49794 00149694 5000B57B */  lq         $21, 0x50($sp)
/* 49798 00149698 4000B47B */  lq         $20, 0x40($sp)
/* 4979C 0014969C 3000B37B */  lq         $19, 0x30($sp)
/* 497A0 001496A0 2000B27B */  lq         $18, 0x20($sp)
/* 497A4 001496A4 1000B17B */  lq         $17, 0x10($sp)
/* 497A8 001496A8 0000B07B */  lq         $16, 0x0($sp)
/* 497AC 001496AC E000BD27 */  addiu      $sp, $sp, 0xE0
/* 497B0 001496B0 0800E003 */  jr         $31
/* 497B4 001496B4 00000000 */   nop
/* 497B8 001496B8 00000000 */  nop
/* 497BC 001496BC 00000000 */  nop
