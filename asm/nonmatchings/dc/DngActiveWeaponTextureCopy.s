.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngActiveWeaponTextureCopy__Fv
/* 12A7B0 0022A6B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 12A7B4 0022A6B4 1000BF7F */  sq         $31, 0x10($sp)
/* 12A7B8 0022A6B8 0000B07F */  sq         $16, 0x0($sp)
/* 12A7BC 0022A6BC 789C858F */  lw         $5, -0x6388($gp)
/* 12A7C0 0022A6C0 0400A480 */  lb         $4, 0x4($5)
/* 12A7C4 0022A6C4 2000A327 */  addiu      $3, $sp, 0x20
/* 12A7C8 0022A6C8 A08982DF */  ld         $2, -0x7660($gp)
/* 12A7CC 0022A6CC 000062FC */  sd         $2, 0x0($3)
/* 12A7D0 0022A6D0 21108500 */  addu       $2, $4, $5
/* 12A7D4 0022A6D4 40434380 */  lb         $3, 0x4340($2)
/* 12A7D8 0022A6D8 A80A0224 */  addiu      $2, $0, 0xAA8
/* 12A7DC 0022A6DC 18108200 */  mult       $2, $4, $2
/* 12A7E0 0022A6E0 2110A200 */  addu       $2, $5, $2
/* 12A7E4 0022A6E4 0C454524 */  addiu      $5, $2, 0x450C
/* 12A7E8 0022A6E8 40110300 */  sll        $2, $3, 5
/* 12A7EC 0022A6EC 23104300 */  subu       $2, $2, $3
/* 12A7F0 0022A6F0 C0100200 */  sll        $2, $2, 3
/* 12A7F4 0022A6F4 2180A200 */  addu       $16, $5, $2
/* 12A7F8 0022A6F8 68CF070C */  jal        GetDefaultWeaponNo__Fi
/* 12A7FC 0022A6FC 00000000 */   nop
/* 12A800 0022A700 2900033C */  lui        $3, %hi(_1731)
/* 12A804 0022A704 E0426524 */  addiu      $5, $3, %lo(_1731)
/* 12A808 0022A708 2800A427 */  addiu      $4, $sp, 0x28
/* 12A80C 0022A70C 0000A3DC */  ld         $3, 0x0($5)
/* 12A810 0022A710 0800A0C4 */  lwc1       $f0, 0x8($5)
/* 12A814 0022A714 000083FC */  sd         $3, 0x0($4)
/* 12A818 0022A718 080080E4 */  swc1       $f0, 0x8($4)
/* 12A81C 0022A71C 3800A427 */  addiu      $4, $sp, 0x38
/* 12A820 0022A720 A88980C7 */  lwc1       $f0, -0x7658($gp)
/* 12A824 0022A724 AC898387 */  lh         $3, -0x7654($gp)
/* 12A828 0022A728 000080E4 */  swc1       $f0, 0x0($4)
/* 12A82C 0022A72C 040083A4 */  sh         $3, 0x4($4)
/* 12A830 0022A730 00000386 */  lh         $3, 0x0($16)
/* 12A834 0022A734 3800A3A7 */  sh         $3, 0x38($sp)
/* 12A838 0022A738 01004324 */  addiu      $3, $2, 0x1
/* 12A83C 0022A73C 3A00A3A7 */  sh         $3, 0x3A($sp)
/* 12A840 0022A740 3C00A2A7 */  sh         $2, 0x3C($sp)
/* 12A844 0022A744 28860070 */  paddub     $16, $0, $0
/* 12A848 0022A748 1C000010 */  b          .L0022A7BC
/* 12A84C 0022A74C 00000000 */   nop
.L0022A750:
/* 12A850 0022A750 40101000 */  sll        $2, $16, 1
/* 12A854 0022A754 21105D00 */  addu       $2, $2, $sp
/* 12A858 0022A758 38004484 */  lh         $4, 0x38($2)
/* 12A85C 0022A75C 7443070C */  jal        GetCommonItemInfo__Fi
/* 12A860 0022A760 00000000 */   nop
/* 12A864 0022A764 14004010 */  beqz       $2, .L0022A7B8
/* 12A868 0022A768 00000000 */   nop
/* 12A86C 0022A76C 04004384 */  lh         $3, 0x4($2)
/* 12A870 0022A770 07006230 */  andi       $2, $3, 0x7
/* 12A874 0022A774 04006104 */  bgez       $3, .L0022A788
/* 12A878 0022A778 00000000 */   nop
/* 12A87C 0022A77C 02004010 */  beqz       $2, .L0022A788
/* 12A880 0022A780 00000000 */   nop
/* 12A884 0022A784 F8FF4224 */  addiu      $2, $2, -0x8
.L0022A788:
/* 12A888 0022A788 40290200 */  sll        $5, $2, 5
/* 12A88C 0022A78C C3100300 */  sra        $2, $3, 3
/* 12A890 0022A790 40310200 */  sll        $6, $2, 5
/* 12A894 0022A794 80101000 */  sll        $2, $16, 2
/* 12A898 0022A798 21105D00 */  addu       $2, $2, $sp
/* 12A89C 0022A79C 28004884 */  lh         $8, 0x28($2)
/* 12A8A0 0022A7A0 2A004984 */  lh         $9, 0x2A($2)
/* 12A8A4 0022A7A4 2000A427 */  addiu      $4, $sp, 0x20
/* 12A8A8 0022A7A8 2A00023C */  lui        $2, %hi(_1728_2)
/* 12A8AC 0022A7AC 40F04724 */  addiu      $7, $2, %lo(_1728_2)
/* 12A8B0 0022A7B0 BCC7060C */  jal        setItemToReserved__FPciiPcii
/* 12A8B4 0022A7B4 00000000 */   nop
.L0022A7B8:
/* 12A8B8 0022A7B8 01001026 */  addiu      $16, $16, 0x1
.L0022A7BC:
/* 12A8BC 0022A7BC 0300022A */  slti       $2, $16, 0x3
/* 12A8C0 0022A7C0 E3FF4014 */  bnez       $2, .L0022A750
/* 12A8C4 0022A7C4 00000000 */   nop
/* 12A8C8 0022A7C8 01000224 */  addiu      $2, $0, 0x1
/* 12A8CC 0022A7CC 1000BF7B */  lq         $31, 0x10($sp)
/* 12A8D0 0022A7D0 0000B07B */  lq         $16, 0x0($sp)
/* 12A8D4 0022A7D4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 12A8D8 0022A7D8 0800E003 */  jr         $31
/* 12A8DC 0022A7DC 00000000 */   nop
