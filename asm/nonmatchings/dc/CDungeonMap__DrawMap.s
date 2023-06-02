.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1
/* C2790 001C2690 A0FDBD27 */  addiu      $sp, $sp, -0x260
/* C2794 001C2694 C000BF7F */  sq         $31, 0xC0($sp)
/* C2798 001C2698 B000BE7F */  sq         $fp, 0xB0($sp)
/* C279C 001C269C A000B77F */  sq         $23, 0xA0($sp)
/* C27A0 001C26A0 9000B67F */  sq         $22, 0x90($sp)
/* C27A4 001C26A4 8000B57F */  sq         $21, 0x80($sp)
/* C27A8 001C26A8 7000B47F */  sq         $20, 0x70($sp)
/* C27AC 001C26AC 6000B37F */  sq         $19, 0x60($sp)
/* C27B0 001C26B0 5000B27F */  sq         $18, 0x50($sp)
/* C27B4 001C26B4 4000B17F */  sq         $17, 0x40($sp)
/* C27B8 001C26B8 3000B07F */  sq         $16, 0x30($sp)
/* C27BC 001C26BC 2C00BBE7 */  swc1       $f27, 0x2C($sp)
/* C27C0 001C26C0 2800BAE7 */  swc1       $f26, 0x28($sp)
/* C27C4 001C26C4 2400B9E7 */  swc1       $f25, 0x24($sp)
/* C27C8 001C26C8 2000B8E7 */  swc1       $f24, 0x20($sp)
/* C27CC 001C26CC 1C00B7E7 */  swc1       $f23, 0x1C($sp)
/* C27D0 001C26D0 1800B6E7 */  swc1       $f22, 0x18($sp)
/* C27D4 001C26D4 1400B5E7 */  swc1       $f21, 0x14($sp)
/* C27D8 001C26D8 1000B4E7 */  swc1       $f20, 0x10($sp)
/* C27DC 001C26DC 28AE8070 */  paddub     $21, $4, $0
/* C27E0 001C26E0 288EA070 */  paddub     $17, $5, $0
/* C27E4 001C26E4 2886C070 */  paddub     $16, $6, $0
/* C27E8 001C26E8 28262072 */  paddub     $4, $17, $0
/* C27EC 001C26EC 2001A527 */  addiu      $5, $sp, 0x120
/* C27F0 001C26F0 9C91040C */  jal        GetPos__7CCameraFPf
/* C27F4 001C26F4 00000000 */   nop
/* C27F8 001C26F8 28262072 */  paddub     $4, $17, $0
/* C27FC 001C26FC 4001A527 */  addiu      $5, $sp, 0x140
/* C2800 001C2700 A891040C */  jal        GetRef__7CCameraFPf
/* C2804 001C2704 00000000 */   nop
/* C2808 001C2708 4001A1C7 */  lwc1       $f1, 0x140($sp)
/* C280C 001C270C 2001A0C7 */  lwc1       $f0, 0x120($sp)
/* C2810 001C2710 01080046 */  sub.s      $f0, $f1, $f0
/* C2814 001C2714 3001A0E7 */  swc1       $f0, 0x130($sp)
/* C2818 001C2718 4401A227 */  addiu      $2, $sp, 0x144
/* C281C 001C271C 000041C4 */  lwc1       $f1, 0x0($2)
/* C2820 001C2720 2401A0C7 */  lwc1       $f0, 0x124($sp)
/* C2824 001C2724 01080046 */  sub.s      $f0, $f1, $f0
/* C2828 001C2728 3401A0E7 */  swc1       $f0, 0x134($sp)
/* C282C 001C272C 4801A227 */  addiu      $2, $sp, 0x148
/* C2830 001C2730 000041C4 */  lwc1       $f1, 0x0($2)
/* C2834 001C2734 2801A227 */  addiu      $2, $sp, 0x128
/* C2838 001C2738 000040C4 */  lwc1       $f0, 0x0($2)
/* C283C 001C273C 01080046 */  sub.s      $f0, $f1, $f0
/* C2840 001C2740 3801A227 */  addiu      $2, $sp, 0x138
/* C2844 001C2744 000040E4 */  swc1       $f0, 0x0($2)
/* C2848 001C2748 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C284C 001C274C 3C01A2AF */  sw         $2, 0x13C($sp)
/* C2850 001C2750 5001A427 */  addiu      $4, $sp, 0x150
/* C2854 001C2754 3001A527 */  addiu      $5, $sp, 0x130
/* C2858 001C2758 9285040C */  jal        sceVu0Normalize
/* C285C 001C275C 00000000 */   nop
/* C2860 001C2760 6001A427 */  addiu      $4, $sp, 0x160
/* C2864 001C2764 20020526 */  addiu      $5, $16, 0x220
/* C2868 001C2768 0C86040C */  jal        sceVu0CopyVector
/* C286C 001C276C 00000000 */   nop
/* C2870 001C2770 2043023C */  lui        $2, (0x43200000 >> 16)
/* C2874 001C2774 00088244 */  mtc1       $2, $f1
/* C2878 001C2778 6001A0C7 */  lwc1       $f0, 0x160($sp)
/* C287C 001C277C 03030146 */  div.s      $f12, $f0, $f1
/* C2880 001C2780 2C44040C */  jal        fptosi
/* C2884 001C2784 00000000 */   nop
/* C2888 001C2788 2043023C */  lui        $2, (0x43200000 >> 16)
/* C288C 001C278C 00088244 */  mtc1       $2, $f1
/* C2890 001C2790 6801A0C7 */  lwc1       $f0, 0x168($sp)
/* C2894 001C2794 03030146 */  div.s      $f12, $f0, $f1
/* C2898 001C2798 2C44040C */  jal        fptosi
/* C289C 001C279C 00000000 */   nop
/* C28A0 001C27A0 A49D828F */  lw         $2, -0x625C($gp)
/* C28A4 001C27A4 80180200 */  sll        $3, $2, 2
/* C28A8 001C27A8 2800023C */  lui        $2, %hi(ItemFreeAreaAll)
/* C28AC 001C27AC 509D4224 */  addiu      $2, $2, %lo(ItemFreeAreaAll)
/* C28B0 001C27B0 21104300 */  addu       $2, $2, $3
/* C28B4 001C27B4 0000428C */  lw         $2, 0x0($2)
/* C28B8 001C27B8 D000A2AF */  sw         $2, 0xD0($sp)
/* C28BC 001C27BC 2826A072 */  paddub     $4, $21, $0
/* C28C0 001C27C0 9C07070C */  jal        ClearNPC_Cash__11CDungeonMapFv
/* C28C4 001C27C4 00000000 */   nop
/* C28C8 001C27C8 10270324 */  addiu      $3, $0, 0x2710
/* C28CC 001C27CC 00008344 */  mtc1       $3, $f0
/* C28D0 001C27D0 00000000 */  nop
/* C28D4 001C27D4 A0058046 */  cvt.s.w    $f22, $f0
/* C28D8 001C27D8 28860070 */  paddub     $16, $0, $0
/* C28DC 001C27DC C4010010 */  b          .L001C2EF0
/* C28E0 001C27E0 00000000 */   nop
.L001C27E4:
/* C28E4 001C27E4 28B60070 */  paddub     $22, $0, $0
/* C28E8 001C27E8 BD010010 */  b          .L001C2EE0
/* C28EC 001C27EC 00000000 */   nop
.L001C27F0:
/* C28F0 001C27F0 2043023C */  lui        $2, (0x43200000 >> 16)
/* C28F4 001C27F4 00088244 */  mtc1       $2, $f1
/* C28F8 001C27F8 00009644 */  mtc1       $22, $f0
/* C28FC 001C27FC 00000000 */  nop
/* C2900 001C2800 20008046 */  cvt.s.w    $f0, $f0
/* C2904 001C2804 C20D0046 */  mul.s      $f23, $f1, $f0
/* C2908 001C2808 2001A0C7 */  lwc1       $f0, 0x120($sp)
/* C290C 001C280C 41BD0046 */  sub.s      $f21, $f23, $f0
/* C2910 001C2810 00009044 */  mtc1       $16, $f0
/* C2914 001C2814 00000000 */  nop
/* C2918 001C2818 20008046 */  cvt.s.w    $f0, $f0
/* C291C 001C281C 020E0046 */  mul.s      $f24, $f1, $f0
/* C2920 001C2820 2801A227 */  addiu      $2, $sp, 0x128
/* C2924 001C2824 000040C4 */  lwc1       $f0, 0x0($2)
/* C2928 001C2828 41C60046 */  sub.s      $f25, $f24, $f0
/* C292C 001C282C 8001B5E7 */  swc1       $f21, 0x180($sp)
/* C2930 001C2830 8401A0AF */  sw         $0, 0x184($sp)
/* C2934 001C2834 8801B9E7 */  swc1       $f25, 0x188($sp)
/* C2938 001C2838 8C01A0AF */  sw         $0, 0x18C($sp)
/* C293C 001C283C 8001A427 */  addiu      $4, $sp, 0x180
/* C2940 001C2840 588D040C */  jal        DistVector__FPf
/* C2944 001C2844 00000000 */   nop
/* C2948 001C2848 06050046 */  mov.s      $f20, $f0
/* C294C 001C284C 80181000 */  sll        $3, $16, 2
/* C2950 001C2850 21187000 */  addu       $3, $3, $16
/* C2954 001C2854 80180300 */  sll        $3, $3, 2
/* C2958 001C2858 2118C302 */  addu       $3, $22, $3
/* C295C 001C285C 00890300 */  sll        $17, $3, 4
/* C2960 001C2860 21203502 */  addu       $4, $17, $21
/* C2964 001C2864 0100013C */  lui        $at, (0x10000 >> 16)
/* C2968 001C2868 21088100 */  addu       $at, $4, $at
/* C296C 001C286C 589C20E4 */  swc1       $f0, -0x63A8($at)
/* C2970 001C2870 581C9324 */  addiu      $19, $4, 0x1C58
/* C2974 001C2874 F87F7326 */  addiu      $19, $19, 0x7FF8
/* C2978 001C2878 0000658E */  lw         $5, 0x0($19)
/* C297C 001C287C FFFF0324 */  addiu      $3, $0, -0x1
/* C2980 001C2880 0600A314 */  bne        $5, $3, .L001C289C
/* C2984 001C2884 00000000 */   nop
/* C2988 001C2888 0100013C */  lui        $at, (0x10000 >> 16)
/* C298C 001C288C 21088100 */  addu       $at, $4, $at
/* C2990 001C2890 5C9C20AC */  sw         $0, -0x63A4($at)
/* C2994 001C2894 91010010 */  b          .L001C2EDC
/* C2998 001C2898 00000000 */   nop
.L001C289C:
/* C299C 001C289C 3B000324 */  addiu      $3, $0, 0x3B
/* C29A0 001C28A0 1200A314 */  bne        $5, $3, .L001C28EC
/* C29A4 001C28A4 00000000 */   nop
/* C29A8 001C28A8 789C838F */  lw         $3, -0x6388($gp)
/* C29AC 001C28AC 00006480 */  lb         $4, 0x0($3)
/* C29B0 001C28B0 02000324 */  addiu      $3, $0, 0x2
/* C29B4 001C28B4 0D008314 */  bne        $4, $3, .L001C28EC
/* C29B8 001C28B8 00000000 */   nop
/* C29BC 001C28BC 34A01646 */  c.lt.s     $f20, $f22
/* C29C0 001C28C0 00000000 */  nop
/* C29C4 001C28C4 09000045 */  bc1f       .L001C28EC
/* C29C8 001C28C8 00000000 */   nop
/* C29CC 001C28CC 86A50046 */  mov.s      $f22, $f20
/* C29D0 001C28D0 7001B7E7 */  swc1       $f23, 0x170($sp)
/* C29D4 001C28D4 7401A0AF */  sw         $0, 0x174($sp)
/* C29D8 001C28D8 7801B8E7 */  swc1       $f24, 0x178($sp)
/* C29DC 001C28DC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C29E0 001C28E0 7C01A3AF */  sw         $3, 0x17C($sp)
/* C29E4 001C28E4 41000324 */  addiu      $3, $0, 0x41
/* C29E8 001C28E8 E000A3AF */  sw         $3, 0xE0($sp)
.L001C28EC:
/* C29EC 001C28EC 0000638E */  lw         $3, 0x0($19)
/* C29F0 001C28F0 4B000424 */  addiu      $4, $0, 0x4B
/* C29F4 001C28F4 0C006414 */  bne        $3, $4, .L001C2928
/* C29F8 001C28F8 00000000 */   nop
/* C29FC 001C28FC 34A01646 */  c.lt.s     $f20, $f22
/* C2A00 001C2900 00000000 */  nop
/* C2A04 001C2904 08000045 */  bc1f       .L001C2928
/* C2A08 001C2908 00000000 */   nop
/* C2A0C 001C290C 86A50046 */  mov.s      $f22, $f20
/* C2A10 001C2910 7001B7E7 */  swc1       $f23, 0x170($sp)
/* C2A14 001C2914 7401A0AF */  sw         $0, 0x174($sp)
/* C2A18 001C2918 7801B8E7 */  swc1       $f24, 0x178($sp)
/* C2A1C 001C291C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C2A20 001C2920 7C01A3AF */  sw         $3, 0x17C($sp)
/* C2A24 001C2924 E000A4AF */  sw         $4, 0xE0($sp)
.L001C2928:
/* C2A28 001C2928 2043033C */  lui        $3, (0x43200000 >> 16)
/* C2A2C 001C292C 00088344 */  mtc1       $3, $f1
/* C2A30 001C2930 B003A0C6 */  lwc1       $f0, 0x3B0($21)
/* C2A34 001C2934 02080046 */  mul.s      $f0, $f1, $f0
/* C2A38 001C2938 34A00046 */  c.lt.s     $f20, $f0
/* C2A3C 001C293C 00000000 */  nop
/* C2A40 001C2940 04000145 */  bc1t       .L001C2954
/* C2A44 001C2944 00000000 */   nop
/* C2A48 001C2948 282E0070 */  paddub     $5, $0, $0
/* C2A4C 001C294C 3A000010 */  b          .L001C2A38
/* C2A50 001C2950 00000000 */   nop
.L001C2954:
/* C2A54 001C2954 3001A0C7 */  lwc1       $f0, 0x130($sp)
/* C2A58 001C2958 01A80046 */  sub.s      $f0, $f21, $f0
/* C2A5C 001C295C 4001A0E7 */  swc1       $f0, 0x140($sp)
/* C2A60 001C2960 4401A227 */  addiu      $2, $sp, 0x144
/* C2A64 001C2964 000040AC */  sw         $0, 0x0($2)
/* C2A68 001C2968 3801A227 */  addiu      $2, $sp, 0x138
/* C2A6C 001C296C 000040C4 */  lwc1       $f0, 0x0($2)
/* C2A70 001C2970 01C80046 */  sub.s      $f0, $f25, $f0
/* C2A74 001C2974 4801A227 */  addiu      $2, $sp, 0x148
/* C2A78 001C2978 000040E4 */  swc1       $f0, 0x0($2)
/* C2A7C 001C297C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C2A80 001C2980 4C01A2AF */  sw         $2, 0x14C($sp)
/* C2A84 001C2984 4001A427 */  addiu      $4, $sp, 0x140
/* C2A88 001C2988 282E8070 */  paddub     $5, $4, $0
/* C2A8C 001C298C 9285040C */  jal        sceVu0Normalize
/* C2A90 001C2990 00000000 */   nop
/* C2A94 001C2994 5001A427 */  addiu      $4, $sp, 0x150
/* C2A98 001C2998 4001A527 */  addiu      $5, $sp, 0x140
/* C2A9C 001C299C 8885040C */  jal        sceVu0InnerProduct
/* C2AA0 001C29A0 00000000 */   nop
/* C2AA4 001C29A4 01000524 */  addiu      $5, $0, 0x1
/* C2AA8 001C29A8 789C838F */  lw         $3, -0x6388($gp)
/* C2AAC 001C29AC 00006680 */  lb         $6, 0x0($3)
/* C2AB0 001C29B0 05000324 */  addiu      $3, $0, 0x5
/* C2AB4 001C29B4 0700C314 */  bne        $6, $3, .L001C29D4
/* C2AB8 001C29B8 00000000 */   nop
/* C2ABC 001C29BC 0000648E */  lw         $4, 0x0($19)
/* C2AC0 001C29C0 2C000324 */  addiu      $3, $0, 0x2C
/* C2AC4 001C29C4 03008314 */  bne        $4, $3, .L001C29D4
/* C2AC8 001C29C8 00000000 */   nop
/* C2ACC 001C29CC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C2AD0 001C29D0 00008344 */  mtc1       $3, $f0
.L001C29D4:
/* C2AD4 001C29D4 00088044 */  mtc1       $0, $f1
/* C2AD8 001C29D8 00000000 */  nop
/* C2ADC 001C29DC 36000146 */  c.le.s     $f0, $f1
/* C2AE0 001C29E0 00000000 */  nop
/* C2AE4 001C29E4 09000045 */  bc1f       .L001C2A0C
/* C2AE8 001C29E8 00000000 */   nop
/* C2AEC 001C29EC 2043033C */  lui        $3, (0x43200000 >> 16)
/* C2AF0 001C29F0 00008344 */  mtc1       $3, $f0
/* C2AF4 001C29F4 00000000 */  nop
/* C2AF8 001C29F8 34A00046 */  c.lt.s     $f20, $f0
/* C2AFC 001C29FC 00000000 */  nop
/* C2B00 001C2A00 02000145 */  bc1t       .L001C2A0C
/* C2B04 001C2A04 00000000 */   nop
/* C2B08 001C2A08 282E0070 */  paddub     $5, $0, $0
.L001C2A0C:
/* C2B0C 001C2A0C 0000648E */  lw         $4, 0x0($19)
/* C2B10 001C2A10 28008328 */  slti       $3, $4, 0x28
/* C2B14 001C2A14 08006014 */  bnez       $3, .L001C2A38
/* C2B18 001C2A18 00000000 */   nop
/* C2B1C 001C2A1C 2C008128 */  slti       $at, $4, 0x2C
/* C2B20 001C2A20 05002010 */  beqz       $at, .L001C2A38
/* C2B24 001C2A24 00000000 */   nop
/* C2B28 001C2A28 05000324 */  addiu      $3, $0, 0x5
/* C2B2C 001C2A2C 0200C314 */  bne        $6, $3, .L001C2A38
/* C2B30 001C2A30 00000000 */   nop
/* C2B34 001C2A34 01000524 */  addiu      $5, $0, 0x1
.L001C2A38:
/* C2B38 001C2A38 21203502 */  addu       $4, $17, $21
/* C2B3C 001C2A3C 0100013C */  lui        $at, (0x10000 >> 16)
/* C2B40 001C2A40 21088100 */  addu       $at, $4, $at
/* C2B44 001C2A44 5C9C25AC */  sw         $5, -0x63A4($at)
/* C2B48 001C2A48 0000668E */  lw         $6, 0x0($19)
/* C2B4C 001C2A4C FFFF0324 */  addiu      $3, $0, -0x1
/* C2B50 001C2A50 2201C310 */  beq        $6, $3, .L001C2EDC
/* C2B54 001C2A54 00000000 */   nop
/* C2B58 001C2A58 01000324 */  addiu      $3, $0, 0x1
/* C2B5C 001C2A5C 1F01A314 */  bne        $5, $3, .L001C2EDC
/* C2B60 001C2A60 00000000 */   nop
/* C2B64 001C2A64 5C1C8224 */  addiu      $2, $4, 0x1C5C
/* C2B68 001C2A68 F87F4224 */  addiu      $2, $2, 0x7FF8
/* C2B6C 001C2A6C 0001A2AF */  sw         $2, 0x100($sp)
/* C2B70 001C2A70 0001A28F */  lw         $2, 0x100($sp)
/* C2B74 001C2A74 0000438C */  lw         $3, 0x0($2)
/* C2B78 001C2A78 C0100600 */  sll        $2, $6, 3
/* C2B7C 001C2A7C 23104600 */  subu       $2, $2, $6
/* C2B80 001C2A80 80100200 */  sll        $2, $2, 2
/* C2B84 001C2A84 21104600 */  addu       $2, $2, $6
/* C2B88 001C2A88 00110200 */  sll        $2, $2, 4
/* C2B8C 001C2A8C 2110A202 */  addu       $2, $21, $2
/* C2B90 001C2A90 900543A4 */  sh         $3, 0x590($2)
/* C2B94 001C2A94 0000638E */  lw         $3, 0x0($19)
/* C2B98 001C2A98 C0100300 */  sll        $2, $3, 3
/* C2B9C 001C2A9C 23104300 */  subu       $2, $2, $3
/* C2BA0 001C2AA0 80100200 */  sll        $2, $2, 2
/* C2BA4 001C2AA4 21104300 */  addu       $2, $2, $3
/* C2BA8 001C2AA8 00110200 */  sll        $2, $2, 4
/* C2BAC 001C2AAC 2118A202 */  addu       $3, $21, $2
/* C2BB0 001C2AB0 800577E4 */  swc1       $f23, 0x580($3)
/* C2BB4 001C2AB4 840560AC */  sw         $0, 0x584($3)
/* C2BB8 001C2AB8 880578E4 */  swc1       $f24, 0x588($3)
/* C2BBC 001C2ABC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C2BC0 001C2AC0 8C0562AC */  sw         $2, 0x58C($3)
/* C2BC4 001C2AC4 288E0070 */  paddub     $17, $0, $0
/* C2BC8 001C2AC8 14000010 */  b          .L001C2B1C
/* C2BCC 001C2ACC 00000000 */   nop
.L001C2AD0:
/* C2BD0 001C2AD0 30130224 */  addiu      $2, $0, 0x1330
/* C2BD4 001C2AD4 18102202 */  mult       $2, $17, $2
/* C2BD8 001C2AD8 21105500 */  addu       $2, $2, $21
/* C2BDC 001C2ADC 0100013C */  lui        $at, (0x10000 >> 16)
/* C2BE0 001C2AE0 21084100 */  addu       $at, $2, $at
/* C2BE4 001C2AE4 C0CF238C */  lw         $3, -0x3040($at)
/* C2BE8 001C2AE8 0000628E */  lw         $2, 0x0($19)
/* C2BEC 001C2AEC 0A006214 */  bne        $3, $2, .L001C2B18
/* C2BF0 001C2AF0 00000000 */   nop
/* C2BF4 001C2AF4 00688044 */  mtc1       $0, $f13
/* C2BF8 001C2AF8 2826A072 */  paddub     $4, $21, $0
/* C2BFC 001C2AFC 282E2072 */  paddub     $5, $17, $0
/* C2C00 001C2B00 06BB0046 */  mov.s      $f12, $f23
/* C2C04 001C2B04 86C30046 */  mov.s      $f14, $f24
/* C2C08 001C2B08 0001A28F */  lw         $2, 0x100($sp)
/* C2C0C 001C2B0C 0000468C */  lw         $6, 0x0($2)
/* C2C10 001C2B10 AC07070C */  jal        ReservNPC_Draw__11CDungeonMapFifffi
/* C2C14 001C2B14 00000000 */   nop
.L001C2B18:
/* C2C18 001C2B18 01003126 */  addiu      $17, $17, 0x1
.L001C2B1C:
/* C2C1C 001C2B1C 0400222A */  slti       $2, $17, 0x4
/* C2C20 001C2B20 EBFF4014 */  bnez       $2, .L001C2AD0
/* C2C24 001C2B24 00000000 */   nop
/* C2C28 001C2B28 789C828F */  lw         $2, -0x6388($gp)
/* C2C2C 001C2B2C 00004380 */  lb         $3, 0x0($2)
/* C2C30 001C2B30 04000224 */  addiu      $2, $0, 0x4
/* C2C34 001C2B34 23006214 */  bne        $3, $2, .L001C2BC4
/* C2C38 001C2B38 00000000 */   nop
/* C2C3C 001C2B3C A001A427 */  addiu      $4, $sp, 0x1A0
/* C2C40 001C2B40 4CB7040C */  jal        MGGetAmbient__FPf
/* C2C44 001C2B44 00000000 */   nop
/* C2C48 001C2B48 9001A427 */  addiu      $4, $sp, 0x190
/* C2C4C 001C2B4C 4CB7040C */  jal        MGGetAmbient__FPf
/* C2C50 001C2B50 00000000 */   nop
/* C2C54 001C2B54 F043023C */  lui        $2, (0x43F00000 >> 16)
/* C2C58 001C2B58 00008244 */  mtc1       $2, $f0
/* C2C5C 001C2B5C 00000000 */  nop
/* C2C60 001C2B60 36A00046 */  c.le.s     $f20, $f0
/* C2C64 001C2B64 00000000 */  nop
/* C2C68 001C2B68 05000045 */  bc1f       .L001C2B80
/* C2C6C 001C2B6C 00000000 */   nop
/* C2C70 001C2B70 0043023C */  lui        $2, (0x43000000 >> 16)
/* C2C74 001C2B74 9C01A2AF */  sw         $2, 0x19C($sp)
/* C2C78 001C2B78 0F000010 */  b          .L001C2BB8
/* C2C7C 001C2B7C 00000000 */   nop
.L001C2B80:
/* C2C80 001C2B80 0043023C */  lui        $2, (0x43000000 >> 16)
/* C2C84 001C2B84 00088244 */  mtc1       $2, $f1
/* C2C88 001C2B88 00000000 */  nop
/* C2C8C 001C2B8C 01A00046 */  sub.s      $f0, $f20, $f0
/* C2C90 001C2B90 41080046 */  sub.s      $f1, $f1, $f0
/* C2C94 001C2B94 9C01A227 */  addiu      $2, $sp, 0x19C
/* C2C98 001C2B98 000041E4 */  swc1       $f1, 0x0($2)
/* C2C9C 001C2B9C 00008044 */  mtc1       $0, $f0
/* C2CA0 001C2BA0 00000000 */  nop
/* C2CA4 001C2BA4 34080046 */  c.lt.s     $f1, $f0
/* C2CA8 001C2BA8 00000000 */  nop
/* C2CAC 001C2BAC 02000045 */  bc1f       .L001C2BB8
/* C2CB0 001C2BB0 00000000 */   nop
/* C2CB4 001C2BB4 000040AC */  sw         $0, 0x0($2)
.L001C2BB8:
/* C2CB8 001C2BB8 9001A427 */  addiu      $4, $sp, 0x190
/* C2CBC 001C2BBC 40B7040C */  jal        MGSetAmbient__FPf
/* C2CC0 001C2BC0 00000000 */   nop
.L001C2BC4:
/* C2CC4 001C2BC4 0000638E */  lw         $3, 0x0($19)
/* C2CC8 001C2BC8 C0100300 */  sll        $2, $3, 3
/* C2CCC 001C2BCC 23104300 */  subu       $2, $2, $3
/* C2CD0 001C2BD0 80100200 */  sll        $2, $2, 2
/* C2CD4 001C2BD4 21104300 */  addu       $2, $2, $3
/* C2CD8 001C2BD8 00110200 */  sll        $2, $2, 4
/* C2CDC 001C2BDC 2110A202 */  addu       $2, $21, $2
/* C2CE0 001C2BE0 90044424 */  addiu      $4, $2, 0x490
/* C2CE4 001C2BE4 B405070C */  jal        Draw__13CDungeonPartsFv
/* C2CE8 001C2BE8 00000000 */   nop
/* C2CEC 001C2BEC 789C838F */  lw         $3, -0x6388($gp)
/* C2CF0 001C2BF0 00006680 */  lb         $6, 0x0($3)
/* C2CF4 001C2BF4 04000324 */  addiu      $3, $0, 0x4
/* C2CF8 001C2BF8 0400C314 */  bne        $6, $3, .L001C2C0C
/* C2CFC 001C2BFC 00000000 */   nop
/* C2D00 001C2C00 A001A427 */  addiu      $4, $sp, 0x1A0
/* C2D04 001C2C04 40B7040C */  jal        MGSetAmbient__FPf
/* C2D08 001C2C08 00000000 */   nop
.L001C2C0C:
/* C2D0C 001C2C0C D501013C */  lui        $at, (0x1D56478 >> 16)
/* C2D10 001C2C10 7864238C */  lw         $3, (0x1D56478 & 0xFFFF)($at)
/* C2D14 001C2C14 B1006010 */  beqz       $3, .L001C2EDC
/* C2D18 001C2C18 00000000 */   nop
/* C2D1C 001C2C1C 28F60070 */  paddub     $fp, $0, $0
/* C2D20 001C2C20 A3000010 */  b          .L001C2EB0
/* C2D24 001C2C24 00000000 */   nop
.L001C2C28:
/* C2D28 001C2C28 0000638E */  lw         $3, 0x0($19)
/* C2D2C 001C2C2C 9F006614 */  bne        $3, $6, .L001C2EAC
/* C2D30 001C2C30 00000000 */   nop
/* C2D34 001C2C34 288E0070 */  paddub     $17, $0, $0
/* C2D38 001C2C38 96000010 */  b          .L001C2E94
/* C2D3C 001C2C3C 00000000 */   nop
.L001C2C40:
/* C2D40 001C2C40 D000A28F */  lw         $2, 0xD0($sp)
/* C2D44 001C2C44 2110E202 */  addu       $2, $23, $2
/* C2D48 001C2C48 02004280 */  lb         $2, 0x2($2)
/* C2D4C 001C2C4C 00008244 */  mtc1       $2, $f0
/* C2D50 001C2C50 00000000 */  nop
/* C2D54 001C2C54 20038046 */  cvt.s.w    $f12, $f0
/* C2D58 001C2C58 2C44040C */  jal        fptosi
/* C2D5C 001C2C5C 00000000 */   nop
/* C2D60 001C2C60 0001A38F */  lw         $3, 0x100($sp)
/* C2D64 001C2C64 0000638C */  lw         $3, 0x0($3)
/* C2D68 001C2C68 21304300 */  addu       $6, $2, $3
/* C2D6C 001C2C6C 0400C128 */  slti       $at, $6, 0x4
/* C2D70 001C2C70 02002014 */  bnez       $at, .L001C2C7C
/* C2D74 001C2C74 00000000 */   nop
/* C2D78 001C2C78 FCFFC624 */  addiu      $6, $6, -0x4
.L001C2C7C:
/* C2D7C 001C2C7C 01000324 */  addiu      $3, $0, 0x1
/* C2D80 001C2C80 F000A3AF */  sw         $3, 0xF0($sp)
/* C2D84 001C2C84 04000324 */  addiu      $3, $0, 0x4
/* C2D88 001C2C88 23306600 */  subu       $6, $3, $6
/* C2D8C 001C2C8C 00190600 */  sll        $3, $6, 4
/* C2D90 001C2C90 23306600 */  subu       $6, $3, $6
/* C2D94 001C2C94 80180600 */  sll        $3, $6, 2
/* C2D98 001C2C98 23186600 */  subu       $3, $3, $6
/* C2D9C 001C2C9C 40180300 */  sll        $3, $3, 1
/* C2DA0 001C2CA0 00008344 */  mtc1       $3, $f0
/* C2DA4 001C2CA4 00000000 */  nop
/* C2DA8 001C2CA8 60008046 */  cvt.s.w    $f1, $f0
/* C2DAC 001C2CAC B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C2DB0 001C2CB0 42000146 */  mul.s      $f1, $f0, $f1
/* C2DB4 001C2CB4 3443033C */  lui        $3, (0x43340000 >> 16)
/* C2DB8 001C2CB8 00008344 */  mtc1       $3, $f0
/* C2DBC 001C2CBC 00000000 */  nop
/* C2DC0 001C2CC0 030D0046 */  div.s      $f20, $f1, $f0
/* C2DC4 001C2CC4 D000A38F */  lw         $3, 0xD0($sp)
/* C2DC8 001C2CC8 2130E302 */  addu       $6, $23, $3
/* C2DCC 001C2CCC 40181100 */  sll        $3, $17, 1
/* C2DD0 001C2CD0 21187100 */  addu       $3, $3, $17
/* C2DD4 001C2CD4 C0180300 */  sll        $3, $3, 3
/* C2DD8 001C2CD8 21306600 */  addu       $6, $3, $6
/* C2DDC 001C2CDC 0400C0C4 */  lwc1       $f0, 0x4($6)
/* C2DE0 001C2CE0 2041033C */  lui        $3, (0x41200000 >> 16)
/* C2DE4 001C2CE4 00088344 */  mtc1       $3, $f1
/* C2DE8 001C2CE8 00000000 */  nop
/* C2DEC 001C2CEC 02080046 */  mul.s      $f0, $f1, $f0
/* C2DF0 001C2CF0 3002A0E7 */  swc1       $f0, 0x230($sp)
/* C2DF4 001C2CF4 0800C0C4 */  lwc1       $f0, 0x8($6)
/* C2DF8 001C2CF8 420D0046 */  mul.s      $f21, $f1, $f0
/* C2DFC 001C2CFC 0C00C0C4 */  lwc1       $f0, 0xC($6)
/* C2E00 001C2D00 02080046 */  mul.s      $f0, $f1, $f0
/* C2E04 001C2D04 4002A0E7 */  swc1       $f0, 0x240($sp)
/* C2E08 001C2D08 1000C0C4 */  lwc1       $f0, 0x10($6)
/* C2E0C 001C2D0C 02080046 */  mul.s      $f0, $f1, $f0
/* C2E10 001C2D10 3C02A327 */  addiu      $3, $sp, 0x23C
/* C2E14 001C2D14 000060E4 */  swc1       $f0, 0x0($3)
/* C2E18 001C2D18 1800C0C4 */  lwc1       $f0, 0x18($6)
/* C2E1C 001C2D1C 02080046 */  mul.s      $f0, $f1, $f0
/* C2E20 001C2D20 4C02A627 */  addiu      $6, $sp, 0x24C
/* C2E24 001C2D24 0000C0E4 */  swc1       $f0, 0x0($6)
/* C2E28 001C2D28 000060C4 */  lwc1       $f0, 0x0($3)
/* C2E2C 001C2D2C 3402A0E7 */  swc1       $f0, 0x234($sp)
/* C2E30 001C2D30 4002A0C7 */  lwc1       $f0, 0x240($sp)
/* C2E34 001C2D34 4402A0E7 */  swc1       $f0, 0x244($sp)
/* C2E38 001C2D38 3002A0C7 */  lwc1       $f0, 0x230($sp)
/* C2E3C 001C2D3C 3802A0E7 */  swc1       $f0, 0x238($sp)
/* C2E40 001C2D40 0000C0C4 */  lwc1       $f0, 0x0($6)
/* C2E44 001C2D44 4802A0E7 */  swc1       $f0, 0x248($sp)
/* C2E48 001C2D48 28960070 */  paddub     $18, $0, $0
/* C2E4C 001C2D4C 3E000010 */  b          .L001C2E48
/* C2E50 001C2D50 00000000 */   nop
.L001C2D54:
/* C2E54 001C2D54 80A01200 */  sll        $20, $18, 2
/* C2E58 001C2D58 06A30046 */  mov.s      $f12, $f20
/* C2E5C 001C2D5C 2876040C */  jal        sinf
/* C2E60 001C2D60 00000000 */   nop
/* C2E64 001C2D64 21109D02 */  addu       $2, $20, $sp
/* C2E68 001C2D68 40025AC4 */  lwc1       $f26, 0x240($2)
/* C2E6C 001C2D6C 47D00046 */  neg.s      $f1, $f26
/* C2E70 001C2D70 420E0046 */  mul.s      $f25, $f1, $f0
/* C2E74 001C2D74 06A30046 */  mov.s      $f12, $f20
/* C2E78 001C2D78 AC75040C */  jal        cosf
/* C2E7C 001C2D7C 00000000 */   nop
/* C2E80 001C2D80 21109D02 */  addu       $2, $20, $sp
/* C2E84 001C2D84 30025BC4 */  lwc1       $f27, 0x230($2)
/* C2E88 001C2D88 02D80046 */  mul.s      $f0, $f27, $f0
/* C2E8C 001C2D8C 01C80046 */  sub.s      $f0, $f25, $f0
/* C2E90 001C2D90 00111200 */  sll        $2, $18, 4
/* C2E94 001C2D94 1001A2AF */  sw         $2, 0x110($sp)
/* C2E98 001C2D98 1001A28F */  lw         $2, 0x110($sp)
/* C2E9C 001C2D9C 21105D00 */  addu       $2, $2, $sp
/* C2EA0 001C2DA0 B0015424 */  addiu      $20, $2, 0x1B0
/* C2EA4 001C2DA4 000080E6 */  swc1       $f0, 0x0($20)
/* C2EA8 001C2DA8 06A30046 */  mov.s      $f12, $f20
/* C2EAC 001C2DAC 2876040C */  jal        sinf
/* C2EB0 001C2DB0 00000000 */   nop
/* C2EB4 001C2DB4 47D80046 */  neg.s      $f1, $f27
/* C2EB8 001C2DB8 420E0046 */  mul.s      $f25, $f1, $f0
/* C2EBC 001C2DBC 06A30046 */  mov.s      $f12, $f20
/* C2EC0 001C2DC0 AC75040C */  jal        cosf
/* C2EC4 001C2DC4 00000000 */   nop
/* C2EC8 001C2DC8 02D00046 */  mul.s      $f0, $f26, $f0
/* C2ECC 001C2DCC 00C80046 */  add.s      $f0, $f25, $f0
/* C2ED0 001C2DD0 1001A28F */  lw         $2, 0x110($sp)
/* C2ED4 001C2DD4 21185D00 */  addu       $3, $2, $sp
/* C2ED8 001C2DD8 B8016424 */  addiu      $4, $3, 0x1B8
/* C2EDC 001C2DDC 000080E4 */  swc1       $f0, 0x0($4)
/* C2EE0 001C2DE0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* C2EE4 001C2DE4 00088244 */  mtc1       $2, $f1
/* C2EE8 001C2DE8 000080C6 */  lwc1       $f0, 0x0($20)
/* C2EEC 001C2DEC 02000146 */  mul.s      $f0, $f0, $f1
/* C2EF0 001C2DF0 000080E6 */  swc1       $f0, 0x0($20)
/* C2EF4 001C2DF4 00001746 */  add.s      $f0, $f0, $f23
/* C2EF8 001C2DF8 000080E6 */  swc1       $f0, 0x0($20)
/* C2EFC 001C2DFC 0040023C */  lui        $2, (0x40000000 >> 16)
/* C2F00 001C2E00 00008244 */  mtc1       $2, $f0
/* C2F04 001C2E04 00000000 */  nop
/* C2F08 001C2E08 00001546 */  add.s      $f0, $f0, $f21
/* C2F0C 001C2E0C B40160E4 */  swc1       $f0, 0x1B4($3)
/* C2F10 001C2E10 000080C4 */  lwc1       $f0, 0x0($4)
/* C2F14 001C2E14 00001846 */  add.s      $f0, $f0, $f24
/* C2F18 001C2E18 000080E4 */  swc1       $f0, 0x0($4)
/* C2F1C 001C2E1C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C2F20 001C2E20 BC0162AC */  sw         $2, 0x1BC($3)
/* C2F24 001C2E24 F0016424 */  addiu      $4, $3, 0x1F0
/* C2F28 001C2E28 282E8072 */  paddub     $5, $20, $0
/* C2F2C 001C2E2C 28360070 */  paddub     $6, $0, $0
/* C2F30 001C2E30 A4B8040C */  jal        MGRotTransPers__FPiPfi
/* C2F34 001C2E34 00000000 */   nop
/* C2F38 001C2E38 02004014 */  bnez       $2, .L001C2E44
/* C2F3C 001C2E3C 00000000 */   nop
/* C2F40 001C2E40 F000A0AF */  sw         $0, 0xF0($sp)
.L001C2E44:
/* C2F44 001C2E44 01005226 */  addiu      $18, $18, 0x1
.L001C2E48:
/* C2F48 001C2E48 0400432A */  slti       $3, $18, 0x4
/* C2F4C 001C2E4C C1FF6014 */  bnez       $3, .L001C2D54
/* C2F50 001C2E50 00000000 */   nop
/* C2F54 001C2E54 F000A38F */  lw         $3, 0xF0($sp)
/* C2F58 001C2E58 0D006010 */  beqz       $3, .L001C2E90
/* C2F5C 001C2E5C 00000000 */   nop
/* C2F60 001C2E60 40000224 */  addiu      $2, $0, 0x40
/* C2F64 001C2E64 0000A2FF */  sd         $2, 0x0($sp)
/* C2F68 001C2E68 D48B848F */  lw         $4, -0x742C($gp)
/* C2F6C 001C2E6C F001A527 */  addiu      $5, $sp, 0x1F0
/* C2F70 001C2E70 0002A627 */  addiu      $6, $sp, 0x200
/* C2F74 001C2E74 1002A727 */  addiu      $7, $sp, 0x210
/* C2F78 001C2E78 2002A827 */  addiu      $8, $sp, 0x220
/* C2F7C 001C2E7C 80000924 */  addiu      $9, $0, 0x80
/* C2F80 001C2E80 28560070 */  paddub     $10, $0, $0
/* C2F84 001C2E84 285E0070 */  paddub     $11, $0, $0
/* C2F88 001C2E88 B477050C */  jal        setColSprite__FP13sceVif1PacketPiPiPiPiUcUcUcUc
/* C2F8C 001C2E8C 00000000 */   nop
.L001C2E90:
/* C2F90 001C2E90 01003126 */  addiu      $17, $17, 0x1
.L001C2E94:
/* C2F94 001C2E94 D000A38F */  lw         $3, 0xD0($sp)
/* C2F98 001C2E98 2118E302 */  addu       $3, $23, $3
/* C2F9C 001C2E9C 01006380 */  lb         $3, 0x1($3)
/* C2FA0 001C2EA0 2A182302 */  slt        $3, $17, $3
/* C2FA4 001C2EA4 66FF6014 */  bnez       $3, .L001C2C40
/* C2FA8 001C2EA8 00000000 */   nop
.L001C2EAC:
/* C2FAC 001C2EAC 0100DE27 */  addiu      $fp, $fp, 0x1
.L001C2EB0:
/* C2FB0 001C2EB0 80181E00 */  sll        $3, $fp, 2
/* C2FB4 001C2EB4 21307E00 */  addu       $6, $3, $fp
/* C2FB8 001C2EB8 80180600 */  sll        $3, $6, 2
/* C2FBC 001C2EBC 2118C300 */  addu       $3, $6, $3
/* C2FC0 001C2EC0 80B80300 */  sll        $23, $3, 2
/* C2FC4 001C2EC4 D000A38F */  lw         $3, 0xD0($sp)
/* C2FC8 001C2EC8 21187700 */  addu       $3, $3, $23
/* C2FCC 001C2ECC 00006680 */  lb         $6, 0x0($3)
/* C2FD0 001C2ED0 FFFF0324 */  addiu      $3, $0, -0x1
/* C2FD4 001C2ED4 54FFC314 */  bne        $6, $3, .L001C2C28
/* C2FD8 001C2ED8 00000000 */   nop
.L001C2EDC:
/* C2FDC 001C2EDC 0100D626 */  addiu      $22, $22, 0x1
.L001C2EE0:
/* C2FE0 001C2EE0 1400C32A */  slti       $3, $22, 0x14
/* C2FE4 001C2EE4 42FE6014 */  bnez       $3, .L001C27F0
/* C2FE8 001C2EE8 00000000 */   nop
/* C2FEC 001C2EEC 01001026 */  addiu      $16, $16, 0x1
.L001C2EF0:
/* C2FF0 001C2EF0 1400032A */  slti       $3, $16, 0x14
/* C2FF4 001C2EF4 3BFE6014 */  bnez       $3, .L001C27E4
/* C2FF8 001C2EF8 00000000 */   nop
/* C2FFC 001C2EFC 10270324 */  addiu      $3, $0, 0x2710
/* C3000 001C2F00 00008344 */  mtc1       $3, $f0
/* C3004 001C2F04 00000000 */  nop
/* C3008 001C2F08 20008046 */  cvt.s.w    $f0, $f0
/* C300C 001C2F0C 34B00046 */  c.lt.s     $f22, $f0
/* C3010 001C2F10 00000000 */  nop
/* C3014 001C2F14 14000045 */  bc1f       .L001C2F68
/* C3018 001C2F18 00000000 */   nop
/* C301C 001C2F1C 2041023C */  lui        $2, (0x41200000 >> 16)
/* C3020 001C2F20 00608244 */  mtc1       $2, $f12
/* C3024 001C2F24 FA43023C */  lui        $2, (0x43FA0000 >> 16)
/* C3028 001C2F28 00688244 */  mtc1       $2, $f13
/* C302C 001C2F2C 5802A427 */  addiu      $4, $sp, 0x258
/* C3030 001C2F30 5C02A527 */  addiu      $5, $sp, 0x25C
/* C3034 001C2F34 7001A627 */  addiu      $6, $sp, 0x170
/* C3038 001C2F38 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* C303C 001C2F3C 00000000 */   nop
/* C3040 001C2F40 E000A48F */  lw         $4, 0xE0($sp)
/* C3044 001C2F44 5802ACC7 */  lwc1       $f12, 0x258($sp)
/* C3048 001C2F48 282E0070 */  paddub     $5, $0, $0
/* C304C 001C2F4C AC6A050C */  jal        SndSetSeVolf__Fifi
/* C3050 001C2F50 00000000 */   nop
/* C3054 001C2F54 E000A48F */  lw         $4, 0xE0($sp)
/* C3058 001C2F58 5C02ACC7 */  lwc1       $f12, 0x25C($sp)
/* C305C 001C2F5C 282E0070 */  paddub     $5, $0, $0
/* C3060 001C2F60 C46A050C */  jal        SndSetSePanf__Fifi
/* C3064 001C2F64 00000000 */   nop
.L001C2F68:
/* C3068 001C2F68 C000BF7B */  lq         $31, 0xC0($sp)
/* C306C 001C2F6C B000BE7B */  lq         $fp, 0xB0($sp)
/* C3070 001C2F70 A000B77B */  lq         $23, 0xA0($sp)
/* C3074 001C2F74 9000B67B */  lq         $22, 0x90($sp)
/* C3078 001C2F78 8000B57B */  lq         $21, 0x80($sp)
/* C307C 001C2F7C 7000B47B */  lq         $20, 0x70($sp)
/* C3080 001C2F80 6000B37B */  lq         $19, 0x60($sp)
/* C3084 001C2F84 5000B27B */  lq         $18, 0x50($sp)
/* C3088 001C2F88 4000B17B */  lq         $17, 0x40($sp)
/* C308C 001C2F8C 3000B07B */  lq         $16, 0x30($sp)
/* C3090 001C2F90 2C00BBC7 */  lwc1       $f27, 0x2C($sp)
/* C3094 001C2F94 2800BAC7 */  lwc1       $f26, 0x28($sp)
/* C3098 001C2F98 2400B9C7 */  lwc1       $f25, 0x24($sp)
/* C309C 001C2F9C 2000B8C7 */  lwc1       $f24, 0x20($sp)
/* C30A0 001C2FA0 1C00B7C7 */  lwc1       $f23, 0x1C($sp)
/* C30A4 001C2FA4 1800B6C7 */  lwc1       $f22, 0x18($sp)
/* C30A8 001C2FA8 1400B5C7 */  lwc1       $f21, 0x14($sp)
/* C30AC 001C2FAC 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* C30B0 001C2FB0 6002BD27 */  addiu      $sp, $sp, 0x260
/* C30B4 001C2FB4 0800E003 */  jr         $31
/* C30B8 001C2FB8 00000000 */   nop
/* C30BC 001C2FBC 00000000 */  nop
