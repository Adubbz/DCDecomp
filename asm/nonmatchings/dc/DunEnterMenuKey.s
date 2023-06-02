.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DunEnterMenuKey__Fv
/* 126720 00226620 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 126724 00226624 3000BF7F */  sq         $31, 0x30($sp)
/* 126728 00226628 2000B27F */  sq         $18, 0x20($sp)
/* 12672C 0022662C 1000B17F */  sq         $17, 0x10($sp)
/* 126730 00226630 0000B07F */  sq         $16, 0x0($sp)
/* 126734 00226634 FFFF1024 */  addiu      $16, $0, -0x1
/* 126738 00226638 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12673C 0022663C 248D2384 */  lh         $3, -0x72DC($at)
/* 126740 00226640 A3006010 */  beqz       $3, .L002268D0
/* 126744 00226644 00000000 */   nop
/* 126748 00226648 02000224 */  addiu      $2, $0, 0x2
/* 12674C 0022664C 93006210 */  beq        $3, $2, .L0022689C
/* 126750 00226650 00000000 */   nop
/* 126754 00226654 03000224 */  addiu      $2, $0, 0x3
/* 126758 00226658 06006210 */  beq        $3, $2, .L00226674
/* 12675C 0022665C 00000000 */   nop
/* 126760 00226660 01000224 */  addiu      $2, $0, 0x1
/* 126764 00226664 03006210 */  beq        $3, $2, .L00226674
/* 126768 00226668 00000000 */   nop
/* 12676C 0022666C 9F010010 */  b          .L00226CEC
/* 126770 00226670 00000000 */   nop
.L00226674:
/* 126774 00226674 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126778 00226678 8C8B2280 */  lb         $2, -0x7474($at)
/* 12677C 0022667C 60004014 */  bnez       $2, .L00226800
/* 126780 00226680 00000000 */   nop
/* 126784 00226684 8CFB040C */  jal        ReadBGSync__Fv
/* 126788 00226688 00000000 */   nop
/* 12678C 0022668C 5C004014 */  bnez       $2, .L00226800
/* 126790 00226690 00000000 */   nop
/* 126794 00226694 2900023C */  lui        $2, %hi(_777)
/* 126798 00226698 80414524 */  addiu      $5, $2, %lo(_777)
/* 12679C 0022669C 4000A427 */  addiu      $4, $sp, 0x40
/* 1267A0 002266A0 02000324 */  addiu      $3, $0, 0x2
.L002266A4:
/* 1267A4 002266A4 0000A278 */  lq         $2, 0x0($5)
/* 1267A8 002266A8 1000A524 */  addiu      $5, $5, 0x10
/* 1267AC 002266AC FFFF6324 */  addiu      $3, $3, -0x1
/* 1267B0 002266B0 0000827C */  sq         $2, 0x0($4)
/* 1267B4 002266B4 10008424 */  addiu      $4, $4, 0x10
/* 1267B8 002266B8 FAFF601C */  bgtz       $3, .L002266A4
/* 1267BC 002266BC 00000000 */   nop
/* 1267C0 002266C0 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 1267C4 002266C4 000082E4 */  swc1       $f2, 0x0($4)
/* 1267C8 002266C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1267CC 002266CC 8D8B2280 */  lb         $2, -0x7473($at)
/* 1267D0 002266D0 4400A2AF */  sw         $2, 0x44($sp)
/* 1267D4 002266D4 5000A2AF */  sw         $2, 0x50($sp)
/* 1267D8 002266D8 28260070 */  paddub     $4, $0, $0
/* 1267DC 002266DC 18FB040C */  jal        GetReadBGFile__Fi
/* 1267E0 002266E0 00000000 */   nop
/* 1267E4 002266E4 288E4070 */  paddub     $17, $2, $0
/* 1267E8 002266E8 8C00448C */  lw         $4, 0x8C($2)
/* 1267EC 002266EC 2A00023C */  lui        $2, %hi(_843_2)
/* 1267F0 002266F0 10EF4524 */  addiu      $5, $2, %lo(_843_2)
/* 1267F4 002266F4 28360070 */  paddub     $6, $0, $0
/* 1267F8 002266F8 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 1267FC 002266FC 00000000 */   nop
/* 126800 00226700 4C00A2AF */  sw         $2, 0x4C($sp)
/* 126804 00226704 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126808 00226708 8D8B2580 */  lb         $5, -0x7473($at)
/* 12680C 0022670C C701023C */  lui        $2, %hi(TexManager)
/* 126810 00226710 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126814 00226714 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 126818 00226718 00000000 */   nop
/* 12681C 0022671C C701023C */  lui        $2, %hi(TexManager)
/* 126820 00226720 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126824 00226724 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 126828 00226728 00000000 */   nop
/* 12682C 0022672C C701023C */  lui        $2, %hi(TexManager)
/* 126830 00226730 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126834 00226734 FFFF0524 */  addiu      $5, $0, -0x1
/* 126838 00226738 4000A627 */  addiu      $6, $sp, 0x40
/* 12683C 0022673C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 126840 00226740 00000000 */   nop
/* 126844 00226744 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126848 00226748 8D8B2680 */  lb         $6, -0x7473($at)
/* 12684C 0022674C C701023C */  lui        $2, %hi(TexManager)
/* 126850 00226750 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126854 00226754 2A00023C */  lui        $2, %hi(_844)
/* 126858 00226758 20EF4524 */  addiu      $5, $2, %lo(_844)
/* 12685C 0022675C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 126860 00226760 00000000 */   nop
/* 126864 00226764 649782AF */  sw         $2, -0x689C($gp)
/* 126868 00226768 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12686C 0022676C 8D8B2680 */  lb         $6, -0x7473($at)
/* 126870 00226770 C701023C */  lui        $2, %hi(TexManager)
/* 126874 00226774 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 126878 00226778 2A00023C */  lui        $2, %hi(_845)
/* 12687C 0022677C 30EF4524 */  addiu      $5, $2, %lo(_845)
/* 126880 00226780 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 126884 00226784 00000000 */   nop
/* 126888 00226788 689782AF */  sw         $2, -0x6898($gp)
/* 12688C 0022678C 8C00248E */  lw         $4, 0x8C($17)
/* 126890 00226790 2A00023C */  lui        $2, %hi(_846)
/* 126894 00226794 38EF4524 */  addiu      $5, $2, %lo(_846)
/* 126898 00226798 28360070 */  paddub     $6, $0, $0
/* 12689C 0022679C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 1268A0 002267A0 00000000 */   nop
/* 1268A4 002267A4 07000424 */  addiu      $4, $0, 0x7
/* 1268A8 002267A8 282E4070 */  paddub     $5, $2, $0
/* 1268AC 002267AC 50B0080C */  jal        InitMenuMesSet__FiPs
/* 1268B0 002267B0 00000000 */   nop
/* 1268B4 002267B4 FFFF0224 */  addiu      $2, $0, -0x1
/* 1268B8 002267B8 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 1268BC 002267BC 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 1268C0 002267C0 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 1268C4 002267C4 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 1268C8 002267C8 0A000524 */  addiu      $5, $0, 0xA
/* 1268CC 002267CC 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 1268D0 002267D0 00000000 */   nop
/* 1268D4 002267D4 01000224 */  addiu      $2, $0, 0x1
/* 1268D8 002267D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1268DC 002267DC 8C8B22A0 */  sb         $2, -0x7474($at)
/* 1268E0 002267E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1268E4 002267E4 8E8B20A0 */  sb         $0, -0x7472($at)
/* 1268E8 002267E8 2A00023C */  lui        $2, %hi(_847)
/* 1268EC 002267EC 50EF4424 */  addiu      $4, $2, %lo(_847)
/* 1268F0 002267F0 A611040C */  jal        printf
/* 1268F4 002267F4 00000000 */   nop
/* 1268F8 002267F8 04000010 */  b          .L0022680C
/* 1268FC 002267FC 00000000 */   nop
.L00226800:
/* 126900 00226800 6097828F */  lw         $2, -0x68A0($gp)
/* 126904 00226804 01004224 */  addiu      $2, $2, 0x1
/* 126908 00226808 609782AF */  sw         $2, -0x68A0($gp)
.L0022680C:
/* 12690C 0022680C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126910 00226810 8C8B2280 */  lb         $2, -0x7474($at)
/* 126914 00226814 06004010 */  beqz       $2, .L00226830
/* 126918 00226818 00000000 */   nop
/* 12691C 0022681C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126920 00226820 288D228C */  lw         $2, -0x72D8($at)
/* 126924 00226824 01004224 */  addiu      $2, $2, 0x1
/* 126928 00226828 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12692C 0022682C 288D22AC */  sw         $2, -0x72D8($at)
.L00226830:
/* 126930 00226830 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126934 00226834 8C8B2280 */  lb         $2, -0x7474($at)
/* 126938 00226838 2C014010 */  beqz       $2, .L00226CEC
/* 12693C 0022683C 00000000 */   nop
/* 126940 00226840 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126944 00226844 288D228C */  lw         $2, -0x72D8($at)
/* 126948 00226848 1F004128 */  slti       $at, $2, 0x1F
/* 12694C 0022684C 27012014 */  bnez       $at, .L00226CEC
/* 126950 00226850 00000000 */   nop
/* 126954 00226854 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126958 00226858 248D20A4 */  sh         $0, -0x72DC($at)
/* 12695C 0022685C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126960 00226860 288D20AC */  sw         $0, -0x72D8($at)
/* 126964 00226864 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126968 00226868 838B2280 */  lb         $2, -0x747D($at)
/* 12696C 0022686C 1F014004 */  bltz       $2, .L00226CEC
/* 126970 00226870 00000000 */   nop
/* 126974 00226874 02000224 */  addiu      $2, $0, 0x2
/* 126978 00226878 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12697C 0022687C 248D22A4 */  sh         $2, -0x72DC($at)
/* 126980 00226880 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126984 00226884 838B2280 */  lb         $2, -0x747D($at)
/* 126988 00226888 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12698C 0022688C 908B22A0 */  sb         $2, -0x7470($at)
/* 126990 00226890 01001024 */  addiu      $16, $0, 0x1
/* 126994 00226894 15010010 */  b          .L00226CEC
/* 126998 00226898 00000000 */   nop
.L0022689C:
/* 12699C 0022689C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1269A0 002268A0 288D228C */  lw         $2, -0x72D8($at)
/* 1269A4 002268A4 01004224 */  addiu      $2, $2, 0x1
/* 1269A8 002268A8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1269AC 002268AC 288D22AC */  sw         $2, -0x72D8($at)
/* 1269B0 002268B0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1269B4 002268B4 288D228C */  lw         $2, -0x72D8($at)
/* 1269B8 002268B8 2F004128 */  slti       $at, $2, 0x2F
/* 1269BC 002268BC 0B012014 */  bnez       $at, .L00226CEC
/* 1269C0 002268C0 00000000 */   nop
/* 1269C4 002268C4 01001024 */  addiu      $16, $0, 0x1
/* 1269C8 002268C8 08010010 */  b          .L00226CEC
/* 1269CC 002268CC 00000000 */   nop
.L002268D0:
/* 1269D0 002268D0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1269D4 002268D4 828B3180 */  lb         $17, -0x747E($at)
/* 1269D8 002268D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1269DC 002268DC 818B3280 */  lb         $18, -0x747F($at)
/* 1269E0 002268E0 CC01023C */  lui        $2, %hi(GamePad)
/* 1269E4 002268E4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1269E8 002268E8 00100524 */  addiu      $5, $0, 0x1000
/* 1269EC 002268EC 1CAE040C */  jal        Down__8CGamePadFi
/* 1269F0 002268F0 00000000 */   nop
/* 1269F4 002268F4 12004010 */  beqz       $2, .L00226940
/* 1269F8 002268F8 00000000 */   nop
/* 1269FC 002268FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A00 00226900 828B2280 */  lb         $2, -0x747E($at)
/* 126A04 00226904 FFFF4224 */  addiu      $2, $2, -0x1
/* 126A08 00226908 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A0C 0022690C 828B22A0 */  sb         $2, -0x747E($at)
/* 126A10 00226910 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A14 00226914 828B2380 */  lb         $3, -0x747E($at)
/* 126A18 00226918 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A1C 0022691C 818B2280 */  lb         $2, -0x747F($at)
/* 126A20 00226920 2A086200 */  slt        $at, $3, $2
/* 126A24 00226924 43002010 */  beqz       $at, .L00226A34
/* 126A28 00226928 00000000 */   nop
/* 126A2C 0022692C FFFF4224 */  addiu      $2, $2, -0x1
/* 126A30 00226930 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A34 00226934 818B22A0 */  sb         $2, -0x747F($at)
/* 126A38 00226938 3E000010 */  b          .L00226A34
/* 126A3C 0022693C 00000000 */   nop
.L00226940:
/* 126A40 00226940 CC01023C */  lui        $2, %hi(GamePad)
/* 126A44 00226944 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126A48 00226948 00400524 */  addiu      $5, $0, 0x4000
/* 126A4C 0022694C 1CAE040C */  jal        Down__8CGamePadFi
/* 126A50 00226950 00000000 */   nop
/* 126A54 00226954 13004010 */  beqz       $2, .L002269A4
/* 126A58 00226958 00000000 */   nop
/* 126A5C 0022695C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A60 00226960 828B2280 */  lb         $2, -0x747E($at)
/* 126A64 00226964 01004224 */  addiu      $2, $2, 0x1
/* 126A68 00226968 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A6C 0022696C 828B22A0 */  sb         $2, -0x747E($at)
/* 126A70 00226970 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A74 00226974 818B2480 */  lb         $4, -0x747F($at)
/* 126A78 00226978 04008324 */  addiu      $3, $4, 0x4
/* 126A7C 0022697C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A80 00226980 828B2280 */  lb         $2, -0x747E($at)
/* 126A84 00226984 2A086200 */  slt        $at, $3, $2
/* 126A88 00226988 2A002010 */  beqz       $at, .L00226A34
/* 126A8C 0022698C 00000000 */   nop
/* 126A90 00226990 01008224 */  addiu      $2, $4, 0x1
/* 126A94 00226994 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126A98 00226998 818B22A0 */  sb         $2, -0x747F($at)
/* 126A9C 0022699C 25000010 */  b          .L00226A34
/* 126AA0 002269A0 00000000 */   nop
.L002269A4:
/* 126AA4 002269A4 CC01023C */  lui        $2, %hi(GamePad)
/* 126AA8 002269A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126AAC 002269AC 0A200524 */  addiu      $5, $0, 0x200A
/* 126AB0 002269B0 1CAE040C */  jal        Down__8CGamePadFi
/* 126AB4 002269B4 00000000 */   nop
/* 126AB8 002269B8 0D004010 */  beqz       $2, .L002269F0
/* 126ABC 002269BC 00000000 */   nop
/* 126AC0 002269C0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126AC4 002269C4 818B2280 */  lb         $2, -0x747F($at)
/* 126AC8 002269C8 05004224 */  addiu      $2, $2, 0x5
/* 126ACC 002269CC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126AD0 002269D0 818B22A0 */  sb         $2, -0x747F($at)
/* 126AD4 002269D4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126AD8 002269D8 828B2280 */  lb         $2, -0x747E($at)
/* 126ADC 002269DC 05004224 */  addiu      $2, $2, 0x5
/* 126AE0 002269E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126AE4 002269E4 828B22A0 */  sb         $2, -0x747E($at)
/* 126AE8 002269E8 12000010 */  b          .L00226A34
/* 126AEC 002269EC 00000000 */   nop
.L002269F0:
/* 126AF0 002269F0 CC01023C */  lui        $2, %hi(GamePad)
/* 126AF4 002269F4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126AF8 002269F8 05800534 */  ori        $5, $0, 0x8005
/* 126AFC 002269FC 1CAE040C */  jal        Down__8CGamePadFi
/* 126B00 00226A00 00000000 */   nop
/* 126B04 00226A04 0B004010 */  beqz       $2, .L00226A34
/* 126B08 00226A08 00000000 */   nop
/* 126B0C 00226A0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B10 00226A10 818B2280 */  lb         $2, -0x747F($at)
/* 126B14 00226A14 FBFF4224 */  addiu      $2, $2, -0x5
/* 126B18 00226A18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B1C 00226A1C 818B22A0 */  sb         $2, -0x747F($at)
/* 126B20 00226A20 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B24 00226A24 828B2280 */  lb         $2, -0x747E($at)
/* 126B28 00226A28 FBFF4224 */  addiu      $2, $2, -0x5
/* 126B2C 00226A2C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B30 00226A30 828B22A0 */  sb         $2, -0x747E($at)
.L00226A34:
/* 126B34 00226A34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B38 00226A38 818B2280 */  lb         $2, -0x747F($at)
/* 126B3C 00226A3C 05004004 */  bltz       $2, .L00226A54
/* 126B40 00226A40 00000000 */   nop
/* 126B44 00226A44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B48 00226A48 828B2280 */  lb         $2, -0x747E($at)
/* 126B4C 00226A4C 05004104 */  bgez       $2, .L00226A64
/* 126B50 00226A50 00000000 */   nop
.L00226A54:
/* 126B54 00226A54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B58 00226A58 828B20A0 */  sb         $0, -0x747E($at)
/* 126B5C 00226A5C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B60 00226A60 818B20A0 */  sb         $0, -0x747F($at)
.L00226A64:
/* 126B64 00226A64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B68 00226A68 8F8B2280 */  lb         $2, -0x7471($at)
/* 126B6C 00226A6C FFFF4324 */  addiu      $3, $2, -0x1
/* 126B70 00226A70 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B74 00226A74 828B2280 */  lb         $2, -0x747E($at)
/* 126B78 00226A78 2A086200 */  slt        $at, $3, $2
/* 126B7C 00226A7C 0E002010 */  beqz       $at, .L00226AB8
/* 126B80 00226A80 00000000 */   nop
/* 126B84 00226A84 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B88 00226A88 828B23A0 */  sb         $3, -0x747E($at)
/* 126B8C 00226A8C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B90 00226A90 828B2280 */  lb         $2, -0x747E($at)
/* 126B94 00226A94 FCFF4224 */  addiu      $2, $2, -0x4
/* 126B98 00226A98 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126B9C 00226A9C 818B22A0 */  sb         $2, -0x747F($at)
/* 126BA0 00226AA0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BA4 00226AA4 818B2280 */  lb         $2, -0x747F($at)
/* 126BA8 00226AA8 03004104 */  bgez       $2, .L00226AB8
/* 126BAC 00226AAC 00000000 */   nop
/* 126BB0 00226AB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BB4 00226AB4 818B20A0 */  sb         $0, -0x747F($at)
.L00226AB8:
/* 126BB8 00226AB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BBC 00226ABC 828B2380 */  lb         $3, -0x747E($at)
/* 126BC0 00226AC0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BC4 00226AC4 8F8B2280 */  lb         $2, -0x7471($at)
/* 126BC8 00226AC8 FFFF4224 */  addiu      $2, $2, -0x1
/* 126BCC 00226ACC 2A084300 */  slt        $at, $2, $3
/* 126BD0 00226AD0 03002010 */  beqz       $at, .L00226AE0
/* 126BD4 00226AD4 00000000 */   nop
/* 126BD8 00226AD8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BDC 00226ADC 828B22A0 */  sb         $2, -0x747E($at)
.L00226AE0:
/* 126BE0 00226AE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BE4 00226AE4 8F8B2480 */  lb         $4, -0x7471($at)
/* 126BE8 00226AE8 06008128 */  slti       $at, $4, 0x6
/* 126BEC 00226AEC 13002014 */  bnez       $at, .L00226B3C
/* 126BF0 00226AF0 00000000 */   nop
/* 126BF4 00226AF4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126BF8 00226AF8 818B2380 */  lb         $3, -0x747F($at)
/* 126BFC 00226AFC FBFF8224 */  addiu      $2, $4, -0x5
/* 126C00 00226B00 2A084300 */  slt        $at, $2, $3
/* 126C04 00226B04 1D002010 */  beqz       $at, .L00226B7C
/* 126C08 00226B08 00000000 */   nop
/* 126C0C 00226B0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C10 00226B10 818B22A0 */  sb         $2, -0x747F($at)
/* 126C14 00226B14 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C18 00226B18 818B2280 */  lb         $2, -0x747F($at)
/* 126C1C 00226B1C 17004104 */  bgez       $2, .L00226B7C
/* 126C20 00226B20 00000000 */   nop
/* 126C24 00226B24 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C28 00226B28 818B20A0 */  sb         $0, -0x747F($at)
/* 126C2C 00226B2C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C30 00226B30 828B20A0 */  sb         $0, -0x747E($at)
/* 126C34 00226B34 11000010 */  b          .L00226B7C
/* 126C38 00226B38 00000000 */   nop
.L00226B3C:
/* 126C3C 00226B3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C40 00226B40 828B2280 */  lb         $2, -0x747E($at)
/* 126C44 00226B44 FFFF8324 */  addiu      $3, $4, -0x1
/* 126C48 00226B48 2A086200 */  slt        $at, $3, $2
/* 126C4C 00226B4C 06002014 */  bnez       $at, .L00226B68
/* 126C50 00226B50 00000000 */   nop
/* 126C54 00226B54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C58 00226B58 818B2280 */  lb         $2, -0x747F($at)
/* 126C5C 00226B5C 2A086200 */  slt        $at, $3, $2
/* 126C60 00226B60 06002010 */  beqz       $at, .L00226B7C
/* 126C64 00226B64 00000000 */   nop
.L00226B68:
/* 126C68 00226B68 FFFF8224 */  addiu      $2, $4, -0x1
/* 126C6C 00226B6C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C70 00226B70 828B22A0 */  sb         $2, -0x747E($at)
/* 126C74 00226B74 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C78 00226B78 818B20A0 */  sb         $0, -0x747F($at)
.L00226B7C:
/* 126C7C 00226B7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C80 00226B80 818B2280 */  lb         $2, -0x747F($at)
/* 126C84 00226B84 05004004 */  bltz       $2, .L00226B9C
/* 126C88 00226B88 00000000 */   nop
/* 126C8C 00226B8C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126C90 00226B90 828B2280 */  lb         $2, -0x747E($at)
/* 126C94 00226B94 05004104 */  bgez       $2, .L00226BAC
/* 126C98 00226B98 00000000 */   nop
.L00226B9C:
/* 126C9C 00226B9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126CA0 00226BA0 818B20A0 */  sb         $0, -0x747F($at)
/* 126CA4 00226BA4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126CA8 00226BA8 828B20A0 */  sb         $0, -0x747E($at)
.L00226BAC:
/* 126CAC 00226BAC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126CB0 00226BB0 818B2280 */  lb         $2, -0x747F($at)
/* 126CB4 00226BB4 23205200 */  subu       $4, $2, $18
/* 126CB8 00226BB8 7200040C */  jal        abs
/* 126CBC 00226BBC 00000000 */   nop
/* 126CC0 00226BC0 05004128 */  slti       $at, $2, 0x5
/* 126CC4 00226BC4 23002014 */  bnez       $at, .L00226C54
/* 126CC8 00226BC8 00000000 */   nop
/* 126CCC 00226BCC 2042023C */  lui        $2, (0x42200000 >> 16)
/* 126CD0 00226BD0 00088244 */  mtc1       $2, $f1
/* 126CD4 00226BD4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126CD8 00226BD8 818B2280 */  lb         $2, -0x747F($at)
/* 126CDC 00226BDC 00008244 */  mtc1       $2, $f0
/* 126CE0 00226BE0 00000000 */  nop
/* 126CE4 00226BE4 20008046 */  cvt.s.w    $f0, $f0
/* 126CE8 00226BE8 42080046 */  mul.s      $f1, $f1, $f0
/* 126CEC 00226BEC EC42023C */  lui        $2, (0x42EC0000 >> 16)
/* 126CF0 00226BF0 00008244 */  mtc1       $2, $f0
/* 126CF4 00226BF4 00000000 */  nop
/* 126CF8 00226BF8 01000146 */  sub.s      $f0, $f0, $f1
/* 126CFC 00226BFC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D00 00226C00 848B20E4 */  swc1       $f0, -0x747C($at)
/* 126D04 00226C04 D842023C */  lui        $2, (0x42D80000 >> 16)
/* 126D08 00226C08 00088244 */  mtc1       $2, $f1
/* 126D0C 00226C0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D10 00226C10 818B2280 */  lb         $2, -0x747F($at)
/* 126D14 00226C14 00008244 */  mtc1       $2, $f0
/* 126D18 00226C18 00000000 */  nop
/* 126D1C 00226C1C 20008046 */  cvt.s.w    $f0, $f0
/* 126D20 00226C20 42080046 */  mul.s      $f1, $f1, $f0
/* 126D24 00226C24 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D28 00226C28 8F8B2280 */  lb         $2, -0x7471($at)
/* 126D2C 00226C2C 00008244 */  mtc1       $2, $f0
/* 126D30 00226C30 00000000 */  nop
/* 126D34 00226C34 20008046 */  cvt.s.w    $f0, $f0
/* 126D38 00226C38 43080046 */  div.s      $f1, $f1, $f0
/* 126D3C 00226C3C F442023C */  lui        $2, (0x42F40000 >> 16)
/* 126D40 00226C40 00008244 */  mtc1       $2, $f0
/* 126D44 00226C44 00000000 */  nop
/* 126D48 00226C48 00000146 */  add.s      $f0, $f0, $f1
/* 126D4C 00226C4C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D50 00226C50 888B20E4 */  swc1       $f0, -0x7478($at)
.L00226C54:
/* 126D54 00226C54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D58 00226C58 828B2280 */  lb         $2, -0x747E($at)
/* 126D5C 00226C5C 05002216 */  bne        $17, $2, .L00226C74
/* 126D60 00226C60 00000000 */   nop
/* 126D64 00226C64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126D68 00226C68 818B2280 */  lb         $2, -0x747F($at)
/* 126D6C 00226C6C 04004212 */  beq        $18, $2, .L00226C80
/* 126D70 00226C70 00000000 */   nop
.L00226C74:
/* 126D74 00226C74 28260070 */  paddub     $4, $0, $0
/* 126D78 00226C78 BCB3080C */  jal        ComMenuSePlay__Fi
/* 126D7C 00226C7C 00000000 */   nop
.L00226C80:
/* 126D80 00226C80 CC01023C */  lui        $2, %hi(GamePad)
/* 126D84 00226C84 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126D88 00226C88 40000524 */  addiu      $5, $0, 0x40
/* 126D8C 00226C8C 1CAE040C */  jal        Down__8CGamePadFi
/* 126D90 00226C90 00000000 */   nop
/* 126D94 00226C94 0B004010 */  beqz       $2, .L00226CC4
/* 126D98 00226C98 00000000 */   nop
/* 126D9C 00226C9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126DA0 00226CA0 828B2280 */  lb         $2, -0x747E($at)
/* 126DA4 00226CA4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126DA8 00226CA8 908B22A0 */  sb         $2, -0x7470($at)
/* 126DAC 00226CAC 02000224 */  addiu      $2, $0, 0x2
/* 126DB0 00226CB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 126DB4 00226CB4 248D22A4 */  sh         $2, -0x72DC($at)
/* 126DB8 00226CB8 01000424 */  addiu      $4, $0, 0x1
/* 126DBC 00226CBC BCB3080C */  jal        ComMenuSePlay__Fi
/* 126DC0 00226CC0 00000000 */   nop
.L00226CC4:
/* 126DC4 00226CC4 CC01023C */  lui        $2, %hi(GamePad)
/* 126DC8 00226CC8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 126DCC 00226CCC 20000524 */  addiu      $5, $0, 0x20
/* 126DD0 00226CD0 1CAE040C */  jal        Down__8CGamePadFi
/* 126DD4 00226CD4 00000000 */   nop
/* 126DD8 00226CD8 04004010 */  beqz       $2, .L00226CEC
/* 126DDC 00226CDC 00000000 */   nop
/* 126DE0 00226CE0 02000424 */  addiu      $4, $0, 0x2
/* 126DE4 00226CE4 BCB3080C */  jal        ComMenuSePlay__Fi
/* 126DE8 00226CE8 00000000 */   nop
.L00226CEC:
/* 126DEC 00226CEC 28160072 */  paddub     $2, $16, $0
/* 126DF0 00226CF0 3000BF7B */  lq         $31, 0x30($sp)
/* 126DF4 00226CF4 2000B27B */  lq         $18, 0x20($sp)
/* 126DF8 00226CF8 1000B17B */  lq         $17, 0x10($sp)
/* 126DFC 00226CFC 0000B07B */  lq         $16, 0x0($sp)
/* 126E00 00226D00 7000BD27 */  addiu      $sp, $sp, 0x70
/* 126E04 00226D04 0800E003 */  jr         $31
/* 126E08 00226D08 00000000 */   nop
/* 126E0C 00226D0C 00000000 */  nop