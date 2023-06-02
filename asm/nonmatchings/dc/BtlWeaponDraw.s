.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtlWeaponDraw__Fifii
/* FB860 001FB760 A0FDBD27 */  addiu      $sp, $sp, -0x260
/* FB864 001FB764 A000BF7F */  sq         $31, 0xA0($sp)
/* FB868 001FB768 9000BE7F */  sq         $fp, 0x90($sp)
/* FB86C 001FB76C 8000B77F */  sq         $23, 0x80($sp)
/* FB870 001FB770 7000B67F */  sq         $22, 0x70($sp)
/* FB874 001FB774 6000B57F */  sq         $21, 0x60($sp)
/* FB878 001FB778 5000B47F */  sq         $20, 0x50($sp)
/* FB87C 001FB77C 4000B37F */  sq         $19, 0x40($sp)
/* FB880 001FB780 3000B27F */  sq         $18, 0x30($sp)
/* FB884 001FB784 2000B17F */  sq         $17, 0x20($sp)
/* FB888 001FB788 1000B07F */  sq         $16, 0x10($sp)
/* FB88C 001FB78C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* FB890 001FB790 28AE8070 */  paddub     $21, $4, $0
/* FB894 001FB794 06650046 */  mov.s      $f20, $f12
/* FB898 001FB798 28BEC070 */  paddub     $23, $6, $0
/* FB89C 001FB79C D494828F */  lw         $2, -0x6B2C($gp)
/* FB8A0 001FB7A0 2110A200 */  addu       $2, $5, $2
/* FB8A4 001FB7A4 40434280 */  lb         $2, 0x4340($2)
/* FB8A8 001FB7A8 B000A2AF */  sw         $2, 0xB0($sp)
/* FB8AC 001FB7AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FB8B0 001FB7B0 74EA3E80 */  lb         $fp, -0x158C($at)
/* FB8B4 001FB7B4 2900023C */  lui        $2, %hi(_2195)
/* FB8B8 001FB7B8 F0314224 */  addiu      $2, $2, %lo(_2195)
/* FB8BC 001FB7BC C000A527 */  addiu      $5, $sp, 0xC0
/* FB8C0 001FB7C0 00004278 */  lq         $2, 0x0($2)
/* FB8C4 001FB7C4 0000A27C */  sq         $2, 0x0($5)
/* FB8C8 001FB7C8 2900023C */  lui        $2, %hi(_2196)
/* FB8CC 001FB7CC 00324224 */  addiu      $2, $2, %lo(_2196)
/* FB8D0 001FB7D0 D000A327 */  addiu      $3, $sp, 0xD0
/* FB8D4 001FB7D4 00004278 */  lq         $2, 0x0($2)
/* FB8D8 001FB7D8 0000627C */  sq         $2, 0x0($3)
/* FB8DC 001FB7DC DA01023C */  lui        $2, %hi(MenuCamera)
/* FB8E0 001FB7E0 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* FB8E4 001FB7E4 C490040C */  jal        SetRef__7CCameraFPf
/* FB8E8 001FB7E8 00000000 */   nop
/* FB8EC 001FB7EC DA01023C */  lui        $2, %hi(MenuCamera)
/* FB8F0 001FB7F0 D0084424 */  addiu      $4, $2, %lo(MenuCamera)
/* FB8F4 001FB7F4 D000A527 */  addiu      $5, $sp, 0xD0
/* FB8F8 001FB7F8 A490040C */  jal        SetPos__7CCameraFPf
/* FB8FC 001FB7FC 00000000 */   nop
/* FB900 001FB800 0001A427 */  addiu      $4, $sp, 0x100
/* FB904 001FB804 4001A527 */  addiu      $5, $sp, 0x140
/* FB908 001FB808 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* FB90C 001FB80C 00000000 */   nop
/* FB910 001FB810 E000A427 */  addiu      $4, $sp, 0xE0
/* FB914 001FB814 4CB7040C */  jal        MGGetAmbient__FPf
/* FB918 001FB818 00000000 */   nop
/* FB91C 001FB81C A042023C */  lui        $2, (0x42A00000 >> 16)
/* FB920 001FB820 F800A2AF */  sw         $2, 0xF8($sp)
/* FB924 001FB824 F400A2AF */  sw         $2, 0xF4($sp)
/* FB928 001FB828 F000A2AF */  sw         $2, 0xF0($sp)
/* FB92C 001FB82C 2900023C */  lui        $2, %hi(_2197)
/* FB930 001FB830 10324224 */  addiu      $2, $2, %lo(_2197)
/* FB934 001FB834 8001A527 */  addiu      $5, $sp, 0x180
/* FB938 001FB838 00004278 */  lq         $2, 0x0($2)
/* FB93C 001FB83C 0000A27C */  sq         $2, 0x0($5)
/* FB940 001FB840 9001A427 */  addiu      $4, $sp, 0x190
/* FB944 001FB844 9285040C */  jal        sceVu0Normalize
/* FB948 001FB848 00000000 */   nop
/* FB94C 001FB84C 2900023C */  lui        $2, %hi(_2198)
/* FB950 001FB850 20324524 */  addiu      $5, $2, %lo(_2198)
/* FB954 001FB854 A001A427 */  addiu      $4, $sp, 0x1A0
/* FB958 001FB858 04000324 */  addiu      $3, $0, 0x4
.L001FB85C:
/* FB95C 001FB85C 0000A278 */  lq         $2, 0x0($5)
/* FB960 001FB860 1000A524 */  addiu      $5, $5, 0x10
/* FB964 001FB864 FFFF6324 */  addiu      $3, $3, -0x1
/* FB968 001FB868 0000827C */  sq         $2, 0x0($4)
/* FB96C 001FB86C 10008424 */  addiu      $4, $4, 0x10
/* FB970 001FB870 FAFF601C */  bgtz       $3, .L001FB85C
/* FB974 001FB874 00000000 */   nop
/* FB978 001FB878 2900023C */  lui        $2, %hi(_2199)
/* FB97C 001FB87C 60324524 */  addiu      $5, $2, %lo(_2199)
/* FB980 001FB880 E001A427 */  addiu      $4, $sp, 0x1E0
/* FB984 001FB884 04000324 */  addiu      $3, $0, 0x4
.L001FB888:
/* FB988 001FB888 0000A278 */  lq         $2, 0x0($5)
/* FB98C 001FB88C 1000A524 */  addiu      $5, $5, 0x10
/* FB990 001FB890 FFFF6324 */  addiu      $3, $3, -0x1
/* FB994 001FB894 0000827C */  sq         $2, 0x0($4)
/* FB998 001FB898 10008424 */  addiu      $4, $4, 0x10
/* FB99C 001FB89C FAFF601C */  bgtz       $3, .L001FB888
/* FB9A0 001FB8A0 00000000 */   nop
/* FB9A4 001FB8A4 9001A0C7 */  lwc1       $f0, 0x190($sp)
/* FB9A8 001FB8A8 A001A0E7 */  swc1       $f0, 0x1A0($sp)
/* FB9AC 001FB8AC 9401A0C7 */  lwc1       $f0, 0x194($sp)
/* FB9B0 001FB8B0 B001A0E7 */  swc1       $f0, 0x1B0($sp)
/* FB9B4 001FB8B4 9801A0C7 */  lwc1       $f0, 0x198($sp)
/* FB9B8 001FB8B8 C001A0E7 */  swc1       $f0, 0x1C0($sp)
/* FB9BC 001FB8BC A001A427 */  addiu      $4, $sp, 0x1A0
/* FB9C0 001FB8C0 E001A527 */  addiu      $5, $sp, 0x1E0
/* FB9C4 001FB8C4 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* FB9C8 001FB8C8 00000000 */   nop
/* FB9CC 001FB8CC 28860070 */  paddub     $16, $0, $0
/* FB9D0 001FB8D0 14010010 */  b          .L001FBD24
/* FB9D4 001FB8D4 00000000 */   nop
.L001FB8D8:
/* FB9D8 001FB8D8 288EE072 */  paddub     $17, $23, $0
/* FB9DC 001FB8DC A0FFA22A */  slti       $2, $21, -0x60
/* FB9E0 001FB8E0 0A014014 */  bnez       $2, .L001FBD0C
/* FB9E4 001FB8E4 00000000 */   nop
/* FB9E8 001FB8E8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FB9EC 001FB8EC 72EA2684 */  lh         $6, -0x158E($at)
/* FB9F0 001FB8F0 0800C228 */  slti       $2, $6, 0x8
/* FB9F4 001FB8F4 03004014 */  bnez       $2, .L001FB904
/* FB9F8 001FB8F8 00000000 */   nop
/* FB9FC 001FB8FC 03011E16 */  bne        $16, $fp, .L001FBD0C
/* FBA00 001FB900 00000000 */   nop
.L001FB904:
/* FBA04 001FB904 7702A12A */  slti       $at, $21, 0x277
/* FBA08 001FB908 09012010 */  beqz       $at, .L001FBD30
/* FBA0C 001FB90C 00000000 */   nop
/* FBA10 001FB910 40111000 */  sll        $2, $16, 5
/* FBA14 001FB914 23105000 */  subu       $2, $2, $16
/* FBA18 001FB918 C0180200 */  sll        $3, $2, 3
/* FBA1C 001FB91C 1495828F */  lw         $2, -0x6AEC($gp)
/* FBA20 001FB920 21904300 */  addu       $18, $2, $3
/* FBA24 001FB924 28B60070 */  paddub     $22, $0, $0
/* FBA28 001FB928 B000A28F */  lw         $2, 0xB0($sp)
/* FBA2C 001FB92C 02000216 */  bne        $16, $2, .L001FB938
/* FBA30 001FB930 00000000 */   nop
/* FBA34 001FB934 01001624 */  addiu      $22, $0, 0x1
.L001FB938:
/* FBA38 001FB938 289E0070 */  paddub     $19, $0, $0
/* FBA3C 001FB93C 02001E16 */  bne        $16, $fp, .L001FB948
/* FBA40 001FB940 00000000 */   nop
/* FBA44 001FB944 01001324 */  addiu      $19, $0, 0x1
.L001FB948:
/* FBA48 001FB948 36006012 */  beqz       $19, .L001FBA24
/* FBA4C 001FB94C 00000000 */   nop
/* FBA50 001FB950 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBA54 001FB954 7CEA2384 */  lh         $3, -0x1584($at)
/* FBA58 001FB958 08000224 */  addiu      $2, $0, 0x8
/* FBA5C 001FB95C 03006210 */  beq        $3, $2, .L001FB96C
/* FBA60 001FB960 00000000 */   nop
/* FBA64 001FB964 2B000010 */  b          .L001FBA14
/* FBA68 001FB968 00000000 */   nop
.L001FB96C:
/* FBA6C 001FB96C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FBA70 001FB970 F4BB2384 */  lh         $3, -0x440C($at)
/* FBA74 001FB974 06000224 */  addiu      $2, $0, 0x6
/* FBA78 001FB978 16006210 */  beq        $3, $2, .L001FB9D4
/* FBA7C 001FB97C 00000000 */   nop
/* FBA80 001FB980 05000224 */  addiu      $2, $0, 0x5
/* FBA84 001FB984 03006210 */  beq        $3, $2, .L001FB994
/* FBA88 001FB988 00000000 */   nop
/* FBA8C 001FB98C 21000010 */  b          .L001FBA14
/* FBA90 001FB990 00000000 */   nop
.L001FB994:
/* FBA94 001FB994 0043023C */  lui        $2, (0x43000000 >> 16)
/* FBA98 001FB998 00108244 */  mtc1       $2, $f2
/* FBA9C 001FB99C 8040023C */  lui        $2, (0x40800000 >> 16)
/* FBAA0 001FB9A0 00088244 */  mtc1       $2, $f1
/* FBAA4 001FB9A4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FBAA8 001FB9A8 F0BB20C4 */  lwc1       $f0, -0x4410($at)
/* FBAAC 001FB9AC 02080046 */  mul.s      $f0, $f1, $f0
/* FBAB0 001FB9B0 01130046 */  sub.s      $f12, $f2, $f0
/* FBAB4 001FB9B4 2C44040C */  jal        fptosi
/* FBAB8 001FB9B8 00000000 */   nop
/* FBABC 001FB9BC 288E4070 */  paddub     $17, $2, $0
/* FBAC0 001FB9C0 14002106 */  bgez       $17, .L001FBA14
/* FBAC4 001FB9C4 00000000 */   nop
/* FBAC8 001FB9C8 288E0070 */  paddub     $17, $0, $0
/* FBACC 001FB9CC 11000010 */  b          .L001FBA14
/* FBAD0 001FB9D0 00000000 */   nop
.L001FB9D4:
/* FBAD4 001FB9D4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FBAD8 001FB9D8 C1BB2280 */  lb         $2, -0x443F($at)
/* FBADC 001FB9DC 04004010 */  beqz       $2, .L001FB9F0
/* FBAE0 001FB9E0 00000000 */   nop
/* FBAE4 001FB9E4 288E0070 */  paddub     $17, $0, $0
/* FBAE8 001FB9E8 06000010 */  b          .L001FBA04
/* FBAEC 001FB9EC 00000000 */   nop
.L001FB9F0:
/* FBAF0 001FB9F0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* FBAF4 001FB9F4 F0BB2CC4 */  lwc1       $f12, -0x4410($at)
/* FBAF8 001FB9F8 2C44040C */  jal        fptosi
/* FBAFC 001FB9FC 00000000 */   nop
/* FBB00 001FBA00 288E4070 */  paddub     $17, $2, $0
.L001FBA04:
/* FBB04 001FBA04 8100212A */  slti       $at, $17, 0x81
/* FBB08 001FBA08 02002014 */  bnez       $at, .L001FBA14
/* FBB0C 001FBA0C 00000000 */   nop
/* FBB10 001FBA10 80001124 */  addiu      $17, $0, 0x80
.L001FBA14:
/* FBB14 001FBA14 D901013C */  lui        $at, (0x1D903F2 >> 16)
/* FBB18 001FBA18 F20331A4 */  sh         $17, (0x1D903F2 & 0xFFFF)($at)
/* FBB1C 001FBA1C 12000010 */  b          .L001FBA68
/* FBB20 001FBA20 00000000 */   nop
.L001FBA24:
/* FBB24 001FBA24 0300C018 */  blez       $6, .L001FBA34
/* FBB28 001FBA28 00000000 */   nop
/* FBB2C 001FBA2C B7000010 */  b          .L001FBD0C
/* FBB30 001FBA30 00000000 */   nop
.L001FBA34:
/* FBB34 001FBA34 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBB38 001FBA38 7CEA2384 */  lh         $3, -0x1584($at)
/* FBB3C 001FBA3C 07006228 */  slti       $2, $3, 0x7
/* FBB40 001FBA40 03004014 */  bnez       $2, .L001FBA50
/* FBB44 001FBA44 00000000 */   nop
/* FBB48 001FBA48 B0000010 */  b          .L001FBD0C
/* FBB4C 001FBA4C 00000000 */   nop
.L001FBA50:
/* FBB50 001FBA50 05004014 */  bnez       $2, .L001FBA68
/* FBB54 001FBA54 00000000 */   nop
/* FBB58 001FBA58 0F006128 */  slti       $at, $3, 0xF
/* FBB5C 001FBA5C 02002010 */  beqz       $at, .L001FBA68
/* FBB60 001FBA60 00000000 */   nop
/* FBB64 001FBA64 288E0070 */  paddub     $17, $0, $0
.L001FBA68:
/* FBB68 001FBA68 00009144 */  mtc1       $17, $f0
/* FBB6C 001FBA6C 00000000 */  nop
/* FBB70 001FBA70 20008046 */  cvt.s.w    $f0, $f0
/* FBB74 001FBA74 FC00A0E7 */  swc1       $f0, 0xFC($sp)
/* FBB78 001FBA78 F000A427 */  addiu      $4, $sp, 0xF0
/* FBB7C 001FBA7C 40B7040C */  jal        MGSetAmbient__FPf
/* FBB80 001FBA80 00000000 */   nop
/* FBB84 001FBA84 0495838F */  lw         $3, -0x6AFC($gp)
/* FBB88 001FBA88 02000224 */  addiu      $2, $0, 0x2
/* FBB8C 001FBA8C 9F006214 */  bne        $3, $2, .L001FBD0C
/* FBB90 001FBA90 00000000 */   nop
/* FBB94 001FBA94 00004286 */  lh         $2, 0x0($18)
/* FBB98 001FBA98 01014228 */  slti       $2, $2, 0x101
/* FBB9C 001FBA9C 57004014 */  bnez       $2, .L001FBBFC
/* FBBA0 001FBAA0 00000000 */   nop
/* FBBA4 001FBAA4 28A60070 */  paddub     $20, $0, $0
/* FBBA8 001FBAA8 7034080C */  jal        GetNowTestNo__Fv
/* FBBAC 001FBAAC 00000000 */   nop
/* FBBB0 001FBAB0 01000324 */  addiu      $3, $0, 0x1
/* FBBB4 001FBAB4 03004310 */  beq        $2, $3, .L001FBAC4
/* FBBB8 001FBAB8 00000000 */   nop
/* FBBBC 001FBABC 41000010 */  b          .L001FBBC4
/* FBBC0 001FBAC0 00000000 */   nop
.L001FBAC4:
/* FBBC4 001FBAC4 3100C012 */  beqz       $22, .L001FBB8C
/* FBBC8 001FBAC8 00000000 */   nop
/* FBBCC 001FBACC F494848F */  lw         $4, -0x6B0C($gp)
/* FBBD0 001FBAD0 38B4080C */  jal        MenuTextureReload__Fi
/* FBBD4 001FBAD4 00000000 */   nop
/* FBBD8 001FBAD8 2900023C */  lui        $2, %hi(_2250)
/* FBBDC 001FBADC A0324224 */  addiu      $2, $2, %lo(_2250)
/* FBBE0 001FBAE0 2002A427 */  addiu      $4, $sp, 0x220
/* FBBE4 001FBAE4 00004378 */  lq         $3, 0x0($2)
/* FBBE8 001FBAE8 100042DC */  ld         $2, 0x10($2)
/* FBBEC 001FBAEC 0000837C */  sq         $3, 0x0($4)
/* FBBF0 001FBAF0 100082FC */  sd         $2, 0x10($4)
/* FBBF4 001FBAF4 5002A0AF */  sw         $0, 0x250($sp)
/* FBBF8 001FBAF8 5402A0AF */  sw         $0, 0x254($sp)
/* FBBFC 001FBAFC 64000324 */  addiu      $3, $0, 0x64
/* FBC00 001FBB00 5802A3AF */  sw         $3, 0x258($sp)
/* FBC04 001FBB04 5C02A3AF */  sw         $3, 0x25C($sp)
/* FBC08 001FBB08 2400A226 */  addiu      $2, $21, 0x24
/* FBC0C 001FBB0C 4002A2AF */  sw         $2, 0x240($sp)
/* FBC10 001FBB10 96000224 */  addiu      $2, $0, 0x96
/* FBC14 001FBB14 4402A2AF */  sw         $2, 0x244($sp)
/* FBC18 001FBB18 4802A3AF */  sw         $3, 0x248($sp)
/* FBC1C 001FBB1C 63000224 */  addiu      $2, $0, 0x63
/* FBC20 001FBB20 4C02A2AF */  sw         $2, 0x24C($sp)
/* FBC24 001FBB24 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBC28 001FBB28 75EA2280 */  lb         $2, -0x158B($at)
/* FBC2C 001FBB2C 80100200 */  sll        $2, $2, 2
/* FBC30 001FBB30 21185D00 */  addu       $3, $2, $sp
/* FBC34 001FBB34 C701023C */  lui        $2, %hi(TexManager)
/* FBC38 001FBB38 70584424 */  addiu      $4, $2, %lo(TexManager)
/* FBC3C 001FBB3C 2002658C */  lw         $5, 0x220($3)
/* FBC40 001FBB40 FFFF0624 */  addiu      $6, $0, -0x1
/* FBC44 001FBB44 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* FBC48 001FBB48 00000000 */   nop
/* FBC4C 001FBB4C C0181100 */  sll        $3, $17, 3
/* FBC50 001FBB50 21207100 */  addu       $4, $3, $17
/* FBC54 001FBB54 28000324 */  addiu      $3, $0, 0x28
/* FBC58 001FBB58 1A008300 */  div        $0, $4, $3
/* FBC5C 001FBB5C 02006014 */  bnez       $3, .L001FBB68
/* FBC60 001FBB60 00000000 */   nop
/* FBC64 001FBB64 CD010000 */  break      0, 7
.L001FBB68:
/* FBC68 001FBB68 12380000 */  mflo       $7
/* FBC6C 001FBB6C 28264070 */  paddub     $4, $2, $0
/* FBC70 001FBB70 4002A527 */  addiu      $5, $sp, 0x240
/* FBC74 001FBB74 5002A627 */  addiu      $6, $sp, 0x250
/* FBC78 001FBB78 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* FBC7C 001FBB7C 00000000 */   nop
/* FBC80 001FBB80 0095848F */  lw         $4, -0x6B00($gp)
/* FBC84 001FBB84 38B4080C */  jal        MenuTextureReload__Fi
/* FBC88 001FBB88 00000000 */   nop
.L001FBB8C:
/* FBC8C 001FBB8C 28260072 */  paddub     $4, $16, $0
/* FBC90 001FBB90 2835080C */  jal        GetMenuWeaponModelFrameNo__Fi
/* FBC94 001FBB94 00000000 */   nop
/* FBC98 001FBB98 0A004004 */  bltz       $2, .L001FBBC4
/* FBC9C 001FBB9C 00000000 */   nop
/* FBCA0 001FBBA0 B0110324 */  addiu      $3, $0, 0x11B0
/* FBCA4 001FBBA4 18184300 */  mult       $3, $2, $3
/* FBCA8 001FBBA8 D901023C */  lui        $2, %hi(DngWeaponFrm)
/* FBCAC 001FBBAC 30164224 */  addiu      $2, $2, %lo(DngWeaponFrm)
/* FBCB0 001FBBB0 21A04300 */  addu       $20, $2, $3
/* FBCB4 001FBBB4 28268072 */  paddub     $4, $20, $0
/* FBCB8 001FBBB8 282E4072 */  paddub     $5, $18, $0
/* FBCBC 001FBBBC CC33080C */  jal        MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
/* FBCC0 001FBBC0 00000000 */   nop
.L001FBBC4:
/* FBCC4 001FBBC4 21008012 */  beqz       $20, .L001FBC4C
/* FBCC8 001FBBC8 00000000 */   nop
/* FBCCC 001FBBCC 2826A072 */  paddub     $4, $21, $0
/* FBCD0 001FBBD0 A0000524 */  addiu      $5, $0, 0xA0
/* FBCD4 001FBBD4 06A30046 */  mov.s      $f12, $f20
/* FBCD8 001FBBD8 28368072 */  paddub     $6, $20, $0
/* FBCDC 001FBBDC 283E4072 */  paddub     $7, $18, $0
/* FBCE0 001FBBE0 2846C072 */  paddub     $8, $22, $0
/* FBCE4 001FBBE4 284E6072 */  paddub     $9, $19, $0
/* FBCE8 001FBBE8 28562072 */  paddub     $10, $17, $0
/* FBCEC 001FBBEC 80EC070C */  jal        DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
/* FBCF0 001FBBF0 00000000 */   nop
/* FBCF4 001FBBF4 15000010 */  b          .L001FBC4C
/* FBCF8 001FBBF8 00000000 */   nop
.L001FBBFC:
/* FBCFC 001FBBFC E094848F */  lw         $4, -0x6B20($gp)
/* FBD00 001FBC00 38B4080C */  jal        MenuTextureReload__Fi
/* FBD04 001FBC04 00000000 */   nop
/* FBD08 001FBC08 06006012 */  beqz       $19, .L001FBC24
/* FBD0C 001FBC0C 00000000 */   nop
/* FBD10 001FBC10 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBD14 001FBC14 7CEA2384 */  lh         $3, -0x1584($at)
/* FBD18 001FBC18 08000224 */  addiu      $2, $0, 0x8
/* FBD1C 001FBC1C 0B006210 */  beq        $3, $2, .L001FBC4C
/* FBD20 001FBC20 00000000 */   nop
.L001FBC24:
/* FBD24 001FBC24 FCFFA426 */  addiu      $4, $21, -0x4
/* FBD28 001FBC28 82000524 */  addiu      $5, $0, 0x82
/* FBD2C 001FBC2C B4000624 */  addiu      $6, $0, 0xB4
/* FBD30 001FBC30 96000724 */  addiu      $7, $0, 0x96
/* FBD34 001FBC34 2A00023C */  lui        $2, %hi(_931_4)
/* FBD38 001FBC38 38D54824 */  addiu      $8, $2, %lo(_931_4)
/* FBD3C 001FBC3C 284E0070 */  paddub     $9, $0, $0
/* FBD40 001FBC40 28562072 */  paddub     $10, $17, $0
/* FBD44 001FBC44 1C30080C */  jal        DrawMenuNothing__FiiiiPcii
/* FBD48 001FBC48 00000000 */   nop
.L001FBC4C:
/* FBD4C 001FBC4C D901013C */  lui        $at, (0x1D903F0 >> 16)
/* FBD50 001FBC50 F00320A0 */  sb         $0, (0x1D903F0 & 0xFFFF)($at)
/* FBD54 001FBC54 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBD58 001FBC58 72EA2384 */  lh         $3, -0x158E($at)
/* FBD5C 001FBC5C 20006010 */  beqz       $3, .L001FBCE0
/* FBD60 001FBC60 00000000 */   nop
/* FBD64 001FBC64 08000224 */  addiu      $2, $0, 0x8
/* FBD68 001FBC68 0C006210 */  beq        $3, $2, .L001FBC9C
/* FBD6C 001FBC6C 00000000 */   nop
/* FBD70 001FBC70 0A000224 */  addiu      $2, $0, 0xA
/* FBD74 001FBC74 09006210 */  beq        $3, $2, .L001FBC9C
/* FBD78 001FBC78 00000000 */   nop
/* FBD7C 001FBC7C 09000224 */  addiu      $2, $0, 0x9
/* FBD80 001FBC80 06006210 */  beq        $3, $2, .L001FBC9C
/* FBD84 001FBC84 00000000 */   nop
/* FBD88 001FBC88 0B000224 */  addiu      $2, $0, 0xB
/* FBD8C 001FBC8C 03006210 */  beq        $3, $2, .L001FBC9C
/* FBD90 001FBC90 00000000 */   nop
/* FBD94 001FBC94 1A000010 */  b          .L001FBD00
/* FBD98 001FBC98 00000000 */   nop
.L001FBC9C:
/* FBD9C 001FBC9C E094848F */  lw         $4, -0x6B20($gp)
/* FBDA0 001FBCA0 38B4080C */  jal        MenuTextureReload__Fi
/* FBDA4 001FBCA4 00000000 */   nop
/* FBDA8 001FBCA8 E4FFA426 */  addiu      $4, $21, -0x1C
/* FBDAC 001FBCAC E6000524 */  addiu      $5, $0, 0xE6
/* FBDB0 001FBCB0 D4000624 */  addiu      $6, $0, 0xD4
/* FBDB4 001FBCB4 283E2072 */  paddub     $7, $17, $0
/* FBDB8 001FBCB8 C4E7070C */  jal        DrawBtlMenuLRCursor__Fiiii
/* FBDBC 001FBCBC 00000000 */   nop
/* FBDC0 001FBCC0 F4FFA426 */  addiu      $4, $21, -0xC
/* FBDC4 001FBCC4 F0000524 */  addiu      $5, $0, 0xF0
/* FBDC8 001FBCC8 28364072 */  paddub     $6, $18, $0
/* FBDCC 001FBCCC 283E0070 */  paddub     $7, $0, $0
/* FBDD0 001FBCD0 28460070 */  paddub     $8, $0, $0
/* FBDD4 001FBCD4 284E2072 */  paddub     $9, $17, $0
/* FBDD8 001FBCD8 FCEB070C */  jal        DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
/* FBDDC 001FBCDC 00000000 */   nop
.L001FBCE0:
/* FBDE0 001FBCE0 5000A526 */  addiu      $5, $21, 0x50
/* FBDE4 001FBCE4 28264072 */  paddub     $4, $18, $0
/* FBDE8 001FBCE8 8E000624 */  addiu      $6, $0, 0x8E
/* FBDEC 001FBCEC 283E2072 */  paddub     $7, $17, $0
/* FBDF0 001FBCF0 FC3D080C */  jal        WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
/* FBDF4 001FBCF4 00000000 */   nop
/* FBDF8 001FBCF8 04000010 */  b          .L001FBD0C
/* FBDFC 001FBCFC 00000000 */   nop
.L001FBD00:
/* FBE00 001FBD00 01000224 */  addiu      $2, $0, 0x1
/* FBE04 001FBD04 D901013C */  lui        $at, (0x1D903F0 >> 16)
/* FBE08 001FBD08 F00322A0 */  sb         $2, (0x1D903F0 & 0xFFFF)($at)
.L001FBD0C:
/* FBE0C 001FBD0C 01001026 */  addiu      $16, $16, 0x1
/* FBE10 001FBD10 D600B526 */  addiu      $21, $21, 0xD6
/* FBE14 001FBD14 8041023C */  lui        $2, (0x41800000 >> 16)
/* FBE18 001FBD18 00008244 */  mtc1       $2, $f0
/* FBE1C 001FBD1C 00000000 */  nop
/* FBE20 001FBD20 00A50046 */  add.s      $f20, $f20, $f0
.L001FBD24:
/* FBE24 001FBD24 0A00022A */  slti       $2, $16, 0xA
/* FBE28 001FBD28 EBFE4014 */  bnez       $2, .L001FB8D8
/* FBE2C 001FBD2C 00000000 */   nop
.L001FBD30:
/* FBE30 001FBD30 0001A427 */  addiu      $4, $sp, 0x100
/* FBE34 001FBD34 4001A527 */  addiu      $5, $sp, 0x140
/* FBE38 001FBD38 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* FBE3C 001FBD3C 00000000 */   nop
/* FBE40 001FBD40 E000A427 */  addiu      $4, $sp, 0xE0
/* FBE44 001FBD44 40B7040C */  jal        MGSetAmbient__FPf
/* FBE48 001FBD48 00000000 */   nop
/* FBE4C 001FBD4C 0495848F */  lw         $4, -0x6AFC($gp)
/* FBE50 001FBD50 02000324 */  addiu      $3, $0, 0x2
/* FBE54 001FBD54 17008314 */  bne        $4, $3, .L001FBDB4
/* FBE58 001FBD58 00000000 */   nop
/* FBE5C 001FBD5C 282E0070 */  paddub     $5, $0, $0
/* FBE60 001FBD60 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBE64 001FBD64 72EA2384 */  lh         $3, -0x158E($at)
/* FBE68 001FBD68 0A000224 */  addiu      $2, $0, 0xA
/* FBE6C 001FBD6C 0C006210 */  beq        $3, $2, .L001FBDA0
/* FBE70 001FBD70 00000000 */   nop
/* FBE74 001FBD74 09000224 */  addiu      $2, $0, 0x9
/* FBE78 001FBD78 09006210 */  beq        $3, $2, .L001FBDA0
/* FBE7C 001FBD7C 00000000 */   nop
/* FBE80 001FBD80 08000224 */  addiu      $2, $0, 0x8
/* FBE84 001FBD84 06006210 */  beq        $3, $2, .L001FBDA0
/* FBE88 001FBD88 00000000 */   nop
/* FBE8C 001FBD8C 0B000224 */  addiu      $2, $0, 0xB
/* FBE90 001FBD90 03006210 */  beq        $3, $2, .L001FBDA0
/* FBE94 001FBD94 00000000 */   nop
/* FBE98 001FBD98 02000010 */  b          .L001FBDA4
/* FBE9C 001FBD9C 00000000 */   nop
.L001FBDA0:
/* FBEA0 001FBDA0 01000524 */  addiu      $5, $0, 0x1
.L001FBDA4:
/* FBEA4 001FBDA4 72000424 */  addiu      $4, $0, 0x72
/* FBEA8 001FBDA8 2836E072 */  paddub     $6, $23, $0
/* FBEAC 001FBDAC B4E5070C */  jal        WeaponNameDraw__Fiii
/* FBEB0 001FBDB0 00000000 */   nop
.L001FBDB4:
/* FBEB4 001FBDB4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBEB8 001FBDB8 72EA2484 */  lh         $4, -0x158E($at)
/* FBEBC 001FBDBC 08000324 */  addiu      $3, $0, 0x8
/* FBEC0 001FBDC0 18008310 */  beq        $4, $3, .L001FBE24
/* FBEC4 001FBDC4 00000000 */   nop
/* FBEC8 001FBDC8 0A000324 */  addiu      $3, $0, 0xA
/* FBECC 001FBDCC 15008310 */  beq        $4, $3, .L001FBE24
/* FBED0 001FBDD0 00000000 */   nop
/* FBED4 001FBDD4 09000324 */  addiu      $3, $0, 0x9
/* FBED8 001FBDD8 12008310 */  beq        $4, $3, .L001FBE24
/* FBEDC 001FBDDC 00000000 */   nop
/* FBEE0 001FBDE0 0B000324 */  addiu      $3, $0, 0xB
/* FBEE4 001FBDE4 0F008310 */  beq        $4, $3, .L001FBE24
/* FBEE8 001FBDE8 00000000 */   nop
/* FBEEC 001FBDEC 01000010 */  b          .L001FBDF4
/* FBEF0 001FBDF0 00000000 */   nop
.L001FBDF4:
/* FBEF4 001FBDF4 284E0070 */  paddub     $9, $0, $0
/* FBEF8 001FBDF8 02008010 */  beqz       $4, .L001FBE04
/* FBEFC 001FBDFC 00000000 */   nop
/* FBF00 001FBE00 01000924 */  addiu      $9, $0, 0x1
.L001FBE04:
/* FBF04 001FBE04 28260070 */  paddub     $4, $0, $0
/* FBF08 001FBE08 CC000524 */  addiu      $5, $0, 0xCC
/* FBF0C 001FBE0C AE010624 */  addiu      $6, $0, 0x1AE
/* FBF10 001FBE10 D2000724 */  addiu      $7, $0, 0xD2
/* FBF14 001FBE14 2A00023C */  lui        $2, %hi(_924_2)
/* FBF18 001FBE18 E8D44824 */  addiu      $8, $2, %lo(_924_2)
/* FBF1C 001FBE1C 7CB6080C */  jal        FadeTexX__FiiiiPci
/* FBF20 001FBE20 00000000 */   nop
.L001FBE24:
/* FBF24 001FBE24 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FBF28 001FBE28 7CEA2484 */  lh         $4, -0x1584($at)
/* FBF2C 001FBE2C 08000324 */  addiu      $3, $0, 0x8
/* FBF30 001FBE30 0F008310 */  beq        $4, $3, .L001FBE70
/* FBF34 001FBE34 00000000 */   nop
/* FBF38 001FBE38 D901023C */  lui        $2, %hi(MenuMes)
/* FBF3C 001FBE3C F0034424 */  addiu      $4, $2, %lo(MenuMes)
/* FBF40 001FBE40 582E080C */  jal        Step__10MenuClsMesFv
/* FBF44 001FBE44 00000000 */   nop
/* FBF48 001FBE48 D901013C */  lui        $at, (0x1D903F2 >> 16)
/* FBF4C 001FBE4C F2032784 */  lh         $7, (0x1D903F2 & 0xFFFF)($at)
/* FBF50 001FBE50 D901023C */  lui        $2, %hi(MenuMes)
/* FBF54 001FBE54 F0034424 */  addiu      $4, $2, %lo(MenuMes)
/* FBF58 001FBE58 D901013C */  lui        $at, (0x1D903F8 >> 16)
/* FBF5C 001FBE5C F803258C */  lw         $5, (0x1D903F8 & 0xFFFF)($at)
/* FBF60 001FBE60 D901013C */  lui        $at, (0x1D903FC >> 16)
/* FBF64 001FBE64 FC03268C */  lw         $6, (0x1D903FC & 0xFFFF)($at)
/* FBF68 001FBE68 782E080C */  jal        Draw1__10MenuClsMesFiii
/* FBF6C 001FBE6C 00000000 */   nop
.L001FBE70:
/* FBF70 001FBE70 A000BF7B */  lq         $31, 0xA0($sp)
/* FBF74 001FBE74 9000BE7B */  lq         $fp, 0x90($sp)
/* FBF78 001FBE78 8000B77B */  lq         $23, 0x80($sp)
/* FBF7C 001FBE7C 7000B67B */  lq         $22, 0x70($sp)
/* FBF80 001FBE80 6000B57B */  lq         $21, 0x60($sp)
/* FBF84 001FBE84 5000B47B */  lq         $20, 0x50($sp)
/* FBF88 001FBE88 4000B37B */  lq         $19, 0x40($sp)
/* FBF8C 001FBE8C 3000B27B */  lq         $18, 0x30($sp)
/* FBF90 001FBE90 2000B17B */  lq         $17, 0x20($sp)
/* FBF94 001FBE94 1000B07B */  lq         $16, 0x10($sp)
/* FBF98 001FBE98 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* FBF9C 001FBE9C 6002BD27 */  addiu      $sp, $sp, 0x260
/* FBFA0 001FBEA0 0800E003 */  jr         $31
/* FBFA4 001FBEA4 00000000 */   nop
/* FBFA8 001FBEA8 00000000 */  nop
/* FBFAC 001FBEAC 00000000 */  nop
