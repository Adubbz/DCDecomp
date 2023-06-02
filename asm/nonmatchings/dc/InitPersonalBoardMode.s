.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
/* 12E840 0022E740 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 12E844 0022E744 2000BF7F */  sq         $31, 0x20($sp)
/* 12E848 0022E748 1000B17F */  sq         $17, 0x10($sp)
/* 12E84C 0022E74C 0000B07F */  sq         $16, 0x0($sp)
/* 12E850 0022E750 288EC070 */  paddub     $17, $6, $0
/* 12E854 0022E754 2886E070 */  paddub     $16, $7, $0
/* 12E858 0022E758 A09784AF */  sw         $4, -0x6860($gp)
/* 12E85C 0022E75C A89785AF */  sw         $5, -0x6858($gp)
/* 12E860 0022E760 A497828F */  lw         $2, -0x685C($gp)
/* 12E864 0022E764 09004014 */  bnez       $2, .L0022E78C
/* 12E868 0022E768 00000000 */   nop
/* 12E86C 0022E76C C701023C */  lui        $2, %hi(TexManager)
/* 12E870 0022E770 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 12E874 0022E774 2A00023C */  lui        $2, %hi(_1073)
/* 12E878 0022E778 C8F14524 */  addiu      $5, $2, %lo(_1073)
/* 12E87C 0022E77C FFFF0624 */  addiu      $6, $0, -0x1
/* 12E880 0022E780 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 12E884 0022E784 00000000 */   nop
/* 12E888 0022E788 A49782AF */  sw         $2, -0x685C($gp)
.L0022E78C:
/* 12E88C 0022E78C A897828F */  lw         $2, -0x6858($gp)
/* 12E890 0022E790 000051AC */  sw         $17, 0x0($2)
/* 12E894 0022E794 A897828F */  lw         $2, -0x6858($gp)
/* 12E898 0022E798 040050AC */  sw         $16, 0x4($2)
/* 12E89C 0022E79C A897828F */  lw         $2, -0x6858($gp)
/* 12E8A0 0022E7A0 0C0040AC */  sw         $0, 0xC($2)
/* 12E8A4 0022E7A4 A897828F */  lw         $2, -0x6858($gp)
/* 12E8A8 0022E7A8 180040AC */  sw         $0, 0x18($2)
/* 12E8AC 0022E7AC A097828F */  lw         $2, -0x6860($gp)
/* 12E8B0 0022E7B0 60434324 */  addiu      $3, $2, 0x4360
/* 12E8B4 0022E7B4 A897828F */  lw         $2, -0x6858($gp)
/* 12E8B8 0022E7B8 240043AC */  sw         $3, 0x24($2)
/* 12E8BC 0022E7BC A097828F */  lw         $2, -0x6860($gp)
/* 12E8C0 0022E7C0 04054324 */  addiu      $3, $2, 0x504
/* 12E8C4 0022E7C4 F87F6324 */  addiu      $3, $3, 0x7FF8
/* 12E8C8 0022E7C8 A897828F */  lw         $2, -0x6858($gp)
/* 12E8CC 0022E7CC 280043AC */  sw         $3, 0x28($2)
/* 12E8D0 0022E7D0 A897828F */  lw         $2, -0x6858($gp)
/* 12E8D4 0022E7D4 0400448C */  lw         $4, 0x4($2)
/* 12E8D8 0022E7D8 D8BD080C */  jal        PersonalRetMax__Fi
/* 12E8DC 0022E7DC 00000000 */   nop
/* 12E8E0 0022E7E0 05000324 */  addiu      $3, $0, 0x5
/* 12E8E4 0022E7E4 1A004300 */  div        $0, $2, $3
/* 12E8E8 0022E7E8 02006014 */  bnez       $3, .L0022E7F4
/* 12E8EC 0022E7EC 00000000 */   nop
/* 12E8F0 0022E7F0 CD010000 */  break      0, 7
.L0022E7F4:
/* 12E8F4 0022E7F4 12200000 */  mflo       $4
/* 12E8F8 0022E7F8 0200801C */  bgtz       $4, .L0022E804
/* 12E8FC 0022E7FC 00000000 */   nop
/* 12E900 0022E800 01000424 */  addiu      $4, $0, 0x1
.L0022E804:
/* 12E904 0022E804 A897858F */  lw         $5, -0x6858($gp)
/* 12E908 0022E808 1800A38C */  lw         $3, 0x18($5)
/* 12E90C 0022E80C 80100300 */  sll        $2, $3, 2
/* 12E910 0022E810 21104300 */  addu       $2, $2, $3
/* 12E914 0022E814 C0180200 */  sll        $3, $2, 3
/* 12E918 0022E818 7F000224 */  addiu      $2, $0, 0x7F
/* 12E91C 0022E81C 23104300 */  subu       $2, $2, $3
/* 12E920 0022E820 00008244 */  mtc1       $2, $f0
/* 12E924 0022E824 00000000 */  nop
/* 12E928 0022E828 20008046 */  cvt.s.w    $f0, $f0
/* 12E92C 0022E82C 1000A0E4 */  swc1       $f0, 0x10($5)
/* 12E930 0022E830 A897838F */  lw         $3, -0x6858($gp)
/* 12E934 0022E834 180060C4 */  lwc1       $f0, 0x18($3)
/* 12E938 0022E838 60008046 */  cvt.s.w    $f1, $f0
/* 12E93C 0022E83C E442023C */  lui        $2, (0x42E40000 >> 16)
/* 12E940 0022E840 00008244 */  mtc1       $2, $f0
/* 12E944 0022E844 00000000 */  nop
/* 12E948 0022E848 42000146 */  mul.s      $f1, $f0, $f1
/* 12E94C 0022E84C 00008444 */  mtc1       $4, $f0
/* 12E950 0022E850 00000000 */  nop
/* 12E954 0022E854 20008046 */  cvt.s.w    $f0, $f0
/* 12E958 0022E858 43080046 */  div.s      $f1, $f1, $f0
/* 12E95C 0022E85C 0C43023C */  lui        $2, (0x430C0000 >> 16)
/* 12E960 0022E860 00008244 */  mtc1       $2, $f0
/* 12E964 0022E864 00000000 */  nop
/* 12E968 0022E868 00000146 */  add.s      $f0, $f0, $f1
/* 12E96C 0022E86C 140060E4 */  swc1       $f0, 0x14($3)
/* 12E970 0022E870 01000324 */  addiu      $3, $0, 0x1
/* 12E974 0022E874 A897828F */  lw         $2, -0x6858($gp)
/* 12E978 0022E878 080043AC */  sw         $3, 0x8($2)
/* 12E97C 0022E87C A897828F */  lw         $2, -0x6858($gp)
/* 12E980 0022E880 30004424 */  addiu      $4, $2, 0x30
/* 12E984 0022E884 10B9080C */  jal        InitHaveData__FP9IHAVEITEM
/* 12E988 0022E888 00000000 */   nop
/* 12E98C 0022E88C A897828F */  lw         $2, -0x6858($gp)
/* 12E990 0022E890 44004424 */  addiu      $4, $2, 0x44
/* 12E994 0022E894 1CB9080C */  jal        InitHaveWep__FP11WEAPON_HAVE
/* 12E998 0022E898 00000000 */   nop
/* 12E99C 0022E89C FFFF0324 */  addiu      $3, $0, -0x1
/* 12E9A0 0022E8A0 A897828F */  lw         $2, -0x6858($gp)
/* 12E9A4 0022E8A4 5C0143AC */  sw         $3, 0x15C($2)
/* 12E9A8 0022E8A8 A897828F */  lw         $2, -0x6858($gp)
/* 12E9AC 0022E8AC 1C0040A4 */  sh         $0, 0x1C($2)
/* 12E9B0 0022E8B0 A897828F */  lw         $2, -0x6858($gp)
/* 12E9B4 0022E8B4 200040AC */  sw         $0, 0x20($2)
/* 12E9B8 0022E8B8 C4B9080C */  jal        DeleteMenuTrushMark__Fv
/* 12E9BC 0022E8BC 00000000 */   nop
/* 12E9C0 0022E8C0 FFFF0324 */  addiu      $3, $0, -0x1
/* 12E9C4 0022E8C4 3C2C0300 */  dsll32     $5, $3, 16
/* 12E9C8 0022E8C8 3F2C0500 */  dsra32     $5, $5, 16
/* 12E9CC 0022E8CC A097878F */  lw         $7, -0x6860($gp)
/* 12E9D0 0022E8D0 1C43E38C */  lw         $3, 0x431C($7)
/* 12E9D4 0022E8D4 2E006010 */  beqz       $3, .L0022E990
/* 12E9D8 0022E8D8 00000000 */   nop
/* 12E9DC 0022E8DC A897868F */  lw         $6, -0x6858($gp)
/* 12E9E0 0022E8E0 2400C48C */  lw         $4, 0x24($6)
/* 12E9E4 0022E8E4 00008380 */  lb         $3, 0x0($4)
/* 12E9E8 0022E8E8 40180300 */  sll        $3, $3, 1
/* 12E9EC 0022E8EC 21186400 */  addu       $3, $3, $4
/* 12E9F0 0022E8F0 0E006384 */  lh         $3, 0xE($3)
/* 12E9F4 0022E8F4 84006328 */  slti       $3, $3, 0x84
/* 12E9F8 0022E8F8 02006014 */  bnez       $3, .L0022E904
/* 12E9FC 0022E8FC 00000000 */   nop
/* 12EA00 0022E900 282E0070 */  paddub     $5, $0, $0
.L0022E904:
/* 12EA04 0022E904 2800C38C */  lw         $3, 0x28($6)
/* 12EA08 0022E908 20056384 */  lh         $3, 0x520($3)
/* 12EA0C 0022E90C 51006328 */  slti       $3, $3, 0x51
/* 12EA10 0022E910 04006014 */  bnez       $3, .L0022E924
/* 12EA14 0022E914 00000000 */   nop
/* 12EA18 0022E918 02000324 */  addiu      $3, $0, 0x2
/* 12EA1C 0022E91C 3C2C0300 */  dsll32     $5, $3, 16
/* 12EA20 0022E920 3F2C0500 */  dsra32     $5, $5, 16
.L0022E924:
/* 12EA24 0022E924 28360070 */  paddub     $6, $0, $0
/* 12EA28 0022E928 0E000010 */  b          .L0022E964
/* 12EA2C 0022E92C 00000000 */   nop
.L0022E930:
/* 12EA30 0022E930 A80A0324 */  addiu      $3, $0, 0xAA8
/* 12EA34 0022E934 1818C300 */  mult       $3, $6, $3
/* 12EA38 0022E938 2118E300 */  addu       $3, $7, $3
/* 12EA3C 0022E93C BC4E6384 */  lh         $3, 0x4EBC($3)
/* 12EA40 0022E940 01016328 */  slti       $3, $3, 0x101
/* 12EA44 0022E944 06006014 */  bnez       $3, .L0022E960
/* 12EA48 0022E948 00000000 */   nop
/* 12EA4C 0022E94C 01000324 */  addiu      $3, $0, 0x1
/* 12EA50 0022E950 3C2C0300 */  dsll32     $5, $3, 16
/* 12EA54 0022E954 3F2C0500 */  dsra32     $5, $5, 16
/* 12EA58 0022E958 05000010 */  b          .L0022E970
/* 12EA5C 0022E95C 00000000 */   nop
.L0022E960:
/* 12EA60 0022E960 0100C624 */  addiu      $6, $6, 0x1
.L0022E964:
/* 12EA64 0022E964 0600C328 */  slti       $3, $6, 0x6
/* 12EA68 0022E968 F1FF6014 */  bnez       $3, .L0022E930
/* 12EA6C 0022E96C 00000000 */   nop
.L0022E970:
/* 12EA70 0022E970 3C1C0500 */  dsll32     $3, $5, 16
/* 12EA74 0022E974 3F1C0300 */  dsra32     $3, $3, 16
/* 12EA78 0022E978 03006010 */  beqz       $3, .L0022E988
/* 12EA7C 0022E97C 00000000 */   nop
/* 12EA80 0022E980 03000010 */  b          .L0022E990
/* 12EA84 0022E984 00000000 */   nop
.L0022E988:
/* 12EA88 0022E988 98B9080C */  jal        SetMenuTrushMark__FP9ITEM_PACK
/* 12EA8C 0022E98C 00000000 */   nop
.L0022E990:
/* 12EA90 0022E990 2000BF7B */  lq         $31, 0x20($sp)
/* 12EA94 0022E994 1000B17B */  lq         $17, 0x10($sp)
/* 12EA98 0022E998 0000B07B */  lq         $16, 0x0($sp)
/* 12EA9C 0022E99C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 12EAA0 0022E9A0 0800E003 */  jr         $31
/* 12EAA4 0022E9A4 00000000 */   nop
/* 12EAA8 0022E9A8 00000000 */  nop
/* 12EAAC 0022E9AC 00000000 */  nop