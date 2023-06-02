.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel usedActiveItem__FP11CUserStatusi
/* D57F0 001D56F0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* D57F4 001D56F4 6000BF7F */  sq         $31, 0x60($sp)
/* D57F8 001D56F8 5000B57F */  sq         $21, 0x50($sp)
/* D57FC 001D56FC 4000B47F */  sq         $20, 0x40($sp)
/* D5800 001D5700 3000B37F */  sq         $19, 0x30($sp)
/* D5804 001D5704 2000B27F */  sq         $18, 0x20($sp)
/* D5808 001D5708 1000B17F */  sq         $17, 0x10($sp)
/* D580C 001D570C 0000B07F */  sq         $16, 0x0($sp)
/* D5810 001D5710 28AE8070 */  paddub     $21, $4, $0
/* D5814 001D5714 04009180 */  lb         $17, 0x4($4)
/* D5818 001D5718 AA000324 */  addiu      $3, $0, 0xAA
/* D581C 001D571C 1000A314 */  bne        $5, $3, .L001D5760
/* D5820 001D5720 00000000 */   nop
/* D5824 001D5724 C842023C */  lui        $2, (0x42C80000 >> 16)
/* D5828 001D5728 00608244 */  mtc1       $2, $f12
/* D582C 001D572C 282E2072 */  paddub     $5, $17, $0
/* D5830 001D5730 C8000624 */  addiu      $6, $0, 0xC8
/* D5834 001D5734 C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* D5838 001D5738 00000000 */   nop
/* D583C 001D573C 0400A582 */  lb         $5, 0x4($21)
/* D5840 001D5740 A040023C */  lui        $2, (0x40A00000 >> 16)
/* D5844 001D5744 00608244 */  mtc1       $2, $f12
/* D5848 001D5748 2826A072 */  paddub     $4, $21, $0
/* D584C 001D574C ECFF0624 */  addiu      $6, $0, -0x14
/* D5850 001D5750 44F9060C */  jal        AddDrink__11CUserStatusFisf
/* D5854 001D5754 00000000 */   nop
/* D5858 001D5758 6D000010 */  b          .L001D5910
/* D585C 001D575C 00000000 */   nop
.L001D5760:
/* D5860 001D5760 AFFFA524 */  addiu      $5, $5, -0x51
/* D5864 001D5764 80180500 */  sll        $3, $5, 2
/* D5868 001D5768 21186500 */  addu       $3, $3, $5
/* D586C 001D576C 80900300 */  sll        $18, $3, 2
/* D5870 001D5770 2800033C */  lui        $3, %hi(ITEM_LIST + 0x8)
/* D5874 001D5774 A8D06324 */  addiu      $3, $3, %lo(ITEM_LIST + 0x8)
/* D5878 001D5778 21A07200 */  addu       $20, $3, $18
/* D587C 001D577C 00008386 */  lh         $3, 0x0($20)
/* D5880 001D5780 04006330 */  andi       $3, $3, 0x4
/* D5884 001D5784 23006010 */  beqz       $3, .L001D5814
/* D5888 001D5788 00000000 */   nop
/* D588C 001D578C 28860070 */  paddub     $16, $0, $0
/* D5890 001D5790 2800033C */  lui        $3, %hi(ITEM_LIST + 0x4)
/* D5894 001D5794 A4D06324 */  addiu      $3, $3, %lo(ITEM_LIST + 0x4)
/* D5898 001D5798 21987200 */  addu       $19, $3, $18
/* D589C 001D579C 0000638E */  lw         $3, 0x0($19)
/* D58A0 001D57A0 40006330 */  andi       $3, $3, 0x40
/* D58A4 001D57A4 0B006010 */  beqz       $3, .L001D57D4
/* D58A8 001D57A8 00000000 */   nop
/* D58AC 001D57AC 2800023C */  lui        $2, %hi(ITEM_LIST + 0xA)
/* D58B0 001D57B0 AAD04224 */  addiu      $2, $2, %lo(ITEM_LIST + 0xA)
/* D58B4 001D57B4 21105200 */  addu       $2, $2, $18
/* D58B8 001D57B8 00004684 */  lh         $6, 0x0($2)
/* D58BC 001D57BC C842023C */  lui        $2, (0x42C80000 >> 16)
/* D58C0 001D57C0 00608244 */  mtc1       $2, $f12
/* D58C4 001D57C4 282E2072 */  paddub     $5, $17, $0
/* D58C8 001D57C8 C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* D58CC 001D57CC 00000000 */   nop
/* D58D0 001D57D0 01001026 */  addiu      $16, $16, 0x1
.L001D57D4:
/* D58D4 001D57D4 0000638E */  lw         $3, 0x0($19)
/* D58D8 001D57D8 80006330 */  andi       $3, $3, 0x80
/* D58DC 001D57DC 0D006010 */  beqz       $3, .L001D5814
/* D58E0 001D57E0 00000000 */   nop
/* D58E4 001D57E4 2800023C */  lui        $2, %hi(ITEM_LIST + 0xA)
/* D58E8 001D57E8 AAD04224 */  addiu      $2, $2, %lo(ITEM_LIST + 0xA)
/* D58EC 001D57EC 21185200 */  addu       $3, $2, $18
/* D58F0 001D57F0 40101000 */  sll        $2, $16, 1
/* D58F4 001D57F4 21104300 */  addu       $2, $2, $3
/* D58F8 001D57F8 00004684 */  lh         $6, 0x0($2)
/* D58FC 001D57FC 0400A582 */  lb         $5, 0x4($21)
/* D5900 001D5800 A040023C */  lui        $2, (0x40A00000 >> 16)
/* D5904 001D5804 00608244 */  mtc1       $2, $f12
/* D5908 001D5808 2826A072 */  paddub     $4, $21, $0
/* D590C 001D580C 44F9060C */  jal        AddDrink__11CUserStatusFisf
/* D5910 001D5810 00000000 */   nop
.L001D5814:
/* D5914 001D5814 00008386 */  lh         $3, 0x0($20)
/* D5918 001D5818 01006330 */  andi       $3, $3, 0x1
/* D591C 001D581C 3C006010 */  beqz       $3, .L001D5910
/* D5920 001D5820 00000000 */   nop
/* D5924 001D5824 2800033C */  lui        $3, %hi(ITEM_LIST + 0x4)
/* D5928 001D5828 A4D06324 */  addiu      $3, $3, %lo(ITEM_LIST + 0x4)
/* D592C 001D582C 21807200 */  addu       $16, $3, $18
/* D5930 001D5830 0000038E */  lw         $3, 0x0($16)
/* D5934 001D5834 00106330 */  andi       $3, $3, 0x1000
/* D5938 001D5838 09006010 */  beqz       $3, .L001D5860
/* D593C 001D583C 00000000 */   nop
/* D5940 001D5840 08000424 */  addiu      $4, $0, 0x8
/* D5944 001D5844 ECC6060C */  jal        BtSetStatusErr__Fi
/* D5948 001D5848 00000000 */   nop
/* D594C 001D584C 6F000424 */  addiu      $4, $0, 0x6F
/* D5950 001D5850 FFFF0524 */  addiu      $5, $0, -0x1
/* D5954 001D5854 28360070 */  paddub     $6, $0, $0
/* D5958 001D5858 AC69050C */  jal        SndSePlay__Fiii
/* D595C 001D585C 00000000 */   nop
.L001D5860:
/* D5960 001D5860 0000048E */  lw         $4, 0x0($16)
/* D5964 001D5864 0200033C */  lui        $3, (0x20000 >> 16)
/* D5968 001D5868 24188300 */  and        $3, $4, $3
/* D596C 001D586C 0A006010 */  beqz       $3, .L001D5898
/* D5970 001D5870 00000000 */   nop
/* D5974 001D5874 789C848F */  lw         $4, -0x6388($gp)
/* D5978 001D5878 80181100 */  sll        $3, $17, 2
/* D597C 001D587C 21186400 */  addu       $3, $3, $4
/* D5980 001D5880 C8426424 */  addiu      $4, $3, 0x42C8
/* D5984 001D5884 C842638C */  lw         $3, 0x42C8($3)
/* D5988 001D5888 40006330 */  andi       $3, $3, 0x40
/* D598C 001D588C 02006010 */  beqz       $3, .L001D5898
/* D5990 001D5890 00000000 */   nop
/* D5994 001D5894 000080AC */  sw         $0, 0x0($4)
.L001D5898:
/* D5998 001D5898 0000038E */  lw         $3, 0x0($16)
/* D599C 001D589C 00806330 */  andi       $3, $3, 0x8000
/* D59A0 001D58A0 0A006010 */  beqz       $3, .L001D58CC
/* D59A4 001D58A4 00000000 */   nop
/* D59A8 001D58A8 789C848F */  lw         $4, -0x6388($gp)
/* D59AC 001D58AC 80181100 */  sll        $3, $17, 2
/* D59B0 001D58B0 21186400 */  addu       $3, $3, $4
/* D59B4 001D58B4 C8426424 */  addiu      $4, $3, 0x42C8
/* D59B8 001D58B8 C842638C */  lw         $3, 0x42C8($3)
/* D59BC 001D58BC 10006330 */  andi       $3, $3, 0x10
/* D59C0 001D58C0 02006010 */  beqz       $3, .L001D58CC
/* D59C4 001D58C4 00000000 */   nop
/* D59C8 001D58C8 000080AC */  sw         $0, 0x0($4)
.L001D58CC:
/* D59CC 001D58CC 0000048E */  lw         $4, 0x0($16)
/* D59D0 001D58D0 0300033C */  lui        $3, (0x3C000 >> 16)
/* D59D4 001D58D4 00C06334 */  ori        $3, $3, (0x3C000 & 0xFFFF)
/* D59D8 001D58D8 24188300 */  and        $3, $4, $3
/* D59DC 001D58DC 0C006010 */  beqz       $3, .L001D5910
/* D59E0 001D58E0 00000000 */   nop
/* D59E4 001D58E4 789C848F */  lw         $4, -0x6388($gp)
/* D59E8 001D58E8 80181100 */  sll        $3, $17, 2
/* D59EC 001D58EC 21186400 */  addu       $3, $3, $4
/* D59F0 001D58F0 C8426524 */  addiu      $5, $3, 0x42C8
/* D59F4 001D58F4 C842648C */  lw         $4, 0x42C8($3)
/* D59F8 001D58F8 04008014 */  bnez       $4, .L001D590C
/* D59FC 001D58FC 00000000 */   nop
/* D5A00 001D5900 08000324 */  addiu      $3, $0, 0x8
/* D5A04 001D5904 02008310 */  beq        $4, $3, .L001D5910
/* D5A08 001D5908 00000000 */   nop
.L001D590C:
/* D5A0C 001D590C 0000A0AC */  sw         $0, 0x0($5)
.L001D5910:
/* D5A10 001D5910 6000BF7B */  lq         $31, 0x60($sp)
/* D5A14 001D5914 5000B57B */  lq         $21, 0x50($sp)
/* D5A18 001D5918 4000B47B */  lq         $20, 0x40($sp)
/* D5A1C 001D591C 3000B37B */  lq         $19, 0x30($sp)
/* D5A20 001D5920 2000B27B */  lq         $18, 0x20($sp)
/* D5A24 001D5924 1000B17B */  lq         $17, 0x10($sp)
/* D5A28 001D5928 0000B07B */  lq         $16, 0x0($sp)
/* D5A2C 001D592C 7000BD27 */  addiu      $sp, $sp, 0x70
/* D5A30 001D5930 0800E003 */  jr         $31
/* D5A34 001D5934 00000000 */   nop
/* D5A38 001D5938 00000000 */  nop
/* D5A3C 001D593C 00000000 */  nop
