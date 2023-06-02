.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_MOVE__FP12RS_STACKDATAi
/* E28C0 001E27C0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E28C4 001E27C4 2000BF7F */  sq         $31, 0x20($sp)
/* E28C8 001E27C8 1000B17F */  sq         $17, 0x10($sp)
/* E28CC 001E27CC 0000B07F */  sq         $16, 0x0($sp)
/* E28D0 001E27D0 288E8070 */  paddub     $17, $4, $0
/* E28D4 001E27D4 E09C838F */  lw         $3, -0x6320($gp)
/* E28D8 001E27D8 9000708C */  lw         $16, 0x90($3)
/* E28DC 001E27DC 10350224 */  addiu      $2, $0, 0x3510
/* E28E0 001E27E0 18100202 */  mult       $2, $16, $2
/* E28E4 001E27E4 21106200 */  addu       $2, $3, $2
/* E28E8 001E27E8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* E28EC 001E27EC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* E28F0 001E27F0 21204100 */  addu       $4, $2, $at
/* E28F4 001E27F4 4000A527 */  addiu      $5, $sp, 0x40
/* E28F8 001E27F8 A000998C */  lw         $25, 0xA0($4)
/* E28FC 001E27FC A000398F */  lw         $25, 0xA0($25)
/* E2900 001E2800 09F82003 */  jalr       $25
/* E2904 001E2804 00000000 */   nop
/* E2908 001E2808 28262072 */  paddub     $4, $17, $0
/* E290C 001E280C 08009124 */  addiu      $17, $4, 0x8
/* E2910 001E2810 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2914 001E2814 00000000 */   nop
/* E2918 001E2818 3000A0E7 */  swc1       $f0, 0x30($sp)
/* E291C 001E281C 28262072 */  paddub     $4, $17, $0
/* E2920 001E2820 08009124 */  addiu      $17, $4, 0x8
/* E2924 001E2824 A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2928 001E2828 00000000 */   nop
/* E292C 001E282C 3400A327 */  addiu      $3, $sp, 0x34
/* E2930 001E2830 000060E4 */  swc1       $f0, 0x0($3)
/* E2934 001E2834 28262072 */  paddub     $4, $17, $0
/* E2938 001E2838 08009124 */  addiu      $17, $4, 0x8
/* E293C 001E283C A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E2940 001E2840 00000000 */   nop
/* E2944 001E2844 3800A227 */  addiu      $2, $sp, 0x38
/* E2948 001E2848 000040E4 */  swc1       $f0, 0x0($2)
/* E294C 001E284C 3000A1C7 */  lwc1       $f1, 0x30($sp)
/* E2950 001E2850 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* E2954 001E2854 01080046 */  sub.s      $f0, $f1, $f0
/* E2958 001E2858 3000A0E7 */  swc1       $f0, 0x30($sp)
/* E295C 001E285C 000061C4 */  lwc1       $f1, 0x0($3)
/* E2960 001E2860 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* E2964 001E2864 01080046 */  sub.s      $f0, $f1, $f0
/* E2968 001E2868 000060E4 */  swc1       $f0, 0x0($3)
/* E296C 001E286C 000041C4 */  lwc1       $f1, 0x0($2)
/* E2970 001E2870 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* E2974 001E2874 01080046 */  sub.s      $f0, $f1, $f0
/* E2978 001E2878 000040E4 */  swc1       $f0, 0x0($2)
/* E297C 001E287C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* E2980 001E2880 3C00A2AF */  sw         $2, 0x3C($sp)
/* E2984 001E2884 80101000 */  sll        $2, $16, 2
/* E2988 001E2888 21185000 */  addu       $3, $2, $16
/* E298C 001E288C 80100300 */  sll        $2, $3, 2
/* E2990 001E2890 21106200 */  addu       $2, $3, $2
/* E2994 001E2894 00810200 */  sll        $16, $2, 4
/* E2998 001E2898 E09C828F */  lw         $2, -0x6320($gp)
/* E299C 001E289C 21105000 */  addu       $2, $2, $16
/* E29A0 001E28A0 0100013C */  lui        $at, (0x1E430 >> 16)
/* E29A4 001E28A4 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* E29A8 001E28A8 21204100 */  addu       $4, $2, $at
/* E29AC 001E28AC 3000A527 */  addiu      $5, $sp, 0x30
/* E29B0 001E28B0 9285040C */  jal        sceVu0Normalize
/* E29B4 001E28B4 00000000 */   nop
/* E29B8 001E28B8 28262072 */  paddub     $4, $17, $0
/* E29BC 001E28BC A485070C */  jal        GetStackFloat__FP12RS_STACKDATA_3
/* E29C0 001E28C0 00000000 */   nop
/* E29C4 001E28C4 E09C838F */  lw         $3, -0x6320($gp)
/* E29C8 001E28C8 21100302 */  addu       $2, $16, $3
/* E29CC 001E28CC 0200013C */  lui        $at, (0x20000 >> 16)
/* E29D0 001E28D0 21084100 */  addu       $at, $2, $at
/* E29D4 001E28D4 E4E3228C */  lw         $2, -0x1C1C($at)
/* E29D8 001E28D8 05004018 */  blez       $2, .L001E28F0
/* E29DC 001E28DC 00000000 */   nop
/* E29E0 001E28E0 003F023C */  lui        $2, (0x3F000000 >> 16)
/* E29E4 001E28E4 00088244 */  mtc1       $2, $f1
/* E29E8 001E28E8 00000000 */  nop
/* E29EC 001E28EC 02000146 */  mul.s      $f0, $f0, $f1
.L001E28F0:
/* E29F0 001E28F0 21100302 */  addu       $2, $16, $3
/* E29F4 001E28F4 0200013C */  lui        $at, (0x20000 >> 16)
/* E29F8 001E28F8 21084100 */  addu       $at, $2, $at
/* E29FC 001E28FC 50E420E4 */  swc1       $f0, -0x1BB0($at)
/* E2A00 001E2900 01000224 */  addiu      $2, $0, 0x1
/* E2A04 001E2904 2000BF7B */  lq         $31, 0x20($sp)
/* E2A08 001E2908 1000B17B */  lq         $17, 0x10($sp)
/* E2A0C 001E290C 0000B07B */  lq         $16, 0x0($sp)
/* E2A10 001E2910 5000BD27 */  addiu      $sp, $sp, 0x50
/* E2A14 001E2914 0800E003 */  jr         $31
/* E2A18 001E2918 00000000 */   nop
/* E2A1C 001E291C 00000000 */  nop
