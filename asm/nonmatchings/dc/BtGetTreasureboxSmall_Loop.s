.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetTreasureboxSmall_Loop__Fv
/* D2560 001D2460 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* D2564 001D2464 2000BF7F */  sq         $31, 0x20($sp)
/* D2568 001D2468 1000B17F */  sq         $17, 0x10($sp)
/* D256C 001D246C 0000B07F */  sq         $16, 0x0($sp)
/* D2570 001D2470 28860070 */  paddub     $16, $0, $0
/* D2574 001D2474 2894838F */  lw         $3, -0x6BD8($gp)
/* D2578 001D2478 0A000224 */  addiu      $2, $0, 0xA
/* D257C 001D247C 6E016210 */  beq        $3, $2, .L001D2A38
/* D2580 001D2480 00000000 */   nop
/* D2584 001D2484 03000224 */  addiu      $2, $0, 0x3
/* D2588 001D2488 08016210 */  beq        $3, $2, .L001D28AC
/* D258C 001D248C 00000000 */   nop
/* D2590 001D2490 02000224 */  addiu      $2, $0, 0x2
/* D2594 001D2494 A9006210 */  beq        $3, $2, .L001D273C
/* D2598 001D2498 00000000 */   nop
/* D259C 001D249C 01000224 */  addiu      $2, $0, 0x1
/* D25A0 001D24A0 2C006210 */  beq        $3, $2, .L001D2554
/* D25A4 001D24A4 00000000 */   nop
/* D25A8 001D24A8 03006010 */  beqz       $3, .L001D24B8
/* D25AC 001D24AC 00000000 */   nop
/* D25B0 001D24B0 88010010 */  b          .L001D2AD4
/* D25B4 001D24B4 00000000 */   nop
.L001D24B8:
/* D25B8 001D24B8 8CFB040C */  jal        ReadBGSync__Fv
/* D25BC 001D24BC 00000000 */   nop
/* D25C0 001D24C0 20004014 */  bnez       $2, .L001D2544
/* D25C4 001D24C4 00000000 */   nop
/* D25C8 001D24C8 006E050C */  jal        SndSPSeSyncBG__Fv
/* D25CC 001D24CC 00000000 */   nop
/* D25D0 001D24D0 509D858F */  lw         $5, -0x62B0($gp)
/* D25D4 001D24D4 1C000424 */  addiu      $4, $0, 0x1C
/* D25D8 001D24D8 FCAF760C */  jal        func_1DABFF0
/* D25DC 001D24DC 00000000 */   nop
/* D25E0 001D24E0 4C9D848F */  lw         $4, -0x62B4($gp)
/* D25E4 001D24E4 F001023C */  lui        $2, %hi(D_1F06850)
/* D25E8 001D24E8 50684524 */  addiu      $5, $2, %lo(D_1F06850)
/* D25EC 001D24EC 28360070 */  paddub     $6, $0, $0
/* D25F0 001D24F0 283E0070 */  paddub     $7, $0, $0
/* D25F4 001D24F4 28460070 */  paddub     $8, $0, $0
/* D25F8 001D24F8 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* D25FC 001D24FC 00000000 */   nop
/* D2600 001D2500 589D82AF */  sw         $2, -0x62A8($gp)
/* D2604 001D2504 549D858F */  lw         $5, -0x62AC($gp)
/* D2608 001D2508 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D260C 001D250C 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D2610 001D2510 2A00023C */  lui        $2, %hi(_747)
/* D2614 001D2514 70C64624 */  addiu      $6, $2, %lo(_747)
/* D2618 001D2518 F001023C */  lui        $2, %hi(D_1F06850)
/* D261C 001D251C 50684724 */  addiu      $7, $2, %lo(D_1F06850)
/* D2620 001D2520 F001023C */  lui        $2, %hi(D_1F06850)
/* D2624 001D2524 50684824 */  addiu      $8, $2, %lo(D_1F06850)
/* D2628 001D2528 FCE5040C */  jal        LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* D262C 001D252C 00000000 */   nop
/* D2630 001D2530 DC01013C */  lui        $at, (0x1DC44D4 >> 16)
/* D2634 001D2534 D44420AC */  sw         $0, (0x1DC44D4 & 0xFFFF)($at)
/* D2638 001D2538 2894828F */  lw         $2, -0x6BD8($gp)
/* D263C 001D253C 01004224 */  addiu      $2, $2, 0x1
/* D2640 001D2540 289482AF */  sw         $2, -0x6BD8($gp)
.L001D2544:
/* D2644 001D2544 5CFA760C */  jal        func_1DBE970
/* D2648 001D2548 00000000 */   nop
/* D264C 001D254C 61010010 */  b          .L001D2AD4
/* D2650 001D2550 00000000 */   nop
.L001D2554:
/* D2654 001D2554 28260070 */  paddub     $4, $0, $0
/* D2658 001D2558 B004770C */  jal        func_1DC12C0
/* D265C 001D255C 00000000 */   nop
/* D2660 001D2560 FFFF0224 */  addiu      $2, $0, -0x1
/* D2664 001D2564 B49D82AF */  sw         $2, -0x624C($gp)
/* D2668 001D2568 01000224 */  addiu      $2, $0, 0x1
/* D266C 001D256C EC9C82AF */  sw         $2, -0x6314($gp)
/* D2670 001D2570 F09C82AF */  sw         $2, -0x6310($gp)
/* D2674 001D2574 E49C82AF */  sw         $2, -0x631C($gp)
/* D2678 001D2578 E89C82AF */  sw         $2, -0x6318($gp)
/* D267C 001D257C C89C848F */  lw         $4, -0x6338($gp)
/* D2680 001D2580 BC9D838F */  lw         $3, -0x6244($gp)
/* D2684 001D2584 80100300 */  sll        $2, $3, 2
/* D2688 001D2588 21104300 */  addu       $2, $2, $3
/* D268C 001D258C 00110200 */  sll        $2, $2, 4
/* D2690 001D2590 21104400 */  addu       $2, $2, $4
/* D2694 001D2594 0100013C */  lui        $at, (0x10000 >> 16)
/* D2698 001D2598 21084100 */  addu       $at, $2, $at
/* D269C 001D259C 788D228C */  lw         $2, -0x7288($at)
/* D26A0 001D25A0 80890200 */  sll        $17, $2, 6
/* D26A4 001D25A4 21109100 */  addu       $2, $4, $17
/* D26A8 001D25A8 3000A427 */  addiu      $4, $sp, 0x30
/* D26AC 001D25AC 78364524 */  addiu      $5, $2, 0x3678
/* D26B0 001D25B0 F87FA524 */  addiu      $5, $5, 0x7FF8
/* D26B4 001D25B4 0C86040C */  jal        sceVu0CopyVector
/* D26B8 001D25B8 00000000 */   nop
/* D26BC 001D25BC F0C1033C */  lui        $3, (0xC1F00000 >> 16)
/* D26C0 001D25C0 C89C828F */  lw         $2, -0x6338($gp)
/* D26C4 001D25C4 21102202 */  addu       $2, $17, $2
/* D26C8 001D25C8 0100013C */  lui        $at, (0x10000 >> 16)
/* D26CC 001D25CC 21084100 */  addu       $at, $2, $at
/* D26D0 001D25D0 8CB623AC */  sw         $3, -0x4974($at)
/* D26D4 001D25D4 C89C828F */  lw         $2, -0x6338($gp)
/* D26D8 001D25D8 21102202 */  addu       $2, $17, $2
/* D26DC 001D25DC 0100013C */  lui        $at, (0x10000 >> 16)
/* D26E0 001D25E0 21084100 */  addu       $at, $2, $at
/* D26E4 001D25E4 84B620AC */  sw         $0, -0x497C($at)
/* D26E8 001D25E8 EB01013C */  lui        $at, (0x1EB5E50 >> 16)
/* D26EC 001D25EC 505E248C */  lw         $4, (0x1EB5E50 & 0xFFFF)($at)
/* D26F0 001D25F0 3000A527 */  addiu      $5, $sp, 0x30
/* D26F4 001D25F4 B89F040C */  jal        SetPosition__6CFrameFPf
/* D26F8 001D25F8 00000000 */   nop
/* D26FC 001D25FC EB01013C */  lui        $at, (0x1EB5EF0 >> 16)
/* D2700 001D2600 F05E248C */  lw         $4, (0x1EB5EF0 & 0xFFFF)($at)
/* D2704 001D2604 3000A527 */  addiu      $5, $sp, 0x30
/* D2708 001D2608 B89F040C */  jal        SetPosition__6CFrameFPf
/* D270C 001D260C 00000000 */   nop
/* D2710 001D2610 00688044 */  mtc1       $0, $f13
/* D2714 001D2614 00000000 */  nop
/* D2718 001D2618 066B0046 */  mov.s      $f12, $f13
/* D271C 001D261C 866B0046 */  mov.s      $f14, $f13
/* D2720 001D2620 EB01013C */  lui        $at, (0x1EB5EF0 >> 16)
/* D2724 001D2624 F05E248C */  lw         $4, (0x1EB5EF0 & 0xFFFF)($at)
/* D2728 001D2628 70A3040C */  jal        SetRotation__6CFrameFfff
/* D272C 001D262C 00000000 */   nop
/* D2730 001D2630 3400B127 */  addiu      $17, $sp, 0x34
/* D2734 001D2634 000021C6 */  lwc1       $f1, 0x0($17)
/* D2738 001D2638 5041023C */  lui        $2, (0x41500000 >> 16)
/* D273C 001D263C 00008244 */  mtc1       $2, $f0
/* D2740 001D2640 00000000 */  nop
/* D2744 001D2644 00080046 */  add.s      $f0, $f1, $f0
/* D2748 001D2648 000020E6 */  swc1       $f0, 0x0($17)
/* D274C 001D264C 589D848F */  lw         $4, -0x62A8($gp)
/* D2750 001D2650 3000A527 */  addiu      $5, $sp, 0x30
/* D2754 001D2654 B89F040C */  jal        SetPosition__6CFrameFPf
/* D2758 001D2658 00000000 */   nop
/* D275C 001D265C 000021C6 */  lwc1       $f1, 0x0($17)
/* D2760 001D2660 5041023C */  lui        $2, (0x41500000 >> 16)
/* D2764 001D2664 00008244 */  mtc1       $2, $f0
/* D2768 001D2668 00000000 */  nop
/* D276C 001D266C 01080046 */  sub.s      $f0, $f1, $f0
/* D2770 001D2670 000020E6 */  swc1       $f0, 0x0($17)
/* D2774 001D2674 589D848F */  lw         $4, -0x62A8($gp)
/* D2778 001D2678 14848CC7 */  lwc1       $f12, -0x7BEC($gp)
/* D277C 001D267C 46630046 */  mov.s      $f13, $f12
/* D2780 001D2680 86630046 */  mov.s      $f14, $f12
/* D2784 001D2684 D49F040C */  jal        SetScale__6CFrameFfff
/* D2788 001D2688 00000000 */   nop
/* D278C 001D268C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* D2790 001D2690 449D80E7 */  swc1       $f0, -0x62BC($gp)
/* D2794 001D2694 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D2798 001D2698 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D279C 001D269C 3000A527 */  addiu      $5, $sp, 0x30
/* D27A0 001D26A0 38E4040C */  jal        SetPosition__10CCharacterFPf
/* D27A4 001D26A4 00000000 */   nop
/* D27A8 001D26A8 00608044 */  mtc1       $0, $f12
/* D27AC 001D26AC 00000000 */  nop
/* D27B0 001D26B0 46630046 */  mov.s      $f13, $f12
/* D27B4 001D26B4 86630046 */  mov.s      $f14, $f12
/* D27B8 001D26B8 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D27BC 001D26BC 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D27C0 001D26C0 54E4040C */  jal        SetRotation__10CCharacterFfff
/* D27C4 001D26C4 00000000 */   nop
/* D27C8 001D26C8 2A000224 */  addiu      $2, $0, 0x2A
/* D27CC 001D26CC DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D27D0 001D26D0 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D27D4 001D26D4 2041023C */  lui        $2, (0x41200000 >> 16)
/* D27D8 001D26D8 EB01013C */  lui        $at, (0x1EB5E70 >> 16)
/* D27DC 001D26DC 705E22AC */  sw         $2, (0x1EB5E70 & 0xFFFF)($at)
/* D27E0 001D26E0 EB01013C */  lui        $at, (0x1EB5F10 >> 16)
/* D27E4 001D26E4 105F22AC */  sw         $2, (0x1EB5F10 & 0xFFFF)($at)
/* D27E8 001D26E8 01000224 */  addiu      $2, $0, 0x1
/* D27EC 001D26EC 489D82AF */  sw         $2, -0x62B8($gp)
/* D27F0 001D26F0 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D27F4 001D26F4 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* D27F8 001D26F8 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* D27FC 001D26FC E0454524 */  addiu      $5, $2, %lo(D_1DC45E0)
/* D2800 001D2700 A892040C */  jal        __as__13CCameraFollowFRC13CCameraFollow
/* D2804 001D2704 00000000 */   nop
/* D2808 001D2708 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D280C 001D270C E0484224 */  addiu      $2, $2, %lo(D_1DC48E0)
/* D2810 001D2710 A89C82AF */  sw         $2, -0x6358($gp)
/* D2814 001D2714 A89C848F */  lw         $4, -0x6358($gp)
/* D2818 001D2718 C492040C */  jal        FollowOff__13CCameraFollowFv
/* D281C 001D271C 00000000 */   nop
/* D2820 001D2720 5CFA760C */  jal        func_1DBE970
/* D2824 001D2724 00000000 */   nop
/* D2828 001D2728 2894828F */  lw         $2, -0x6BD8($gp)
/* D282C 001D272C 01004224 */  addiu      $2, $2, 0x1
/* D2830 001D2730 289482AF */  sw         $2, -0x6BD8($gp)
/* D2834 001D2734 E7000010 */  b          .L001D2AD4
/* D2838 001D2738 00000000 */   nop
.L001D273C:
/* D283C 001D273C EB01013C */  lui        $at, (0x1EB5EF0 >> 16)
/* D2840 001D2740 F05E248C */  lw         $4, (0x1EB5EF0 & 0xFFFF)($at)
/* D2844 001D2744 A89C858F */  lw         $5, -0x6358($gp)
/* D2848 001D2748 2A00023C */  lui        $2, %hi(_754)
/* D284C 001D274C 80C64624 */  addiu      $6, $2, %lo(_754)
/* D2850 001D2750 2A00023C */  lui        $2, %hi(_755)
/* D2854 001D2754 88C64724 */  addiu      $7, $2, %lo(_755)
/* D2858 001D2758 A0DB060C */  jal        setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* D285C 001D275C 00000000 */   nop
/* D2860 001D2760 EB01013C */  lui        $at, (0x1EB5F10 >> 16)
/* D2864 001D2764 105F21C4 */  lwc1       $f1, (0x1EB5F10 & 0xFFFF)($at)
/* D2868 001D2768 9841023C */  lui        $2, (0x41980000 >> 16)
/* D286C 001D276C 00008244 */  mtc1       $2, $f0
/* D2870 001D2770 00000000 */  nop
/* D2874 001D2774 36080046 */  c.le.s     $f1, $f0
/* D2878 001D2778 00000000 */  nop
/* D287C 001D277C 0F000145 */  bc1t       .L001D27BC
/* D2880 001D2780 00000000 */   nop
/* D2884 001D2784 6C8580C7 */  lwc1       $f0, -0x7A94($gp)
/* D2888 001D2788 34080046 */  c.lt.s     $f1, $f0
/* D288C 001D278C 00000000 */  nop
/* D2890 001D2790 0A000045 */  bc1f       .L001D27BC
/* D2894 001D2794 00000000 */   nop
/* D2898 001D2798 CF000424 */  addiu      $4, $0, 0xCF
/* D289C 001D279C FFFF0524 */  addiu      $5, $0, -0x1
/* D28A0 001D27A0 28360070 */  paddub     $6, $0, $0
/* D28A4 001D27A4 AC69050C */  jal        SndSePlay__Fiii
/* D28A8 001D27A8 00000000 */   nop
/* D28AC 001D27AC 02000424 */  addiu      $4, $0, 0x2
/* D28B0 001D27B0 FFFF0524 */  addiu      $5, $0, -0x1
/* D28B4 001D27B4 206E050C */  jal        SndSPSePlay__Fii
/* D28B8 001D27B8 00000000 */   nop
.L001D27BC:
/* D28BC 001D27BC EB01013C */  lui        $at, (0x1EB5F10 >> 16)
/* D28C0 001D27C0 105F22C4 */  lwc1       $f2, (0x1EB5F10 & 0xFFFF)($at)
/* D28C4 001D27C4 4842023C */  lui        $2, (0x42480000 >> 16)
/* D28C8 001D27C8 00088244 */  mtc1       $2, $f1
/* D28CC 001D27CC 00000000 */  nop
/* D28D0 001D27D0 36100146 */  c.le.s     $f2, $f1
/* D28D4 001D27D4 00000000 */  nop
/* D28D8 001D27D8 11000145 */  bc1t       .L001D2820
/* D28DC 001D27DC 00000000 */   nop
/* D28E0 001D27E0 5C42023C */  lui        $2, (0x425C0000 >> 16)
/* D28E4 001D27E4 00008244 */  mtc1       $2, $f0
/* D28E8 001D27E8 00000000 */  nop
/* D28EC 001D27EC 36100046 */  c.le.s     $f2, $f0
/* D28F0 001D27F0 00000000 */  nop
/* D28F4 001D27F4 0A000045 */  bc1f       .L001D2820
/* D28F8 001D27F8 00000000 */   nop
/* D28FC 001D27FC 41100146 */  sub.s      $f1, $f2, $f1
/* D2900 001D2800 1C8580C7 */  lwc1       $f0, -0x7AE4($gp)
/* D2904 001D2804 02030146 */  mul.s      $f12, $f0, $f1
/* D2908 001D2808 449D8CE7 */  swc1       $f12, -0x62BC($gp)
/* D290C 001D280C 589D848F */  lw         $4, -0x62A8($gp)
/* D2910 001D2810 46630046 */  mov.s      $f13, $f12
/* D2914 001D2814 86630046 */  mov.s      $f14, $f12
/* D2918 001D2818 D49F040C */  jal        SetScale__6CFrameFfff
/* D291C 001D281C 00000000 */   nop
.L001D2820:
/* D2920 001D2820 EB01013C */  lui        $at, (0x1EB5F10 >> 16)
/* D2924 001D2824 105F21C4 */  lwc1       $f1, (0x1EB5F10 & 0xFFFF)($at)
/* D2928 001D2828 9E42023C */  lui        $2, (0x429E0000 >> 16)
/* D292C 001D282C 00008244 */  mtc1       $2, $f0
/* D2930 001D2830 00000000 */  nop
/* D2934 001D2834 34080046 */  c.lt.s     $f1, $f0
/* D2938 001D2838 00000000 */  nop
/* D293C 001D283C A5000145 */  bc1t       .L001D2AD4
/* D2940 001D2840 00000000 */   nop
/* D2944 001D2844 2B000224 */  addiu      $2, $0, 0x2B
/* D2948 001D2848 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D294C 001D284C 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D2950 001D2850 02000224 */  addiu      $2, $0, 0x2
/* D2954 001D2854 489D82AF */  sw         $2, -0x62B8($gp)
/* D2958 001D2858 4094858F */  lw         $5, -0x6BC0($gp)
/* D295C 001D285C 0800A010 */  beqz       $5, .L001D2880
/* D2960 001D2860 00000000 */   nop
/* D2964 001D2864 3C94848F */  lw         $4, -0x6BC4($gp)
/* D2968 001D2868 28000624 */  addiu      $6, $0, 0x28
/* D296C 001D286C 01000724 */  addiu      $7, $0, 0x1
/* D2970 001D2870 A480050C */  jal        ItemGetMes__Fiiii
/* D2974 001D2874 00000000 */   nop
/* D2978 001D2878 07000010 */  b          .L001D2898
/* D297C 001D287C 00000000 */   nop
.L001D2880:
/* D2980 001D2880 3C94848F */  lw         $4, -0x6BC4($gp)
/* D2984 001D2884 FFFF0524 */  addiu      $5, $0, -0x1
/* D2988 001D2888 28000624 */  addiu      $6, $0, 0x28
/* D298C 001D288C 01000724 */  addiu      $7, $0, 0x1
/* D2990 001D2890 A480050C */  jal        ItemGetMes__Fiiii
/* D2994 001D2894 00000000 */   nop
.L001D2898:
/* D2998 001D2898 2894828F */  lw         $2, -0x6BD8($gp)
/* D299C 001D289C 01004224 */  addiu      $2, $2, 0x1
/* D29A0 001D28A0 289482AF */  sw         $2, -0x6BD8($gp)
/* D29A4 001D28A4 8B000010 */  b          .L001D2AD4
/* D29A8 001D28A8 00000000 */   nop
.L001D28AC:
/* D29AC 001D28AC EB01013C */  lui        $at, (0x1EB5EF0 >> 16)
/* D29B0 001D28B0 F05E248C */  lw         $4, (0x1EB5EF0 & 0xFFFF)($at)
/* D29B4 001D28B4 A89C858F */  lw         $5, -0x6358($gp)
/* D29B8 001D28B8 2A00023C */  lui        $2, %hi(_754)
/* D29BC 001D28BC 80C64624 */  addiu      $6, $2, %lo(_754)
/* D29C0 001D28C0 2A00023C */  lui        $2, %hi(_755)
/* D29C4 001D28C4 88C64724 */  addiu      $7, $2, %lo(_755)
/* D29C8 001D28C8 A0DB060C */  jal        setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* D29CC 001D28CC 00000000 */   nop
/* D29D0 001D28D0 CC01023C */  lui        $2, %hi(GamePad)
/* D29D4 001D28D4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D29D8 001D28D8 60000524 */  addiu      $5, $0, 0x60
/* D29DC 001D28DC 1CAE040C */  jal        Down__8CGamePadFi
/* D29E0 001D28E0 00000000 */   nop
/* D29E4 001D28E4 7B004010 */  beqz       $2, .L001D2AD4
/* D29E8 001D28E8 00000000 */   nop
/* D29EC 001D28EC 01000224 */  addiu      $2, $0, 0x1
/* D29F0 001D28F0 DC01013C */  lui        $at, (0x1DC44D4 >> 16)
/* D29F4 001D28F4 D44422AC */  sw         $2, (0x1DC44D4 & 0xFFFF)($at)
/* D29F8 001D28F8 C701023C */  lui        $2, %hi(TexManager)
/* D29FC 001D28FC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D2A00 001D2900 1C000524 */  addiu      $5, $0, 0x1C
/* D2A04 001D2904 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* D2A08 001D2908 00000000 */   nop
/* D2A0C 001D290C C701023C */  lui        $2, %hi(TexManager)
/* D2A10 001D2910 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D2A14 001D2914 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* D2A18 001D2918 00000000 */   nop
/* D2A1C 001D291C 3C94858F */  lw         $5, -0x6BC4($gp)
/* D2A20 001D2920 17FFA224 */  addiu      $2, $5, -0xE9
/* D2A24 001D2924 0200412C */  sltiu      $at, $2, 0x2
/* D2A28 001D2928 0D002010 */  beqz       $at, .L001D2960
/* D2A2C 001D292C 00000000 */   nop
/* D2A30 001D2930 E9000224 */  addiu      $2, $0, 0xE9
/* D2A34 001D2934 0300A214 */  bne        $5, $2, .L001D2944
/* D2A38 001D2938 00000000 */   nop
/* D2A3C 001D293C 01000224 */  addiu      $2, $0, 0x1
/* D2A40 001D2940 AC9D82AF */  sw         $2, -0x6254($gp)
.L001D2944:
/* D2A44 001D2944 EA000224 */  addiu      $2, $0, 0xEA
/* D2A48 001D2948 0900A214 */  bne        $5, $2, .L001D2970
/* D2A4C 001D294C 00000000 */   nop
/* D2A50 001D2950 01000224 */  addiu      $2, $0, 0x1
/* D2A54 001D2954 B09D82AF */  sw         $2, -0x6250($gp)
/* D2A58 001D2958 05000010 */  b          .L001D2970
/* D2A5C 001D295C 00000000 */   nop
.L001D2960:
/* D2A60 001D2960 789C848F */  lw         $4, -0x6388($gp)
/* D2A64 001D2964 4094868F */  lw         $6, -0x6BC0($gp)
/* D2A68 001D2968 18F8060C */  jal        GetItem__14CDngStatusDataFii
/* D2A6C 001D296C 00000000 */   nop
.L001D2970:
/* D2A70 001D2970 4000A427 */  addiu      $4, $sp, 0x40
/* D2A74 001D2974 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D2A78 001D2978 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D2A7C 001D297C 0C86040C */  jal        sceVu0CopyVector
/* D2A80 001D2980 00000000 */   nop
/* D2A84 001D2984 4800A1C7 */  lwc1       $f1, 0x48($sp)
/* D2A88 001D2988 2041023C */  lui        $2, (0x41200000 >> 16)
/* D2A8C 001D298C 00008244 */  mtc1       $2, $f0
/* D2A90 001D2990 00000000 */  nop
/* D2A94 001D2994 00080046 */  add.s      $f0, $f1, $f0
/* D2A98 001D2998 4800A0E7 */  swc1       $f0, 0x48($sp)
/* D2A9C 001D299C EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D2AA0 001D29A0 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D2AA4 001D29A4 4000A527 */  addiu      $5, $sp, 0x40
/* D2AA8 001D29A8 38E4040C */  jal        SetPosition__10CCharacterFPf
/* D2AAC 001D29AC 00000000 */   nop
/* D2AB0 001D29B0 00608044 */  mtc1       $0, $f12
/* D2AB4 001D29B4 00000000 */  nop
/* D2AB8 001D29B8 86630046 */  mov.s      $f14, $f12
/* D2ABC 001D29BC EA01023C */  lui        $2, %hi(D_1EA1D20)
/* D2AC0 001D29C0 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* D2AC4 001D29C4 68858DC7 */  lwc1       $f13, -0x7A98($gp)
/* D2AC8 001D29C8 54E4040C */  jal        SetRotation__10CCharacterFfff
/* D2ACC 001D29CC 00000000 */   nop
/* D2AD0 001D29D0 3480050C */  jal        ClearSystemMes__Fv
/* D2AD4 001D29D4 00000000 */   nop
/* D2AD8 001D29D8 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D2ADC 001D29DC 8C4420AC */  sw         $0, (0x1DC448C & 0xFFFF)($at)
/* D2AE0 001D29E0 01000424 */  addiu      $4, $0, 0x1
/* D2AE4 001D29E4 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D2AE8 001D29E8 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D2AEC 001D29EC 789C828F */  lw         $2, -0x6388($gp)
/* D2AF0 001D29F0 0100013C */  lui        $at, (0x10000 >> 16)
/* D2AF4 001D29F4 21084100 */  addu       $at, $2, $at
/* D2AF8 001D29F8 0C8B20AC */  sw         $0, -0x74F4($at)
/* D2AFC 001D29FC DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D2B00 001D2A00 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D2B04 001D2A04 B004770C */  jal        func_1DC12C0
/* D2B08 001D2A08 00000000 */   nop
/* D2B0C 001D2A0C EC9C80AF */  sw         $0, -0x6314($gp)
/* D2B10 001D2A10 F09C80AF */  sw         $0, -0x6310($gp)
/* D2B14 001D2A14 E49C80AF */  sw         $0, -0x631C($gp)
/* D2B18 001D2A18 E89C80AF */  sw         $0, -0x6318($gp)
/* D2B1C 001D2A1C 489D80AF */  sw         $0, -0x62B8($gp)
/* D2B20 001D2A20 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* D2B24 001D2A24 E0454224 */  addiu      $2, $2, %lo(D_1DC45E0)
/* D2B28 001D2A28 A89C82AF */  sw         $2, -0x6358($gp)
/* D2B2C 001D2A2C 01001024 */  addiu      $16, $0, 0x1
/* D2B30 001D2A30 28000010 */  b          .L001D2AD4
/* D2B34 001D2A34 00000000 */   nop
.L001D2A38:
/* D2B38 001D2A38 CC01023C */  lui        $2, %hi(GamePad)
/* D2B3C 001D2A3C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D2B40 001D2A40 60000524 */  addiu      $5, $0, 0x60
/* D2B44 001D2A44 1CAE040C */  jal        Down__8CGamePadFi
/* D2B48 001D2A48 00000000 */   nop
/* D2B4C 001D2A4C 21004010 */  beqz       $2, .L001D2AD4
/* D2B50 001D2A50 00000000 */   nop
/* D2B54 001D2A54 3480050C */  jal        ClearSystemMes__Fv
/* D2B58 001D2A58 00000000 */   nop
/* D2B5C 001D2A5C 01000424 */  addiu      $4, $0, 0x1
/* D2B60 001D2A60 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D2B64 001D2A64 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D2B68 001D2A68 789C828F */  lw         $2, -0x6388($gp)
/* D2B6C 001D2A6C 0100013C */  lui        $at, (0x10000 >> 16)
/* D2B70 001D2A70 21084100 */  addu       $at, $2, $at
/* D2B74 001D2A74 0C8B20AC */  sw         $0, -0x74F4($at)
/* D2B78 001D2A78 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D2B7C 001D2A7C 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D2B80 001D2A80 C89C858F */  lw         $5, -0x6338($gp)
/* D2B84 001D2A84 BC9D838F */  lw         $3, -0x6244($gp)
/* D2B88 001D2A88 80100300 */  sll        $2, $3, 2
/* D2B8C 001D2A8C 21104300 */  addu       $2, $2, $3
/* D2B90 001D2A90 00110200 */  sll        $2, $2, 4
/* D2B94 001D2A94 21104500 */  addu       $2, $2, $5
/* D2B98 001D2A98 0100013C */  lui        $at, (0x10000 >> 16)
/* D2B9C 001D2A9C 21084100 */  addu       $at, $2, $at
/* D2BA0 001D2AA0 788D228C */  lw         $2, -0x7288($at)
/* D2BA4 001D2AA4 80110200 */  sll        $2, $2, 6
/* D2BA8 001D2AA8 21104500 */  addu       $2, $2, $5
/* D2BAC 001D2AAC 0100013C */  lui        $at, (0x10000 >> 16)
/* D2BB0 001D2AB0 21084100 */  addu       $at, $2, $at
/* D2BB4 001D2AB4 8CB620AC */  sw         $0, -0x4974($at)
/* D2BB8 001D2AB8 B004770C */  jal        func_1DC12C0
/* D2BBC 001D2ABC 00000000 */   nop
/* D2BC0 001D2AC0 EC9C80AF */  sw         $0, -0x6314($gp)
/* D2BC4 001D2AC4 F09C80AF */  sw         $0, -0x6310($gp)
/* D2BC8 001D2AC8 E49C80AF */  sw         $0, -0x631C($gp)
/* D2BCC 001D2ACC E89C80AF */  sw         $0, -0x6318($gp)
/* D2BD0 001D2AD0 01001024 */  addiu      $16, $0, 0x1
.L001D2AD4:
/* D2BD4 001D2AD4 28160072 */  paddub     $2, $16, $0
/* D2BD8 001D2AD8 2000BF7B */  lq         $31, 0x20($sp)
/* D2BDC 001D2ADC 1000B17B */  lq         $17, 0x10($sp)
/* D2BE0 001D2AE0 0000B07B */  lq         $16, 0x0($sp)
/* D2BE4 001D2AE4 5000BD27 */  addiu      $sp, $sp, 0x50
/* D2BE8 001D2AE8 0800E003 */  jr         $31
/* D2BEC 001D2AEC 00000000 */   nop
