.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaChangeDraw__Fv
/* 129840 00229740 A0FEBD27 */  addiu      $sp, $sp, -0x160
/* 129844 00229744 7000BF7F */  sq         $31, 0x70($sp)
/* 129848 00229748 6000B47F */  sq         $20, 0x60($sp)
/* 12984C 0022974C 5000B37F */  sq         $19, 0x50($sp)
/* 129850 00229750 4000B27F */  sq         $18, 0x40($sp)
/* 129854 00229754 3000B17F */  sq         $17, 0x30($sp)
/* 129858 00229758 2000B07F */  sq         $16, 0x20($sp)
/* 12985C 0022975C 1800B6E7 */  swc1       $f22, 0x18($sp)
/* 129860 00229760 1400B5E7 */  swc1       $f21, 0x14($sp)
/* 129864 00229764 1000B4E7 */  swc1       $f20, 0x10($sp)
/* 129868 00229768 28260070 */  paddub     $4, $0, $0
/* 12986C 0022976C 046F050C */  jal        setbilinear__Fi
/* 129870 00229770 00000000 */   nop
/* 129874 00229774 64000424 */  addiu      $4, $0, 0x64
/* 129878 00229778 80000524 */  addiu      $5, $0, 0x80
/* 12987C 0022977C ACB4080C */  jal        FrameImageDraw__Fii
/* 129880 00229780 00000000 */   nop
/* 129884 00229784 84978387 */  lh         $3, -0x687C($gp)
/* 129888 00229788 92026010 */  beqz       $3, .L0022A1D4
/* 12988C 0022978C 00000000 */   nop
/* 129890 00229790 80978487 */  lh         $4, -0x6880($gp)
/* 129894 00229794 38B4080C */  jal        MenuTextureReload__Fi
/* 129898 00229798 00000000 */   nop
/* 12989C 0022979C C701023C */  lui        $2, %hi(TexManager)
/* 1298A0 002297A0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 1298A4 002297A4 2A00023C */  lui        $2, %hi(_1349)
/* 1298A8 002297A8 98EF4524 */  addiu      $5, $2, %lo(_1349)
/* 1298AC 002297AC FFFF0624 */  addiu      $6, $0, -0x1
/* 1298B0 002297B0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 1298B4 002297B4 00000000 */   nop
/* 1298B8 002297B8 789780C7 */  lwc1       $f0, -0x6888($gp)
/* 1298BC 002297BC 60008046 */  cvt.s.w    $f1, $f0
/* 1298C0 002297C0 0040023C */  lui        $2, (0x40000000 >> 16)
/* 1298C4 002297C4 00008244 */  mtc1       $2, $f0
/* 1298C8 002297C8 988994C7 */  lwc1       $f20, -0x7668($gp)
/* 1298CC 002297CC 02001446 */  mul.s      $f0, $f0, $f20
/* 1298D0 002297D0 010B0046 */  sub.s      $f12, $f1, $f0
/* 1298D4 002297D4 2C44040C */  jal        fptosi
/* 1298D8 002297D8 00000000 */   nop
/* 1298DC 002297DC 7C9780C7 */  lwc1       $f0, -0x6884($gp)
/* 1298E0 002297E0 60008046 */  cvt.s.w    $f1, $f0
/* 1298E4 002297E4 048380C7 */  lwc1       $f0, -0x7CFC($gp)
/* 1298E8 002297E8 02001446 */  mul.s      $f0, $f0, $f20
/* 1298EC 002297EC 010B0046 */  sub.s      $f12, $f1, $f0
/* 1298F0 002297F0 2C44040C */  jal        fptosi
/* 1298F4 002297F4 00000000 */   nop
/* 1298F8 002297F8 80001024 */  addiu      $16, $0, 0x80
/* 1298FC 002297FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129900 00229800 338D2680 */  lb         $6, -0x72CD($at)
/* 129904 00229804 05000224 */  addiu      $2, $0, 0x5
/* 129908 00229808 0600C210 */  beq        $6, $2, .L00229824
/* 12990C 0022980C 00000000 */   nop
/* 129910 00229810 06000224 */  addiu      $2, $0, 0x6
/* 129914 00229814 0300C210 */  beq        $6, $2, .L00229824
/* 129918 00229818 00000000 */   nop
/* 12991C 0022981C 09000010 */  b          .L00229844
/* 129920 00229820 00000000 */   nop
.L00229824:
/* 129924 00229824 80000324 */  addiu      $3, $0, 0x80
/* 129928 00229828 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12992C 0022982C 7C8D228C */  lw         $2, -0x7284($at)
/* 129930 00229830 80100200 */  sll        $2, $2, 2
/* 129934 00229834 23806200 */  subu       $16, $3, $2
/* 129938 00229838 02000106 */  bgez       $16, .L00229844
/* 12993C 0022983C 00000000 */   nop
/* 129940 00229840 28860070 */  paddub     $16, $0, $0
.L00229844:
/* 129944 00229844 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129948 00229848 328D2280 */  lb         $2, -0x72CE($at)
/* 12994C 0022984C 00008244 */  mtc1       $2, $f0
/* 129950 00229850 00000000 */  nop
/* 129954 00229854 60008046 */  cvt.s.w    $f1, $f0
/* 129958 00229858 288680C7 */  lwc1       $f0, -0x79D8($gp)
/* 12995C 0022985C 03050146 */  div.s      $f20, $f0, $f1
/* 129960 00229860 01000224 */  addiu      $2, $0, 0x1
/* 129964 00229864 6100C210 */  beq        $6, $2, .L002299EC
/* 129968 00229868 00000000 */   nop
/* 12996C 0022986C 05000224 */  addiu      $2, $0, 0x5
/* 129970 00229870 0600C210 */  beq        $6, $2, .L0022988C
/* 129974 00229874 00000000 */   nop
/* 129978 00229878 06000224 */  addiu      $2, $0, 0x6
/* 12997C 0022987C 0300C210 */  beq        $6, $2, .L0022988C
/* 129980 00229880 00000000 */   nop
/* 129984 00229884 A8000010 */  b          .L00229B28
/* 129988 00229888 00000000 */   nop
.L0022988C:
/* 12998C 0022988C 988981C7 */  lwc1       $f1, -0x7668($gp)
/* 129990 00229890 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129994 00229894 7C8D20C4 */  lwc1       $f0, -0x7284($at)
/* 129998 00229898 20008046 */  cvt.s.w    $f0, $f0
/* 12999C 0022989C 00080046 */  add.s      $f0, $f1, $f0
/* 1299A0 002298A0 988980E7 */  swc1       $f0, -0x7668($gp)
/* 1299A4 002298A4 A041023C */  lui        $2, (0x41A00000 >> 16)
/* 1299A8 002298A8 00008244 */  mtc1       $2, $f0
/* 1299AC 002298AC 00000000 */  nop
/* 1299B0 002298B0 43A50046 */  div.s      $f21, $f20, $f0
/* 1299B4 002298B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1299B8 002298B8 748D21C4 */  lwc1       $f1, -0x728C($at)
/* 1299BC 002298BC 00008044 */  mtc1       $0, $f0
/* 1299C0 002298C0 00000000 */  nop
/* 1299C4 002298C4 34080046 */  c.lt.s     $f1, $f0
/* 1299C8 002298C8 00000000 */  nop
/* 1299CC 002298CC 02000045 */  bc1f       .L002298D8
/* 1299D0 002298D0 00000000 */   nop
/* 1299D4 002298D4 47AD0046 */  neg.s      $f21, $f21
.L002298D8:
/* 1299D8 002298D8 288E0070 */  paddub     $17, $0, $0
/* 1299DC 002298DC 3C000010 */  b          .L002299D0
/* 1299E0 002298E0 00000000 */   nop
.L002298E4:
/* 1299E4 002298E4 40181100 */  sll        $3, $17, 1
/* 1299E8 002298E8 DB01023C */  lui        $2, %hi(D_1DA8D68)
/* 1299EC 002298EC 688D4224 */  addiu      $2, $2, %lo(D_1DA8D68)
/* 1299F0 002298F0 21104300 */  addu       $2, $2, $3
/* 1299F4 002298F4 00004284 */  lh         $2, 0x0($2)
/* 1299F8 002298F8 00008244 */  mtc1       $2, $f0
/* 1299FC 002298FC 00000000 */  nop
/* 129A00 00229900 20008046 */  cvt.s.w    $f0, $f0
/* 129A04 00229904 1AA00046 */  mula.s     $f20, $f0
/* 129A08 00229908 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129A0C 0022990C 7C8D20C4 */  lwc1       $f0, -0x7284($at)
/* 129A10 00229910 20008046 */  cvt.s.w    $f0, $f0
/* 129A14 00229914 5CA80046 */  madd.s     $f1, $f21, $f0
/* 129A18 00229918 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* 129A1C 0022991C 80050146 */  add.s      $f22, $f0, $f1
/* 129A20 00229920 06B30046 */  mov.s      $f12, $f22
/* 129A24 00229924 9044040C */  jal        fptodp
/* 129A28 00229928 00000000 */   nop
/* 129A2C 0022992C 28264070 */  paddub     $4, $2, $0
/* 129A30 00229930 F473040C */  jal        cos
/* 129A34 00229934 00000000 */   nop
/* 129A38 00229938 28964070 */  paddub     $18, $2, $0
/* 129A3C 0022993C 98898CC7 */  lwc1       $f12, -0x7668($gp)
/* 129A40 00229940 9044040C */  jal        fptodp
/* 129A44 00229944 00000000 */   nop
/* 129A48 00229948 28264070 */  paddub     $4, $2, $0
/* 129A4C 0022994C 282E4072 */  paddub     $5, $18, $0
/* 129A50 00229950 9E3F040C */  jal        dpmul
/* 129A54 00229954 00000000 */   nop
/* 129A58 00229958 28264070 */  paddub     $4, $2, $0
/* 129A5C 0022995C 9241040C */  jal        dptofp
/* 129A60 00229960 00000000 */   nop
/* 129A64 00229964 C0901100 */  sll        $18, $17, 3
/* 129A68 00229968 DB01023C */  lui        $2, %hi(D_1DA8D38)
/* 129A6C 0022996C 388D4224 */  addiu      $2, $2, %lo(D_1DA8D38)
/* 129A70 00229970 21105200 */  addu       $2, $2, $18
/* 129A74 00229974 000040E4 */  swc1       $f0, 0x0($2)
/* 129A78 00229978 06B30046 */  mov.s      $f12, $f22
/* 129A7C 0022997C 9044040C */  jal        fptodp
/* 129A80 00229980 00000000 */   nop
/* 129A84 00229984 28264070 */  paddub     $4, $2, $0
/* 129A88 00229988 C474040C */  jal        sin
/* 129A8C 0022998C 00000000 */   nop
/* 129A90 00229990 289E4070 */  paddub     $19, $2, $0
/* 129A94 00229994 98898CC7 */  lwc1       $f12, -0x7668($gp)
/* 129A98 00229998 9044040C */  jal        fptodp
/* 129A9C 0022999C 00000000 */   nop
/* 129AA0 002299A0 28264070 */  paddub     $4, $2, $0
/* 129AA4 002299A4 282E6072 */  paddub     $5, $19, $0
/* 129AA8 002299A8 9E3F040C */  jal        dpmul
/* 129AAC 002299AC 00000000 */   nop
/* 129AB0 002299B0 28264070 */  paddub     $4, $2, $0
/* 129AB4 002299B4 9241040C */  jal        dptofp
/* 129AB8 002299B8 00000000 */   nop
/* 129ABC 002299BC DB01023C */  lui        $2, %hi(D_1DA8D3C)
/* 129AC0 002299C0 3C8D4224 */  addiu      $2, $2, %lo(D_1DA8D3C)
/* 129AC4 002299C4 21105200 */  addu       $2, $2, $18
/* 129AC8 002299C8 000040E4 */  swc1       $f0, 0x0($2)
/* 129ACC 002299CC 01003126 */  addiu      $17, $17, 0x1
.L002299D0:
/* 129AD0 002299D0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129AD4 002299D4 328D2280 */  lb         $2, -0x72CE($at)
/* 129AD8 002299D8 2A102202 */  slt        $2, $17, $2
/* 129ADC 002299DC C1FF4014 */  bnez       $2, .L002298E4
/* 129AE0 002299E0 00000000 */   nop
/* 129AE4 002299E4 50000010 */  b          .L00229B28
/* 129AE8 002299E8 00000000 */   nop
.L002299EC:
/* 129AEC 002299EC A041023C */  lui        $2, (0x41A00000 >> 16)
/* 129AF0 002299F0 00008244 */  mtc1       $2, $f0
/* 129AF4 002299F4 00000000 */  nop
/* 129AF8 002299F8 43A50046 */  div.s      $f21, $f20, $f0
/* 129AFC 002299FC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129B00 00229A00 748D21C4 */  lwc1       $f1, -0x728C($at)
/* 129B04 00229A04 00008044 */  mtc1       $0, $f0
/* 129B08 00229A08 00000000 */  nop
/* 129B0C 00229A0C 34080046 */  c.lt.s     $f1, $f0
/* 129B10 00229A10 00000000 */  nop
/* 129B14 00229A14 02000045 */  bc1f       .L00229A20
/* 129B18 00229A18 00000000 */   nop
/* 129B1C 00229A1C 47AD0046 */  neg.s      $f21, $f21
.L00229A20:
/* 129B20 00229A20 288E0070 */  paddub     $17, $0, $0
/* 129B24 00229A24 3B000010 */  b          .L00229B14
/* 129B28 00229A28 00000000 */   nop
.L00229A2C:
/* 129B2C 00229A2C 40181100 */  sll        $3, $17, 1
/* 129B30 00229A30 DB01023C */  lui        $2, %hi(D_1DA8D68)
/* 129B34 00229A34 688D4224 */  addiu      $2, $2, %lo(D_1DA8D68)
/* 129B38 00229A38 21104300 */  addu       $2, $2, $3
/* 129B3C 00229A3C 00004284 */  lh         $2, 0x0($2)
/* 129B40 00229A40 00008244 */  mtc1       $2, $f0
/* 129B44 00229A44 00000000 */  nop
/* 129B48 00229A48 20008046 */  cvt.s.w    $f0, $f0
/* 129B4C 00229A4C 1AA00046 */  mula.s     $f20, $f0
/* 129B50 00229A50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129B54 00229A54 348D20C4 */  lwc1       $f0, -0x72CC($at)
/* 129B58 00229A58 5CA80046 */  madd.s     $f1, $f21, $f0
/* 129B5C 00229A5C B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* 129B60 00229A60 80050146 */  add.s      $f22, $f0, $f1
/* 129B64 00229A64 06B30046 */  mov.s      $f12, $f22
/* 129B68 00229A68 9044040C */  jal        fptodp
/* 129B6C 00229A6C 00000000 */   nop
/* 129B70 00229A70 28264070 */  paddub     $4, $2, $0
/* 129B74 00229A74 F473040C */  jal        cos
/* 129B78 00229A78 00000000 */   nop
/* 129B7C 00229A7C 28964070 */  paddub     $18, $2, $0
/* 129B80 00229A80 98898CC7 */  lwc1       $f12, -0x7668($gp)
/* 129B84 00229A84 9044040C */  jal        fptodp
/* 129B88 00229A88 00000000 */   nop
/* 129B8C 00229A8C 28264070 */  paddub     $4, $2, $0
/* 129B90 00229A90 282E4072 */  paddub     $5, $18, $0
/* 129B94 00229A94 9E3F040C */  jal        dpmul
/* 129B98 00229A98 00000000 */   nop
/* 129B9C 00229A9C 28264070 */  paddub     $4, $2, $0
/* 129BA0 00229AA0 9241040C */  jal        dptofp
/* 129BA4 00229AA4 00000000 */   nop
/* 129BA8 00229AA8 C0901100 */  sll        $18, $17, 3
/* 129BAC 00229AAC DB01023C */  lui        $2, %hi(D_1DA8D38)
/* 129BB0 00229AB0 388D4224 */  addiu      $2, $2, %lo(D_1DA8D38)
/* 129BB4 00229AB4 21105200 */  addu       $2, $2, $18
/* 129BB8 00229AB8 000040E4 */  swc1       $f0, 0x0($2)
/* 129BBC 00229ABC 06B30046 */  mov.s      $f12, $f22
/* 129BC0 00229AC0 9044040C */  jal        fptodp
/* 129BC4 00229AC4 00000000 */   nop
/* 129BC8 00229AC8 28264070 */  paddub     $4, $2, $0
/* 129BCC 00229ACC C474040C */  jal        sin
/* 129BD0 00229AD0 00000000 */   nop
/* 129BD4 00229AD4 289E4070 */  paddub     $19, $2, $0
/* 129BD8 00229AD8 98898CC7 */  lwc1       $f12, -0x7668($gp)
/* 129BDC 00229ADC 9044040C */  jal        fptodp
/* 129BE0 00229AE0 00000000 */   nop
/* 129BE4 00229AE4 28264070 */  paddub     $4, $2, $0
/* 129BE8 00229AE8 282E6072 */  paddub     $5, $19, $0
/* 129BEC 00229AEC 9E3F040C */  jal        dpmul
/* 129BF0 00229AF0 00000000 */   nop
/* 129BF4 00229AF4 28264070 */  paddub     $4, $2, $0
/* 129BF8 00229AF8 9241040C */  jal        dptofp
/* 129BFC 00229AFC 00000000 */   nop
/* 129C00 00229B00 DB01023C */  lui        $2, %hi(D_1DA8D3C)
/* 129C04 00229B04 3C8D4224 */  addiu      $2, $2, %lo(D_1DA8D3C)
/* 129C08 00229B08 21105200 */  addu       $2, $2, $18
/* 129C0C 00229B0C 000040E4 */  swc1       $f0, 0x0($2)
/* 129C10 00229B10 01003126 */  addiu      $17, $17, 0x1
.L00229B14:
/* 129C14 00229B14 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129C18 00229B18 328D2280 */  lb         $2, -0x72CE($at)
/* 129C1C 00229B1C 2A102202 */  slt        $2, $17, $2
/* 129C20 00229B20 C2FF4014 */  bnez       $2, .L00229A2C
/* 129C24 00229B24 00000000 */   nop
.L00229B28:
/* 129C28 00229B28 8C97918F */  lw         $17, -0x6874($gp)
/* 129C2C 00229B2C 28960070 */  paddub     $18, $0, $0
/* 129C30 00229B30 3F000010 */  b          .L00229C30
/* 129C34 00229B34 00000000 */   nop
.L00229B38:
/* 129C38 00229B38 C0181200 */  sll        $3, $18, 3
/* 129C3C 00229B3C DB01023C */  lui        $2, %hi(D_1DA8D38)
/* 129C40 00229B40 388D4224 */  addiu      $2, $2, %lo(D_1DA8D38)
/* 129C44 00229B44 21104300 */  addu       $2, $2, $3
/* 129C48 00229B48 000041C4 */  lwc1       $f1, 0x0($2)
/* 129C4C 00229B4C 789780C7 */  lwc1       $f0, -0x6888($gp)
/* 129C50 00229B50 20008046 */  cvt.s.w    $f0, $f0
/* 129C54 00229B54 00030146 */  add.s      $f12, $f0, $f1
/* 129C58 00229B58 7C9780C7 */  lwc1       $f0, -0x6884($gp)
/* 129C5C 00229B5C 60008046 */  cvt.s.w    $f1, $f0
/* 129C60 00229B60 DB01023C */  lui        $2, %hi(D_1DA8D3C)
/* 129C64 00229B64 3C8D4224 */  addiu      $2, $2, %lo(D_1DA8D3C)
/* 129C68 00229B68 21104300 */  addu       $2, $2, $3
/* 129C6C 00229B6C 000040C4 */  lwc1       $f0, 0x0($2)
/* 129C70 00229B70 000D0046 */  add.s      $f20, $f1, $f0
/* 129C74 00229B74 80001324 */  addiu      $19, $0, 0x80
/* 129C78 00229B78 40101200 */  sll        $2, $18, 1
/* 129C7C 00229B7C 21105200 */  addu       $2, $2, $18
/* 129C80 00229B80 00190200 */  sll        $3, $2, 4
/* 129C84 00229B84 28360070 */  paddub     $6, $0, $0
/* 129C88 00229B88 0300412A */  slti       $at, $18, 0x3
/* 129C8C 00229B8C 06002014 */  bnez       $at, .L00229BA8
/* 129C90 00229B90 00000000 */   nop
/* 129C94 00229B94 FDFF4326 */  addiu      $3, $18, -0x3
/* 129C98 00229B98 40100300 */  sll        $2, $3, 1
/* 129C9C 00229B9C 21104300 */  addu       $2, $2, $3
/* 129CA0 00229BA0 00190200 */  sll        $3, $2, 4
/* 129CA4 00229BA4 30000624 */  addiu      $6, $0, 0x30
.L00229BA8:
/* 129CA8 00229BA8 9097878F */  lw         $7, -0x6870($gp)
/* 129CAC 00229BAC 0700E010 */  beqz       $7, .L00229BCC
/* 129CB0 00229BB0 00000000 */   nop
/* 129CB4 00229BB4 40101200 */  sll        $2, $18, 1
/* 129CB8 00229BB8 21104700 */  addu       $2, $2, $7
/* 129CBC 00229BBC 12004284 */  lh         $2, 0x12($2)
/* 129CC0 00229BC0 0200401C */  bgtz       $2, .L00229BCC
/* 129CC4 00229BC4 00000000 */   nop
/* 129CC8 00229BC8 40001324 */  addiu      $19, $0, 0x40
.L00229BCC:
/* 129CCC 00229BCC B000A3AF */  sw         $3, 0xB0($sp)
/* 129CD0 00229BD0 B400A6AF */  sw         $6, 0xB4($sp)
/* 129CD4 00229BD4 30000224 */  addiu      $2, $0, 0x30
/* 129CD8 00229BD8 B800A2AF */  sw         $2, 0xB8($sp)
/* 129CDC 00229BDC BC00A2AF */  sw         $2, 0xBC($sp)
/* 129CE0 00229BE0 2C44040C */  jal        fptosi
/* 129CE4 00229BE4 00000000 */   nop
/* 129CE8 00229BE8 A000A2AF */  sw         $2, 0xA0($sp)
/* 129CEC 00229BEC 06A30046 */  mov.s      $f12, $f20
/* 129CF0 00229BF0 2C44040C */  jal        fptosi
/* 129CF4 00229BF4 00000000 */   nop
/* 129CF8 00229BF8 A400A2AF */  sw         $2, 0xA4($sp)
/* 129CFC 00229BFC 30000224 */  addiu      $2, $0, 0x30
/* 129D00 00229C00 A800A2AF */  sw         $2, 0xA8($sp)
/* 129D04 00229C04 AC00A2AF */  sw         $2, 0xAC($sp)
/* 129D08 00229C08 FF006732 */  andi       $7, $19, 0xFF
/* 129D0C 00229C0C 2846E070 */  paddub     $8, $7, $0
/* 129D10 00229C10 284EE070 */  paddub     $9, $7, $0
/* 129D14 00229C14 28262072 */  paddub     $4, $17, $0
/* 129D18 00229C18 A000A527 */  addiu      $5, $sp, 0xA0
/* 129D1C 00229C1C B000A627 */  addiu      $6, $sp, 0xB0
/* 129D20 00229C20 28560072 */  paddub     $10, $16, $0
/* 129D24 00229C24 E4B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
/* 129D28 00229C28 00000000 */   nop
/* 129D2C 00229C2C 01005226 */  addiu      $18, $18, 0x1
.L00229C30:
/* 129D30 00229C30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129D34 00229C34 328D2280 */  lb         $2, -0x72CE($at)
/* 129D38 00229C38 2A104202 */  slt        $2, $18, $2
/* 129D3C 00229C3C BEFF4014 */  bnez       $2, .L00229B38
/* 129D40 00229C40 00000000 */   nop
/* 129D44 00229C44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129D48 00229C48 338D2380 */  lb         $3, -0x72CD($at)
/* 129D4C 00229C4C 06000224 */  addiu      $2, $0, 0x6
/* 129D50 00229C50 1E006210 */  beq        $3, $2, .L00229CCC
/* 129D54 00229C54 00000000 */   nop
/* 129D58 00229C58 05000224 */  addiu      $2, $0, 0x5
/* 129D5C 00229C5C 1B006210 */  beq        $3, $2, .L00229CCC
/* 129D60 00229C60 00000000 */   nop
/* 129D64 00229C64 03000224 */  addiu      $2, $0, 0x3
/* 129D68 00229C68 18006210 */  beq        $3, $2, .L00229CCC
/* 129D6C 00229C6C 00000000 */   nop
/* 129D70 00229C70 04000224 */  addiu      $2, $0, 0x4
/* 129D74 00229C74 15006210 */  beq        $3, $2, .L00229CCC
/* 129D78 00229C78 00000000 */   nop
/* 129D7C 00229C7C 789780C7 */  lwc1       $f0, -0x6888($gp)
/* 129D80 00229C80 60008046 */  cvt.s.w    $f1, $f0
/* 129D84 00229C84 988980C7 */  lwc1       $f0, -0x7668($gp)
/* 129D88 00229C88 41080046 */  sub.s      $f1, $f1, $f0
/* 129D8C 00229C8C 3041023C */  lui        $2, (0x41300000 >> 16)
/* 129D90 00229C90 00008244 */  mtc1       $2, $f0
/* 129D94 00229C94 00000000 */  nop
/* 129D98 00229C98 010B0046 */  sub.s      $f12, $f1, $f0
/* 129D9C 00229C9C 7C97828F */  lw         $2, -0x6884($gp)
/* 129DA0 00229CA0 F4FF4224 */  addiu      $2, $2, -0xC
/* 129DA4 00229CA4 00008244 */  mtc1       $2, $f0
/* 129DA8 00229CA8 00000000 */  nop
/* 129DAC 00229CAC 60038046 */  cvt.s.w    $f13, $f0
/* 129DB0 00229CB0 34000424 */  addiu      $4, $0, 0x34
/* 129DB4 00229CB4 282E8070 */  paddub     $5, $4, $0
/* 129DB8 00229CB8 28360070 */  paddub     $6, $0, $0
/* 129DBC 00229CBC A096878F */  lw         $7, -0x6960($gp)
/* 129DC0 00229CC0 80000824 */  addiu      $8, $0, 0x80
/* 129DC4 00229CC4 C05E080C */  jal        DrawMenuWaku__FffiiiP8CTexturei
/* 129DC8 00229CC8 00000000 */   nop
.L00229CCC:
/* 129DCC 00229CCC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129DD0 00229CD0 338D2380 */  lb         $3, -0x72CD($at)
/* 129DD4 00229CD4 02000224 */  addiu      $2, $0, 0x2
/* 129DD8 00229CD8 07006210 */  beq        $3, $2, .L00229CF8
/* 129DDC 00229CDC 00000000 */   nop
/* 129DE0 00229CE0 03000224 */  addiu      $2, $0, 0x3
/* 129DE4 00229CE4 04006210 */  beq        $3, $2, .L00229CF8
/* 129DE8 00229CE8 00000000 */   nop
/* 129DEC 00229CEC 04000224 */  addiu      $2, $0, 0x4
/* 129DF0 00229CF0 45006214 */  bne        $3, $2, .L00229E08
/* 129DF4 00229CF4 00000000 */   nop
.L00229CF8:
/* 129DF8 00229CF8 40000424 */  addiu      $4, $0, 0x40
/* 129DFC 00229CFC A0B4080C */  jal        AllFadeForMenu__Fi
/* 129E00 00229D00 00000000 */   nop
/* 129E04 00229D04 01000224 */  addiu      $2, $0, 0x1
/* 129E08 00229D08 DA01013C */  lui        $at, (0x1DA3BA8 >> 16)
/* 129E0C 00229D0C A83B22AC */  sw         $2, (0x1DA3BA8 & 0xFFFF)($at)
/* 129E10 00229D10 05000224 */  addiu      $2, $0, 0x5
/* 129E14 00229D14 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 129E18 00229D18 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 129E1C 00229D1C DA01013C */  lui        $at, (0x1DA525C >> 16)
/* 129E20 00229D20 5C52248C */  lw         $4, (0x1DA525C & 0xFFFF)($at)
/* 129E24 00229D24 38B4080C */  jal        MenuTextureReload__Fi
/* 129E28 00229D28 00000000 */   nop
/* 129E2C 00229D2C DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 129E30 00229D30 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 129E34 00229D34 6437050C */  jal        Step__6ClsMesFv
/* 129E38 00229D38 00000000 */   nop
/* 129E3C 00229D3C DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 129E40 00229D40 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 129E44 00229D44 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 129E48 00229D48 00000000 */   nop
/* 129E4C 00229D4C DA01013C */  lui        $at, (0x1DA3B10 >> 16)
/* 129E50 00229D50 103B228C */  lw         $2, (0x1DA3B10 & 0xFFFF)($at)
/* 129E54 00229D54 E2FF5124 */  addiu      $17, $2, -0x1E
/* 129E58 00229D58 DA01013C */  lui        $at, (0x1DA3B14 >> 16)
/* 129E5C 00229D5C 143B228C */  lw         $2, (0x1DA3B14 & 0xFFFF)($at)
/* 129E60 00229D60 10004624 */  addiu      $6, $2, 0x10
/* 129E64 00229D64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129E68 00229D68 318D2380 */  lb         $3, -0x72CF($at)
/* 129E6C 00229D6C 40100300 */  sll        $2, $3, 1
/* 129E70 00229D70 21104300 */  addu       $2, $2, $3
/* 129E74 00229D74 C0100200 */  sll        $2, $2, 3
/* 129E78 00229D78 2190C200 */  addu       $18, $6, $2
/* 129E7C 00229D7C 00009144 */  mtc1       $17, $f0
/* 129E80 00229D80 00000000 */  nop
/* 129E84 00229D84 20008046 */  cvt.s.w    $f0, $f0
/* 129E88 00229D88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129E8C 00229D8C 848D21C4 */  lwc1       $f1, -0x727C($at)
/* 129E90 00229D90 01000146 */  sub.s      $f0, $f0, $f1
/* 129E94 00229D94 8040023C */  lui        $2, (0x40800000 >> 16)
/* 129E98 00229D98 00108244 */  mtc1       $2, $f2
/* 129E9C 00229D9C 00000000 */  nop
/* 129EA0 00229DA0 03000246 */  div.s      $f0, $f0, $f2
/* 129EA4 00229DA4 00080046 */  add.s      $f0, $f1, $f0
/* 129EA8 00229DA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129EAC 00229DAC 848D20E4 */  swc1       $f0, -0x727C($at)
/* 129EB0 00229DB0 00009244 */  mtc1       $18, $f0
/* 129EB4 00229DB4 00000000 */  nop
/* 129EB8 00229DB8 20008046 */  cvt.s.w    $f0, $f0
/* 129EBC 00229DBC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129EC0 00229DC0 888D21C4 */  lwc1       $f1, -0x7278($at)
/* 129EC4 00229DC4 01000146 */  sub.s      $f0, $f0, $f1
/* 129EC8 00229DC8 03000246 */  div.s      $f0, $f0, $f2
/* 129ECC 00229DCC 00080046 */  add.s      $f0, $f1, $f0
/* 129ED0 00229DD0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129ED4 00229DD4 888D20E4 */  swc1       $f0, -0x7278($at)
/* 129ED8 00229DD8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129EDC 00229DDC 848D2CC4 */  lwc1       $f12, -0x727C($at)
/* 129EE0 00229DE0 2C44040C */  jal        fptosi
/* 129EE4 00229DE4 00000000 */   nop
/* 129EE8 00229DE8 288E4070 */  paddub     $17, $2, $0
/* 129EEC 00229DEC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129EF0 00229DF0 888D2CC4 */  lwc1       $f12, -0x7278($at)
/* 129EF4 00229DF4 2C44040C */  jal        fptosi
/* 129EF8 00229DF8 00000000 */   nop
/* 129EFC 00229DFC 28964070 */  paddub     $18, $2, $0
/* 129F00 00229E00 1F000010 */  b          .L00229E80
/* 129F04 00229E04 00000000 */   nop
.L00229E08:
/* 129F08 00229E08 FFFF0224 */  addiu      $2, $0, -0x1
/* 129F0C 00229E0C DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 129F10 00229E10 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 129F14 00229E14 789780C7 */  lwc1       $f0, -0x6888($gp)
/* 129F18 00229E18 60008046 */  cvt.s.w    $f1, $f0
/* 129F1C 00229E1C 988980C7 */  lwc1       $f0, -0x7668($gp)
/* 129F20 00229E20 41080046 */  sub.s      $f1, $f1, $f0
/* 129F24 00229E24 0042023C */  lui        $2, (0x42000000 >> 16)
/* 129F28 00229E28 00008244 */  mtc1       $2, $f0
/* 129F2C 00229E2C 00000000 */  nop
/* 129F30 00229E30 010B0046 */  sub.s      $f12, $f1, $f0
/* 129F34 00229E34 2C44040C */  jal        fptosi
/* 129F38 00229E38 00000000 */   nop
/* 129F3C 00229E3C 288E4070 */  paddub     $17, $2, $0
/* 129F40 00229E40 7C97828F */  lw         $2, -0x6884($gp)
/* 129F44 00229E44 06005224 */  addiu      $18, $2, 0x6
/* 129F48 00229E48 D8FF222A */  slti       $2, $17, -0x28
/* 129F4C 00229E4C 0A004014 */  bnez       $2, .L00229E78
/* 129F50 00229E50 00000000 */   nop
/* 129F54 00229E54 8102212A */  slti       $at, $17, 0x281
/* 129F58 00229E58 07002010 */  beqz       $at, .L00229E78
/* 129F5C 00229E5C 00000000 */   nop
/* 129F60 00229E60 D8FF422A */  slti       $2, $18, -0x28
/* 129F64 00229E64 04004014 */  bnez       $2, .L00229E78
/* 129F68 00229E68 00000000 */   nop
/* 129F6C 00229E6C C301412A */  slti       $at, $18, 0x1C3
/* 129F70 00229E70 03002014 */  bnez       $at, .L00229E80
/* 129F74 00229E74 00000000 */   nop
.L00229E78:
/* 129F78 00229E78 8A021124 */  addiu      $17, $0, 0x28A
/* 129F7C 00229E7C C2011224 */  addiu      $18, $0, 0x1C2
.L00229E80:
/* 129F80 00229E80 F896828F */  lw         $2, -0x6908($gp)
/* 129F84 00229E84 01004224 */  addiu      $2, $2, 0x1
/* 129F88 00229E88 F89682AF */  sw         $2, -0x6908($gp)
/* 129F8C 00229E8C F896828F */  lw         $2, -0x6908($gp)
/* 129F90 00229E90 1000013C */  lui        $at, (0x107AC1 >> 16)
/* 129F94 00229E94 C17A2134 */  ori        $at, $at, (0x107AC1 & 0xFFFF)
/* 129F98 00229E98 2A084100 */  slt        $at, $2, $at
/* 129F9C 00229E9C 02002014 */  bnez       $at, .L00229EA8
/* 129FA0 00229EA0 00000000 */   nop
/* 129FA4 00229EA4 F89680AF */  sw         $0, -0x6908($gp)
.L00229EA8:
/* 129FA8 00229EA8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 129FAC 00229EAC 8C8D2284 */  lh         $2, -0x7274($at)
/* 129FB0 00229EB0 B1004010 */  beqz       $2, .L0022A178
/* 129FB4 00229EB4 00000000 */   nop
/* 129FB8 00229EB8 80978487 */  lh         $4, -0x6880($gp)
/* 129FBC 00229EBC 38B4080C */  jal        MenuTextureReload__Fi
/* 129FC0 00229EC0 00000000 */   nop
/* 129FC4 00229EC4 A6000224 */  addiu      $2, $0, 0xA6
/* 129FC8 00229EC8 D000A2AF */  sw         $2, 0xD0($sp)
/* 129FCC 00229ECC D400A0AF */  sw         $0, 0xD4($sp)
/* 129FD0 00229ED0 1A000324 */  addiu      $3, $0, 0x1A
/* 129FD4 00229ED4 D800A3AF */  sw         $3, 0xD8($sp)
/* 129FD8 00229ED8 1C000224 */  addiu      $2, $0, 0x1C
/* 129FDC 00229EDC DC00A2AF */  sw         $2, 0xDC($sp)
/* 129FE0 00229EE0 5C000224 */  addiu      $2, $0, 0x5C
/* 129FE4 00229EE4 C000A2AF */  sw         $2, 0xC0($sp)
/* 129FE8 00229EE8 24010224 */  addiu      $2, $0, 0x124
/* 129FEC 00229EEC C400A2AF */  sw         $2, 0xC4($sp)
/* 129FF0 00229EF0 C800A3AF */  sw         $3, 0xC8($sp)
/* 129FF4 00229EF4 1B000224 */  addiu      $2, $0, 0x1B
/* 129FF8 00229EF8 CC00A2AF */  sw         $2, 0xCC($sp)
/* 129FFC 00229EFC 8C97848F */  lw         $4, -0x6874($gp)
/* 12A000 00229F00 C000A527 */  addiu      $5, $sp, 0xC0
/* 12A004 00229F04 D000A627 */  addiu      $6, $sp, 0xD0
/* 12A008 00229F08 283E0072 */  paddub     $7, $16, $0
/* 12A00C 00229F0C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12A010 00229F10 00000000 */   nop
/* 12A014 00229F14 C0000224 */  addiu      $2, $0, 0xC0
/* 12A018 00229F18 F000A2AF */  sw         $2, 0xF0($sp)
/* 12A01C 00229F1C F400A0AF */  sw         $0, 0xF4($sp)
/* 12A020 00229F20 20000224 */  addiu      $2, $0, 0x20
/* 12A024 00229F24 F800A2AF */  sw         $2, 0xF8($sp)
/* 12A028 00229F28 1C000224 */  addiu      $2, $0, 0x1C
/* 12A02C 00229F2C FC00A2AF */  sw         $2, 0xFC($sp)
/* 12A030 00229F30 76000224 */  addiu      $2, $0, 0x76
/* 12A034 00229F34 E000A2AF */  sw         $2, 0xE0($sp)
/* 12A038 00229F38 24010224 */  addiu      $2, $0, 0x124
/* 12A03C 00229F3C E400A2AF */  sw         $2, 0xE4($sp)
/* 12A040 00229F40 30000224 */  addiu      $2, $0, 0x30
/* 12A044 00229F44 E800A2AF */  sw         $2, 0xE8($sp)
/* 12A048 00229F48 1B000224 */  addiu      $2, $0, 0x1B
/* 12A04C 00229F4C EC00A2AF */  sw         $2, 0xEC($sp)
/* 12A050 00229F50 8C97848F */  lw         $4, -0x6874($gp)
/* 12A054 00229F54 E000A527 */  addiu      $5, $sp, 0xE0
/* 12A058 00229F58 F000A627 */  addiu      $6, $sp, 0xF0
/* 12A05C 00229F5C 283E0072 */  paddub     $7, $16, $0
/* 12A060 00229F60 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12A064 00229F64 00000000 */   nop
/* 12A068 00229F68 E0000224 */  addiu      $2, $0, 0xE0
/* 12A06C 00229F6C 1001A2AF */  sw         $2, 0x110($sp)
/* 12A070 00229F70 1401A0AF */  sw         $0, 0x114($sp)
/* 12A074 00229F74 1A000324 */  addiu      $3, $0, 0x1A
/* 12A078 00229F78 1801A3AF */  sw         $3, 0x118($sp)
/* 12A07C 00229F7C 1C000224 */  addiu      $2, $0, 0x1C
/* 12A080 00229F80 1C01A2AF */  sw         $2, 0x11C($sp)
/* 12A084 00229F84 A6000224 */  addiu      $2, $0, 0xA6
/* 12A088 00229F88 0001A2AF */  sw         $2, 0x100($sp)
/* 12A08C 00229F8C 24010224 */  addiu      $2, $0, 0x124
/* 12A090 00229F90 0401A2AF */  sw         $2, 0x104($sp)
/* 12A094 00229F94 0801A3AF */  sw         $3, 0x108($sp)
/* 12A098 00229F98 1B000224 */  addiu      $2, $0, 0x1B
/* 12A09C 00229F9C 0C01A2AF */  sw         $2, 0x10C($sp)
/* 12A0A0 00229FA0 8C97848F */  lw         $4, -0x6874($gp)
/* 12A0A4 00229FA4 0001A527 */  addiu      $5, $sp, 0x100
/* 12A0A8 00229FA8 1001A627 */  addiu      $6, $sp, 0x110
/* 12A0AC 00229FAC 283E0072 */  paddub     $7, $16, $0
/* 12A0B0 00229FB0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12A0B4 00229FB4 00000000 */   nop
/* 12A0B8 00229FB8 9097828F */  lw         $2, -0x6870($gp)
/* 12A0BC 00229FBC 46434494 */  lhu        $4, 0x4346($2)
/* 12A0C0 00229FC0 2900023C */  lui        $2, %hi(_1581_3)
/* 12A0C4 00229FC4 A0424224 */  addiu      $2, $2, %lo(_1581_3)
/* 12A0C8 00229FC8 8000A827 */  addiu      $8, $sp, 0x80
/* 12A0CC 00229FCC 00004278 */  lq         $2, 0x0($2)
/* 12A0D0 00229FD0 0000027D */  sq         $2, 0x0($8)
/* 12A0D4 00229FD4 B7000524 */  addiu      $5, $0, 0xB7
/* 12A0D8 00229FD8 2C010624 */  addiu      $6, $0, 0x12C
/* 12A0DC 00229FDC 8C97878F */  lw         $7, -0x6874($gp)
/* 12A0E0 00229FE0 284E0070 */  paddub     $9, $0, $0
/* 12A0E4 00229FE4 28560072 */  paddub     $10, $16, $0
/* 12A0E8 00229FE8 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 12A0EC 00229FEC 00000000 */   nop
/* 12A0F0 00229FF0 64000424 */  addiu      $4, $0, 0x64
/* 12A0F4 00229FF4 40010524 */  addiu      $5, $0, 0x140
/* 12A0F8 00229FF8 2C868CC7 */  lwc1       $f12, -0x79D4($gp)
/* 12A0FC 00229FFC 30868DC7 */  lwc1       $f13, -0x79D0($gp)
/* 12A100 0022A000 28360072 */  paddub     $6, $16, $0
/* 12A104 0022A004 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* 12A108 0022A008 00000000 */   nop
/* 12A10C 0022A00C 3001A0AF */  sw         $0, 0x130($sp)
/* 12A110 0022A010 60000224 */  addiu      $2, $0, 0x60
/* 12A114 0022A014 3401A2AF */  sw         $2, 0x134($sp)
/* 12A118 0022A018 20000324 */  addiu      $3, $0, 0x20
/* 12A11C 0022A01C 3801A3AF */  sw         $3, 0x138($sp)
/* 12A120 0022A020 3C01A3AF */  sw         $3, 0x13C($sp)
/* 12A124 0022A024 76000224 */  addiu      $2, $0, 0x76
/* 12A128 0022A028 2001A2AF */  sw         $2, 0x120($sp)
/* 12A12C 0022A02C 50010224 */  addiu      $2, $0, 0x150
/* 12A130 0022A030 2401A2AF */  sw         $2, 0x124($sp)
/* 12A134 0022A034 2801A3AF */  sw         $3, 0x128($sp)
/* 12A138 0022A038 2C01A3AF */  sw         $3, 0x12C($sp)
/* 12A13C 0022A03C 8C97848F */  lw         $4, -0x6874($gp)
/* 12A140 0022A040 2001A527 */  addiu      $5, $sp, 0x120
/* 12A144 0022A044 3001A627 */  addiu      $6, $sp, 0x130
/* 12A148 0022A048 283E0072 */  paddub     $7, $16, $0
/* 12A14C 0022A04C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12A150 0022A050 00000000 */   nop
/* 12A154 0022A054 20000224 */  addiu      $2, $0, 0x20
/* 12A158 0022A058 5001A2AF */  sw         $2, 0x150($sp)
/* 12A15C 0022A05C 60000224 */  addiu      $2, $0, 0x60
/* 12A160 0022A060 5401A2AF */  sw         $2, 0x154($sp)
/* 12A164 0022A064 10000324 */  addiu      $3, $0, 0x10
/* 12A168 0022A068 5801A3AF */  sw         $3, 0x158($sp)
/* 12A16C 0022A06C 5C01A3AF */  sw         $3, 0x15C($sp)
/* 12A170 0022A070 04010224 */  addiu      $2, $0, 0x104
/* 12A174 0022A074 4001A2AF */  sw         $2, 0x140($sp)
/* 12A178 0022A078 58010224 */  addiu      $2, $0, 0x158
/* 12A17C 0022A07C 4401A2AF */  sw         $2, 0x144($sp)
/* 12A180 0022A080 4801A3AF */  sw         $3, 0x148($sp)
/* 12A184 0022A084 4C01A3AF */  sw         $3, 0x14C($sp)
/* 12A188 0022A088 8C97848F */  lw         $4, -0x6874($gp)
/* 12A18C 0022A08C 4001A527 */  addiu      $5, $sp, 0x140
/* 12A190 0022A090 5001A627 */  addiu      $6, $sp, 0x150
/* 12A194 0022A094 283E0072 */  paddub     $7, $16, $0
/* 12A198 0022A098 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12A19C 0022A09C 00000000 */   nop
/* 12A1A0 0022A0A0 DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* 12A1A4 0022A0A4 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* 12A1A8 0022A0A8 38B4080C */  jal        MenuTextureReload__Fi
/* 12A1AC 0022A0AC 00000000 */   nop
/* 12A1B0 0022A0B0 A0000224 */  addiu      $2, $0, 0xA0
/* 12A1B4 0022A0B4 DA01013C */  lui        $at, (0x1DA22E0 >> 16)
/* 12A1B8 0022A0B8 E02222AC */  sw         $2, (0x1DA22E0 & 0xFFFF)($at)
/* 12A1BC 0022A0BC 4A010224 */  addiu      $2, $0, 0x14A
/* 12A1C0 0022A0C0 DA01013C */  lui        $at, (0x1DA22E4 >> 16)
/* 12A1C4 0022A0C4 E42222AC */  sw         $2, (0x1DA22E4 & 0xFFFF)($at)
/* 12A1C8 0022A0C8 AA000224 */  addiu      $2, $0, 0xAA
/* 12A1CC 0022A0CC DA01013C */  lui        $at, (0x1DA22E8 >> 16)
/* 12A1D0 0022A0D0 E82222AC */  sw         $2, (0x1DA22E8 & 0xFFFF)($at)
/* 12A1D4 0022A0D4 5E010224 */  addiu      $2, $0, 0x15E
/* 12A1D8 0022A0D8 DA01013C */  lui        $at, (0x1DA22EC >> 16)
/* 12A1DC 0022A0DC EC2222AC */  sw         $2, (0x1DA22EC & 0xFFFF)($at)
/* 12A1E0 0022A0E0 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12A1E4 0022A0E4 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12A1E8 0022A0E8 6437050C */  jal        Step__6ClsMesFv
/* 12A1EC 0022A0EC 00000000 */   nop
/* 12A1F0 0022A0F0 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 12A1F4 0022A0F4 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 12A1F8 0022A0F8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 12A1FC 0022A0FC 00000000 */   nop
/* 12A200 0022A100 2900023C */  lui        $2, %hi(_1582_2)
/* 12A204 0022A104 B0424224 */  addiu      $2, $2, %lo(_1582_2)
/* 12A208 0022A108 9000A327 */  addiu      $3, $sp, 0x90
/* 12A20C 0022A10C 00004278 */  lq         $2, 0x0($2)
/* 12A210 0022A110 0000627C */  sq         $2, 0x0($3)
/* 12A214 0022A114 9097828F */  lw         $2, -0x6870($gp)
/* 12A218 0022A118 60434524 */  addiu      $5, $2, 0x4360
/* 12A21C 0022A11C AE000424 */  addiu      $4, $0, 0xAE
/* 12A220 0022A120 4CC8080C */  jal        GetNowItemNum__FsP9ITEM_PACK
/* 12A224 0022A124 00000000 */   nop
/* 12A228 0022A128 289E4070 */  paddub     $19, $2, $0
/* 12A22C 0022A12C 22011424 */  addiu      $20, $0, 0x122
/* 12A230 0022A130 28266072 */  paddub     $4, $19, $0
/* 12A234 0022A134 C0B7080C */  jal        GetNumberKeta__Fi
/* 12A238 0022A138 00000000 */   nop
/* 12A23C 0022A13C 9800A38F */  lw         $3, 0x98($sp)
/* 12A240 0022A140 43180300 */  sra        $3, $3, 1
/* 12A244 0022A144 18106200 */  mult       $2, $3, $2
/* 12A248 0022A148 21A08202 */  addu       $20, $20, $2
/* 12A24C 0022A14C 0000B0FF */  sd         $16, 0x0($sp)
/* 12A250 0022A150 28266072 */  paddub     $4, $19, $0
/* 12A254 0022A154 282E8072 */  paddub     $5, $20, $0
/* 12A258 0022A158 58010624 */  addiu      $6, $0, 0x158
/* 12A25C 0022A15C 9000A727 */  addiu      $7, $sp, 0x90
/* 12A260 0022A160 A096888F */  lw         $8, -0x6960($gp)
/* 12A264 0022A164 284E0070 */  paddub     $9, $0, $0
/* 12A268 0022A168 28560070 */  paddub     $10, $0, $0
/* 12A26C 0022A16C C0010B24 */  addiu      $11, $0, 0x1C0
/* 12A270 0022A170 F45F080C */  jal        DrawMenuNumber__Fiii4RECTP8CTextureiiii
/* 12A274 0022A174 00000000 */   nop
.L0022A178:
/* 12A278 0022A178 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12A27C 0022A17C 338D2380 */  lb         $3, -0x72CD($at)
/* 12A280 0022A180 06000224 */  addiu      $2, $0, 0x6
/* 12A284 0022A184 10006210 */  beq        $3, $2, .L0022A1C8
/* 12A288 0022A188 00000000 */   nop
/* 12A28C 0022A18C 05000224 */  addiu      $2, $0, 0x5
/* 12A290 0022A190 0D006210 */  beq        $3, $2, .L0022A1C8
/* 12A294 0022A194 00000000 */   nop
/* 12A298 0022A198 03000224 */  addiu      $2, $0, 0x3
/* 12A29C 0022A19C 0A006210 */  beq        $3, $2, .L0022A1C8
/* 12A2A0 0022A1A0 00000000 */   nop
/* 12A2A4 0022A1A4 04000224 */  addiu      $2, $0, 0x4
/* 12A2A8 0022A1A8 07006210 */  beq        $3, $2, .L0022A1C8
/* 12A2AC 0022A1AC 00000000 */   nop
/* 12A2B0 0022A1B0 28262072 */  paddub     $4, $17, $0
/* 12A2B4 0022A1B4 282E4072 */  paddub     $5, $18, $0
/* 12A2B8 0022A1B8 01000624 */  addiu      $6, $0, 0x1
/* 12A2BC 0022A1BC 40000724 */  addiu      $7, $0, 0x40
/* 12A2C0 0022A1C0 D05B080C */  jal        DrawMenuObjectVibe__Fiiii
/* 12A2C4 0022A1C4 00000000 */   nop
.L0022A1C8:
/* 12A2C8 0022A1C8 01000424 */  addiu      $4, $0, 0x1
/* 12A2CC 0022A1CC 046F050C */  jal        setbilinear__Fi
/* 12A2D0 0022A1D0 00000000 */   nop
.L0022A1D4:
/* 12A2D4 0022A1D4 7000BF7B */  lq         $31, 0x70($sp)
/* 12A2D8 0022A1D8 6000B47B */  lq         $20, 0x60($sp)
/* 12A2DC 0022A1DC 5000B37B */  lq         $19, 0x50($sp)
/* 12A2E0 0022A1E0 4000B27B */  lq         $18, 0x40($sp)
/* 12A2E4 0022A1E4 3000B17B */  lq         $17, 0x30($sp)
/* 12A2E8 0022A1E8 2000B07B */  lq         $16, 0x20($sp)
/* 12A2EC 0022A1EC 1800B6C7 */  lwc1       $f22, 0x18($sp)
/* 12A2F0 0022A1F0 1400B5C7 */  lwc1       $f21, 0x14($sp)
/* 12A2F4 0022A1F4 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* 12A2F8 0022A1F8 6001BD27 */  addiu      $sp, $sp, 0x160
/* 12A2FC 0022A1FC 0800E003 */  jr         $31
/* 12A300 0022A200 00000000 */   nop
/* 12A304 0022A204 00000000 */  nop
/* 12A308 0022A208 00000000 */  nop
/* 12A30C 0022A20C 00000000 */  nop
