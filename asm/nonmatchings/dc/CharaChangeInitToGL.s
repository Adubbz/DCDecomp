.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaChangeInitToGL__FP1i
/* 10E6B0 0020E5B0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 10E6B4 0020E5B4 1000BF7F */  sq         $31, 0x10($sp)
/* 10E6B8 0020E5B8 0000B07F */  sq         $16, 0x0($sp)
/* 10E6BC 0020E5BC 2886A070 */  paddub     $16, $5, $0
/* 10E6C0 0020E5C0 FC9584AF */  sw         $4, -0x6A04($gp)
/* 10E6C4 0020E5C4 F89585A7 */  sh         $5, -0x6A08($gp)
/* 10E6C8 0020E5C8 DA01023C */  lui        $2, %hi(MenureadFile)
/* 10E6CC 0020E5CC E0EE4424 */  addiu      $4, $2, %lo(MenureadFile)
/* 10E6D0 0020E5D0 4C39080C */  jal        GetCharaChangeReadCharaFilePath__FPci
/* 10E6D4 0020E5D4 00000000 */   nop
/* 10E6D8 0020E5D8 FC95848F */  lw         $4, -0x6A04($gp)
/* 10E6DC 0020E5DC 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E6E0 0020E5E0 00000000 */   nop
/* 10E6E4 0020E5E4 FC9582AF */  sw         $2, -0x6A04($gp)
/* 10E6E8 0020E5E8 FC95828F */  lw         $2, -0x6A04($gp)
/* 10E6EC 0020E5EC 009682AF */  sw         $2, -0x6A00($gp)
/* 10E6F0 0020E5F0 30FB040C */  jal        StartReadBG__Fv
/* 10E6F4 0020E5F4 00000000 */   nop
/* 10E6F8 0020E5F8 DA01023C */  lui        $2, %hi(MenureadFile)
/* 10E6FC 0020E5FC E0EE4424 */  addiu      $4, $2, %lo(MenureadFile)
/* 10E700 0020E600 0096858F */  lw         $5, -0x6A00($gp)
/* 10E704 0020E604 DC00A627 */  addiu      $6, $sp, 0xDC
/* 10E708 0020E608 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E70C 0020E60C 00000000 */   nop
/* 10E710 0020E610 DC00A28F */  lw         $2, 0xDC($sp)
/* 10E714 0020E614 03110200 */  sra        $2, $2, 4
/* 10E718 0020E618 00190200 */  sll        $3, $2, 4
/* 10E71C 0020E61C 0096828F */  lw         $2, -0x6A00($gp)
/* 10E720 0020E620 21104300 */  addu       $2, $2, $3
/* 10E724 0020E624 10004224 */  addiu      $2, $2, 0x10
/* 10E728 0020E628 049682AF */  sw         $2, -0x69FC($gp)
/* 10E72C 0020E62C 0496848F */  lw         $4, -0x69FC($gp)
/* 10E730 0020E630 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E734 0020E634 00000000 */   nop
/* 10E738 0020E638 049682AF */  sw         $2, -0x69FC($gp)
/* 10E73C 0020E63C 6000A427 */  addiu      $4, $sp, 0x60
/* 10E740 0020E640 A000A527 */  addiu      $5, $sp, 0xA0
/* 10E744 0020E644 28360072 */  paddub     $6, $16, $0
/* 10E748 0020E648 283E0070 */  paddub     $7, $0, $0
/* 10E74C 0020E64C 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10E750 0020E650 00000000 */   nop
/* 10E754 0020E654 2000A427 */  addiu      $4, $sp, 0x20
/* 10E758 0020E658 2A00023C */  lui        $2, %hi(MenuWepDir)
/* 10E75C 0020E65C B0E04524 */  addiu      $5, $2, %lo(MenuWepDir)
/* 10E760 0020E660 5A15040C */  jal        strcpy
/* 10E764 0020E664 00000000 */   nop
/* 10E768 0020E668 2000A427 */  addiu      $4, $sp, 0x20
/* 10E76C 0020E66C 6000A527 */  addiu      $5, $sp, 0x60
/* 10E770 0020E670 BC14040C */  jal        strcat
/* 10E774 0020E674 00000000 */   nop
/* 10E778 0020E678 2000A427 */  addiu      $4, $sp, 0x20
/* 10E77C 0020E67C 0496858F */  lw         $5, -0x69FC($gp)
/* 10E780 0020E680 DC00A627 */  addiu      $6, $sp, 0xDC
/* 10E784 0020E684 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E788 0020E688 00000000 */   nop
/* 10E78C 0020E68C DC00A28F */  lw         $2, 0xDC($sp)
/* 10E790 0020E690 03110200 */  sra        $2, $2, 4
/* 10E794 0020E694 00190200 */  sll        $3, $2, 4
/* 10E798 0020E698 0496828F */  lw         $2, -0x69FC($gp)
/* 10E79C 0020E69C 21104300 */  addu       $2, $2, $3
/* 10E7A0 0020E6A0 10004224 */  addiu      $2, $2, 0x10
/* 10E7A4 0020E6A4 089682AF */  sw         $2, -0x69F8($gp)
/* 10E7A8 0020E6A8 0896848F */  lw         $4, -0x69F8($gp)
/* 10E7AC 0020E6AC 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E7B0 0020E6B0 00000000 */   nop
/* 10E7B4 0020E6B4 089682AF */  sw         $2, -0x69F8($gp)
/* 10E7B8 0020E6B8 6000A427 */  addiu      $4, $sp, 0x60
/* 10E7BC 0020E6BC A000A527 */  addiu      $5, $sp, 0xA0
/* 10E7C0 0020E6C0 28360072 */  paddub     $6, $16, $0
/* 10E7C4 0020E6C4 01000724 */  addiu      $7, $0, 0x1
/* 10E7C8 0020E6C8 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10E7CC 0020E6CC 00000000 */   nop
/* 10E7D0 0020E6D0 2000A427 */  addiu      $4, $sp, 0x20
/* 10E7D4 0020E6D4 2A00023C */  lui        $2, %hi(MenuWepDir)
/* 10E7D8 0020E6D8 B0E04524 */  addiu      $5, $2, %lo(MenuWepDir)
/* 10E7DC 0020E6DC 5A15040C */  jal        strcpy
/* 10E7E0 0020E6E0 00000000 */   nop
/* 10E7E4 0020E6E4 2000A427 */  addiu      $4, $sp, 0x20
/* 10E7E8 0020E6E8 6000A527 */  addiu      $5, $sp, 0x60
/* 10E7EC 0020E6EC BC14040C */  jal        strcat
/* 10E7F0 0020E6F0 00000000 */   nop
/* 10E7F4 0020E6F4 2000A427 */  addiu      $4, $sp, 0x20
/* 10E7F8 0020E6F8 0896858F */  lw         $5, -0x69F8($gp)
/* 10E7FC 0020E6FC DC00A627 */  addiu      $6, $sp, 0xDC
/* 10E800 0020E700 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E804 0020E704 00000000 */   nop
/* 10E808 0020E708 DC00A28F */  lw         $2, 0xDC($sp)
/* 10E80C 0020E70C 03110200 */  sra        $2, $2, 4
/* 10E810 0020E710 00190200 */  sll        $3, $2, 4
/* 10E814 0020E714 0896828F */  lw         $2, -0x69F8($gp)
/* 10E818 0020E718 21104300 */  addu       $2, $2, $3
/* 10E81C 0020E71C 10004224 */  addiu      $2, $2, 0x10
/* 10E820 0020E720 0C9682AF */  sw         $2, -0x69F4($gp)
/* 10E824 0020E724 0C96848F */  lw         $4, -0x69F4($gp)
/* 10E828 0020E728 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E82C 0020E72C 00000000 */   nop
/* 10E830 0020E730 0C9682AF */  sw         $2, -0x69F4($gp)
/* 10E834 0020E734 789C848F */  lw         $4, -0x6388($gp)
/* 10E838 0020E738 21100402 */  addu       $2, $16, $4
/* 10E83C 0020E73C 40434380 */  lb         $3, 0x4340($2)
/* 10E840 0020E740 40110300 */  sll        $2, $3, 5
/* 10E844 0020E744 23104300 */  subu       $2, $2, $3
/* 10E848 0020E748 C0180200 */  sll        $3, $2, 3
/* 10E84C 0020E74C A80A0224 */  addiu      $2, $0, 0xAA8
/* 10E850 0020E750 18100202 */  mult       $2, $16, $2
/* 10E854 0020E754 21108200 */  addu       $2, $4, $2
/* 10E858 0020E758 21204300 */  addu       $4, $2, $3
/* 10E85C 0020E75C 80181000 */  sll        $3, $16, 2
/* 10E860 0020E760 2900023C */  lui        $2, %hi(defWeapon_5)
/* 10E864 0020E764 60394224 */  addiu      $2, $2, %lo(defWeapon_5)
/* 10E868 0020E768 21104300 */  addu       $2, $2, $3
/* 10E86C 0020E76C 0000438C */  lw         $3, 0x0($2)
/* 10E870 0020E770 0C458284 */  lh         $2, 0x450C($4)
/* 10E874 0020E774 23384300 */  subu       $7, $2, $3
/* 10E878 0020E778 0200E104 */  bgez       $7, .L0020E784
/* 10E87C 0020E77C 00000000 */   nop
/* 10E880 0020E780 283E0070 */  paddub     $7, $0, $0
.L0020E784:
/* 10E884 0020E784 6000A427 */  addiu      $4, $sp, 0x60
/* 10E888 0020E788 A000A527 */  addiu      $5, $sp, 0xA0
/* 10E88C 0020E78C 28360072 */  paddub     $6, $16, $0
/* 10E890 0020E790 94DC060C */  jal        BtGetWeaponNamePath2__FPcPcii
/* 10E894 0020E794 00000000 */   nop
/* 10E898 0020E798 2000A427 */  addiu      $4, $sp, 0x20
/* 10E89C 0020E79C 2A00023C */  lui        $2, %hi(MenuWepDir)
/* 10E8A0 0020E7A0 B0E04524 */  addiu      $5, $2, %lo(MenuWepDir)
/* 10E8A4 0020E7A4 5A15040C */  jal        strcpy
/* 10E8A8 0020E7A8 00000000 */   nop
/* 10E8AC 0020E7AC 2000A427 */  addiu      $4, $sp, 0x20
/* 10E8B0 0020E7B0 6000A527 */  addiu      $5, $sp, 0x60
/* 10E8B4 0020E7B4 BC14040C */  jal        strcat
/* 10E8B8 0020E7B8 00000000 */   nop
/* 10E8BC 0020E7BC 2000A427 */  addiu      $4, $sp, 0x20
/* 10E8C0 0020E7C0 0C96858F */  lw         $5, -0x69F4($gp)
/* 10E8C4 0020E7C4 DC00A627 */  addiu      $6, $sp, 0xDC
/* 10E8C8 0020E7C8 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E8CC 0020E7CC 00000000 */   nop
/* 10E8D0 0020E7D0 DC00A28F */  lw         $2, 0xDC($sp)
/* 10E8D4 0020E7D4 03110200 */  sra        $2, $2, 4
/* 10E8D8 0020E7D8 00190200 */  sll        $3, $2, 4
/* 10E8DC 0020E7DC 0C96828F */  lw         $2, -0x69F4($gp)
/* 10E8E0 0020E7E0 21104300 */  addu       $2, $2, $3
/* 10E8E4 0020E7E4 10004224 */  addiu      $2, $2, 0x10
/* 10E8E8 0020E7E8 EC9582AF */  sw         $2, -0x6A14($gp)
/* 10E8EC 0020E7EC EC95848F */  lw         $4, -0x6A14($gp)
/* 10E8F0 0020E7F0 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10E8F4 0020E7F4 00000000 */   nop
/* 10E8F8 0020E7F8 EC9582AF */  sw         $2, -0x6A14($gp)
/* 10E8FC 0020E7FC 789C858F */  lw         $5, -0x6388($gp)
/* 10E900 0020E800 0800A014 */  bnez       $5, .L0020E824
/* 10E904 0020E804 00000000 */   nop
/* 10E908 0020E808 2A00023C */  lui        $2, %hi(_1236)
/* 10E90C 0020E80C 20E14424 */  addiu      $4, $2, %lo(_1236)
/* 10E910 0020E810 A611040C */  jal        printf
/* 10E914 0020E814 00000000 */   nop
/* 10E918 0020E818 FFFF0224 */  addiu      $2, $0, -0x1
/* 10E91C 0020E81C 1C000010 */  b          .L0020E890
/* 10E920 0020E820 00000000 */   nop
.L0020E824:
/* 10E924 0020E824 F8958487 */  lh         $4, -0x6A08($gp)
/* 10E928 0020E828 21108500 */  addu       $2, $4, $5
/* 10E92C 0020E82C 40434380 */  lb         $3, 0x4340($2)
/* 10E930 0020E830 A80A0224 */  addiu      $2, $0, 0xAA8
/* 10E934 0020E834 18108200 */  mult       $2, $4, $2
/* 10E938 0020E838 2110A200 */  addu       $2, $5, $2
/* 10E93C 0020E83C 0C454524 */  addiu      $5, $2, 0x450C
/* 10E940 0020E840 40110300 */  sll        $2, $3, 5
/* 10E944 0020E844 23104300 */  subu       $2, $2, $3
/* 10E948 0020E848 C0100200 */  sll        $2, $2, 3
/* 10E94C 0020E84C 2110A200 */  addu       $2, $5, $2
/* 10E950 0020E850 16004580 */  lb         $5, 0x16($2)
/* 10E954 0020E854 18E8760C */  jal        func_1DBA060
/* 10E958 0020E858 00000000 */   nop
/* 10E95C 0020E85C E89582AF */  sw         $2, -0x6A18($gp)
/* 10E960 0020E860 B000A427 */  addiu      $4, $sp, 0xB0
/* 10E964 0020E864 2A00023C */  lui        $2, %hi(_936_3)
/* 10E968 0020E868 B0DD4524 */  addiu      $5, $2, %lo(_936_3)
/* 10E96C 0020E86C E895868F */  lw         $6, -0x6A18($gp)
/* 10E970 0020E870 1614040C */  jal        sprintf
/* 10E974 0020E874 00000000 */   nop
/* 10E978 0020E878 EC95858F */  lw         $5, -0x6A14($gp)
/* 10E97C 0020E87C B000A427 */  addiu      $4, $sp, 0xB0
/* 10E980 0020E880 DC00A627 */  addiu      $6, $sp, 0xDC
/* 10E984 0020E884 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10E988 0020E888 00000000 */   nop
/* 10E98C 0020E88C 01000224 */  addiu      $2, $0, 0x1
.L0020E890:
/* 10E990 0020E890 1000BF7B */  lq         $31, 0x10($sp)
/* 10E994 0020E894 0000B07B */  lq         $16, 0x0($sp)
/* 10E998 0020E898 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 10E99C 0020E89C 0800E003 */  jr         $31
/* 10E9A0 0020E8A0 00000000 */   nop
/* 10E9A4 0020E8A4 00000000 */  nop
/* 10E9A8 0020E8A8 00000000 */  nop
/* 10E9AC 0020E8AC 00000000 */  nop
