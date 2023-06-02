.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_DIRECTION__FP12RS_STACKDATAi
/* E2740 001E2640 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* E2744 001E2644 2000BF7F */  sq         $31, 0x20($sp)
/* E2748 001E2648 1000B17F */  sq         $17, 0x10($sp)
/* E274C 001E264C 0000B07F */  sq         $16, 0x0($sp)
/* E2750 001E2650 288E8070 */  paddub     $17, $4, $0
/* E2754 001E2654 2886A070 */  paddub     $16, $5, $0
/* E2758 001E2658 E09C848F */  lw         $4, -0x6320($gp)
/* E275C 001E265C 9000838C */  lw         $3, 0x90($4)
/* E2760 001E2660 10350224 */  addiu      $2, $0, 0x3510
/* E2764 001E2664 18106200 */  mult       $2, $3, $2
/* E2768 001E2668 21108200 */  addu       $2, $4, $2
/* E276C 001E266C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E2770 001E2670 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E2774 001E2674 21204100 */  addu       $4, $2, $at
/* E2778 001E2678 3000A527 */  addiu      $5, $sp, 0x30
/* E277C 001E267C A000998C */  lw         $25, 0xA0($4)
/* E2780 001E2680 5800398F */  lw         $25, 0x58($25)
/* E2784 001E2684 09F82003 */  jalr       $25
/* E2788 001E2688 00000000 */   nop
/* E278C 001E268C 04000224 */  addiu      $2, $0, 0x4
/* E2790 001E2690 1D000216 */  bne        $16, $2, .L001E2708
/* E2794 001E2694 00000000 */   nop
/* E2798 001E2698 28262072 */  paddub     $4, $17, $0
/* E279C 001E269C 08009124 */  addiu      $17, $4, 0x8
/* E27A0 001E26A0 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E27A4 001E26A4 00000000 */   nop
/* E27A8 001E26A8 3400A227 */  addiu      $2, $sp, 0x34
/* E27AC 001E26AC 000042C4 */  lwc1       $f2, 0x0($2)
/* E27B0 001E26B0 788181C7 */  lwc1       $f1, -0x7E88($gp)
/* E27B4 001E26B4 02080046 */  mul.s      $f0, $f1, $f0
/* E27B8 001E26B8 40100046 */  add.s      $f1, $f2, $f0
/* E27BC 001E26BC 000041E4 */  swc1       $f1, 0x0($2)
/* E27C0 001E26C0 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* E27C4 001E26C4 36080046 */  c.le.s     $f1, $f0
/* E27C8 001E26C8 00000000 */  nop
/* E27CC 001E26CC 05000145 */  bc1t       .L001E26E4
/* E27D0 001E26D0 00000000 */   nop
/* E27D4 001E26D4 000041C4 */  lwc1       $f1, 0x0($2)
/* E27D8 001E26D8 888180C7 */  lwc1       $f0, -0x7E78($gp)
/* E27DC 001E26DC 01080046 */  sub.s      $f0, $f1, $f0
/* E27E0 001E26E0 000040E4 */  swc1       $f0, 0x0($2)
.L001E26E4:
/* E27E4 001E26E4 000041C4 */  lwc1       $f1, 0x0($2)
/* E27E8 001E26E8 8C8180C7 */  lwc1       $f0, -0x7E74($gp)
/* E27EC 001E26EC 34080046 */  c.lt.s     $f1, $f0
/* E27F0 001E26F0 00000000 */  nop
/* E27F4 001E26F4 04000045 */  bc1f       .L001E2708
/* E27F8 001E26F8 00000000 */   nop
/* E27FC 001E26FC 908180C7 */  lwc1       $f0, -0x7E70($gp)
/* E2800 001E2700 00080046 */  add.s      $f0, $f1, $f0
/* E2804 001E2704 000040E4 */  swc1       $f0, 0x0($2)
.L001E2708:
/* E2808 001E2708 2900023C */  lui        $2, %hi(_776_2)
/* E280C 001E270C 40184224 */  addiu      $2, $2, %lo(_776_2)
/* E2810 001E2710 C000A327 */  addiu      $3, $sp, 0xC0
/* E2814 001E2714 00004278 */  lq         $2, 0x0($2)
/* E2818 001E2718 0000627C */  sq         $2, 0x0($3)
/* E281C 001E271C 8000A427 */  addiu      $4, $sp, 0x80
/* E2820 001E2720 2A86040C */  jal        sceVu0UnitMatrix
/* E2824 001E2724 00000000 */   nop
/* E2828 001E2728 4000A427 */  addiu      $4, $sp, 0x40
/* E282C 001E272C 8000A527 */  addiu      $5, $sp, 0x80
/* E2830 001E2730 3400ACC7 */  lwc1       $f12, 0x34($sp)
/* E2834 001E2734 A686040C */  jal        sceVu0RotMatrixY
/* E2838 001E2738 00000000 */   nop
/* E283C 001E273C C000A427 */  addiu      $4, $sp, 0xC0
/* E2840 001E2740 4000A527 */  addiu      $5, $sp, 0x40
/* E2844 001E2744 28368070 */  paddub     $6, $4, $0
/* E2848 001E2748 6285040C */  jal        sceVu0ApplyMatrix
/* E284C 001E274C 00000000 */   nop
/* E2850 001E2750 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E2854 001E2754 CC00A2AF */  sw         $2, 0xCC($sp)
/* E2858 001E2758 C000A427 */  addiu      $4, $sp, 0xC0
/* E285C 001E275C 282E8070 */  paddub     $5, $4, $0
/* E2860 001E2760 9285040C */  jal        sceVu0Normalize
/* E2864 001E2764 00000000 */   nop
/* E2868 001E2768 28262072 */  paddub     $4, $17, $0
/* E286C 001E276C 08009124 */  addiu      $17, $4, 0x8
/* E2870 001E2770 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* E2874 001E2774 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E2878 001E2778 00000000 */   nop
/* E287C 001E277C 28262072 */  paddub     $4, $17, $0
/* E2880 001E2780 08009124 */  addiu      $17, $4, 0x8
/* E2884 001E2784 C400ACC7 */  lwc1       $f12, 0xC4($sp)
/* E2888 001E2788 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E288C 001E278C 00000000 */   nop
/* E2890 001E2790 28262072 */  paddub     $4, $17, $0
/* E2894 001E2794 C800ACC7 */  lwc1       $f12, 0xC8($sp)
/* E2898 001E2798 BC85070C */  jal        SetStack__FP12RS_STACKDATAf_3
/* E289C 001E279C 00000000 */   nop
/* E28A0 001E27A0 01000224 */  addiu      $2, $0, 0x1
/* E28A4 001E27A4 2000BF7B */  lq         $31, 0x20($sp)
/* E28A8 001E27A8 1000B17B */  lq         $17, 0x10($sp)
/* E28AC 001E27AC 0000B07B */  lq         $16, 0x0($sp)
/* E28B0 001E27B0 D000BD27 */  addiu      $sp, $sp, 0xD0
/* E28B4 001E27B4 0800E003 */  jr         $31
/* E28B8 001E27B8 00000000 */   nop
/* E28BC 001E27BC 00000000 */  nop
