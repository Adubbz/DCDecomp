.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BuildCharaSpecialParts__11CDungeonMapFv
/* CA580 001CA480 B0FDBD27 */  addiu      $sp, $sp, -0x250
/* CA584 001CA484 4000BF7F */  sq         $31, 0x40($sp)
/* CA588 001CA488 3000B37F */  sq         $19, 0x30($sp)
/* CA58C 001CA48C 2000B27F */  sq         $18, 0x20($sp)
/* CA590 001CA490 1000B17F */  sq         $17, 0x10($sp)
/* CA594 001CA494 0000B07F */  sq         $16, 0x0($sp)
/* CA598 001CA498 28968070 */  paddub     $18, $4, $0
/* CA59C 001CA49C A49D838F */  lw         $3, -0x625C($gp)
/* CA5A0 001CA4A0 06006128 */  slti       $at, $3, 0x6
/* CA5A4 001CA4A4 57032010 */  beqz       $at, .L001CB204
/* CA5A8 001CA4A8 00000000 */   nop
/* CA5AC 001CA4AC 789C828F */  lw         $2, -0x6388($gp)
/* CA5B0 001CA4B0 0100013C */  lui        $at, (0x10000 >> 16)
/* CA5B4 001CA4B4 21084100 */  addu       $at, $2, $at
/* CA5B8 001CA4B8 108B258C */  lw         $5, -0x74F0($at)
/* CA5BC 001CA4BC 2900A004 */  bltz       $5, .L001CA564
/* CA5C0 001CA4C0 00000000 */   nop
/* CA5C4 001CA4C4 0600A128 */  slti       $at, $5, 0x6
/* CA5C8 001CA4C8 26002010 */  beqz       $at, .L001CA564
/* CA5CC 001CA4CC 00000000 */   nop
/* CA5D0 001CA4D0 01000224 */  addiu      $2, $0, 0x1
/* CA5D4 001CA4D4 1F00A214 */  bne        $5, $2, .L001CA554
/* CA5D8 001CA4D8 00000000 */   nop
/* CA5DC 001CA4DC BE11040C */  jal        rand
/* CA5E0 001CA4E0 00000000 */   nop
/* CA5E4 001CA4E4 00008244 */  mtc1       $2, $f0
/* CA5E8 001CA4E8 00000000 */  nop
/* CA5EC 001CA4EC 60008046 */  cvt.s.w    $f1, $f0
/* CA5F0 001CA4F0 C842023C */  lui        $2, (0x42C80000 >> 16)
/* CA5F4 001CA4F4 00008244 */  mtc1       $2, $f0
/* CA5F8 001CA4F8 00000000 */  nop
/* CA5FC 001CA4FC 42000146 */  mul.s      $f1, $f0, $f1
/* CA600 001CA500 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA604 001CA504 00008244 */  mtc1       $2, $f0
/* CA608 001CA508 00000000 */  nop
/* CA60C 001CA50C 030B0046 */  div.s      $f12, $f1, $f0
/* CA610 001CA510 2C44040C */  jal        fptosi
/* CA614 001CA514 00000000 */   nop
/* CA618 001CA518 32004228 */  slti       $2, $2, 0x32
/* CA61C 001CA51C 07004014 */  bnez       $2, .L001CA53C
/* CA620 001CA520 00000000 */   nop
/* CA624 001CA524 28264072 */  paddub     $4, $18, $0
/* CA628 001CA528 282E0070 */  paddub     $5, $0, $0
/* CA62C 001CA52C 8C2C070C */  jal        SetCharaDoor__11CDungeonMapFi
/* CA630 001CA530 00000000 */   nop
/* CA634 001CA534 05000010 */  b          .L001CA54C
/* CA638 001CA538 00000000 */   nop
.L001CA53C:
/* CA63C 001CA53C 28264072 */  paddub     $4, $18, $0
/* CA640 001CA540 282E0070 */  paddub     $5, $0, $0
/* CA644 001CA544 8C2C070C */  jal        SetCharaDoor__11CDungeonMapFi
/* CA648 001CA548 00000000 */   nop
.L001CA54C:
/* CA64C 001CA54C 2D030010 */  b          .L001CB204
/* CA650 001CA550 00000000 */   nop
.L001CA554:
/* CA654 001CA554 8C2C070C */  jal        SetCharaDoor__11CDungeonMapFi
/* CA658 001CA558 00000000 */   nop
/* CA65C 001CA55C 29030010 */  b          .L001CB204
/* CA660 001CA560 00000000 */   nop
.L001CA564:
/* CA664 001CA564 BE11040C */  jal        rand
/* CA668 001CA568 00000000 */   nop
/* CA66C 001CA56C 00008244 */  mtc1       $2, $f0
/* CA670 001CA570 00000000 */  nop
/* CA674 001CA574 60008046 */  cvt.s.w    $f1, $f0
/* CA678 001CA578 C842023C */  lui        $2, (0x42C80000 >> 16)
/* CA67C 001CA57C 00008244 */  mtc1       $2, $f0
/* CA680 001CA580 00000000 */  nop
/* CA684 001CA584 42000146 */  mul.s      $f1, $f0, $f1
/* CA688 001CA588 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA68C 001CA58C 00008244 */  mtc1       $2, $f0
/* CA690 001CA590 00000000 */  nop
/* CA694 001CA594 030B0046 */  div.s      $f12, $f1, $f0
/* CA698 001CA598 2C44040C */  jal        fptosi
/* CA69C 001CA59C 00000000 */   nop
/* CA6A0 001CA5A0 28864070 */  paddub     $16, $2, $0
/* CA6A4 001CA5A4 A49D828F */  lw         $2, -0x625C($gp)
/* CA6A8 001CA5A8 07004014 */  bnez       $2, .L001CA5C8
/* CA6AC 001CA5AC 00000000 */   nop
/* CA6B0 001CA5B0 789C828F */  lw         $2, -0x6388($gp)
/* CA6B4 001CA5B4 02004280 */  lb         $2, 0x2($2)
/* CA6B8 001CA5B8 08004128 */  slti       $at, $2, 0x8
/* CA6BC 001CA5BC 02002010 */  beqz       $at, .L001CA5C8
/* CA6C0 001CA5C0 00000000 */   nop
/* CA6C4 001CA5C4 28860070 */  paddub     $16, $0, $0
.L001CA5C8:
/* CA6C8 001CA5C8 789C828F */  lw         $2, -0x6388($gp)
/* CA6CC 001CA5CC 05004280 */  lb         $2, 0x5($2)
/* CA6D0 001CA5D0 02004228 */  slti       $2, $2, 0x2
/* CA6D4 001CA5D4 2B004014 */  bnez       $2, .L001CA684
/* CA6D8 001CA5D8 00000000 */   nop
/* CA6DC 001CA5DC 3300012A */  slti       $at, $16, 0x33
/* CA6E0 001CA5E0 28002014 */  bnez       $at, .L001CA684
/* CA6E4 001CA5E4 00000000 */   nop
/* CA6E8 001CA5E8 28264072 */  paddub     $4, $18, $0
/* CA6EC 001CA5EC 5000A527 */  addiu      $5, $sp, 0x50
/* CA6F0 001CA5F0 40000624 */  addiu      $6, $0, 0x40
/* CA6F4 001CA5F4 283E0070 */  paddub     $7, $0, $0
/* CA6F8 001CA5F8 FFFF0824 */  addiu      $8, $0, -0x1
/* CA6FC 001CA5FC A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CA700 001CA600 00000000 */   nop
/* CA704 001CA604 289E4070 */  paddub     $19, $2, $0
/* CA708 001CA608 1E00601A */  blez       $19, .L001CA684
/* CA70C 001CA60C 00000000 */   nop
/* CA710 001CA610 BE11040C */  jal        rand
/* CA714 001CA614 00000000 */   nop
/* CA718 001CA618 00008244 */  mtc1       $2, $f0
/* CA71C 001CA61C 00000000 */  nop
/* CA720 001CA620 60008046 */  cvt.s.w    $f1, $f0
/* CA724 001CA624 00009344 */  mtc1       $19, $f0
/* CA728 001CA628 00000000 */  nop
/* CA72C 001CA62C 20008046 */  cvt.s.w    $f0, $f0
/* CA730 001CA630 42000146 */  mul.s      $f1, $f0, $f1
/* CA734 001CA634 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA738 001CA638 00008244 */  mtc1       $2, $f0
/* CA73C 001CA63C 00000000 */  nop
/* CA740 001CA640 030B0046 */  div.s      $f12, $f1, $f0
/* CA744 001CA644 2C44040C */  jal        fptosi
/* CA748 001CA648 00000000 */   nop
/* CA74C 001CA64C 3B000524 */  addiu      $5, $0, 0x3B
/* CA750 001CA650 C0100200 */  sll        $2, $2, 3
/* CA754 001CA654 21205D00 */  addu       $4, $2, $sp
/* CA758 001CA658 5400838C */  lw         $3, 0x54($4)
/* CA75C 001CA65C 80100300 */  sll        $2, $3, 2
/* CA760 001CA660 21104300 */  addu       $2, $2, $3
/* CA764 001CA664 80180200 */  sll        $3, $2, 2
/* CA768 001CA668 5000828C */  lw         $2, 0x50($4)
/* CA76C 001CA66C 21104300 */  addu       $2, $2, $3
/* CA770 001CA670 00110200 */  sll        $2, $2, 4
/* CA774 001CA674 21105200 */  addu       $2, $2, $18
/* CA778 001CA678 0100013C */  lui        $at, (0x10000 >> 16)
/* CA77C 001CA67C 21084100 */  addu       $at, $2, $at
/* CA780 001CA680 509C25AC */  sw         $5, -0x63B0($at)
.L001CA684:
/* CA784 001CA684 BE11040C */  jal        rand
/* CA788 001CA688 00000000 */   nop
/* CA78C 001CA68C 00008244 */  mtc1       $2, $f0
/* CA790 001CA690 00000000 */  nop
/* CA794 001CA694 60008046 */  cvt.s.w    $f1, $f0
/* CA798 001CA698 C842023C */  lui        $2, (0x42C80000 >> 16)
/* CA79C 001CA69C 00008244 */  mtc1       $2, $f0
/* CA7A0 001CA6A0 00000000 */  nop
/* CA7A4 001CA6A4 42000146 */  mul.s      $f1, $f0, $f1
/* CA7A8 001CA6A8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA7AC 001CA6AC 00008244 */  mtc1       $2, $f0
/* CA7B0 001CA6B0 00000000 */  nop
/* CA7B4 001CA6B4 030B0046 */  div.s      $f12, $f1, $f0
/* CA7B8 001CA6B8 2C44040C */  jal        fptosi
/* CA7BC 001CA6BC 00000000 */   nop
/* CA7C0 001CA6C0 28864070 */  paddub     $16, $2, $0
/* CA7C4 001CA6C4 789C858F */  lw         $5, -0x6388($gp)
/* CA7C8 001CA6C8 0200B180 */  lb         $17, 0x2($5)
/* CA7CC 001CA6CC A49D848F */  lw         $4, -0x625C($gp)
/* CA7D0 001CA6D0 05000324 */  addiu      $3, $0, 0x5
/* CA7D4 001CA6D4 08028310 */  beq        $4, $3, .L001CAEF8
/* CA7D8 001CA6D8 00000000 */   nop
/* CA7DC 001CA6DC 04000324 */  addiu      $3, $0, 0x4
/* CA7E0 001CA6E0 3D018310 */  beq        $4, $3, .L001CABD8
/* CA7E4 001CA6E4 00000000 */   nop
/* CA7E8 001CA6E8 03000324 */  addiu      $3, $0, 0x3
/* CA7EC 001CA6EC A3008310 */  beq        $4, $3, .L001CA97C
/* CA7F0 001CA6F0 00000000 */   nop
/* CA7F4 001CA6F4 02000324 */  addiu      $3, $0, 0x2
/* CA7F8 001CA6F8 3A008310 */  beq        $4, $3, .L001CA7E4
/* CA7FC 001CA6FC 00000000 */   nop
/* CA800 001CA700 01000324 */  addiu      $3, $0, 0x1
/* CA804 001CA704 03008310 */  beq        $4, $3, .L001CA714
/* CA808 001CA708 00000000 */   nop
/* CA80C 001CA70C BD020010 */  b          .L001CB204
/* CA810 001CA710 00000000 */   nop
.L001CA714:
/* CA814 001CA714 0500A380 */  lb         $3, 0x5($5)
/* CA818 001CA718 03006328 */  slti       $3, $3, 0x3
/* CA81C 001CA71C B9026014 */  bnez       $3, .L001CB204
/* CA820 001CA720 00000000 */   nop
/* CA824 001CA724 0B00012A */  slti       $at, $16, 0xB
/* CA828 001CA728 B6022014 */  bnez       $at, .L001CB204
/* CA82C 001CA72C 00000000 */   nop
/* CA830 001CA730 0900232A */  slti       $3, $17, 0x9
/* CA834 001CA734 B3026014 */  bnez       $3, .L001CB204
/* CA838 001CA738 00000000 */   nop
/* CA83C 001CA73C 28264072 */  paddub     $4, $18, $0
/* CA840 001CA740 5000A527 */  addiu      $5, $sp, 0x50
/* CA844 001CA744 40000624 */  addiu      $6, $0, 0x40
/* CA848 001CA748 09000724 */  addiu      $7, $0, 0x9
/* CA84C 001CA74C 0C000824 */  addiu      $8, $0, 0xC
/* CA850 001CA750 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CA854 001CA754 00000000 */   nop
/* CA858 001CA758 289E4070 */  paddub     $19, $2, $0
/* CA85C 001CA75C A902601A */  blez       $19, .L001CB204
/* CA860 001CA760 00000000 */   nop
/* CA864 001CA764 BE11040C */  jal        rand
/* CA868 001CA768 00000000 */   nop
/* CA86C 001CA76C 00008244 */  mtc1       $2, $f0
/* CA870 001CA770 00000000 */  nop
/* CA874 001CA774 60008046 */  cvt.s.w    $f1, $f0
/* CA878 001CA778 00009344 */  mtc1       $19, $f0
/* CA87C 001CA77C 00000000 */  nop
/* CA880 001CA780 20008046 */  cvt.s.w    $f0, $f0
/* CA884 001CA784 42000146 */  mul.s      $f1, $f0, $f1
/* CA888 001CA788 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA88C 001CA78C 00008244 */  mtc1       $2, $f0
/* CA890 001CA790 00000000 */  nop
/* CA894 001CA794 030B0046 */  div.s      $f12, $f1, $f0
/* CA898 001CA798 2C44040C */  jal        fptosi
/* CA89C 001CA79C 00000000 */   nop
/* CA8A0 001CA7A0 C0180200 */  sll        $3, $2, 3
/* CA8A4 001CA7A4 21287D00 */  addu       $5, $3, $sp
/* CA8A8 001CA7A8 5400A48C */  lw         $4, 0x54($5)
/* CA8AC 001CA7AC 80180400 */  sll        $3, $4, 2
/* CA8B0 001CA7B0 21186400 */  addu       $3, $3, $4
/* CA8B4 001CA7B4 80200300 */  sll        $4, $3, 2
/* CA8B8 001CA7B8 5000A38C */  lw         $3, 0x50($5)
/* CA8BC 001CA7BC 21186400 */  addu       $3, $3, $4
/* CA8C0 001CA7C0 00190300 */  sll        $3, $3, 4
/* CA8C4 001CA7C4 21187200 */  addu       $3, $3, $18
/* CA8C8 001CA7C8 581C6424 */  addiu      $4, $3, 0x1C58
/* CA8CC 001CA7CC F87F8424 */  addiu      $4, $4, 0x7FF8
/* CA8D0 001CA7D0 0000838C */  lw         $3, 0x0($4)
/* CA8D4 001CA7D4 33006324 */  addiu      $3, $3, 0x33
/* CA8D8 001CA7D8 000083AC */  sw         $3, 0x0($4)
/* CA8DC 001CA7DC 89020010 */  b          .L001CB204
/* CA8E0 001CA7E0 00000000 */   nop
.L001CA7E4:
/* CA8E4 001CA7E4 0500A380 */  lb         $3, 0x5($5)
/* CA8E8 001CA7E8 03006328 */  slti       $3, $3, 0x3
/* CA8EC 001CA7EC 2E006014 */  bnez       $3, .L001CA8A8
/* CA8F0 001CA7F0 00000000 */   nop
/* CA8F4 001CA7F4 2800012A */  slti       $at, $16, 0x28
/* CA8F8 001CA7F8 2B002010 */  beqz       $at, .L001CA8A8
/* CA8FC 001CA7FC 00000000 */   nop
/* CA900 001CA800 28264072 */  paddub     $4, $18, $0
/* CA904 001CA804 5000A527 */  addiu      $5, $sp, 0x50
/* CA908 001CA808 40000624 */  addiu      $6, $0, 0x40
/* CA90C 001CA80C 09000724 */  addiu      $7, $0, 0x9
/* CA910 001CA810 0C000824 */  addiu      $8, $0, 0xC
/* CA914 001CA814 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CA918 001CA818 00000000 */   nop
/* CA91C 001CA81C 289E4070 */  paddub     $19, $2, $0
/* CA920 001CA820 2100601A */  blez       $19, .L001CA8A8
/* CA924 001CA824 00000000 */   nop
/* CA928 001CA828 BE11040C */  jal        rand
/* CA92C 001CA82C 00000000 */   nop
/* CA930 001CA830 00008244 */  mtc1       $2, $f0
/* CA934 001CA834 00000000 */  nop
/* CA938 001CA838 60008046 */  cvt.s.w    $f1, $f0
/* CA93C 001CA83C 00009344 */  mtc1       $19, $f0
/* CA940 001CA840 00000000 */  nop
/* CA944 001CA844 20008046 */  cvt.s.w    $f0, $f0
/* CA948 001CA848 42000146 */  mul.s      $f1, $f0, $f1
/* CA94C 001CA84C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CA950 001CA850 00008244 */  mtc1       $2, $f0
/* CA954 001CA854 00000000 */  nop
/* CA958 001CA858 030B0046 */  div.s      $f12, $f1, $f0
/* CA95C 001CA85C 2C44040C */  jal        fptosi
/* CA960 001CA860 00000000 */   nop
/* CA964 001CA864 C0180200 */  sll        $3, $2, 3
/* CA968 001CA868 21287D00 */  addu       $5, $3, $sp
/* CA96C 001CA86C 5400A48C */  lw         $4, 0x54($5)
/* CA970 001CA870 80180400 */  sll        $3, $4, 2
/* CA974 001CA874 21186400 */  addu       $3, $3, $4
/* CA978 001CA878 80200300 */  sll        $4, $3, 2
/* CA97C 001CA87C 5000A38C */  lw         $3, 0x50($5)
/* CA980 001CA880 21186400 */  addu       $3, $3, $4
/* CA984 001CA884 00190300 */  sll        $3, $3, 4
/* CA988 001CA888 21187200 */  addu       $3, $3, $18
/* CA98C 001CA88C 581C6424 */  addiu      $4, $3, 0x1C58
/* CA990 001CA890 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CA994 001CA894 0000838C */  lw         $3, 0x0($4)
/* CA998 001CA898 33006324 */  addiu      $3, $3, 0x33
/* CA99C 001CA89C 000083AC */  sw         $3, 0x0($4)
/* CA9A0 001CA8A0 58020010 */  b          .L001CB204
/* CA9A4 001CA8A4 00000000 */   nop
.L001CA8A8:
/* CA9A8 001CA8A8 789C838F */  lw         $3, -0x6388($gp)
/* CA9AC 001CA8AC 05006380 */  lb         $3, 0x5($3)
/* CA9B0 001CA8B0 04006328 */  slti       $3, $3, 0x4
/* CA9B4 001CA8B4 53026014 */  bnez       $3, .L001CB204
/* CA9B8 001CA8B8 00000000 */   nop
/* CA9BC 001CA8BC 2800032A */  slti       $3, $16, 0x28
/* CA9C0 001CA8C0 50026014 */  bnez       $3, .L001CB204
/* CA9C4 001CA8C4 00000000 */   nop
/* CA9C8 001CA8C8 0900232A */  slti       $3, $17, 0x9
/* CA9CC 001CA8CC 4D026014 */  bnez       $3, .L001CB204
/* CA9D0 001CA8D0 00000000 */   nop
/* CA9D4 001CA8D4 28264072 */  paddub     $4, $18, $0
/* CA9D8 001CA8D8 5000A527 */  addiu      $5, $sp, 0x50
/* CA9DC 001CA8DC 40000624 */  addiu      $6, $0, 0x40
/* CA9E0 001CA8E0 09000724 */  addiu      $7, $0, 0x9
/* CA9E4 001CA8E4 0C000824 */  addiu      $8, $0, 0xC
/* CA9E8 001CA8E8 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CA9EC 001CA8EC 00000000 */   nop
/* CA9F0 001CA8F0 289E4070 */  paddub     $19, $2, $0
/* CA9F4 001CA8F4 4302601A */  blez       $19, .L001CB204
/* CA9F8 001CA8F8 00000000 */   nop
/* CA9FC 001CA8FC BE11040C */  jal        rand
/* CAA00 001CA900 00000000 */   nop
/* CAA04 001CA904 00008244 */  mtc1       $2, $f0
/* CAA08 001CA908 00000000 */  nop
/* CAA0C 001CA90C 60008046 */  cvt.s.w    $f1, $f0
/* CAA10 001CA910 00009344 */  mtc1       $19, $f0
/* CAA14 001CA914 00000000 */  nop
/* CAA18 001CA918 20008046 */  cvt.s.w    $f0, $f0
/* CAA1C 001CA91C 42000146 */  mul.s      $f1, $f0, $f1
/* CAA20 001CA920 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAA24 001CA924 00008244 */  mtc1       $2, $f0
/* CAA28 001CA928 00000000 */  nop
/* CAA2C 001CA92C 030B0046 */  div.s      $f12, $f1, $f0
/* CAA30 001CA930 2C44040C */  jal        fptosi
/* CAA34 001CA934 00000000 */   nop
/* CAA38 001CA938 C0180200 */  sll        $3, $2, 3
/* CAA3C 001CA93C 21287D00 */  addu       $5, $3, $sp
/* CAA40 001CA940 5400A48C */  lw         $4, 0x54($5)
/* CAA44 001CA944 80180400 */  sll        $3, $4, 2
/* CAA48 001CA948 21186400 */  addu       $3, $3, $4
/* CAA4C 001CA94C 80200300 */  sll        $4, $3, 2
/* CAA50 001CA950 5000A38C */  lw         $3, 0x50($5)
/* CAA54 001CA954 21186400 */  addu       $3, $3, $4
/* CAA58 001CA958 00190300 */  sll        $3, $3, 4
/* CAA5C 001CA95C 21187200 */  addu       $3, $3, $18
/* CAA60 001CA960 581C6424 */  addiu      $4, $3, 0x1C58
/* CAA64 001CA964 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CAA68 001CA968 0000838C */  lw         $3, 0x0($4)
/* CAA6C 001CA96C 37006324 */  addiu      $3, $3, 0x37
/* CAA70 001CA970 000083AC */  sw         $3, 0x0($4)
/* CAA74 001CA974 23020010 */  b          .L001CB204
/* CAA78 001CA978 00000000 */   nop
.L001CA97C:
/* CAA7C 001CA97C 0500A380 */  lb         $3, 0x5($5)
/* CAA80 001CA980 03006328 */  slti       $3, $3, 0x3
/* CAA84 001CA984 2E006014 */  bnez       $3, .L001CAA40
/* CAA88 001CA988 00000000 */   nop
/* CAA8C 001CA98C 1400012A */  slti       $at, $16, 0x14
/* CAA90 001CA990 2B002010 */  beqz       $at, .L001CAA40
/* CAA94 001CA994 00000000 */   nop
/* CAA98 001CA998 28264072 */  paddub     $4, $18, $0
/* CAA9C 001CA99C 5000A527 */  addiu      $5, $sp, 0x50
/* CAAA0 001CA9A0 40000624 */  addiu      $6, $0, 0x40
/* CAAA4 001CA9A4 09000724 */  addiu      $7, $0, 0x9
/* CAAA8 001CA9A8 0C000824 */  addiu      $8, $0, 0xC
/* CAAAC 001CA9AC A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAAB0 001CA9B0 00000000 */   nop
/* CAAB4 001CA9B4 289E4070 */  paddub     $19, $2, $0
/* CAAB8 001CA9B8 2100601A */  blez       $19, .L001CAA40
/* CAABC 001CA9BC 00000000 */   nop
/* CAAC0 001CA9C0 BE11040C */  jal        rand
/* CAAC4 001CA9C4 00000000 */   nop
/* CAAC8 001CA9C8 00008244 */  mtc1       $2, $f0
/* CAACC 001CA9CC 00000000 */  nop
/* CAAD0 001CA9D0 60008046 */  cvt.s.w    $f1, $f0
/* CAAD4 001CA9D4 00009344 */  mtc1       $19, $f0
/* CAAD8 001CA9D8 00000000 */  nop
/* CAADC 001CA9DC 20008046 */  cvt.s.w    $f0, $f0
/* CAAE0 001CA9E0 42000146 */  mul.s      $f1, $f0, $f1
/* CAAE4 001CA9E4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAAE8 001CA9E8 00008244 */  mtc1       $2, $f0
/* CAAEC 001CA9EC 00000000 */  nop
/* CAAF0 001CA9F0 030B0046 */  div.s      $f12, $f1, $f0
/* CAAF4 001CA9F4 2C44040C */  jal        fptosi
/* CAAF8 001CA9F8 00000000 */   nop
/* CAAFC 001CA9FC C0180200 */  sll        $3, $2, 3
/* CAB00 001CAA00 21287D00 */  addu       $5, $3, $sp
/* CAB04 001CAA04 5400A48C */  lw         $4, 0x54($5)
/* CAB08 001CAA08 80180400 */  sll        $3, $4, 2
/* CAB0C 001CAA0C 21186400 */  addu       $3, $3, $4
/* CAB10 001CAA10 80200300 */  sll        $4, $3, 2
/* CAB14 001CAA14 5000A38C */  lw         $3, 0x50($5)
/* CAB18 001CAA18 21186400 */  addu       $3, $3, $4
/* CAB1C 001CAA1C 00190300 */  sll        $3, $3, 4
/* CAB20 001CAA20 21187200 */  addu       $3, $3, $18
/* CAB24 001CAA24 581C6424 */  addiu      $4, $3, 0x1C58
/* CAB28 001CAA28 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CAB2C 001CAA2C 0000838C */  lw         $3, 0x0($4)
/* CAB30 001CAA30 33006324 */  addiu      $3, $3, 0x33
/* CAB34 001CAA34 000083AC */  sw         $3, 0x0($4)
/* CAB38 001CAA38 F2010010 */  b          .L001CB204
/* CAB3C 001CAA3C 00000000 */   nop
.L001CAA40:
/* CAB40 001CAA40 789C838F */  lw         $3, -0x6388($gp)
/* CAB44 001CAA44 05006380 */  lb         $3, 0x5($3)
/* CAB48 001CAA48 04006328 */  slti       $3, $3, 0x4
/* CAB4C 001CAA4C 2E006014 */  bnez       $3, .L001CAB08
/* CAB50 001CAA50 00000000 */   nop
/* CAB54 001CAA54 2800012A */  slti       $at, $16, 0x28
/* CAB58 001CAA58 2B002010 */  beqz       $at, .L001CAB08
/* CAB5C 001CAA5C 00000000 */   nop
/* CAB60 001CAA60 28264072 */  paddub     $4, $18, $0
/* CAB64 001CAA64 5000A527 */  addiu      $5, $sp, 0x50
/* CAB68 001CAA68 40000624 */  addiu      $6, $0, 0x40
/* CAB6C 001CAA6C 09000724 */  addiu      $7, $0, 0x9
/* CAB70 001CAA70 0C000824 */  addiu      $8, $0, 0xC
/* CAB74 001CAA74 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAB78 001CAA78 00000000 */   nop
/* CAB7C 001CAA7C 289E4070 */  paddub     $19, $2, $0
/* CAB80 001CAA80 2100601A */  blez       $19, .L001CAB08
/* CAB84 001CAA84 00000000 */   nop
/* CAB88 001CAA88 BE11040C */  jal        rand
/* CAB8C 001CAA8C 00000000 */   nop
/* CAB90 001CAA90 00008244 */  mtc1       $2, $f0
/* CAB94 001CAA94 00000000 */  nop
/* CAB98 001CAA98 60008046 */  cvt.s.w    $f1, $f0
/* CAB9C 001CAA9C 00009344 */  mtc1       $19, $f0
/* CABA0 001CAAA0 00000000 */  nop
/* CABA4 001CAAA4 20008046 */  cvt.s.w    $f0, $f0
/* CABA8 001CAAA8 42000146 */  mul.s      $f1, $f0, $f1
/* CABAC 001CAAAC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CABB0 001CAAB0 00008244 */  mtc1       $2, $f0
/* CABB4 001CAAB4 00000000 */  nop
/* CABB8 001CAAB8 030B0046 */  div.s      $f12, $f1, $f0
/* CABBC 001CAABC 2C44040C */  jal        fptosi
/* CABC0 001CAAC0 00000000 */   nop
/* CABC4 001CAAC4 C0180200 */  sll        $3, $2, 3
/* CABC8 001CAAC8 21287D00 */  addu       $5, $3, $sp
/* CABCC 001CAACC 5400A48C */  lw         $4, 0x54($5)
/* CABD0 001CAAD0 80180400 */  sll        $3, $4, 2
/* CABD4 001CAAD4 21186400 */  addu       $3, $3, $4
/* CABD8 001CAAD8 80200300 */  sll        $4, $3, 2
/* CABDC 001CAADC 5000A38C */  lw         $3, 0x50($5)
/* CABE0 001CAAE0 21186400 */  addu       $3, $3, $4
/* CABE4 001CAAE4 00190300 */  sll        $3, $3, 4
/* CABE8 001CAAE8 21187200 */  addu       $3, $3, $18
/* CABEC 001CAAEC 581C6424 */  addiu      $4, $3, 0x1C58
/* CABF0 001CAAF0 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CABF4 001CAAF4 0000838C */  lw         $3, 0x0($4)
/* CABF8 001CAAF8 37006324 */  addiu      $3, $3, 0x37
/* CABFC 001CAAFC 000083AC */  sw         $3, 0x0($4)
/* CAC00 001CAB00 C0010010 */  b          .L001CB204
/* CAC04 001CAB04 00000000 */   nop
.L001CAB08:
/* CAC08 001CAB08 789C838F */  lw         $3, -0x6388($gp)
/* CAC0C 001CAB0C 05006380 */  lb         $3, 0x5($3)
/* CAC10 001CAB10 05006328 */  slti       $3, $3, 0x5
/* CAC14 001CAB14 BB016014 */  bnez       $3, .L001CB204
/* CAC18 001CAB18 00000000 */   nop
/* CAC1C 001CAB1C 2800032A */  slti       $3, $16, 0x28
/* CAC20 001CAB20 B8016014 */  bnez       $3, .L001CB204
/* CAC24 001CAB24 00000000 */   nop
/* CAC28 001CAB28 0900232A */  slti       $3, $17, 0x9
/* CAC2C 001CAB2C B5016014 */  bnez       $3, .L001CB204
/* CAC30 001CAB30 00000000 */   nop
/* CAC34 001CAB34 28264072 */  paddub     $4, $18, $0
/* CAC38 001CAB38 5000A527 */  addiu      $5, $sp, 0x50
/* CAC3C 001CAB3C 40000624 */  addiu      $6, $0, 0x40
/* CAC40 001CAB40 283E0070 */  paddub     $7, $0, $0
/* CAC44 001CAB44 FFFF0824 */  addiu      $8, $0, -0x1
/* CAC48 001CAB48 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAC4C 001CAB4C 00000000 */   nop
/* CAC50 001CAB50 289E4070 */  paddub     $19, $2, $0
/* CAC54 001CAB54 AB01601A */  blez       $19, .L001CB204
/* CAC58 001CAB58 00000000 */   nop
/* CAC5C 001CAB5C BE11040C */  jal        rand
/* CAC60 001CAB60 00000000 */   nop
/* CAC64 001CAB64 00008244 */  mtc1       $2, $f0
/* CAC68 001CAB68 00000000 */  nop
/* CAC6C 001CAB6C 60008046 */  cvt.s.w    $f1, $f0
/* CAC70 001CAB70 00009344 */  mtc1       $19, $f0
/* CAC74 001CAB74 00000000 */  nop
/* CAC78 001CAB78 20008046 */  cvt.s.w    $f0, $f0
/* CAC7C 001CAB7C 42000146 */  mul.s      $f1, $f0, $f1
/* CAC80 001CAB80 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAC84 001CAB84 00008244 */  mtc1       $2, $f0
/* CAC88 001CAB88 00000000 */  nop
/* CAC8C 001CAB8C 030B0046 */  div.s      $f12, $f1, $f0
/* CAC90 001CAB90 2C44040C */  jal        fptosi
/* CAC94 001CAB94 00000000 */   nop
/* CAC98 001CAB98 44000624 */  addiu      $6, $0, 0x44
/* CAC9C 001CAB9C C0180200 */  sll        $3, $2, 3
/* CACA0 001CABA0 21287D00 */  addu       $5, $3, $sp
/* CACA4 001CABA4 5400A48C */  lw         $4, 0x54($5)
/* CACA8 001CABA8 80180400 */  sll        $3, $4, 2
/* CACAC 001CABAC 21186400 */  addu       $3, $3, $4
/* CACB0 001CABB0 80200300 */  sll        $4, $3, 2
/* CACB4 001CABB4 5000A38C */  lw         $3, 0x50($5)
/* CACB8 001CABB8 21186400 */  addu       $3, $3, $4
/* CACBC 001CABBC 00190300 */  sll        $3, $3, 4
/* CACC0 001CABC0 21187200 */  addu       $3, $3, $18
/* CACC4 001CABC4 0100013C */  lui        $at, (0x10000 >> 16)
/* CACC8 001CABC8 21086100 */  addu       $at, $3, $at
/* CACCC 001CABCC 509C26AC */  sw         $6, -0x63B0($at)
/* CACD0 001CABD0 8C010010 */  b          .L001CB204
/* CACD4 001CABD4 00000000 */   nop
.L001CABD8:
/* CACD8 001CABD8 0500A380 */  lb         $3, 0x5($5)
/* CACDC 001CABDC 03006328 */  slti       $3, $3, 0x3
/* CACE0 001CABE0 2E006014 */  bnez       $3, .L001CAC9C
/* CACE4 001CABE4 00000000 */   nop
/* CACE8 001CABE8 0A00012A */  slti       $at, $16, 0xA
/* CACEC 001CABEC 2B002010 */  beqz       $at, .L001CAC9C
/* CACF0 001CABF0 00000000 */   nop
/* CACF4 001CABF4 28264072 */  paddub     $4, $18, $0
/* CACF8 001CABF8 5000A527 */  addiu      $5, $sp, 0x50
/* CACFC 001CABFC 40000624 */  addiu      $6, $0, 0x40
/* CAD00 001CAC00 09000724 */  addiu      $7, $0, 0x9
/* CAD04 001CAC04 0C000824 */  addiu      $8, $0, 0xC
/* CAD08 001CAC08 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAD0C 001CAC0C 00000000 */   nop
/* CAD10 001CAC10 289E4070 */  paddub     $19, $2, $0
/* CAD14 001CAC14 2100601A */  blez       $19, .L001CAC9C
/* CAD18 001CAC18 00000000 */   nop
/* CAD1C 001CAC1C BE11040C */  jal        rand
/* CAD20 001CAC20 00000000 */   nop
/* CAD24 001CAC24 00008244 */  mtc1       $2, $f0
/* CAD28 001CAC28 00000000 */  nop
/* CAD2C 001CAC2C 60008046 */  cvt.s.w    $f1, $f0
/* CAD30 001CAC30 00009344 */  mtc1       $19, $f0
/* CAD34 001CAC34 00000000 */  nop
/* CAD38 001CAC38 20008046 */  cvt.s.w    $f0, $f0
/* CAD3C 001CAC3C 42000146 */  mul.s      $f1, $f0, $f1
/* CAD40 001CAC40 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAD44 001CAC44 00008244 */  mtc1       $2, $f0
/* CAD48 001CAC48 00000000 */  nop
/* CAD4C 001CAC4C 030B0046 */  div.s      $f12, $f1, $f0
/* CAD50 001CAC50 2C44040C */  jal        fptosi
/* CAD54 001CAC54 00000000 */   nop
/* CAD58 001CAC58 C0180200 */  sll        $3, $2, 3
/* CAD5C 001CAC5C 21287D00 */  addu       $5, $3, $sp
/* CAD60 001CAC60 5400A48C */  lw         $4, 0x54($5)
/* CAD64 001CAC64 80180400 */  sll        $3, $4, 2
/* CAD68 001CAC68 21186400 */  addu       $3, $3, $4
/* CAD6C 001CAC6C 80200300 */  sll        $4, $3, 2
/* CAD70 001CAC70 5000A38C */  lw         $3, 0x50($5)
/* CAD74 001CAC74 21186400 */  addu       $3, $3, $4
/* CAD78 001CAC78 00190300 */  sll        $3, $3, 4
/* CAD7C 001CAC7C 21187200 */  addu       $3, $3, $18
/* CAD80 001CAC80 581C6424 */  addiu      $4, $3, 0x1C58
/* CAD84 001CAC84 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CAD88 001CAC88 0000838C */  lw         $3, 0x0($4)
/* CAD8C 001CAC8C 33006324 */  addiu      $3, $3, 0x33
/* CAD90 001CAC90 000083AC */  sw         $3, 0x0($4)
/* CAD94 001CAC94 5B010010 */  b          .L001CB204
/* CAD98 001CAC98 00000000 */   nop
.L001CAC9C:
/* CAD9C 001CAC9C 789C838F */  lw         $3, -0x6388($gp)
/* CADA0 001CACA0 05006380 */  lb         $3, 0x5($3)
/* CADA4 001CACA4 04006328 */  slti       $3, $3, 0x4
/* CADA8 001CACA8 2E006014 */  bnez       $3, .L001CAD64
/* CADAC 001CACAC 00000000 */   nop
/* CADB0 001CACB0 1400012A */  slti       $at, $16, 0x14
/* CADB4 001CACB4 2B002010 */  beqz       $at, .L001CAD64
/* CADB8 001CACB8 00000000 */   nop
/* CADBC 001CACBC 28264072 */  paddub     $4, $18, $0
/* CADC0 001CACC0 5000A527 */  addiu      $5, $sp, 0x50
/* CADC4 001CACC4 40000624 */  addiu      $6, $0, 0x40
/* CADC8 001CACC8 09000724 */  addiu      $7, $0, 0x9
/* CADCC 001CACCC 0C000824 */  addiu      $8, $0, 0xC
/* CADD0 001CACD0 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CADD4 001CACD4 00000000 */   nop
/* CADD8 001CACD8 289E4070 */  paddub     $19, $2, $0
/* CADDC 001CACDC 2100601A */  blez       $19, .L001CAD64
/* CADE0 001CACE0 00000000 */   nop
/* CADE4 001CACE4 BE11040C */  jal        rand
/* CADE8 001CACE8 00000000 */   nop
/* CADEC 001CACEC 00008244 */  mtc1       $2, $f0
/* CADF0 001CACF0 00000000 */  nop
/* CADF4 001CACF4 60008046 */  cvt.s.w    $f1, $f0
/* CADF8 001CACF8 00009344 */  mtc1       $19, $f0
/* CADFC 001CACFC 00000000 */  nop
/* CAE00 001CAD00 20008046 */  cvt.s.w    $f0, $f0
/* CAE04 001CAD04 42000146 */  mul.s      $f1, $f0, $f1
/* CAE08 001CAD08 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAE0C 001CAD0C 00008244 */  mtc1       $2, $f0
/* CAE10 001CAD10 00000000 */  nop
/* CAE14 001CAD14 030B0046 */  div.s      $f12, $f1, $f0
/* CAE18 001CAD18 2C44040C */  jal        fptosi
/* CAE1C 001CAD1C 00000000 */   nop
/* CAE20 001CAD20 C0180200 */  sll        $3, $2, 3
/* CAE24 001CAD24 21287D00 */  addu       $5, $3, $sp
/* CAE28 001CAD28 5400A48C */  lw         $4, 0x54($5)
/* CAE2C 001CAD2C 80180400 */  sll        $3, $4, 2
/* CAE30 001CAD30 21186400 */  addu       $3, $3, $4
/* CAE34 001CAD34 80200300 */  sll        $4, $3, 2
/* CAE38 001CAD38 5000A38C */  lw         $3, 0x50($5)
/* CAE3C 001CAD3C 21186400 */  addu       $3, $3, $4
/* CAE40 001CAD40 00190300 */  sll        $3, $3, 4
/* CAE44 001CAD44 21187200 */  addu       $3, $3, $18
/* CAE48 001CAD48 581C6424 */  addiu      $4, $3, 0x1C58
/* CAE4C 001CAD4C F87F8424 */  addiu      $4, $4, 0x7FF8
/* CAE50 001CAD50 0000838C */  lw         $3, 0x0($4)
/* CAE54 001CAD54 37006324 */  addiu      $3, $3, 0x37
/* CAE58 001CAD58 000083AC */  sw         $3, 0x0($4)
/* CAE5C 001CAD5C 29010010 */  b          .L001CB204
/* CAE60 001CAD60 00000000 */   nop
.L001CAD64:
/* CAE64 001CAD64 789C838F */  lw         $3, -0x6388($gp)
/* CAE68 001CAD68 05006380 */  lb         $3, 0x5($3)
/* CAE6C 001CAD6C 05006328 */  slti       $3, $3, 0x5
/* CAE70 001CAD70 2D006014 */  bnez       $3, .L001CAE28
/* CAE74 001CAD74 00000000 */   nop
/* CAE78 001CAD78 1E00012A */  slti       $at, $16, 0x1E
/* CAE7C 001CAD7C 2A002010 */  beqz       $at, .L001CAE28
/* CAE80 001CAD80 00000000 */   nop
/* CAE84 001CAD84 28264072 */  paddub     $4, $18, $0
/* CAE88 001CAD88 5000A527 */  addiu      $5, $sp, 0x50
/* CAE8C 001CAD8C 40000624 */  addiu      $6, $0, 0x40
/* CAE90 001CAD90 283E0070 */  paddub     $7, $0, $0
/* CAE94 001CAD94 FFFF0824 */  addiu      $8, $0, -0x1
/* CAE98 001CAD98 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAE9C 001CAD9C 00000000 */   nop
/* CAEA0 001CADA0 289E4070 */  paddub     $19, $2, $0
/* CAEA4 001CADA4 2000601A */  blez       $19, .L001CAE28
/* CAEA8 001CADA8 00000000 */   nop
/* CAEAC 001CADAC BE11040C */  jal        rand
/* CAEB0 001CADB0 00000000 */   nop
/* CAEB4 001CADB4 00008244 */  mtc1       $2, $f0
/* CAEB8 001CADB8 00000000 */  nop
/* CAEBC 001CADBC 60008046 */  cvt.s.w    $f1, $f0
/* CAEC0 001CADC0 00009344 */  mtc1       $19, $f0
/* CAEC4 001CADC4 00000000 */  nop
/* CAEC8 001CADC8 20008046 */  cvt.s.w    $f0, $f0
/* CAECC 001CADCC 42000146 */  mul.s      $f1, $f0, $f1
/* CAED0 001CADD0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAED4 001CADD4 00008244 */  mtc1       $2, $f0
/* CAED8 001CADD8 00000000 */  nop
/* CAEDC 001CADDC 030B0046 */  div.s      $f12, $f1, $f0
/* CAEE0 001CADE0 2C44040C */  jal        fptosi
/* CAEE4 001CADE4 00000000 */   nop
/* CAEE8 001CADE8 44000624 */  addiu      $6, $0, 0x44
/* CAEEC 001CADEC C0180200 */  sll        $3, $2, 3
/* CAEF0 001CADF0 21287D00 */  addu       $5, $3, $sp
/* CAEF4 001CADF4 5400A48C */  lw         $4, 0x54($5)
/* CAEF8 001CADF8 80180400 */  sll        $3, $4, 2
/* CAEFC 001CADFC 21186400 */  addu       $3, $3, $4
/* CAF00 001CAE00 80200300 */  sll        $4, $3, 2
/* CAF04 001CAE04 5000A38C */  lw         $3, 0x50($5)
/* CAF08 001CAE08 21186400 */  addu       $3, $3, $4
/* CAF0C 001CAE0C 00190300 */  sll        $3, $3, 4
/* CAF10 001CAE10 21187200 */  addu       $3, $3, $18
/* CAF14 001CAE14 0100013C */  lui        $at, (0x10000 >> 16)
/* CAF18 001CAE18 21086100 */  addu       $at, $3, $at
/* CAF1C 001CAE1C 509C26AC */  sw         $6, -0x63B0($at)
/* CAF20 001CAE20 F8000010 */  b          .L001CB204
/* CAF24 001CAE24 00000000 */   nop
.L001CAE28:
/* CAF28 001CAE28 789C838F */  lw         $3, -0x6388($gp)
/* CAF2C 001CAE2C 05006380 */  lb         $3, 0x5($3)
/* CAF30 001CAE30 06006328 */  slti       $3, $3, 0x6
/* CAF34 001CAE34 F3006014 */  bnez       $3, .L001CB204
/* CAF38 001CAE38 00000000 */   nop
/* CAF3C 001CAE3C 2900012A */  slti       $at, $16, 0x29
/* CAF40 001CAE40 F0002014 */  bnez       $at, .L001CB204
/* CAF44 001CAE44 00000000 */   nop
/* CAF48 001CAE48 0800232A */  slti       $3, $17, 0x8
/* CAF4C 001CAE4C ED006014 */  bnez       $3, .L001CB204
/* CAF50 001CAE50 00000000 */   nop
/* CAF54 001CAE54 28264072 */  paddub     $4, $18, $0
/* CAF58 001CAE58 5000A527 */  addiu      $5, $sp, 0x50
/* CAF5C 001CAE5C 40000624 */  addiu      $6, $0, 0x40
/* CAF60 001CAE60 283E0070 */  paddub     $7, $0, $0
/* CAF64 001CAE64 FFFF0824 */  addiu      $8, $0, -0x1
/* CAF68 001CAE68 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CAF6C 001CAE6C 00000000 */   nop
/* CAF70 001CAE70 289E4070 */  paddub     $19, $2, $0
/* CAF74 001CAE74 E300601A */  blez       $19, .L001CB204
/* CAF78 001CAE78 00000000 */   nop
/* CAF7C 001CAE7C BE11040C */  jal        rand
/* CAF80 001CAE80 00000000 */   nop
/* CAF84 001CAE84 00008244 */  mtc1       $2, $f0
/* CAF88 001CAE88 00000000 */  nop
/* CAF8C 001CAE8C 60008046 */  cvt.s.w    $f1, $f0
/* CAF90 001CAE90 00009344 */  mtc1       $19, $f0
/* CAF94 001CAE94 00000000 */  nop
/* CAF98 001CAE98 20008046 */  cvt.s.w    $f0, $f0
/* CAF9C 001CAE9C 42000146 */  mul.s      $f1, $f0, $f1
/* CAFA0 001CAEA0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CAFA4 001CAEA4 00008244 */  mtc1       $2, $f0
/* CAFA8 001CAEA8 00000000 */  nop
/* CAFAC 001CAEAC 030B0046 */  div.s      $f12, $f1, $f0
/* CAFB0 001CAEB0 2C44040C */  jal        fptosi
/* CAFB4 001CAEB4 00000000 */   nop
/* CAFB8 001CAEB8 45000624 */  addiu      $6, $0, 0x45
/* CAFBC 001CAEBC C0180200 */  sll        $3, $2, 3
/* CAFC0 001CAEC0 21287D00 */  addu       $5, $3, $sp
/* CAFC4 001CAEC4 5400A48C */  lw         $4, 0x54($5)
/* CAFC8 001CAEC8 80180400 */  sll        $3, $4, 2
/* CAFCC 001CAECC 21186400 */  addu       $3, $3, $4
/* CAFD0 001CAED0 80200300 */  sll        $4, $3, 2
/* CAFD4 001CAED4 5000A38C */  lw         $3, 0x50($5)
/* CAFD8 001CAED8 21186400 */  addu       $3, $3, $4
/* CAFDC 001CAEDC 00190300 */  sll        $3, $3, 4
/* CAFE0 001CAEE0 21187200 */  addu       $3, $3, $18
/* CAFE4 001CAEE4 0100013C */  lui        $at, (0x10000 >> 16)
/* CAFE8 001CAEE8 21086100 */  addu       $at, $3, $at
/* CAFEC 001CAEEC 509C26AC */  sw         $6, -0x63B0($at)
/* CAFF0 001CAEF0 C4000010 */  b          .L001CB204
/* CAFF4 001CAEF4 00000000 */   nop
.L001CAEF8:
/* CAFF8 001CAEF8 0500A380 */  lb         $3, 0x5($5)
/* CAFFC 001CAEFC 03006328 */  slti       $3, $3, 0x3
/* CB000 001CAF00 2E006014 */  bnez       $3, .L001CAFBC
/* CB004 001CAF04 00000000 */   nop
/* CB008 001CAF08 0A00012A */  slti       $at, $16, 0xA
/* CB00C 001CAF0C 2B002010 */  beqz       $at, .L001CAFBC
/* CB010 001CAF10 00000000 */   nop
/* CB014 001CAF14 28264072 */  paddub     $4, $18, $0
/* CB018 001CAF18 5000A527 */  addiu      $5, $sp, 0x50
/* CB01C 001CAF1C 40000624 */  addiu      $6, $0, 0x40
/* CB020 001CAF20 09000724 */  addiu      $7, $0, 0x9
/* CB024 001CAF24 0C000824 */  addiu      $8, $0, 0xC
/* CB028 001CAF28 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB02C 001CAF2C 00000000 */   nop
/* CB030 001CAF30 289E4070 */  paddub     $19, $2, $0
/* CB034 001CAF34 2100601A */  blez       $19, .L001CAFBC
/* CB038 001CAF38 00000000 */   nop
/* CB03C 001CAF3C BE11040C */  jal        rand
/* CB040 001CAF40 00000000 */   nop
/* CB044 001CAF44 00008244 */  mtc1       $2, $f0
/* CB048 001CAF48 00000000 */  nop
/* CB04C 001CAF4C 60008046 */  cvt.s.w    $f1, $f0
/* CB050 001CAF50 00009344 */  mtc1       $19, $f0
/* CB054 001CAF54 00000000 */  nop
/* CB058 001CAF58 20008046 */  cvt.s.w    $f0, $f0
/* CB05C 001CAF5C 42000146 */  mul.s      $f1, $f0, $f1
/* CB060 001CAF60 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB064 001CAF64 00008244 */  mtc1       $2, $f0
/* CB068 001CAF68 00000000 */  nop
/* CB06C 001CAF6C 030B0046 */  div.s      $f12, $f1, $f0
/* CB070 001CAF70 2C44040C */  jal        fptosi
/* CB074 001CAF74 00000000 */   nop
/* CB078 001CAF78 C0180200 */  sll        $3, $2, 3
/* CB07C 001CAF7C 21287D00 */  addu       $5, $3, $sp
/* CB080 001CAF80 5400A48C */  lw         $4, 0x54($5)
/* CB084 001CAF84 80180400 */  sll        $3, $4, 2
/* CB088 001CAF88 21186400 */  addu       $3, $3, $4
/* CB08C 001CAF8C 80200300 */  sll        $4, $3, 2
/* CB090 001CAF90 5000A38C */  lw         $3, 0x50($5)
/* CB094 001CAF94 21186400 */  addu       $3, $3, $4
/* CB098 001CAF98 00190300 */  sll        $3, $3, 4
/* CB09C 001CAF9C 21187200 */  addu       $3, $3, $18
/* CB0A0 001CAFA0 581C6424 */  addiu      $4, $3, 0x1C58
/* CB0A4 001CAFA4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* CB0A8 001CAFA8 0000838C */  lw         $3, 0x0($4)
/* CB0AC 001CAFAC 33006324 */  addiu      $3, $3, 0x33
/* CB0B0 001CAFB0 000083AC */  sw         $3, 0x0($4)
/* CB0B4 001CAFB4 93000010 */  b          .L001CB204
/* CB0B8 001CAFB8 00000000 */   nop
.L001CAFBC:
/* CB0BC 001CAFBC 789C838F */  lw         $3, -0x6388($gp)
/* CB0C0 001CAFC0 05006380 */  lb         $3, 0x5($3)
/* CB0C4 001CAFC4 04006328 */  slti       $3, $3, 0x4
/* CB0C8 001CAFC8 2E006014 */  bnez       $3, .L001CB084
/* CB0CC 001CAFCC 00000000 */   nop
/* CB0D0 001CAFD0 1400012A */  slti       $at, $16, 0x14
/* CB0D4 001CAFD4 2B002010 */  beqz       $at, .L001CB084
/* CB0D8 001CAFD8 00000000 */   nop
/* CB0DC 001CAFDC 28264072 */  paddub     $4, $18, $0
/* CB0E0 001CAFE0 5000A527 */  addiu      $5, $sp, 0x50
/* CB0E4 001CAFE4 40000624 */  addiu      $6, $0, 0x40
/* CB0E8 001CAFE8 09000724 */  addiu      $7, $0, 0x9
/* CB0EC 001CAFEC 0C000824 */  addiu      $8, $0, 0xC
/* CB0F0 001CAFF0 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB0F4 001CAFF4 00000000 */   nop
/* CB0F8 001CAFF8 289E4070 */  paddub     $19, $2, $0
/* CB0FC 001CAFFC 2100601A */  blez       $19, .L001CB084
/* CB100 001CB000 00000000 */   nop
/* CB104 001CB004 BE11040C */  jal        rand
/* CB108 001CB008 00000000 */   nop
/* CB10C 001CB00C 00008244 */  mtc1       $2, $f0
/* CB110 001CB010 00000000 */  nop
/* CB114 001CB014 60008046 */  cvt.s.w    $f1, $f0
/* CB118 001CB018 00009344 */  mtc1       $19, $f0
/* CB11C 001CB01C 00000000 */  nop
/* CB120 001CB020 20008046 */  cvt.s.w    $f0, $f0
/* CB124 001CB024 42000146 */  mul.s      $f1, $f0, $f1
/* CB128 001CB028 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB12C 001CB02C 00008244 */  mtc1       $2, $f0
/* CB130 001CB030 00000000 */  nop
/* CB134 001CB034 030B0046 */  div.s      $f12, $f1, $f0
/* CB138 001CB038 2C44040C */  jal        fptosi
/* CB13C 001CB03C 00000000 */   nop
/* CB140 001CB040 C0180200 */  sll        $3, $2, 3
/* CB144 001CB044 21287D00 */  addu       $5, $3, $sp
/* CB148 001CB048 5400A48C */  lw         $4, 0x54($5)
/* CB14C 001CB04C 80180400 */  sll        $3, $4, 2
/* CB150 001CB050 21186400 */  addu       $3, $3, $4
/* CB154 001CB054 80200300 */  sll        $4, $3, 2
/* CB158 001CB058 5000A38C */  lw         $3, 0x50($5)
/* CB15C 001CB05C 21186400 */  addu       $3, $3, $4
/* CB160 001CB060 00190300 */  sll        $3, $3, 4
/* CB164 001CB064 21187200 */  addu       $3, $3, $18
/* CB168 001CB068 581C6424 */  addiu      $4, $3, 0x1C58
/* CB16C 001CB06C F87F8424 */  addiu      $4, $4, 0x7FF8
/* CB170 001CB070 0000838C */  lw         $3, 0x0($4)
/* CB174 001CB074 37006324 */  addiu      $3, $3, 0x37
/* CB178 001CB078 000083AC */  sw         $3, 0x0($4)
/* CB17C 001CB07C 61000010 */  b          .L001CB204
/* CB180 001CB080 00000000 */   nop
.L001CB084:
/* CB184 001CB084 789C838F */  lw         $3, -0x6388($gp)
/* CB188 001CB088 05006380 */  lb         $3, 0x5($3)
/* CB18C 001CB08C 05006328 */  slti       $3, $3, 0x5
/* CB190 001CB090 2D006014 */  bnez       $3, .L001CB148
/* CB194 001CB094 00000000 */   nop
/* CB198 001CB098 1E00012A */  slti       $at, $16, 0x1E
/* CB19C 001CB09C 2A002010 */  beqz       $at, .L001CB148
/* CB1A0 001CB0A0 00000000 */   nop
/* CB1A4 001CB0A4 28264072 */  paddub     $4, $18, $0
/* CB1A8 001CB0A8 5000A527 */  addiu      $5, $sp, 0x50
/* CB1AC 001CB0AC 40000624 */  addiu      $6, $0, 0x40
/* CB1B0 001CB0B0 283E0070 */  paddub     $7, $0, $0
/* CB1B4 001CB0B4 FFFF0824 */  addiu      $8, $0, -0x1
/* CB1B8 001CB0B8 A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB1BC 001CB0BC 00000000 */   nop
/* CB1C0 001CB0C0 289E4070 */  paddub     $19, $2, $0
/* CB1C4 001CB0C4 2000601A */  blez       $19, .L001CB148
/* CB1C8 001CB0C8 00000000 */   nop
/* CB1CC 001CB0CC BE11040C */  jal        rand
/* CB1D0 001CB0D0 00000000 */   nop
/* CB1D4 001CB0D4 00008244 */  mtc1       $2, $f0
/* CB1D8 001CB0D8 00000000 */  nop
/* CB1DC 001CB0DC 60008046 */  cvt.s.w    $f1, $f0
/* CB1E0 001CB0E0 00009344 */  mtc1       $19, $f0
/* CB1E4 001CB0E4 00000000 */  nop
/* CB1E8 001CB0E8 20008046 */  cvt.s.w    $f0, $f0
/* CB1EC 001CB0EC 42000146 */  mul.s      $f1, $f0, $f1
/* CB1F0 001CB0F0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB1F4 001CB0F4 00008244 */  mtc1       $2, $f0
/* CB1F8 001CB0F8 00000000 */  nop
/* CB1FC 001CB0FC 030B0046 */  div.s      $f12, $f1, $f0
/* CB200 001CB100 2C44040C */  jal        fptosi
/* CB204 001CB104 00000000 */   nop
/* CB208 001CB108 44000624 */  addiu      $6, $0, 0x44
/* CB20C 001CB10C C0180200 */  sll        $3, $2, 3
/* CB210 001CB110 21287D00 */  addu       $5, $3, $sp
/* CB214 001CB114 5400A48C */  lw         $4, 0x54($5)
/* CB218 001CB118 80180400 */  sll        $3, $4, 2
/* CB21C 001CB11C 21186400 */  addu       $3, $3, $4
/* CB220 001CB120 80200300 */  sll        $4, $3, 2
/* CB224 001CB124 5000A38C */  lw         $3, 0x50($5)
/* CB228 001CB128 21186400 */  addu       $3, $3, $4
/* CB22C 001CB12C 00190300 */  sll        $3, $3, 4
/* CB230 001CB130 21187200 */  addu       $3, $3, $18
/* CB234 001CB134 0100013C */  lui        $at, (0x10000 >> 16)
/* CB238 001CB138 21086100 */  addu       $at, $3, $at
/* CB23C 001CB13C 509C26AC */  sw         $6, -0x63B0($at)
/* CB240 001CB140 30000010 */  b          .L001CB204
/* CB244 001CB144 00000000 */   nop
.L001CB148:
/* CB248 001CB148 789C838F */  lw         $3, -0x6388($gp)
/* CB24C 001CB14C 05006380 */  lb         $3, 0x5($3)
/* CB250 001CB150 06006328 */  slti       $3, $3, 0x6
/* CB254 001CB154 2B006014 */  bnez       $3, .L001CB204
/* CB258 001CB158 00000000 */   nop
/* CB25C 001CB15C 2900012A */  slti       $at, $16, 0x29
/* CB260 001CB160 28002014 */  bnez       $at, .L001CB204
/* CB264 001CB164 00000000 */   nop
/* CB268 001CB168 28264072 */  paddub     $4, $18, $0
/* CB26C 001CB16C 5000A527 */  addiu      $5, $sp, 0x50
/* CB270 001CB170 40000624 */  addiu      $6, $0, 0x40
/* CB274 001CB174 283E0070 */  paddub     $7, $0, $0
/* CB278 001CB178 FFFF0824 */  addiu      $8, $0, -0x1
/* CB27C 001CB17C A428070C */  jal        CreatPartsList__11CDungeonMapFPiiii
/* CB280 001CB180 00000000 */   nop
/* CB284 001CB184 289E4070 */  paddub     $19, $2, $0
/* CB288 001CB188 1E00601A */  blez       $19, .L001CB204
/* CB28C 001CB18C 00000000 */   nop
/* CB290 001CB190 BE11040C */  jal        rand
/* CB294 001CB194 00000000 */   nop
/* CB298 001CB198 00008244 */  mtc1       $2, $f0
/* CB29C 001CB19C 00000000 */  nop
/* CB2A0 001CB1A0 60008046 */  cvt.s.w    $f1, $f0
/* CB2A4 001CB1A4 00009344 */  mtc1       $19, $f0
/* CB2A8 001CB1A8 00000000 */  nop
/* CB2AC 001CB1AC 20008046 */  cvt.s.w    $f0, $f0
/* CB2B0 001CB1B0 42000146 */  mul.s      $f1, $f0, $f1
/* CB2B4 001CB1B4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* CB2B8 001CB1B8 00008244 */  mtc1       $2, $f0
/* CB2BC 001CB1BC 00000000 */  nop
/* CB2C0 001CB1C0 030B0046 */  div.s      $f12, $f1, $f0
/* CB2C4 001CB1C4 2C44040C */  jal        fptosi
/* CB2C8 001CB1C8 00000000 */   nop
/* CB2CC 001CB1CC 45000624 */  addiu      $6, $0, 0x45
/* CB2D0 001CB1D0 C0180200 */  sll        $3, $2, 3
/* CB2D4 001CB1D4 21287D00 */  addu       $5, $3, $sp
/* CB2D8 001CB1D8 5400A48C */  lw         $4, 0x54($5)
/* CB2DC 001CB1DC 80180400 */  sll        $3, $4, 2
/* CB2E0 001CB1E0 21186400 */  addu       $3, $3, $4
/* CB2E4 001CB1E4 80200300 */  sll        $4, $3, 2
/* CB2E8 001CB1E8 5000A38C */  lw         $3, 0x50($5)
/* CB2EC 001CB1EC 21186400 */  addu       $3, $3, $4
/* CB2F0 001CB1F0 00190300 */  sll        $3, $3, 4
/* CB2F4 001CB1F4 21187200 */  addu       $3, $3, $18
/* CB2F8 001CB1F8 0100013C */  lui        $at, (0x10000 >> 16)
/* CB2FC 001CB1FC 21086100 */  addu       $at, $3, $at
/* CB300 001CB200 509C26AC */  sw         $6, -0x63B0($at)
.L001CB204:
/* CB304 001CB204 4000BF7B */  lq         $31, 0x40($sp)
/* CB308 001CB208 3000B37B */  lq         $19, 0x30($sp)
/* CB30C 001CB20C 2000B27B */  lq         $18, 0x20($sp)
/* CB310 001CB210 1000B17B */  lq         $17, 0x10($sp)
/* CB314 001CB214 0000B07B */  lq         $16, 0x0($sp)
/* CB318 001CB218 5002BD27 */  addiu      $sp, $sp, 0x250
/* CB31C 001CB21C 0800E003 */  jr         $31
/* CB320 001CB220 00000000 */   nop
/* CB324 001CB224 00000000 */  nop
/* CB328 001CB228 00000000 */  nop
/* CB32C 001CB22C 00000000 */  nop
