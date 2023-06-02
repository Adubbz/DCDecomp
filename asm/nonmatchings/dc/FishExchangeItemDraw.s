.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishExchangeItemDraw__Fiii
/* F2580 001F2480 90FEBD27 */  addiu      $sp, $sp, -0x170
/* F2584 001F2484 9000BF7F */  sq         $31, 0x90($sp)
/* F2588 001F2488 8000B77F */  sq         $23, 0x80($sp)
/* F258C 001F248C 7000B67F */  sq         $22, 0x70($sp)
/* F2590 001F2490 6000B57F */  sq         $21, 0x60($sp)
/* F2594 001F2494 5000B47F */  sq         $20, 0x50($sp)
/* F2598 001F2498 4000B37F */  sq         $19, 0x40($sp)
/* F259C 001F249C 3000B27F */  sq         $18, 0x30($sp)
/* F25A0 001F24A0 2000B17F */  sq         $17, 0x20($sp)
/* F25A4 001F24A4 1000B07F */  sq         $16, 0x10($sp)
/* F25A8 001F24A8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* F25AC 001F24AC 28AE8070 */  paddub     $21, $4, $0
/* F25B0 001F24B0 28A6A070 */  paddub     $20, $5, $0
/* F25B4 001F24B4 289EC070 */  paddub     $19, $6, $0
/* F25B8 001F24B8 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F25BC 001F24BC 90032484 */  lh         $4, (0x1D90390 & 0xFFFF)($at)
/* F25C0 001F24C0 38B4080C */  jal        MenuTextureReload__Fi
/* F25C4 001F24C4 00000000 */   nop
/* F25C8 001F24C8 E8C4070C */  jal        AlreadyGetMardanWeapon__Fv
/* F25CC 001F24CC 00000000 */   nop
/* F25D0 001F24D0 28BE4070 */  paddub     $23, $2, $0
/* F25D4 001F24D4 1C8D848F */  lw         $4, -0x72E4($gp)
/* F25D8 001F24D8 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* F25DC 001F24DC 00000000 */   nop
/* F25E0 001F24E0 05004280 */  lb         $2, 0x5($2)
/* F25E4 001F24E4 0200401C */  bgtz       $2, .L001F24F0
/* F25E8 001F24E8 00000000 */   nop
/* F25EC 001F24EC 01000224 */  addiu      $2, $0, 0x1
.L001F24F0:
/* F25F0 001F24F0 19005024 */  addiu      $16, $2, 0x19
/* F25F4 001F24F4 01000224 */  addiu      $2, $0, 0x1
/* F25F8 001F24F8 0200E216 */  bne        $23, $2, .L001F2504
/* F25FC 001F24FC 00000000 */   nop
/* F2600 001F2500 01001026 */  addiu      $16, $16, 0x1
.L001F2504:
/* F2604 001F2504 F000A0AF */  sw         $0, 0xF0($sp)
/* F2608 001F2508 F400A0AF */  sw         $0, 0xF4($sp)
/* F260C 001F250C 60010324 */  addiu      $3, $0, 0x160
/* F2610 001F2510 F800A3AF */  sw         $3, 0xF8($sp)
/* F2614 001F2514 D0000224 */  addiu      $2, $0, 0xD0
/* F2618 001F2518 FC00A2AF */  sw         $2, 0xFC($sp)
/* F261C 001F251C E000B5AF */  sw         $21, 0xE0($sp)
/* F2620 001F2520 E400B4AF */  sw         $20, 0xE4($sp)
/* F2624 001F2524 E800A3AF */  sw         $3, 0xE8($sp)
/* F2628 001F2528 EC00A2AF */  sw         $2, 0xEC($sp)
/* F262C 001F252C C894848F */  lw         $4, -0x6B38($gp)
/* F2630 001F2530 E000A527 */  addiu      $5, $sp, 0xE0
/* F2634 001F2534 F000A627 */  addiu      $6, $sp, 0xF0
/* F2638 001F2538 283E6072 */  paddub     $7, $19, $0
/* F263C 001F253C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2640 001F2540 00000000 */   nop
/* F2644 001F2544 00009044 */  mtc1       $16, $f0
/* F2648 001F2548 00000000 */  nop
/* F264C 001F254C 20058046 */  cvt.s.w    $f20, $f0
/* F2650 001F2550 4401B626 */  addiu      $22, $21, 0x144
/* F2654 001F2554 FC42023C */  lui        $2, (0x42FC0000 >> 16)
/* F2658 001F2558 00008244 */  mtc1       $2, $f0
/* F265C 001F255C 00000000 */  nop
/* F2660 001F2560 43001446 */  div.s      $f1, $f0, $f20
/* F2664 001F2564 D901013C */  lui        $at, (0x1D903A8 >> 16)
/* F2668 001F2568 A8032284 */  lh         $2, (0x1D903A8 & 0xFFFF)($at)
/* F266C 001F256C 00008244 */  mtc1       $2, $f0
/* F2670 001F2570 00000000 */  nop
/* F2674 001F2574 20008046 */  cvt.s.w    $f0, $f0
/* F2678 001F2578 42000146 */  mul.s      $f1, $f0, $f1
/* F267C 001F257C 28008226 */  addiu      $2, $20, 0x28
/* F2680 001F2580 00008244 */  mtc1       $2, $f0
/* F2684 001F2584 00000000 */  nop
/* F2688 001F2588 20008046 */  cvt.s.w    $f0, $f0
/* F268C 001F258C 00030146 */  add.s      $f12, $f0, $f1
/* F2690 001F2590 2C44040C */  jal        fptosi
/* F2694 001F2594 00000000 */   nop
/* F2698 001F2598 288E4070 */  paddub     $17, $2, $0
/* F269C 001F259C 76020224 */  addiu      $2, $0, 0x276
/* F26A0 001F25A0 00008244 */  mtc1       $2, $f0
/* F26A4 001F25A4 00000000 */  nop
/* F26A8 001F25A8 20008046 */  cvt.s.w    $f0, $f0
/* F26AC 001F25AC 43001446 */  div.s      $f1, $f0, $f20
/* F26B0 001F25B0 0041023C */  lui        $2, (0x41000000 >> 16)
/* F26B4 001F25B4 00008244 */  mtc1       $2, $f0
/* F26B8 001F25B8 00000000 */  nop
/* F26BC 001F25BC 010D0046 */  sub.s      $f20, $f1, $f0
/* F26C0 001F25C0 F0000224 */  addiu      $2, $0, 0xF0
/* F26C4 001F25C4 A000A2AF */  sw         $2, 0xA0($sp)
/* F26C8 001F25C8 D0000224 */  addiu      $2, $0, 0xD0
/* F26CC 001F25CC A400B227 */  addiu      $18, $sp, 0xA4
/* F26D0 001F25D0 000042AE */  sw         $2, 0x0($18)
/* F26D4 001F25D4 08000324 */  addiu      $3, $0, 0x8
/* F26D8 001F25D8 A800A3AF */  sw         $3, 0xA8($sp)
/* F26DC 001F25DC 04000224 */  addiu      $2, $0, 0x4
/* F26E0 001F25E0 AC00A2AF */  sw         $2, 0xAC($sp)
/* F26E4 001F25E4 0001B6AF */  sw         $22, 0x100($sp)
/* F26E8 001F25E8 0401B1AF */  sw         $17, 0x104($sp)
/* F26EC 001F25EC 0801A3AF */  sw         $3, 0x108($sp)
/* F26F0 001F25F0 0C01A2AF */  sw         $2, 0x10C($sp)
/* F26F4 001F25F4 C894848F */  lw         $4, -0x6B38($gp)
/* F26F8 001F25F8 0001A527 */  addiu      $5, $sp, 0x100
/* F26FC 001F25FC A000A627 */  addiu      $6, $sp, 0xA0
/* F2700 001F2600 283E6072 */  paddub     $7, $19, $0
/* F2704 001F2604 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2708 001F2608 00000000 */   nop
/* F270C 001F260C 0000428E */  lw         $2, 0x0($18)
/* F2710 001F2610 04004224 */  addiu      $2, $2, 0x4
/* F2714 001F2614 000042AE */  sw         $2, 0x0($18)
/* F2718 001F2618 1001B6AF */  sw         $22, 0x110($sp)
/* F271C 001F261C 04002226 */  addiu      $2, $17, 0x4
/* F2720 001F2620 1401A2AF */  sw         $2, 0x114($sp)
/* F2724 001F2624 08000224 */  addiu      $2, $0, 0x8
/* F2728 001F2628 1801A2AF */  sw         $2, 0x118($sp)
/* F272C 001F262C 06A30046 */  mov.s      $f12, $f20
/* F2730 001F2630 2C44040C */  jal        fptosi
/* F2734 001F2634 00000000 */   nop
/* F2738 001F2638 1C01A2AF */  sw         $2, 0x11C($sp)
/* F273C 001F263C C894848F */  lw         $4, -0x6B38($gp)
/* F2740 001F2640 1001A527 */  addiu      $5, $sp, 0x110
/* F2744 001F2644 A000A627 */  addiu      $6, $sp, 0xA0
/* F2748 001F2648 283E6072 */  paddub     $7, $19, $0
/* F274C 001F264C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2750 001F2650 00000000 */   nop
/* F2754 001F2654 0000428E */  lw         $2, 0x0($18)
/* F2758 001F2658 04004224 */  addiu      $2, $2, 0x4
/* F275C 001F265C 000042AE */  sw         $2, 0x0($18)
/* F2760 001F2660 2001B6AF */  sw         $22, 0x120($sp)
/* F2764 001F2664 04002226 */  addiu      $2, $17, 0x4
/* F2768 001F2668 00008244 */  mtc1       $2, $f0
/* F276C 001F266C 00000000 */  nop
/* F2770 001F2670 20008046 */  cvt.s.w    $f0, $f0
/* F2774 001F2674 00031446 */  add.s      $f12, $f0, $f20
/* F2778 001F2678 2C44040C */  jal        fptosi
/* F277C 001F267C 00000000 */   nop
/* F2780 001F2680 2401A2AF */  sw         $2, 0x124($sp)
/* F2784 001F2684 08000224 */  addiu      $2, $0, 0x8
/* F2788 001F2688 2801A2AF */  sw         $2, 0x128($sp)
/* F278C 001F268C 04000224 */  addiu      $2, $0, 0x4
/* F2790 001F2690 2C01A2AF */  sw         $2, 0x12C($sp)
/* F2794 001F2694 C894848F */  lw         $4, -0x6B38($gp)
/* F2798 001F2698 2001A527 */  addiu      $5, $sp, 0x120
/* F279C 001F269C A000A627 */  addiu      $6, $sp, 0xA0
/* F27A0 001F26A0 283E6072 */  paddub     $7, $19, $0
/* F27A4 001F26A4 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F27A8 001F26A8 00000000 */   nop
/* F27AC 001F26AC 1600B526 */  addiu      $21, $21, 0x16
/* F27B0 001F26B0 14009126 */  addiu      $17, $20, 0x14
/* F27B4 001F26B4 28960070 */  paddub     $18, $0, $0
/* F27B8 001F26B8 52000010 */  b          .L001F2804
/* F27BC 001F26BC 00000000 */   nop
.L001F26C0:
/* F27C0 001F26C0 D901013C */  lui        $at, (0x1D903A8 >> 16)
/* F27C4 001F26C4 A8032284 */  lh         $2, (0x1D903A8 & 0xFFFF)($at)
/* F27C8 001F26C8 21205200 */  addu       $4, $2, $18
/* F27CC 001F26CC 94C4070C */  jal        GetExchangeItemList__Fi
/* F27D0 001F26D0 00000000 */   nop
/* F27D4 001F26D4 28B64070 */  paddub     $22, $2, $0
/* F27D8 001F26D8 01000224 */  addiu      $2, $0, 0x1
/* F27DC 001F26DC 0D00E216 */  bne        $23, $2, .L001F2714
/* F27E0 001F26E0 00000000 */   nop
/* F27E4 001F26E4 04000224 */  addiu      $2, $0, 0x4
/* F27E8 001F26E8 0A004216 */  bne        $18, $2, .L001F2714
/* F27EC 001F26EC 00000000 */   nop
/* F27F0 001F26F0 D901013C */  lui        $at, (0x1D903A8 >> 16)
/* F27F4 001F26F4 A8032284 */  lh         $2, (0x1D903A8 & 0xFFFF)($at)
/* F27F8 001F26F8 04004224 */  addiu      $2, $2, 0x4
/* F27FC 001F26FC 05005014 */  bne        $2, $16, .L001F2714
/* F2800 001F2700 00000000 */   nop
/* F2804 001F2704 20000424 */  addiu      $4, $0, 0x20
/* F2808 001F2708 94C4070C */  jal        GetExchangeItemList__Fi
/* F280C 001F270C 00000000 */   nop
/* F2810 001F2710 28B64070 */  paddub     $22, $2, $0
.L001F2714:
/* F2814 001F2714 0000C486 */  lh         $4, 0x0($22)
/* F2818 001F2718 CE008826 */  addiu      $8, $20, 0xCE
/* F281C 001F271C 282EA072 */  paddub     $5, $21, $0
/* F2820 001F2720 28362072 */  paddub     $6, $17, $0
/* F2824 001F2724 283E8072 */  paddub     $7, $20, $0
/* F2828 001F2728 284E6072 */  paddub     $9, $19, $0
/* F282C 001F272C 28560070 */  paddub     $10, $0, $0
/* F2830 001F2730 68B5080C */  jal        DrawIconParts__Fiiiiiii
/* F2834 001F2734 00000000 */   nop
/* F2838 001F2738 E0010224 */  addiu      $2, $0, 0x1E0
/* F283C 001F273C 4001A2AF */  sw         $2, 0x140($sp)
/* F2840 001F2740 EC000224 */  addiu      $2, $0, 0xEC
/* F2844 001F2744 4401A2AF */  sw         $2, 0x144($sp)
/* F2848 001F2748 20000424 */  addiu      $4, $0, 0x20
/* F284C 001F274C 4801A4AF */  sw         $4, 0x148($sp)
/* F2850 001F2750 14000324 */  addiu      $3, $0, 0x14
/* F2854 001F2754 4C01A3AF */  sw         $3, 0x14C($sp)
/* F2858 001F2758 0401A226 */  addiu      $2, $21, 0x104
/* F285C 001F275C 3001A2AF */  sw         $2, 0x130($sp)
/* F2860 001F2760 08002226 */  addiu      $2, $17, 0x8
/* F2864 001F2764 3401A2AF */  sw         $2, 0x134($sp)
/* F2868 001F2768 3801A4AF */  sw         $4, 0x138($sp)
/* F286C 001F276C 3C01A3AF */  sw         $3, 0x13C($sp)
/* F2870 001F2770 C894848F */  lw         $4, -0x6B38($gp)
/* F2874 001F2774 3001A527 */  addiu      $5, $sp, 0x130
/* F2878 001F2778 4001A627 */  addiu      $6, $sp, 0x140
/* F287C 001F277C 283E6072 */  paddub     $7, $19, $0
/* F2880 001F2780 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2884 001F2784 00000000 */   nop
/* F2888 001F2788 2900023C */  lui        $2, %hi(_3177)
/* F288C 001F278C 902A4224 */  addiu      $2, $2, %lo(_3177)
/* F2890 001F2790 B000A827 */  addiu      $8, $sp, 0xB0
/* F2894 001F2794 00004278 */  lq         $2, 0x0($2)
/* F2898 001F2798 0000027D */  sq         $2, 0x0($8)
/* F289C 001F279C 0200C486 */  lh         $4, 0x2($22)
/* F28A0 001F27A0 0601A526 */  addiu      $5, $21, 0x106
/* F28A4 001F27A4 06002626 */  addiu      $6, $17, 0x6
/* F28A8 001F27A8 C894878F */  lw         $7, -0x6B38($gp)
/* F28AC 001F27AC 01000924 */  addiu      $9, $0, 0x1
/* F28B0 001F27B0 28566072 */  paddub     $10, $19, $0
/* F28B4 001F27B4 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F28B8 001F27B8 00000000 */   nop
/* F28BC 001F27BC 0F004006 */  bltz       $18, .L001F27FC
/* F28C0 001F27C0 00000000 */   nop
/* F28C4 001F27C4 0A00412A */  slti       $at, $18, 0xA
/* F28C8 001F27C8 0C002010 */  beqz       $at, .L001F27FC
/* F28CC 001F27CC 00000000 */   nop
/* F28D0 001F27D0 2400A326 */  addiu      $3, $21, 0x24
/* F28D4 001F27D4 C0301200 */  sll        $6, $18, 3
/* F28D8 001F27D8 DA01023C */  lui        $2, %hi(D_1DA6A20)
/* F28DC 001F27DC 206A4224 */  addiu      $2, $2, %lo(D_1DA6A20)
/* F28E0 001F27E0 21104600 */  addu       $2, $2, $6
/* F28E4 001F27E4 000043AC */  sw         $3, 0x0($2)
/* F28E8 001F27E8 04002326 */  addiu      $3, $17, 0x4
/* F28EC 001F27EC DA01023C */  lui        $2, %hi(D_1DA6A24)
/* F28F0 001F27F0 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* F28F4 001F27F4 21104600 */  addu       $2, $2, $6
/* F28F8 001F27F8 000043AC */  sw         $3, 0x0($2)
.L001F27FC:
/* F28FC 001F27FC 01005226 */  addiu      $18, $18, 0x1
/* F2900 001F2800 22003126 */  addiu      $17, $17, 0x22
.L001F2804:
/* F2904 001F2804 0500422A */  slti       $2, $18, 0x5
/* F2908 001F2808 ADFF4014 */  bnez       $2, .L001F26C0
/* F290C 001F280C 00000000 */   nop
/* F2910 001F2810 D901013C */  lui        $at, (0x1D903A4 >> 16)
/* F2914 001F2814 A4032384 */  lh         $3, (0x1D903A4 & 0xFFFF)($at)
/* F2918 001F2818 D901013C */  lui        $at, (0x1D903A8 >> 16)
/* F291C 001F281C A8032284 */  lh         $2, (0x1D903A8 & 0xFFFF)($at)
/* F2920 001F2820 23306200 */  subu       $6, $3, $2
/* F2924 001F2824 14008326 */  addiu      $3, $20, 0x14
/* F2928 001F2828 00110600 */  sll        $2, $6, 4
/* F292C 001F282C 21104600 */  addu       $2, $2, $6
/* F2930 001F2830 40100200 */  sll        $2, $2, 1
/* F2934 001F2834 21806200 */  addu       $16, $3, $2
/* F2938 001F2838 E4FFB126 */  addiu      $17, $21, -0x1C
/* F293C 001F283C D901013C */  lui        $at, (0x1D903A6 >> 16)
/* F2940 001F2840 A6032384 */  lh         $3, (0x1D903A6 & 0xFFFF)($at)
/* F2944 001F2844 04000224 */  addiu      $2, $0, 0x4
/* F2948 001F2848 06006214 */  bne        $3, $2, .L001F2864
/* F294C 001F284C 00000000 */   nop
/* F2950 001F2850 F2001124 */  addiu      $17, $0, 0xF2
/* F2954 001F2854 D901013C */  lui        $at, (0x1D903A2 >> 16)
/* F2958 001F2858 A2032284 */  lh         $2, (0x1D903A2 & 0xFFFF)($at)
/* F295C 001F285C 40110200 */  sll        $2, $2, 5
/* F2960 001F2860 02015024 */  addiu      $16, $2, 0x102
.L001F2864:
/* F2964 001F2864 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F2968 001F2868 9C03228C */  lw         $2, (0x1D9039C & 0xFFFF)($at)
/* F296C 001F286C 23100202 */  subu       $2, $16, $2
/* F2970 001F2870 00008244 */  mtc1       $2, $f0
/* F2974 001F2874 00000000 */  nop
/* F2978 001F2878 60008046 */  cvt.s.w    $f1, $f0
/* F297C 001F287C 8040023C */  lui        $2, (0x40800000 >> 16)
/* F2980 001F2880 00008244 */  mtc1       $2, $f0
/* F2984 001F2884 00000000 */  nop
/* F2988 001F2888 030B0046 */  div.s      $f12, $f1, $f0
/* F298C 001F288C 2C44040C */  jal        fptosi
/* F2990 001F2890 00000000 */   nop
/* F2994 001F2894 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F2998 001F2898 9C03238C */  lw         $3, (0x1D9039C & 0xFFFF)($at)
/* F299C 001F289C 21106200 */  addu       $2, $3, $2
/* F29A0 001F28A0 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F29A4 001F28A4 9C0322AC */  sw         $2, (0x1D9039C & 0xFFFF)($at)
/* F29A8 001F28A8 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F29AC 001F28AC 9C03228C */  lw         $2, (0x1D9039C & 0xFFFF)($at)
/* F29B0 001F28B0 23205000 */  subu       $4, $2, $16
/* F29B4 001F28B4 7200040C */  jal        abs
/* F29B8 001F28B8 00000000 */   nop
/* F29BC 001F28BC 02004128 */  slti       $at, $2, 0x2
/* F29C0 001F28C0 03002010 */  beqz       $at, .L001F28D0
/* F29C4 001F28C4 00000000 */   nop
/* F29C8 001F28C8 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F29CC 001F28CC 9C0330AC */  sw         $16, (0x1D9039C & 0xFFFF)($at)
.L001F28D0:
/* F29D0 001F28D0 D901013C */  lui        $at, (0x1D9039C >> 16)
/* F29D4 001F28D4 9C03308C */  lw         $16, (0x1D9039C & 0xFFFF)($at)
/* F29D8 001F28D8 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* F29DC 001F28DC 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* F29E0 001F28E0 38B4080C */  jal        MenuTextureReload__Fi
/* F29E4 001F28E4 00000000 */   nop
/* F29E8 001F28E8 5801A427 */  addiu      $4, $sp, 0x158
/* F29EC 001F28EC 5C01A527 */  addiu      $5, $sp, 0x15C
/* F29F0 001F28F0 6401A627 */  addiu      $6, $sp, 0x164
/* F29F4 001F28F4 6001A727 */  addiu      $7, $sp, 0x160
/* F29F8 001F28F8 C4B8080C */  jal        GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
/* F29FC 001F28FC 00000000 */   nop
/* F2A00 001F2900 5801ACC7 */  lwc1       $f12, 0x158($sp)
/* F2A04 001F2904 2C44040C */  jal        fptosi
/* F2A08 001F2908 00000000 */   nop
/* F2A0C 001F290C 28964070 */  paddub     $18, $2, $0
/* F2A10 001F2910 5C01ACC7 */  lwc1       $f12, 0x15C($sp)
/* F2A14 001F2914 2C44040C */  jal        fptosi
/* F2A18 001F2918 00000000 */   nop
/* F2A1C 001F291C 28264072 */  paddub     $4, $18, $0
/* F2A20 001F2920 282E4070 */  paddub     $5, $2, $0
/* F2A24 001F2924 6401ACC7 */  lwc1       $f12, 0x164($sp)
/* F2A28 001F2928 6001ADC7 */  lwc1       $f13, 0x160($sp)
/* F2A2C 001F292C 80000624 */  addiu      $6, $0, 0x80
/* F2A30 001F2930 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* F2A34 001F2934 00000000 */   nop
/* F2A38 001F2938 6801A427 */  addiu      $4, $sp, 0x168
/* F2A3C 001F293C 6C01A527 */  addiu      $5, $sp, 0x16C
/* F2A40 001F2940 F0B8080C */  jal        GetMainMenuRightHelpMsgLangOffset__FRiRi
/* F2A44 001F2944 00000000 */   nop
/* F2A48 001F2948 DA01013C */  lui        $at, (0x1DA3A24 >> 16)
/* F2A4C 001F294C 243A33AC */  sw         $19, (0x1DA3A24 & 0xFFFF)($at)
/* F2A50 001F2950 5801A1C7 */  lwc1       $f1, 0x158($sp)
/* F2A54 001F2954 6801A0C7 */  lwc1       $f0, 0x168($sp)
/* F2A58 001F2958 20008046 */  cvt.s.w    $f0, $f0
/* F2A5C 001F295C 000B0046 */  add.s      $f12, $f1, $f0
/* F2A60 001F2960 2C44040C */  jal        fptosi
/* F2A64 001F2964 00000000 */   nop
/* F2A68 001F2968 DA01013C */  lui        $at, (0x1DA2350 >> 16)
/* F2A6C 001F296C 502322AC */  sw         $2, (0x1DA2350 & 0xFFFF)($at)
/* F2A70 001F2970 5C01A1C7 */  lwc1       $f1, 0x15C($sp)
/* F2A74 001F2974 6C01A0C7 */  lwc1       $f0, 0x16C($sp)
/* F2A78 001F2978 20008046 */  cvt.s.w    $f0, $f0
/* F2A7C 001F297C 000B0046 */  add.s      $f12, $f1, $f0
/* F2A80 001F2980 2C44040C */  jal        fptosi
/* F2A84 001F2984 00000000 */   nop
/* F2A88 001F2988 DA01013C */  lui        $at, (0x1DA2354 >> 16)
/* F2A8C 001F298C 542322AC */  sw         $2, (0x1DA2354 & 0xFFFF)($at)
/* F2A90 001F2990 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F2A94 001F2994 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F2A98 001F2998 6437050C */  jal        Step__6ClsMesFv
/* F2A9C 001F299C 00000000 */   nop
/* F2AA0 001F29A0 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F2AA4 001F29A4 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F2AA8 001F29A8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F2AAC 001F29AC 00000000 */   nop
/* F2AB0 001F29B0 DA01013C */  lui        $at, (0x1DA69A4 >> 16)
/* F2AB4 001F29B4 A46933AC */  sw         $19, (0x1DA69A4 & 0xFFFF)($at)
/* F2AB8 001F29B8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F2ABC 001F29BC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F2AC0 001F29C0 6437050C */  jal        Step__6ClsMesFv
/* F2AC4 001F29C4 00000000 */   nop
/* F2AC8 001F29C8 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F2ACC 001F29CC D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F2AD0 001F29D0 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F2AD4 001F29D4 00000000 */   nop
/* F2AD8 001F29D8 D901013C */  lui        $at, (0x1D90398 >> 16)
/* F2ADC 001F29DC 9803248C */  lw         $4, (0x1D90398 & 0xFFFF)($at)
/* F2AE0 001F29E0 DA01013C */  lui        $at, (0x1DA5238 >> 16)
/* F2AE4 001F29E4 3852228C */  lw         $2, (0x1DA5238 & 0xFFFF)($at)
/* F2AE8 001F29E8 0D004410 */  beq        $2, $4, .L001F2A20
/* F2AEC 001F29EC 00000000 */   nop
/* F2AF0 001F29F0 DA01013C */  lui        $at, (0x1DA5238 >> 16)
/* F2AF4 001F29F4 385224AC */  sw         $4, (0x1DA5238 & 0xFFFF)($at)
/* F2AF8 001F29F8 C0B7080C */  jal        GetNumberKeta__Fi
/* F2AFC 001F29FC 00000000 */   nop
/* F2B00 001F2A00 FFFF0324 */  addiu      $3, $0, -0x1
/* F2B04 001F2A04 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* F2B08 001F2A08 CC5123AC */  sw         $3, (0x1DA51CC & 0xFFFF)($at)
/* F2B0C 001F2A0C CD004524 */  addiu      $5, $2, 0xCD
/* F2B10 001F2A10 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* F2B14 001F2A14 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* F2B18 001F2A18 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F2B1C 001F2A1C 00000000 */   nop
.L001F2A20:
/* F2B20 001F2A20 DA01013C */  lui        $at, (0x1DA51E4 >> 16)
/* F2B24 001F2A24 E45133AC */  sw         $19, (0x1DA51E4 & 0xFFFF)($at)
/* F2B28 001F2A28 46000224 */  addiu      $2, $0, 0x46
/* F2B2C 001F2A2C DA01013C */  lui        $at, (0x1DA3B10 >> 16)
/* F2B30 001F2A30 103B22AC */  sw         $2, (0x1DA3B10 & 0xFFFF)($at)
/* F2B34 001F2A34 40010224 */  addiu      $2, $0, 0x140
/* F2B38 001F2A38 DA01013C */  lui        $at, (0x1DA3B14 >> 16)
/* F2B3C 001F2A3C 143B22AC */  sw         $2, (0x1DA3B14 & 0xFFFF)($at)
/* F2B40 001F2A40 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* F2B44 001F2A44 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* F2B48 001F2A48 6437050C */  jal        Step__6ClsMesFv
/* F2B4C 001F2A4C 00000000 */   nop
/* F2B50 001F2A50 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* F2B54 001F2A54 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* F2B58 001F2A58 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F2B5C 001F2A5C 00000000 */   nop
/* F2B60 001F2A60 D901013C */  lui        $at, (0x1D903A6 >> 16)
/* F2B64 001F2A64 A6032484 */  lh         $4, (0x1D903A6 & 0xFFFF)($at)
/* F2B68 001F2A68 04000324 */  addiu      $3, $0, 0x4
/* F2B6C 001F2A6C 04008310 */  beq        $4, $3, .L001F2A80
/* F2B70 001F2A70 00000000 */   nop
/* F2B74 001F2A74 05000324 */  addiu      $3, $0, 0x5
/* F2B78 001F2A78 4B008314 */  bne        $4, $3, .L001F2BA8
/* F2B7C 001F2A7C 00000000 */   nop
.L001F2A80:
/* F2B80 001F2A80 40000424 */  addiu      $4, $0, 0x40
/* F2B84 001F2A84 A0B4080C */  jal        AllFadeForMenu__Fi
/* F2B88 001F2A88 00000000 */   nop
/* F2B8C 001F2A8C D901013C */  lui        $at, (0x1D903A6 >> 16)
/* F2B90 001F2A90 A6032384 */  lh         $3, (0x1D903A6 & 0xFFFF)($at)
/* F2B94 001F2A94 04000224 */  addiu      $2, $0, 0x4
/* F2B98 001F2A98 2B006214 */  bne        $3, $2, .L001F2B48
/* F2B9C 001F2A9C 00000000 */   nop
/* F2BA0 001F2AA0 10010224 */  addiu      $2, $0, 0x110
/* F2BA4 001F2AA4 C000A2AF */  sw         $2, 0xC0($sp)
/* F2BA8 001F2AA8 02010224 */  addiu      $2, $0, 0x102
/* F2BAC 001F2AAC C400B227 */  addiu      $18, $sp, 0xC4
/* F2BB0 001F2AB0 000042AE */  sw         $2, 0x0($18)
/* F2BB4 001F2AB4 60000324 */  addiu      $3, $0, 0x60
/* F2BB8 001F2AB8 C800A3AF */  sw         $3, 0xC8($sp)
/* F2BBC 001F2ABC 1F000224 */  addiu      $2, $0, 0x1F
/* F2BC0 001F2AC0 CC00A2AF */  sw         $2, 0xCC($sp)
/* F2BC4 001F2AC4 A0010224 */  addiu      $2, $0, 0x1A0
/* F2BC8 001F2AC8 D000A2AF */  sw         $2, 0xD0($sp)
/* F2BCC 001F2ACC D400B327 */  addiu      $19, $sp, 0xD4
/* F2BD0 001F2AD0 000060AE */  sw         $0, 0x0($19)
/* F2BD4 001F2AD4 D800A3AF */  sw         $3, 0xD8($sp)
/* F2BD8 001F2AD8 20000224 */  addiu      $2, $0, 0x20
/* F2BDC 001F2ADC DC00A2AF */  sw         $2, 0xDC($sp)
/* F2BE0 001F2AE0 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F2BE4 001F2AE4 90032484 */  lh         $4, (0x1D90390 & 0xFFFF)($at)
/* F2BE8 001F2AE8 38B4080C */  jal        MenuTextureReload__Fi
/* F2BEC 001F2AEC 00000000 */   nop
/* F2BF0 001F2AF0 C894848F */  lw         $4, -0x6B38($gp)
/* F2BF4 001F2AF4 C000A527 */  addiu      $5, $sp, 0xC0
/* F2BF8 001F2AF8 D000A627 */  addiu      $6, $sp, 0xD0
/* F2BFC 001F2AFC 80000724 */  addiu      $7, $0, 0x80
/* F2C00 001F2B00 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2C04 001F2B04 00000000 */   nop
/* F2C08 001F2B08 0000428E */  lw         $2, 0x0($18)
/* F2C0C 001F2B0C 20004224 */  addiu      $2, $2, 0x20
/* F2C10 001F2B10 000042AE */  sw         $2, 0x0($18)
/* F2C14 001F2B14 20000224 */  addiu      $2, $0, 0x20
/* F2C18 001F2B18 000062AE */  sw         $2, 0x0($19)
/* F2C1C 001F2B1C C894848F */  lw         $4, -0x6B38($gp)
/* F2C20 001F2B20 C000A527 */  addiu      $5, $sp, 0xC0
/* F2C24 001F2B24 D000A627 */  addiu      $6, $sp, 0xD0
/* F2C28 001F2B28 80000724 */  addiu      $7, $0, 0x80
/* F2C2C 001F2B2C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F2C30 001F2B30 00000000 */   nop
/* F2C34 001F2B34 05000224 */  addiu      $2, $0, 0x5
/* F2C38 001F2B38 DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* F2C3C 001F2B3C E40B22AC */  sw         $2, (0x1DA0BE4 & 0xFFFF)($at)
/* F2C40 001F2B40 04000010 */  b          .L001F2B54
/* F2C44 001F2B44 00000000 */   nop
.L001F2B48:
/* F2C48 001F2B48 05000224 */  addiu      $2, $0, 0x5
/* F2C4C 001F2B4C DA01013C */  lui        $at, (0x1DA0BE4 >> 16)
/* F2C50 001F2B50 E40B22AC */  sw         $2, (0x1DA0BE4 & 0xFFFF)($at)
.L001F2B54:
/* F2C54 001F2B54 DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* F2C58 001F2B58 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* F2C5C 001F2B5C 38B4080C */  jal        MenuTextureReload__Fi
/* F2C60 001F2B60 00000000 */   nop
/* F2C64 001F2B64 01000224 */  addiu      $2, $0, 0x1
/* F2C68 001F2B68 DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* F2C6C 001F2B6C 280C22AC */  sw         $2, (0x1DA0C28 & 0xFFFF)($at)
/* F2C70 001F2B70 DC000224 */  addiu      $2, $0, 0xDC
/* F2C74 001F2B74 DA01013C */  lui        $at, (0x1DA0B90 >> 16)
/* F2C78 001F2B78 900B22AC */  sw         $2, (0x1DA0B90 & 0xFFFF)($at)
/* F2C7C 001F2B7C 8C000224 */  addiu      $2, $0, 0x8C
/* F2C80 001F2B80 DA01013C */  lui        $at, (0x1DA0B94 >> 16)
/* F2C84 001F2B84 940B22AC */  sw         $2, (0x1DA0B94 & 0xFFFF)($at)
/* F2C88 001F2B88 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F2C8C 001F2B8C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F2C90 001F2B90 6437050C */  jal        Step__6ClsMesFv
/* F2C94 001F2B94 00000000 */   nop
/* F2C98 001F2B98 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* F2C9C 001F2B9C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* F2CA0 001F2BA0 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F2CA4 001F2BA4 00000000 */   nop
.L001F2BA8:
/* F2CA8 001F2BA8 D901013C */  lui        $at, (0x1D903A6 >> 16)
/* F2CAC 001F2BAC A6032484 */  lh         $4, (0x1D903A6 & 0xFFFF)($at)
/* F2CB0 001F2BB0 05000324 */  addiu      $3, $0, 0x5
/* F2CB4 001F2BB4 07008310 */  beq        $4, $3, .L001F2BD4
/* F2CB8 001F2BB8 00000000 */   nop
/* F2CBC 001F2BBC 28262072 */  paddub     $4, $17, $0
/* F2CC0 001F2BC0 282E0072 */  paddub     $5, $16, $0
/* F2CC4 001F2BC4 01000624 */  addiu      $6, $0, 0x1
/* F2CC8 001F2BC8 40000724 */  addiu      $7, $0, 0x40
/* F2CCC 001F2BCC D05B080C */  jal        DrawMenuObjectVibe__Fiiii
/* F2CD0 001F2BD0 00000000 */   nop
.L001F2BD4:
/* F2CD4 001F2BD4 9000BF7B */  lq         $31, 0x90($sp)
/* F2CD8 001F2BD8 8000B77B */  lq         $23, 0x80($sp)
/* F2CDC 001F2BDC 7000B67B */  lq         $22, 0x70($sp)
/* F2CE0 001F2BE0 6000B57B */  lq         $21, 0x60($sp)
/* F2CE4 001F2BE4 5000B47B */  lq         $20, 0x50($sp)
/* F2CE8 001F2BE8 4000B37B */  lq         $19, 0x40($sp)
/* F2CEC 001F2BEC 3000B27B */  lq         $18, 0x30($sp)
/* F2CF0 001F2BF0 2000B17B */  lq         $17, 0x20($sp)
/* F2CF4 001F2BF4 1000B07B */  lq         $16, 0x10($sp)
/* F2CF8 001F2BF8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* F2CFC 001F2BFC 7001BD27 */  addiu      $sp, $sp, 0x170
/* F2D00 001F2C00 0800E003 */  jr         $31
/* F2D04 001F2C04 00000000 */   nop
/* F2D08 001F2C08 00000000 */  nop
/* F2D0C 001F2C0C 00000000 */  nop
