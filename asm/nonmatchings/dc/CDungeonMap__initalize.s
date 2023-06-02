.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel initalize__11CDungeonMapFv
/* CC590 001CC490 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* CC594 001CC494 3000BF7F */  sq         $31, 0x30($sp)
/* CC598 001CC498 2000B27F */  sq         $18, 0x20($sp)
/* CC59C 001CC49C 1000B17F */  sq         $17, 0x10($sp)
/* CC5A0 001CC4A0 0000B07F */  sq         $16, 0x0($sp)
/* CC5A4 001CC4A4 288E8070 */  paddub     $17, $4, $0
/* CC5A8 001CC4A8 28860070 */  paddub     $16, $0, $0
/* CC5AC 001CC4AC 05000010 */  b          .L001CC4C4
/* CC5B0 001CC4B0 00000000 */   nop
.L001CC4B4:
/* CC5B4 001CC4B4 80181000 */  sll        $3, $16, 2
/* CC5B8 001CC4B8 21187100 */  addu       $3, $3, $17
/* CC5BC 001CC4BC 780460AC */  sw         $0, 0x478($3)
/* CC5C0 001CC4C0 01001026 */  addiu      $16, $16, 0x1
.L001CC4C4:
/* CC5C4 001CC4C4 0600032A */  slti       $3, $16, 0x6
/* CC5C8 001CC4C8 FAFF6014 */  bnez       $3, .L001CC4B4
/* CC5CC 001CC4CC 00000000 */   nop
/* CC5D0 001CC4D0 28860070 */  paddub     $16, $0, $0
/* CC5D4 001CC4D4 05000010 */  b          .L001CC4EC
/* CC5D8 001CC4D8 00000000 */   nop
.L001CC4DC:
/* CC5DC 001CC4DC 80181000 */  sll        $3, $16, 2
/* CC5E0 001CC4E0 21187100 */  addu       $3, $3, $17
/* CC5E4 001CC4E4 6C0460AC */  sw         $0, 0x46C($3)
/* CC5E8 001CC4E8 01001026 */  addiu      $16, $16, 0x1
.L001CC4EC:
/* CC5EC 001CC4EC 0300032A */  slti       $3, $16, 0x3
/* CC5F0 001CC4F0 FAFF6014 */  bnez       $3, .L001CC4DC
/* CC5F4 001CC4F4 00000000 */   nop
/* CC5F8 001CC4F8 0100013C */  lui        $at, (0x10000 >> 16)
/* CC5FC 001CC4FC 21082102 */  addu       $at, $17, $at
/* CC600 001CC500 64BC20AC */  sw         $0, -0x439C($at)
/* CC604 001CC504 0100013C */  lui        $at, (0x10000 >> 16)
/* CC608 001CC508 21082102 */  addu       $at, $17, $at
/* CC60C 001CC50C 68BC20AC */  sw         $0, -0x4398($at)
/* CC610 001CC510 0100013C */  lui        $at, (0x10000 >> 16)
/* CC614 001CC514 21082102 */  addu       $at, $17, $at
/* CC618 001CC518 6CBC20AC */  sw         $0, -0x4394($at)
/* CC61C 001CC51C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC620 001CC520 21082102 */  addu       $at, $17, $at
/* CC624 001CC524 70BC20AC */  sw         $0, -0x4390($at)
/* CC628 001CC528 0100013C */  lui        $at, (0x10000 >> 16)
/* CC62C 001CC52C 21082102 */  addu       $at, $17, $at
/* CC630 001CC530 74BC20AC */  sw         $0, -0x438C($at)
/* CC634 001CC534 0100013C */  lui        $at, (0x10000 >> 16)
/* CC638 001CC538 21082102 */  addu       $at, $17, $at
/* CC63C 001CC53C 78BC20AC */  sw         $0, -0x4388($at)
/* CC640 001CC540 0100013C */  lui        $at, (0x10000 >> 16)
/* CC644 001CC544 21082102 */  addu       $at, $17, $at
/* CC648 001CC548 7CBC20AC */  sw         $0, -0x4384($at)
/* CC64C 001CC54C 28860070 */  paddub     $16, $0, $0
/* CC650 001CC550 07000010 */  b          .L001CC570
/* CC654 001CC554 00000000 */   nop
.L001CC558:
/* CC658 001CC558 80191000 */  sll        $3, $16, 6
/* CC65C 001CC55C 21187100 */  addu       $3, $3, $17
/* CC660 001CC560 0100013C */  lui        $at, (0x10000 >> 16)
/* CC664 001CC564 21086100 */  addu       $at, $3, $at
/* CC668 001CC568 60B620AC */  sw         $0, -0x49A0($at)
/* CC66C 001CC56C 01001026 */  addiu      $16, $16, 0x1
.L001CC570:
/* CC670 001CC570 1800032A */  slti       $3, $16, 0x18
/* CC674 001CC574 F8FF6014 */  bnez       $3, .L001CC558
/* CC678 001CC578 00000000 */   nop
/* CC67C 001CC57C 28860070 */  paddub     $16, $0, $0
/* CC680 001CC580 07000010 */  b          .L001CC5A0
/* CC684 001CC584 00000000 */   nop
.L001CC588:
/* CC688 001CC588 40191000 */  sll        $3, $16, 5
/* CC68C 001CC58C 21187100 */  addu       $3, $3, $17
/* CC690 001CC590 0100013C */  lui        $at, (0x10000 >> 16)
/* CC694 001CC594 21086100 */  addu       $at, $3, $at
/* CC698 001CC598 94BC20AC */  sw         $0, -0x436C($at)
/* CC69C 001CC59C 01001026 */  addiu      $16, $16, 0x1
.L001CC5A0:
/* CC6A0 001CC5A0 0100013C */  lui        $at, (0x10000 >> 16)
/* CC6A4 001CC5A4 21082102 */  addu       $at, $17, $at
/* CC6A8 001CC5A8 80BD238C */  lw         $3, -0x4280($at)
/* CC6AC 001CC5AC 2A180302 */  slt        $3, $16, $3
/* CC6B0 001CC5B0 F5FF6014 */  bnez       $3, .L001CC588
/* CC6B4 001CC5B4 00000000 */   nop
/* CC6B8 001CC5B8 B40320AE */  sw         $0, 0x3B4($17)
/* CC6BC 001CC5BC B80320AE */  sw         $0, 0x3B8($17)
/* CC6C0 001CC5C0 600420AE */  sw         $0, 0x460($17)
/* CC6C4 001CC5C4 28860070 */  paddub     $16, $0, $0
/* CC6C8 001CC5C8 0B000010 */  b          .L001CC5F8
/* CC6CC 001CC5CC 00000000 */   nop
.L001CC5D0:
/* CC6D0 001CC5D0 C0101000 */  sll        $2, $16, 3
/* CC6D4 001CC5D4 23105000 */  subu       $2, $2, $16
/* CC6D8 001CC5D8 80100200 */  sll        $2, $2, 2
/* CC6DC 001CC5DC 21105000 */  addu       $2, $2, $16
/* CC6E0 001CC5E0 00110200 */  sll        $2, $2, 4
/* CC6E4 001CC5E4 21102202 */  addu       $2, $17, $2
/* CC6E8 001CC5E8 90044424 */  addiu      $4, $2, 0x490
/* CC6EC 001CC5EC E806070C */  jal        initalize__13CDungeonPartsFv
/* CC6F0 001CC5F0 00000000 */   nop
/* CC6F4 001CC5F4 01001026 */  addiu      $16, $16, 0x1
.L001CC5F8:
/* CC6F8 001CC5F8 4800032A */  slti       $3, $16, 0x48
/* CC6FC 001CC5FC F4FF6014 */  bnez       $3, .L001CC5D0
/* CC700 001CC600 00000000 */   nop
/* CC704 001CC604 28860070 */  paddub     $16, $0, $0
/* CC708 001CC608 14000010 */  b          .L001CC65C
/* CC70C 001CC60C 00000000 */   nop
.L001CC610:
/* CC710 001CC610 FFFF0324 */  addiu      $3, $0, -0x1
/* CC714 001CC614 00211000 */  sll        $4, $16, 4
/* CC718 001CC618 21209100 */  addu       $4, $4, $17
/* CC71C 001CC61C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC720 001CC620 21088100 */  addu       $at, $4, $at
/* CC724 001CC624 509C23AC */  sw         $3, -0x63B0($at)
/* CC728 001CC628 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* CC72C 001CC62C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC730 001CC630 21088100 */  addu       $at, $4, $at
/* CC734 001CC634 589C23AC */  sw         $3, -0x63A8($at)
/* CC738 001CC638 80181000 */  sll        $3, $16, 2
/* CC73C 001CC63C 21187100 */  addu       $3, $3, $17
/* CC740 001CC640 0100013C */  lui        $at, (0x10000 >> 16)
/* CC744 001CC644 21086100 */  addu       $at, $3, $at
/* CC748 001CC648 108720AC */  sw         $0, -0x78F0($at)
/* CC74C 001CC64C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC750 001CC650 21088100 */  addu       $at, $4, $at
/* CC754 001CC654 5C9C20AC */  sw         $0, -0x63A4($at)
/* CC758 001CC658 01001026 */  addiu      $16, $16, 0x1
.L001CC65C:
/* CC75C 001CC65C 9001032A */  slti       $3, $16, 0x190
/* CC760 001CC660 EBFF6014 */  bnez       $3, .L001CC610
/* CC764 001CC664 00000000 */   nop
/* CC768 001CC668 28860070 */  paddub     $16, $0, $0
/* CC76C 001CC66C 05000010 */  b          .L001CC684
/* CC770 001CC670 00000000 */   nop
.L001CC674:
/* CC774 001CC674 80181000 */  sll        $3, $16, 2
/* CC778 001CC678 21187100 */  addu       $3, $3, $17
/* CC77C 001CC67C 080060AC */  sw         $0, 0x8($3)
/* CC780 001CC680 01001026 */  addiu      $16, $16, 0x1
.L001CC684:
/* CC784 001CC684 1000032A */  slti       $3, $16, 0x10
/* CC788 001CC688 FAFF6014 */  bnez       $3, .L001CC674
/* CC78C 001CC68C 00000000 */   nop
/* CC790 001CC690 28860070 */  paddub     $16, $0, $0
/* CC794 001CC694 12000010 */  b          .L001CC6E0
/* CC798 001CC698 00000000 */   nop
.L001CC69C:
/* CC79C 001CC69C 30130224 */  addiu      $2, $0, 0x1330
/* CC7A0 001CC6A0 18900202 */  mult       $18, $16, $2
/* CC7A4 001CC6A4 21103202 */  addu       $2, $17, $18
/* CC7A8 001CC6A8 F83D4424 */  addiu      $4, $2, 0x3DF8
/* CC7AC 001CC6AC F87F8424 */  addiu      $4, $4, 0x7FF8
/* CC7B0 001CC6B0 A000998C */  lw         $25, 0xA0($4)
/* CC7B4 001CC6B4 C400398F */  lw         $25, 0xC4($25)
/* CC7B8 001CC6B8 09F82003 */  jalr       $25
/* CC7BC 001CC6BC 00000000 */   nop
/* CC7C0 001CC6C0 21185102 */  addu       $3, $18, $17
/* CC7C4 001CC6C4 0100013C */  lui        $at, (0x10000 >> 16)
/* CC7C8 001CC6C8 21086100 */  addu       $at, $3, $at
/* CC7CC 001CC6CC C4CF20AC */  sw         $0, -0x303C($at)
/* CC7D0 001CC6D0 0100013C */  lui        $at, (0x10000 >> 16)
/* CC7D4 001CC6D4 21086100 */  addu       $at, $3, $at
/* CC7D8 001CC6D8 10D120AC */  sw         $0, -0x2EF0($at)
/* CC7DC 001CC6DC 01001026 */  addiu      $16, $16, 0x1
.L001CC6E0:
/* CC7E0 001CC6E0 0400032A */  slti       $3, $16, 0x4
/* CC7E4 001CC6E4 EDFF6014 */  bnez       $3, .L001CC69C
/* CC7E8 001CC6E8 00000000 */   nop
/* CC7EC 001CC6EC 282E0070 */  paddub     $5, $0, $0
/* CC7F0 001CC6F0 0D000010 */  b          .L001CC728
/* CC7F4 001CC6F4 00000000 */   nop
.L001CC6F8:
/* CC7F8 001CC6F8 FFFF0424 */  addiu      $4, $0, -0x1
/* CC7FC 001CC6FC 80180500 */  sll        $3, $5, 2
/* CC800 001CC700 21186500 */  addu       $3, $3, $5
/* CC804 001CC704 00190300 */  sll        $3, $3, 4
/* CC808 001CC708 21187100 */  addu       $3, $3, $17
/* CC80C 001CC70C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC810 001CC710 21086100 */  addu       $at, $3, $at
/* CC814 001CC714 588D24AC */  sw         $4, -0x72A8($at)
/* CC818 001CC718 0100013C */  lui        $at, (0x10000 >> 16)
/* CC81C 001CC71C 21086100 */  addu       $at, $3, $at
/* CC820 001CC720 7C8D20AC */  sw         $0, -0x7284($at)
/* CC824 001CC724 0100A524 */  addiu      $5, $5, 0x1
.L001CC728:
/* CC828 001CC728 3000A328 */  slti       $3, $5, 0x30
/* CC82C 001CC72C F2FF6014 */  bnez       $3, .L001CC6F8
/* CC830 001CC730 00000000 */   nop
/* CC834 001CC734 282E0070 */  paddub     $5, $0, $0
/* CC838 001CC738 0D000010 */  b          .L001CC770
/* CC83C 001CC73C 00000000 */   nop
.L001CC740:
/* CC840 001CC740 80190500 */  sll        $3, $5, 6
/* CC844 001CC744 21187100 */  addu       $3, $3, $17
/* CC848 001CC748 0100013C */  lui        $at, (0x10000 >> 16)
/* CC84C 001CC74C 21086100 */  addu       $at, $3, $at
/* CC850 001CC750 60B620AC */  sw         $0, -0x49A0($at)
/* CC854 001CC754 0100013C */  lui        $at, (0x10000 >> 16)
/* CC858 001CC758 21086100 */  addu       $at, $3, $at
/* CC85C 001CC75C 8CB620AC */  sw         $0, -0x4974($at)
/* CC860 001CC760 0100013C */  lui        $at, (0x10000 >> 16)
/* CC864 001CC764 21086100 */  addu       $at, $3, $at
/* CC868 001CC768 90B620AC */  sw         $0, -0x4970($at)
/* CC86C 001CC76C 0100A524 */  addiu      $5, $5, 0x1
.L001CC770:
/* CC870 001CC770 1800A328 */  slti       $3, $5, 0x18
/* CC874 001CC774 F2FF6014 */  bnez       $3, .L001CC740
/* CC878 001CC778 00000000 */   nop
/* CC87C 001CC77C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC880 001CC780 21082102 */  addu       $at, $17, $at
/* CC884 001CC784 60BC20AC */  sw         $0, -0x43A0($at)
/* CC888 001CC788 282E0070 */  paddub     $5, $0, $0
/* CC88C 001CC78C 07000010 */  b          .L001CC7AC
/* CC890 001CC790 00000000 */   nop
.L001CC794:
/* CC894 001CC794 40190500 */  sll        $3, $5, 5
/* CC898 001CC798 21187100 */  addu       $3, $3, $17
/* CC89C 001CC79C 0100013C */  lui        $at, (0x10000 >> 16)
/* CC8A0 001CC7A0 21086100 */  addu       $at, $3, $at
/* CC8A4 001CC7A4 94BC20AC */  sw         $0, -0x436C($at)
/* CC8A8 001CC7A8 0100A524 */  addiu      $5, $5, 0x1
.L001CC7AC:
/* CC8AC 001CC7AC 0800A328 */  slti       $3, $5, 0x8
/* CC8B0 001CC7B0 F8FF6014 */  bnez       $3, .L001CC794
/* CC8B4 001CC7B4 00000000 */   nop
/* CC8B8 001CC7B8 0100013C */  lui        $at, (0x10000 >> 16)
/* CC8BC 001CC7BC 21082102 */  addu       $at, $17, $at
/* CC8C0 001CC7C0 80BD20AC */  sw         $0, -0x4280($at)
/* CC8C4 001CC7C4 282E0070 */  paddub     $5, $0, $0
/* CC8C8 001CC7C8 09000010 */  b          .L001CC7F0
/* CC8CC 001CC7CC 00000000 */   nop
.L001CC7D0:
/* CC8D0 001CC7D0 40180500 */  sll        $3, $5, 1
/* CC8D4 001CC7D4 21186500 */  addu       $3, $3, $5
/* CC8D8 001CC7D8 C0180300 */  sll        $3, $3, 3
/* CC8DC 001CC7DC 21187100 */  addu       $3, $3, $17
/* CC8E0 001CC7E0 0100013C */  lui        $at, (0x10000 >> 16)
/* CC8E4 001CC7E4 21086100 */  addu       $at, $3, $at
/* CC8E8 001CC7E8 9CBD20AC */  sw         $0, -0x4264($at)
/* CC8EC 001CC7EC 0100A524 */  addiu      $5, $5, 0x1
.L001CC7F0:
/* CC8F0 001CC7F0 0400A328 */  slti       $3, $5, 0x4
/* CC8F4 001CC7F4 F6FF6014 */  bnez       $3, .L001CC7D0
/* CC8F8 001CC7F8 00000000 */   nop
/* CC8FC 001CC7FC 8040033C */  lui        $3, (0x40800000 >> 16)
/* CC900 001CC800 B00323AE */  sw         $3, 0x3B0($17)
/* CC904 001CC804 3000BF7B */  lq         $31, 0x30($sp)
/* CC908 001CC808 2000B27B */  lq         $18, 0x20($sp)
/* CC90C 001CC80C 1000B17B */  lq         $17, 0x10($sp)
/* CC910 001CC810 0000B07B */  lq         $16, 0x0($sp)
/* CC914 001CC814 4000BD27 */  addiu      $sp, $sp, 0x40
/* CC918 001CC818 0800E003 */  jr         $31
/* CC91C 001CC81C 00000000 */   nop
