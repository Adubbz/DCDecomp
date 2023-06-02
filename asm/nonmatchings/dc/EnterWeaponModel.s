.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnterWeaponModel__Fiii
/* 10D5C0 0020D4C0 60FEBD27 */  addiu      $sp, $sp, -0x1A0
/* 10D5C4 0020D4C4 9000BF7F */  sq         $31, 0x90($sp)
/* 10D5C8 0020D4C8 8000BE7F */  sq         $fp, 0x80($sp)
/* 10D5CC 0020D4CC 7000B77F */  sq         $23, 0x70($sp)
/* 10D5D0 0020D4D0 6000B67F */  sq         $22, 0x60($sp)
/* 10D5D4 0020D4D4 5000B57F */  sq         $21, 0x50($sp)
/* 10D5D8 0020D4D8 4000B47F */  sq         $20, 0x40($sp)
/* 10D5DC 0020D4DC 3000B37F */  sq         $19, 0x30($sp)
/* 10D5E0 0020D4E0 2000B27F */  sq         $18, 0x20($sp)
/* 10D5E4 0020D4E4 1000B17F */  sq         $17, 0x10($sp)
/* 10D5E8 0020D4E8 0000B07F */  sq         $16, 0x0($sp)
/* 10D5EC 0020D4EC 288E8070 */  paddub     $17, $4, $0
/* 10D5F0 0020D4F0 28B6A070 */  paddub     $22, $5, $0
/* 10D5F4 0020D4F4 28260070 */  paddub     $4, $0, $0
/* 10D5F8 0020D4F8 18FB040C */  jal        GetReadBGFile__Fi
/* 10D5FC 0020D4FC 00000000 */   nop
/* 10D600 0020D500 28F64070 */  paddub     $fp, $2, $0
/* 10D604 0020D504 01000424 */  addiu      $4, $0, 0x1
/* 10D608 0020D508 18FB040C */  jal        GetReadBGFile__Fi
/* 10D60C 0020D50C 00000000 */   nop
/* 10D610 0020D510 28964070 */  paddub     $18, $2, $0
/* 10D614 0020D514 02000424 */  addiu      $4, $0, 0x2
/* 10D618 0020D518 18FB040C */  jal        GetReadBGFile__Fi
/* 10D61C 0020D51C 00000000 */   nop
/* 10D620 0020D520 289E4070 */  paddub     $19, $2, $0
/* 10D624 0020D524 2900023C */  lui        $2, %hi(_991)
/* 10D628 0020D528 103A4224 */  addiu      $2, $2, %lo(_991)
/* 10D62C 0020D52C A000A427 */  addiu      $4, $sp, 0xA0
/* 10D630 0020D530 00004378 */  lq         $3, 0x0($2)
/* 10D634 0020D534 100042DC */  ld         $2, 0x10($2)
/* 10D638 0020D538 0000837C */  sq         $3, 0x0($4)
/* 10D63C 0020D53C 100082FC */  sd         $2, 0x10($4)
/* 10D640 0020D540 80B81100 */  sll        $23, $17, 2
/* 10D644 0020D544 40181100 */  sll        $3, $17, 1
/* 10D648 0020D548 2900023C */  lui        $2, %hi(MenuCharaWeaponMax)
/* 10D64C 0020D54C A82B4224 */  addiu      $2, $2, %lo(MenuCharaWeaponMax)
/* 10D650 0020D550 21104300 */  addu       $2, $2, $3
/* 10D654 0020D554 00005484 */  lh         $20, 0x0($2)
/* 10D658 0020D558 2900023C */  lui        $2, %hi(_998)
/* 10D65C 0020D55C 303A4224 */  addiu      $2, $2, %lo(_998)
/* 10D660 0020D560 C000A427 */  addiu      $4, $sp, 0xC0
/* 10D664 0020D564 00004378 */  lq         $3, 0x0($2)
/* 10D668 0020D568 100042DC */  ld         $2, 0x10($2)
/* 10D66C 0020D56C 0000837C */  sq         $3, 0x0($4)
/* 10D670 0020D570 100082FC */  sd         $2, 0x10($4)
/* 10D674 0020D574 7034080C */  jal        GetNowTestNo__Fv
/* 10D678 0020D578 00000000 */   nop
/* 10D67C 0020D57C 01000324 */  addiu      $3, $0, 0x1
/* 10D680 0020D580 05004310 */  beq        $2, $3, .L0020D598
/* 10D684 0020D584 00000000 */   nop
/* 10D688 0020D588 D8004010 */  beqz       $2, .L0020D8EC
/* 10D68C 0020D58C 00000000 */   nop
/* 10D690 0020D590 D6000010 */  b          .L0020D8EC
/* 10D694 0020D594 00000000 */   nop
.L0020D598:
/* 10D698 0020D598 2900023C */  lui        $2, %hi(_1003_2)
/* 10D69C 0020D59C 503A4524 */  addiu      $5, $2, %lo(_1003_2)
/* 10D6A0 0020D5A0 7001A427 */  addiu      $4, $sp, 0x170
/* 10D6A4 0020D5A4 02000324 */  addiu      $3, $0, 0x2
.L0020D5A8:
/* 10D6A8 0020D5A8 0000A278 */  lq         $2, 0x0($5)
/* 10D6AC 0020D5AC 1000A524 */  addiu      $5, $5, 0x10
/* 10D6B0 0020D5B0 FFFF6324 */  addiu      $3, $3, -0x1
/* 10D6B4 0020D5B4 0000827C */  sq         $2, 0x0($4)
/* 10D6B8 0020D5B8 10008424 */  addiu      $4, $4, 0x10
/* 10D6BC 0020D5BC FAFF601C */  bgtz       $3, .L0020D5A8
/* 10D6C0 0020D5C0 00000000 */   nop
/* 10D6C4 0020D5C4 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 10D6C8 0020D5C8 000082E4 */  swc1       $f2, 0x0($4)
/* 10D6CC 0020D5CC F494858F */  lw         $5, -0x6B0C($gp)
/* 10D6D0 0020D5D0 7401A5AF */  sw         $5, 0x174($sp)
/* 10D6D4 0020D5D4 8001A5AF */  sw         $5, 0x180($sp)
/* 10D6D8 0020D5D8 8C00428E */  lw         $2, 0x8C($18)
/* 10D6DC 0020D5DC 7C01A2AF */  sw         $2, 0x17C($sp)
/* 10D6E0 0020D5E0 C701023C */  lui        $2, %hi(TexManager)
/* 10D6E4 0020D5E4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10D6E8 0020D5E8 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 10D6EC 0020D5EC 00000000 */   nop
/* 10D6F0 0020D5F0 C701023C */  lui        $2, %hi(TexManager)
/* 10D6F4 0020D5F4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10D6F8 0020D5F8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 10D6FC 0020D5FC 00000000 */   nop
/* 10D700 0020D600 C701023C */  lui        $2, %hi(TexManager)
/* 10D704 0020D604 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10D708 0020D608 FFFF0524 */  addiu      $5, $0, -0x1
/* 10D70C 0020D60C 7001A627 */  addiu      $6, $sp, 0x170
/* 10D710 0020D610 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 10D714 0020D614 00000000 */   nop
/* 10D718 0020D618 C701023C */  lui        $2, %hi(TexManager)
/* 10D71C 0020D61C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 10D720 0020D620 2A00023C */  lui        $2, %hi(_1032)
/* 10D724 0020D624 F0DE4524 */  addiu      $5, $2, %lo(_1032)
/* 10D728 0020D628 F494868F */  lw         $6, -0x6B0C($gp)
/* 10D72C 0020D62C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 10D730 0020D630 00000000 */   nop
/* 10D734 0020D634 B09682AF */  sw         $2, -0x6950($gp)
/* 10D738 0020D638 281E0070 */  paddub     $3, $0, $0
/* 10D73C 0020D63C 04000010 */  b          .L0020D650
/* 10D740 0020D640 00000000 */   nop
.L0020D644:
/* 10D744 0020D644 21107D00 */  addu       $2, $3, $sp
/* 10D748 0020D648 E00043A0 */  sb         $3, 0xE0($2)
/* 10D74C 0020D64C 01006324 */  addiu      $3, $3, 0x1
.L0020D650:
/* 10D750 0020D650 3C841400 */  dsll32     $16, $20, 16
/* 10D754 0020D654 3F841000 */  dsra32     $16, $16, 16
/* 10D758 0020D658 2A107000 */  slt        $2, $3, $16
/* 10D75C 0020D65C F9FF4014 */  bnez       $2, .L0020D644
/* 10D760 0020D660 00000000 */   nop
/* 10D764 0020D664 F434080C */  jal        InitMenuWeaponModelData__Fv
/* 10D768 0020D668 00000000 */   nop
/* 10D76C 0020D66C 28A60070 */  paddub     $20, $0, $0
/* 10D770 0020D670 85000010 */  b          .L0020D888
/* 10D774 0020D674 00000000 */   nop
.L0020D678:
/* 10D778 0020D678 2110FD02 */  addu       $2, $23, $sp
/* 10D77C 0020D67C C000558C */  lw         $21, 0xC0($2)
/* 10D780 0020D680 1001A427 */  addiu      $4, $sp, 0x110
/* 10D784 0020D684 282EA072 */  paddub     $5, $21, $0
/* 10D788 0020D688 5A15040C */  jal        strcpy
/* 10D78C 0020D68C 00000000 */   nop
/* 10D790 0020D690 3001A427 */  addiu      $4, $sp, 0x130
/* 10D794 0020D694 282EA072 */  paddub     $5, $21, $0
/* 10D798 0020D698 5A15040C */  jal        strcpy
/* 10D79C 0020D69C 00000000 */   nop
/* 10D7A0 0020D6A0 5001A427 */  addiu      $4, $sp, 0x150
/* 10D7A4 0020D6A4 282EA072 */  paddub     $5, $21, $0
/* 10D7A8 0020D6A8 5A15040C */  jal        strcpy
/* 10D7AC 0020D6AC 00000000 */   nop
/* 10D7B0 0020D6B0 21109D02 */  addu       $2, $20, $sp
/* 10D7B4 0020D6B4 E0005580 */  lb         $21, 0xE0($2)
/* 10D7B8 0020D6B8 2A08A002 */  slt        $at, $21, $0
/* 10D7BC 0020D6BC 24002014 */  bnez       $at, .L0020D750
/* 10D7C0 0020D6C0 00000000 */   nop
/* 10D7C4 0020D6C4 0A00A12A */  slti       $at, $21, 0xA
/* 10D7C8 0020D6C8 21002010 */  beqz       $at, .L0020D750
/* 10D7CC 0020D6CC 00000000 */   nop
/* 10D7D0 0020D6D0 5001A427 */  addiu      $4, $sp, 0x150
/* 10D7D4 0020D6D4 2A00023C */  lui        $2, %hi(_1033)
/* 10D7D8 0020D6D8 F8DE4524 */  addiu      $5, $2, %lo(_1033)
/* 10D7DC 0020D6DC BC14040C */  jal        strcat
/* 10D7E0 0020D6E0 00000000 */   nop
/* 10D7E4 0020D6E4 5001A427 */  addiu      $4, $sp, 0x150
/* 10D7E8 0020D6E8 282E8070 */  paddub     $5, $4, $0
/* 10D7EC 0020D6EC 2836A072 */  paddub     $6, $21, $0
/* 10D7F0 0020D6F0 1614040C */  jal        sprintf
/* 10D7F4 0020D6F4 00000000 */   nop
/* 10D7F8 0020D6F8 1001A427 */  addiu      $4, $sp, 0x110
/* 10D7FC 0020D6FC 2A00023C */  lui        $2, %hi(_1033)
/* 10D800 0020D700 F8DE4524 */  addiu      $5, $2, %lo(_1033)
/* 10D804 0020D704 BC14040C */  jal        strcat
/* 10D808 0020D708 00000000 */   nop
/* 10D80C 0020D70C 1001A427 */  addiu      $4, $sp, 0x110
/* 10D810 0020D710 282E8070 */  paddub     $5, $4, $0
/* 10D814 0020D714 2836A072 */  paddub     $6, $21, $0
/* 10D818 0020D718 1614040C */  jal        sprintf
/* 10D81C 0020D71C 00000000 */   nop
/* 10D820 0020D720 3001A427 */  addiu      $4, $sp, 0x130
/* 10D824 0020D724 2A00023C */  lui        $2, %hi(_1033)
/* 10D828 0020D728 F8DE4524 */  addiu      $5, $2, %lo(_1033)
/* 10D82C 0020D72C BC14040C */  jal        strcat
/* 10D830 0020D730 00000000 */   nop
/* 10D834 0020D734 3001A427 */  addiu      $4, $sp, 0x130
/* 10D838 0020D738 282E8070 */  paddub     $5, $4, $0
/* 10D83C 0020D73C 2836A072 */  paddub     $6, $21, $0
/* 10D840 0020D740 1614040C */  jal        sprintf
/* 10D844 0020D744 00000000 */   nop
/* 10D848 0020D748 33000010 */  b          .L0020D818
/* 10D84C 0020D74C 00000000 */   nop
.L0020D750:
/* 10D850 0020D750 0A00A22A */  slti       $2, $21, 0xA
/* 10D854 0020D754 21004014 */  bnez       $2, .L0020D7DC
/* 10D858 0020D758 00000000 */   nop
/* 10D85C 0020D75C 5001A427 */  addiu      $4, $sp, 0x150
/* 10D860 0020D760 2A00023C */  lui        $2, %hi(_1034_2)
/* 10D864 0020D764 00DF4524 */  addiu      $5, $2, %lo(_1034_2)
/* 10D868 0020D768 BC14040C */  jal        strcat
/* 10D86C 0020D76C 00000000 */   nop
/* 10D870 0020D770 5001A427 */  addiu      $4, $sp, 0x150
/* 10D874 0020D774 282E8070 */  paddub     $5, $4, $0
/* 10D878 0020D778 2836A072 */  paddub     $6, $21, $0
/* 10D87C 0020D77C 1614040C */  jal        sprintf
/* 10D880 0020D780 00000000 */   nop
/* 10D884 0020D784 1001A427 */  addiu      $4, $sp, 0x110
/* 10D888 0020D788 2A00023C */  lui        $2, %hi(_1034_2)
/* 10D88C 0020D78C 00DF4524 */  addiu      $5, $2, %lo(_1034_2)
/* 10D890 0020D790 BC14040C */  jal        strcat
/* 10D894 0020D794 00000000 */   nop
/* 10D898 0020D798 1001A427 */  addiu      $4, $sp, 0x110
/* 10D89C 0020D79C 282E8070 */  paddub     $5, $4, $0
/* 10D8A0 0020D7A0 2836A072 */  paddub     $6, $21, $0
/* 10D8A4 0020D7A4 1614040C */  jal        sprintf
/* 10D8A8 0020D7A8 00000000 */   nop
/* 10D8AC 0020D7AC 3001A427 */  addiu      $4, $sp, 0x130
/* 10D8B0 0020D7B0 2A00023C */  lui        $2, %hi(_1034_2)
/* 10D8B4 0020D7B4 00DF4524 */  addiu      $5, $2, %lo(_1034_2)
/* 10D8B8 0020D7B8 BC14040C */  jal        strcat
/* 10D8BC 0020D7BC 00000000 */   nop
/* 10D8C0 0020D7C0 3001A427 */  addiu      $4, $sp, 0x130
/* 10D8C4 0020D7C4 282E8070 */  paddub     $5, $4, $0
/* 10D8C8 0020D7C8 2836A072 */  paddub     $6, $21, $0
/* 10D8CC 0020D7CC 1614040C */  jal        sprintf
/* 10D8D0 0020D7D0 00000000 */   nop
/* 10D8D4 0020D7D4 10000010 */  b          .L0020D818
/* 10D8D8 0020D7D8 00000000 */   nop
.L0020D7DC:
/* 10D8DC 0020D7DC 5001A427 */  addiu      $4, $sp, 0x150
/* 10D8E0 0020D7E0 2A00023C */  lui        $2, %hi(_1035_3)
/* 10D8E4 0020D7E4 08DF4524 */  addiu      $5, $2, %lo(_1035_3)
/* 10D8E8 0020D7E8 BC14040C */  jal        strcat
/* 10D8EC 0020D7EC 00000000 */   nop
/* 10D8F0 0020D7F0 1001A427 */  addiu      $4, $sp, 0x110
/* 10D8F4 0020D7F4 2A00023C */  lui        $2, %hi(_1035_3)
/* 10D8F8 0020D7F8 08DF4524 */  addiu      $5, $2, %lo(_1035_3)
/* 10D8FC 0020D7FC BC14040C */  jal        strcat
/* 10D900 0020D800 00000000 */   nop
/* 10D904 0020D804 3001A427 */  addiu      $4, $sp, 0x130
/* 10D908 0020D808 2A00023C */  lui        $2, %hi(_1036_2)
/* 10D90C 0020D80C 10DF4524 */  addiu      $5, $2, %lo(_1036_2)
/* 10D910 0020D810 BC14040C */  jal        strcat
/* 10D914 0020D814 00000000 */   nop
.L0020D818:
/* 10D918 0020D818 5001A427 */  addiu      $4, $sp, 0x150
/* 10D91C 0020D81C 2A00023C */  lui        $2, %hi(_1037_2)
/* 10D920 0020D820 18DF4524 */  addiu      $5, $2, %lo(_1037_2)
/* 10D924 0020D824 BC14040C */  jal        strcat
/* 10D928 0020D828 00000000 */   nop
/* 10D92C 0020D82C 1001A427 */  addiu      $4, $sp, 0x110
/* 10D930 0020D830 2A00023C */  lui        $2, %hi(_1038_2)
/* 10D934 0020D834 20DF4524 */  addiu      $5, $2, %lo(_1038_2)
/* 10D938 0020D838 BC14040C */  jal        strcat
/* 10D93C 0020D83C 00000000 */   nop
/* 10D940 0020D840 3001A427 */  addiu      $4, $sp, 0x130
/* 10D944 0020D844 2A00023C */  lui        $2, %hi(_1039_2)
/* 10D948 0020D848 28DF4524 */  addiu      $5, $2, %lo(_1039_2)
/* 10D94C 0020D84C BC14040C */  jal        strcat
/* 10D950 0020D850 00000000 */   nop
/* 10D954 0020D854 8C00C48F */  lw         $4, 0x8C($fp)
/* 10D958 0020D858 5001A527 */  addiu      $5, $sp, 0x150
/* 10D95C 0020D85C 28360070 */  paddub     $6, $0, $0
/* 10D960 0020D860 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 10D964 0020D864 00000000 */   nop
/* 10D968 0020D868 282E4070 */  paddub     $5, $2, $0
/* 10D96C 0020D86C 0500A010 */  beqz       $5, .L0020D884
/* 10D970 0020D870 00000000 */   nop
/* 10D974 0020D874 28268072 */  paddub     $4, $20, $0
/* 10D978 0020D878 EC34080C */  jal        GetMenuWeaponModelData__Fi
/* 10D97C 0020D87C 00000000 */   nop
/* 10D980 0020D880 000045AC */  sw         $5, 0x0($2)
.L0020D884:
/* 10D984 0020D884 01009426 */  addiu      $20, $20, 0x1
.L0020D888:
/* 10D988 0020D888 2A109002 */  slt        $2, $20, $16
/* 10D98C 0020D88C 7AFF4014 */  bnez       $2, .L0020D678
/* 10D990 0020D890 00000000 */   nop
/* 10D994 0020D894 0A006012 */  beqz       $19, .L0020D8C0
/* 10D998 0020D898 00000000 */   nop
/* 10D99C 0020D89C 8C00648E */  lw         $4, 0x8C($19)
/* 10D9A0 0020D8A0 2834080C */  jal        SetWepEffectMenuReadBuf__FP1
/* 10D9A4 0020D8A4 00000000 */   nop
/* 10D9A8 0020D8A8 8C00628E */  lw         $2, 0x8C($19)
/* 10D9AC 0020D8AC 0200013C */  lui        $at, (0x2D010 >> 16)
/* 10D9B0 0020D8B0 10D02134 */  ori        $at, $at, (0x2D010 & 0xFFFF)
/* 10D9B4 0020D8B4 21104100 */  addu       $2, $2, $at
/* 10D9B8 0020D8B8 07000010 */  b          .L0020D8D8
/* 10D9BC 0020D8BC 00000000 */   nop
.L0020D8C0:
/* 10D9C0 0020D8C0 9000428E */  lw         $2, 0x90($18)
/* 10D9C4 0020D8C4 03110200 */  sra        $2, $2, 4
/* 10D9C8 0020D8C8 00190200 */  sll        $3, $2, 4
/* 10D9CC 0020D8CC 8C00428E */  lw         $2, 0x8C($18)
/* 10D9D0 0020D8D0 21104300 */  addu       $2, $2, $3
/* 10D9D4 0020D8D4 10004224 */  addiu      $2, $2, 0x10
.L0020D8D8:
/* 10D9D8 0020D8D8 F09582AF */  sw         $2, -0x6A10($gp)
/* 10D9DC 0020D8DC 28262072 */  paddub     $4, $17, $0
/* 10D9E0 0020D8E0 282EC072 */  paddub     $5, $22, $0
/* 10D9E4 0020D8E4 4C36080C */  jal        WeaponModelBuildFunc__Fii
/* 10D9E8 0020D8E8 00000000 */   nop
.L0020D8EC:
/* 10D9EC 0020D8EC 01000224 */  addiu      $2, $0, 0x1
/* 10D9F0 0020D8F0 9000BF7B */  lq         $31, 0x90($sp)
/* 10D9F4 0020D8F4 8000BE7B */  lq         $fp, 0x80($sp)
/* 10D9F8 0020D8F8 7000B77B */  lq         $23, 0x70($sp)
/* 10D9FC 0020D8FC 6000B67B */  lq         $22, 0x60($sp)
/* 10DA00 0020D900 5000B57B */  lq         $21, 0x50($sp)
/* 10DA04 0020D904 4000B47B */  lq         $20, 0x40($sp)
/* 10DA08 0020D908 3000B37B */  lq         $19, 0x30($sp)
/* 10DA0C 0020D90C 2000B27B */  lq         $18, 0x20($sp)
/* 10DA10 0020D910 1000B17B */  lq         $17, 0x10($sp)
/* 10DA14 0020D914 0000B07B */  lq         $16, 0x0($sp)
/* 10DA18 0020D918 A001BD27 */  addiu      $sp, $sp, 0x1A0
/* 10DA1C 0020D91C 0800E003 */  jr         $31
/* 10DA20 0020D920 00000000 */   nop
/* 10DA24 0020D924 00000000 */  nop
/* 10DA28 0020D928 00000000 */  nop
/* 10DA2C 0020D92C 00000000 */  nop
