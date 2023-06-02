.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetLevelUpWeaponData__14CWeaponLevelUpFv
/* 136870 00236770 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 136874 00236774 2000BF7F */  sq         $31, 0x20($sp)
/* 136878 00236778 1000B17F */  sq         $17, 0x10($sp)
/* 13687C 0023677C 0000B07F */  sq         $16, 0x0($sp)
/* 136880 00236780 28868070 */  paddub     $16, $4, $0
/* 136884 00236784 D412828C */  lw         $2, 0x12D4($4)
/* 136888 00236788 00004484 */  lh         $4, 0x0($2)
/* 13688C 0023678C D443070C */  jal        GetWeaponData__Fi
/* 136890 00236790 00000000 */   nop
/* 136894 00236794 D412048E */  lw         $4, 0x12D4($16)
/* 136898 00236798 04008384 */  lh         $3, 0x4($4)
/* 13689C 0023679C 01006324 */  addiu      $3, $3, 0x1
/* 1368A0 002367A0 040083A4 */  sh         $3, 0x4($4)
/* 1368A4 002367A4 D412038E */  lw         $3, 0x12D4($16)
/* 1368A8 002367A8 04006524 */  addiu      $5, $3, 0x4
/* 1368AC 002367AC 04006484 */  lh         $4, 0x4($3)
/* 1368B0 002367B0 44004384 */  lh         $3, 0x44($2)
/* 1368B4 002367B4 2A086400 */  slt        $at, $3, $4
/* 1368B8 002367B8 02002010 */  beqz       $at, .L002367C4
/* 1368BC 002367BC 00000000 */   nop
/* 1368C0 002367C0 0000A3A4 */  sh         $3, 0x0($5)
.L002367C4:
/* 1368C4 002367C4 D412048E */  lw         $4, 0x12D4($16)
/* 1368C8 002367C8 06008384 */  lh         $3, 0x6($4)
/* 1368CC 002367CC 01006324 */  addiu      $3, $3, 0x1
/* 1368D0 002367D0 060083A4 */  sh         $3, 0x6($4)
/* 1368D4 002367D4 D412038E */  lw         $3, 0x12D4($16)
/* 1368D8 002367D8 06006424 */  addiu      $4, $3, 0x6
/* 1368DC 002367DC 06006384 */  lh         $3, 0x6($3)
/* 1368E0 002367E0 64006128 */  slti       $at, $3, 0x64
/* 1368E4 002367E4 03002014 */  bnez       $at, .L002367F4
/* 1368E8 002367E8 00000000 */   nop
/* 1368EC 002367EC 63000324 */  addiu      $3, $0, 0x63
/* 1368F0 002367F0 000083A4 */  sh         $3, 0x0($4)
.L002367F4:
/* 1368F4 002367F4 D412048E */  lw         $4, 0x12D4($16)
/* 1368F8 002367F8 08008384 */  lh         $3, 0x8($4)
/* 1368FC 002367FC 01006324 */  addiu      $3, $3, 0x1
/* 136900 00236800 080083A4 */  sh         $3, 0x8($4)
/* 136904 00236804 D412038E */  lw         $3, 0x12D4($16)
/* 136908 00236808 08006424 */  addiu      $4, $3, 0x8
/* 13690C 0023680C 08006384 */  lh         $3, 0x8($3)
/* 136910 00236810 64006128 */  slti       $at, $3, 0x64
/* 136914 00236814 03002014 */  bnez       $at, .L00236824
/* 136918 00236818 00000000 */   nop
/* 13691C 0023681C 63000324 */  addiu      $3, $0, 0x63
/* 136920 00236820 000083A4 */  sh         $3, 0x0($4)
.L00236824:
/* 136924 00236824 D412048E */  lw         $4, 0x12D4($16)
/* 136928 00236828 0A008384 */  lh         $3, 0xA($4)
/* 13692C 0023682C 01006324 */  addiu      $3, $3, 0x1
/* 136930 00236830 0A0083A4 */  sh         $3, 0xA($4)
/* 136934 00236834 D412038E */  lw         $3, 0x12D4($16)
/* 136938 00236838 0A006424 */  addiu      $4, $3, 0xA
/* 13693C 0023683C 0A006384 */  lh         $3, 0xA($3)
/* 136940 00236840 46004284 */  lh         $2, 0x46($2)
/* 136944 00236844 2A084300 */  slt        $at, $2, $3
/* 136948 00236848 02002010 */  beqz       $at, .L00236854
/* 13694C 0023684C 00000000 */   nop
/* 136950 00236850 000082A4 */  sh         $2, 0x0($4)
.L00236854:
/* 136954 00236854 D412028E */  lw         $2, 0x12D4($16)
/* 136958 00236858 0C005124 */  addiu      $17, $2, 0xC
/* 13695C 0023685C BE11040C */  jal        rand
/* 136960 00236860 00000000 */   nop
/* 136964 00236864 03000324 */  addiu      $3, $0, 0x3
/* 136968 00236868 1A004300 */  div        $0, $2, $3
/* 13696C 0023686C 00000000 */  nop
/* 136970 00236870 00000000 */  nop
/* 136974 00236874 10200000 */  mfhi       $4
/* 136978 00236878 00002386 */  lh         $3, 0x0($17)
/* 13697C 0023687C 01006324 */  addiu      $3, $3, 0x1
/* 136980 00236880 21186400 */  addu       $3, $3, $4
/* 136984 00236884 000023A6 */  sh         $3, 0x0($17)
/* 136988 00236888 D412038E */  lw         $3, 0x12D4($16)
/* 13698C 0023688C 0C006424 */  addiu      $4, $3, 0xC
/* 136990 00236890 0C006384 */  lh         $3, 0xC($3)
/* 136994 00236894 64006128 */  slti       $at, $3, 0x64
/* 136998 00236898 03002014 */  bnez       $at, .L002368A8
/* 13699C 0023689C 00000000 */   nop
/* 1369A0 002368A0 63000324 */  addiu      $3, $0, 0x63
/* 1369A4 002368A4 000083A4 */  sh         $3, 0x0($4)
.L002368A8:
/* 1369A8 002368A8 D412038E */  lw         $3, 0x12D4($16)
/* 1369AC 002368AC 140060A4 */  sh         $0, 0x14($3)
/* 1369B0 002368B0 2000BF7B */  lq         $31, 0x20($sp)
/* 1369B4 002368B4 1000B17B */  lq         $17, 0x10($sp)
/* 1369B8 002368B8 0000B07B */  lq         $16, 0x0($sp)
/* 1369BC 002368BC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 1369C0 002368C0 0800E003 */  jr         $31
/* 1369C4 002368C4 00000000 */   nop
/* 1369C8 002368C8 00000000 */  nop
/* 1369CC 002368CC 00000000 */  nop
