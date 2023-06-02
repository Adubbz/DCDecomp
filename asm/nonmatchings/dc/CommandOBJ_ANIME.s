.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandOBJ_ANIME__FPPv
/* 768C0 001767C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 768C4 001767C4 3000BF7F */  sq         $31, 0x30($sp)
/* 768C8 001767C8 2000B27F */  sq         $18, 0x20($sp)
/* 768CC 001767CC 1000B17F */  sq         $17, 0x10($sp)
/* 768D0 001767D0 0000B07F */  sq         $16, 0x0($sp)
/* 768D4 001767D4 28968070 */  paddub     $18, $4, $0
/* 768D8 001767D8 D08F848F */  lw         $4, -0x7030($gp)
/* 768DC 001767DC 80008328 */  slti       $3, $4, 0x80
/* 768E0 001767E0 07006014 */  bnez       $3, .L00176800
/* 768E4 001767E4 00000000 */   nop
/* 768E8 001767E8 2A00023C */  lui        $2, %hi(_734_2)
/* 768EC 001767EC 30A84424 */  addiu      $4, $2, %lo(_734_2)
/* 768F0 001767F0 A611040C */  jal        printf
/* 768F4 001767F4 00000000 */   nop
/* 768F8 001767F8 55000010 */  b          .L00176950
/* 768FC 001767FC 00000000 */   nop
.L00176800:
/* 76900 00176800 C0180400 */  sll        $3, $4, 3
/* 76904 00176804 21186400 */  addu       $3, $3, $4
/* 76908 00176808 00210300 */  sll        $4, $3, 4
/* 7690C 0017680C C08F838F */  lw         $3, -0x7040($gp)
/* 76910 00176810 21186400 */  addu       $3, $3, $4
/* 76914 00176814 0100013C */  lui        $at, (0x1A260 >> 16)
/* 76918 00176818 60A22134 */  ori        $at, $at, (0x1A260 & 0xFFFF)
/* 7691C 0017681C 21806100 */  addu       $16, $3, $at
/* 76920 00176820 0000438E */  lw         $3, 0x0($18)
/* 76924 00176824 0000638C */  lw         $3, 0x0($3)
/* 76928 00176828 100003AE */  sw         $3, 0x10($16)
/* 7692C 0017682C 1000038E */  lw         $3, 0x10($16)
/* 76930 00176830 04006004 */  bltz       $3, .L00176844
/* 76934 00176834 00000000 */   nop
/* 76938 00176838 04006328 */  slti       $3, $3, 0x4
/* 7693C 0017683C 03006014 */  bnez       $3, .L0017684C
/* 76940 00176840 00000000 */   nop
.L00176844:
/* 76944 00176844 42000010 */  b          .L00176950
/* 76948 00176848 00000000 */   nop
.L0017684C:
/* 7694C 0017684C 0400428E */  lw         $2, 0x4($18)
/* 76950 00176850 0000428C */  lw         $2, 0x0($2)
/* 76954 00176854 140002AE */  sw         $2, 0x14($16)
/* 76958 00176858 0800458E */  lw         $5, 0x8($18)
/* 7695C 0017685C 28260072 */  paddub     $4, $16, $0
/* 76960 00176860 5A15040C */  jal        strcpy
/* 76964 00176864 00000000 */   nop
/* 76968 00176868 0C00438E */  lw         $3, 0xC($18)
/* 7696C 0017686C 000060C4 */  lwc1       $f0, 0x0($3)
/* 76970 00176870 200000E6 */  swc1       $f0, 0x20($16)
/* 76974 00176874 1000438E */  lw         $3, 0x10($18)
/* 76978 00176878 000060C4 */  lwc1       $f0, 0x0($3)
/* 7697C 0017687C 240000E6 */  swc1       $f0, 0x24($16)
/* 76980 00176880 1400438E */  lw         $3, 0x14($18)
/* 76984 00176884 000060C4 */  lwc1       $f0, 0x0($3)
/* 76988 00176888 280000E6 */  swc1       $f0, 0x28($16)
/* 7698C 0017688C 1800438E */  lw         $3, 0x18($18)
/* 76990 00176890 000060C4 */  lwc1       $f0, 0x0($3)
/* 76994 00176894 400000E6 */  swc1       $f0, 0x40($16)
/* 76998 00176898 1C00438E */  lw         $3, 0x1C($18)
/* 7699C 0017689C 000060C4 */  lwc1       $f0, 0x0($3)
/* 769A0 001768A0 440000E6 */  swc1       $f0, 0x44($16)
/* 769A4 001768A4 2000438E */  lw         $3, 0x20($18)
/* 769A8 001768A8 000060C4 */  lwc1       $f0, 0x0($3)
/* 769AC 001768AC 480000E6 */  swc1       $f0, 0x48($16)
/* 769B0 001768B0 2400438E */  lw         $3, 0x24($18)
/* 769B4 001768B4 000060C4 */  lwc1       $f0, 0x0($3)
/* 769B8 001768B8 300000E6 */  swc1       $f0, 0x30($16)
/* 769BC 001768BC 2800438E */  lw         $3, 0x28($18)
/* 769C0 001768C0 000060C4 */  lwc1       $f0, 0x0($3)
/* 769C4 001768C4 340000E6 */  swc1       $f0, 0x34($16)
/* 769C8 001768C8 2C00438E */  lw         $3, 0x2C($18)
/* 769CC 001768CC 000060C4 */  lwc1       $f0, 0x0($3)
/* 769D0 001768D0 380000E6 */  swc1       $f0, 0x38($16)
/* 769D4 001768D4 F88F838F */  lw         $3, -0x7008($gp)
/* 769D8 001768D8 02006010 */  beqz       $3, .L001768E4
/* 769DC 001768DC 00000000 */   nop
/* 769E0 001768E0 98007124 */  addiu      $17, $3, 0x98
.L001768E4:
/* 769E4 001768E4 FC8F838F */  lw         $3, -0x7004($gp)
/* 769E8 001768E8 02006010 */  beqz       $3, .L001768F4
/* 769EC 001768EC 00000000 */   nop
/* 769F0 001768F0 68027124 */  addiu      $17, $3, 0x268
.L001768F4:
/* 769F4 001768F4 0090838F */  lw         $3, -0x7000($gp)
/* 769F8 001768F8 02006010 */  beqz       $3, .L00176904
/* 769FC 001768FC 00000000 */   nop
/* 76A00 00176900 68027124 */  addiu      $17, $3, 0x268
.L00176904:
/* 76A04 00176904 28260070 */  paddub     $4, $0, $0
/* 76A08 00176908 0B000010 */  b          .L00176938
/* 76A0C 0017690C 00000000 */   nop
.L00176910:
/* 76A10 00176910 40180400 */  sll        $3, $4, 1
/* 76A14 00176914 21282302 */  addu       $5, $17, $3
/* 76A18 00176918 0000A384 */  lh         $3, 0x0($5)
/* 76A1C 0017691C 0500601C */  bgtz       $3, .L00176934
/* 76A20 00176920 00000000 */   nop
/* 76A24 00176924 D08F8387 */  lh         $3, -0x7030($gp)
/* 76A28 00176928 0000A3A4 */  sh         $3, 0x0($5)
/* 76A2C 0017692C 05000010 */  b          .L00176944
/* 76A30 00176930 00000000 */   nop
.L00176934:
/* 76A34 00176934 01008424 */  addiu      $4, $4, 0x1
.L00176938:
/* 76A38 00176938 08008328 */  slti       $3, $4, 0x8
/* 76A3C 0017693C F4FF6014 */  bnez       $3, .L00176910
/* 76A40 00176940 00000000 */   nop
.L00176944:
/* 76A44 00176944 D08F838F */  lw         $3, -0x7030($gp)
/* 76A48 00176948 01006324 */  addiu      $3, $3, 0x1
/* 76A4C 0017694C D08F83AF */  sw         $3, -0x7030($gp)
.L00176950:
/* 76A50 00176950 3000BF7B */  lq         $31, 0x30($sp)
/* 76A54 00176954 2000B27B */  lq         $18, 0x20($sp)
/* 76A58 00176958 1000B17B */  lq         $17, 0x10($sp)
/* 76A5C 0017695C 0000B07B */  lq         $16, 0x0($sp)
/* 76A60 00176960 4000BD27 */  addiu      $sp, $sp, 0x40
/* 76A64 00176964 0800E003 */  jr         $31
/* 76A68 00176968 00000000 */   nop
/* 76A6C 0017696C 00000000 */  nop
