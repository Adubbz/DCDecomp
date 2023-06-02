.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetGateKey_Loop__Fv
/* D37A0 001D36A0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* D37A4 001D36A4 1000BF7F */  sq         $31, 0x10($sp)
/* D37A8 001D36A8 0000B07F */  sq         $16, 0x0($sp)
/* D37AC 001D36AC 28860070 */  paddub     $16, $0, $0
/* D37B0 001D36B0 6494838F */  lw         $3, -0x6B9C($gp)
/* D37B4 001D36B4 03000224 */  addiu      $2, $0, 0x3
/* D37B8 001D36B8 C1006210 */  beq        $3, $2, .L001D39C0
/* D37BC 001D36BC 00000000 */   nop
/* D37C0 001D36C0 02000224 */  addiu      $2, $0, 0x2
/* D37C4 001D36C4 9E006210 */  beq        $3, $2, .L001D3940
/* D37C8 001D36C8 00000000 */   nop
/* D37CC 001D36CC 01000224 */  addiu      $2, $0, 0x1
/* D37D0 001D36D0 3F006210 */  beq        $3, $2, .L001D37D0
/* D37D4 001D36D4 00000000 */   nop
/* D37D8 001D36D8 03006010 */  beqz       $3, .L001D36E8
/* D37DC 001D36DC 00000000 */   nop
/* D37E0 001D36E0 DD000010 */  b          .L001D3A58
/* D37E4 001D36E4 00000000 */   nop
.L001D36E8:
/* D37E8 001D36E8 8CFB040C */  jal        ReadBGSync__Fv
/* D37EC 001D36EC 00000000 */   nop
/* D37F0 001D36F0 33004014 */  bnez       $2, .L001D37C0
/* D37F4 001D36F4 00000000 */   nop
/* D37F8 001D36F8 509D858F */  lw         $5, -0x62B0($gp)
/* D37FC 001D36FC 1C000424 */  addiu      $4, $0, 0x1C
/* D3800 001D3700 FCAF760C */  jal        func_1DABFF0
/* D3804 001D3704 00000000 */   nop
/* D3808 001D3708 4C9D848F */  lw         $4, -0x62B4($gp)
/* D380C 001D370C F001023C */  lui        $2, %hi(D_1F06850)
/* D3810 001D3710 50684524 */  addiu      $5, $2, %lo(D_1F06850)
/* D3814 001D3714 28360070 */  paddub     $6, $0, $0
/* D3818 001D3718 283E0070 */  paddub     $7, $0, $0
/* D381C 001D371C 28460070 */  paddub     $8, $0, $0
/* D3820 001D3720 AC98040C */  jal        LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
/* D3824 001D3724 00000000 */   nop
/* D3828 001D3728 589D82AF */  sw         $2, -0x62A8($gp)
/* D382C 001D372C EA01013C */  lui        $at, (0x1EA1DDC >> 16)
/* D3830 001D3730 DC1D248C */  lw         $4, (0x1EA1DDC & 0xFFFF)($at)
/* D3834 001D3734 2A00023C */  lui        $2, %hi(_969)
/* D3838 001D3738 28C74524 */  addiu      $5, $2, %lo(_969)
/* D383C 001D373C C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D3840 001D3740 00000000 */   nop
/* D3844 001D3744 589D848F */  lw         $4, -0x62A8($gp)
/* D3848 001D3748 282E4070 */  paddub     $5, $2, $0
/* D384C 001D374C 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* D3850 001D3750 00000000 */   nop
/* D3854 001D3754 00688044 */  mtc1       $0, $f13
/* D3858 001D3758 00000000 */  nop
/* D385C 001D375C 066B0046 */  mov.s      $f12, $f13
/* D3860 001D3760 866B0046 */  mov.s      $f14, $f13
/* D3864 001D3764 589D848F */  lw         $4, -0x62A8($gp)
/* D3868 001D3768 A09F040C */  jal        SetPosition__6CFrameFfff
/* D386C 001D376C 00000000 */   nop
/* D3870 001D3770 00688044 */  mtc1       $0, $f13
/* D3874 001D3774 00000000 */  nop
/* D3878 001D3778 866B0046 */  mov.s      $f14, $f13
/* D387C 001D377C 066B0046 */  mov.s      $f12, $f13
/* D3880 001D3780 589D848F */  lw         $4, -0x62A8($gp)
/* D3884 001D3784 70A3040C */  jal        SetRotation__6CFrameFfff
/* D3888 001D3788 00000000 */   nop
/* D388C 001D378C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D3890 001D3790 00608244 */  mtc1       $2, $f12
/* D3894 001D3794 00000000 */  nop
/* D3898 001D3798 86630046 */  mov.s      $f14, $f12
/* D389C 001D379C 46630046 */  mov.s      $f13, $f12
/* D38A0 001D37A0 589D848F */  lw         $4, -0x62A8($gp)
/* D38A4 001D37A4 D49F040C */  jal        SetScale__6CFrameFfff
/* D38A8 001D37A8 00000000 */   nop
/* D38AC 001D37AC 01000224 */  addiu      $2, $0, 0x1
/* D38B0 001D37B0 689482AF */  sw         $2, -0x6B98($gp)
/* D38B4 001D37B4 6494828F */  lw         $2, -0x6B9C($gp)
/* D38B8 001D37B8 01004224 */  addiu      $2, $2, 0x1
/* D38BC 001D37BC 649482AF */  sw         $2, -0x6B9C($gp)
.L001D37C0:
/* D38C0 001D37C0 5CFA760C */  jal        func_1DBE970
/* D38C4 001D37C4 00000000 */   nop
/* D38C8 001D37C8 A3000010 */  b          .L001D3A58
/* D38CC 001D37CC 00000000 */   nop
.L001D37D0:
/* D38D0 001D37D0 28260070 */  paddub     $4, $0, $0
/* D38D4 001D37D4 B004770C */  jal        func_1DC12C0
/* D38D8 001D37D8 00000000 */   nop
/* D38DC 001D37DC FFFF0224 */  addiu      $2, $0, -0x1
/* D38E0 001D37E0 B49D82AF */  sw         $2, -0x624C($gp)
/* D38E4 001D37E4 01000224 */  addiu      $2, $0, 0x1
/* D38E8 001D37E8 EC9C82AF */  sw         $2, -0x6314($gp)
/* D38EC 001D37EC F09C82AF */  sw         $2, -0x6310($gp)
/* D38F0 001D37F0 E49C82AF */  sw         $2, -0x631C($gp)
/* D38F4 001D37F4 E89C82AF */  sw         $2, -0x6318($gp)
/* D38F8 001D37F8 22000224 */  addiu      $2, $0, 0x22
/* D38FC 001D37FC DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D3900 001D3800 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D3904 001D3804 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D3908 001D3808 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* D390C 001D380C C492040C */  jal        FollowOff__13CCameraFollowFv
/* D3910 001D3810 00000000 */   nop
/* D3914 001D3814 3000A427 */  addiu      $4, $sp, 0x30
/* D3918 001D3818 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D391C 001D381C 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D3920 001D3820 0C86040C */  jal        sceVu0CopyVector
/* D3924 001D3824 00000000 */   nop
/* D3928 001D3828 3400A1C7 */  lwc1       $f1, 0x34($sp)
/* D392C 001D382C 4041023C */  lui        $2, (0x41400000 >> 16)
/* D3930 001D3830 00008244 */  mtc1       $2, $f0
/* D3934 001D3834 00000000 */  nop
/* D3938 001D3838 00080046 */  add.s      $f0, $f1, $f0
/* D393C 001D383C 3400A0E7 */  swc1       $f0, 0x34($sp)
/* D3940 001D3840 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D3944 001D3844 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* D3948 001D3848 3000A527 */  addiu      $5, $sp, 0x30
/* D394C 001D384C C490040C */  jal        SetRef__7CCameraFPf
/* D3950 001D3850 00000000 */   nop
/* D3954 001D3854 2000A427 */  addiu      $4, $sp, 0x20
/* D3958 001D3858 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* D395C 001D385C 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* D3960 001D3860 0C86040C */  jal        sceVu0CopyVector
/* D3964 001D3864 00000000 */   nop
/* D3968 001D3868 00608044 */  mtc1       $0, $f12
/* D396C 001D386C 4000A427 */  addiu      $4, $sp, 0x40
/* D3970 001D3870 6850070C */  jal        getCharacterVector__FPff
/* D3974 001D3874 00000000 */   nop
/* D3978 001D3878 2042023C */  lui        $2, (0x42200000 >> 16)
/* D397C 001D387C 00608244 */  mtc1       $2, $f12
/* D3980 001D3880 4000A427 */  addiu      $4, $sp, 0x40
/* D3984 001D3884 282E8070 */  paddub     $5, $4, $0
/* D3988 001D3888 4688040C */  jal        sceVu0ScaleVectorXYZ
/* D398C 001D388C 00000000 */   nop
/* D3990 001D3890 2000A1C7 */  lwc1       $f1, 0x20($sp)
/* D3994 001D3894 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* D3998 001D3898 00080046 */  add.s      $f0, $f1, $f0
/* D399C 001D389C 2000A0E7 */  swc1       $f0, 0x20($sp)
/* D39A0 001D38A0 2400A2C7 */  lwc1       $f2, 0x24($sp)
/* D39A4 001D38A4 A041023C */  lui        $2, (0x41A00000 >> 16)
/* D39A8 001D38A8 00088244 */  mtc1       $2, $f1
/* D39AC 001D38AC 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* D39B0 001D38B0 00080046 */  add.s      $f0, $f1, $f0
/* D39B4 001D38B4 00100046 */  add.s      $f0, $f2, $f0
/* D39B8 001D38B8 2400A0E7 */  swc1       $f0, 0x24($sp)
/* D39BC 001D38BC 2800A1C7 */  lwc1       $f1, 0x28($sp)
/* D39C0 001D38C0 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* D39C4 001D38C4 00080046 */  add.s      $f0, $f1, $f0
/* D39C8 001D38C8 2800A0E7 */  swc1       $f0, 0x28($sp)
/* D39CC 001D38CC DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D39D0 001D38D0 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* D39D4 001D38D4 2000A527 */  addiu      $5, $sp, 0x20
/* D39D8 001D38D8 A490040C */  jal        SetPos__7CCameraFPf
/* D39DC 001D38DC 00000000 */   nop
/* D39E0 001D38E0 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* D39E4 001D38E4 E0484224 */  addiu      $2, $2, %lo(D_1DC48E0)
/* D39E8 001D38E8 A89C82AF */  sw         $2, -0x6358($gp)
/* D39EC 001D38EC A89C848F */  lw         $4, -0x6358($gp)
/* D39F0 001D38F0 FFFF0524 */  addiu      $5, $0, -0x1
/* D39F4 001D38F4 B802998C */  lw         $25, 0x2B8($4)
/* D39F8 001D38F8 0800398F */  lw         $25, 0x8($25)
/* D39FC 001D38FC 09F82003 */  jalr       $25
/* D3A00 001D3900 00000000 */   nop
/* D3A04 001D3904 A89C848F */  lw         $4, -0x6358($gp)
/* D3A08 001D3908 C492040C */  jal        FollowOff__13CCameraFollowFv
/* D3A0C 001D390C 00000000 */   nop
/* D3A10 001D3910 28010424 */  addiu      $4, $0, 0x128
/* D3A14 001D3914 FFFF0524 */  addiu      $5, $0, -0x1
/* D3A18 001D3918 28360070 */  paddub     $6, $0, $0
/* D3A1C 001D391C AC69050C */  jal        SndSePlay__Fiii
/* D3A20 001D3920 00000000 */   nop
/* D3A24 001D3924 5CFA760C */  jal        func_1DBE970
/* D3A28 001D3928 00000000 */   nop
/* D3A2C 001D392C 6494828F */  lw         $2, -0x6B9C($gp)
/* D3A30 001D3930 01004224 */  addiu      $2, $2, 0x1
/* D3A34 001D3934 649482AF */  sw         $2, -0x6B9C($gp)
/* D3A38 001D3938 47000010 */  b          .L001D3A58
/* D3A3C 001D393C 00000000 */   nop
.L001D3940:
/* D3A40 001D3940 EA01013C */  lui        $at, (0x1EA2064 >> 16)
/* D3A44 001D3944 6420228C */  lw         $2, (0x1EA2064 & 0xFFFF)($at)
/* D3A48 001D3948 240240C4 */  lwc1       $f0, 0x224($2)
/* D3A4C 001D394C 60008046 */  cvt.s.w    $f1, $f0
/* D3A50 001D3950 EA01013C */  lui        $at, (0x1EA2010 >> 16)
/* D3A54 001D3954 102022C4 */  lwc1       $f2, (0x1EA2010 & 0xFFFF)($at)
/* D3A58 001D3958 003F023C */  lui        $2, (0x3F000000 >> 16)
/* D3A5C 001D395C 00008244 */  mtc1       $2, $f0
/* D3A60 001D3960 00000000 */  nop
/* D3A64 001D3964 01080046 */  sub.s      $f0, $f1, $f0
/* D3A68 001D3968 34100046 */  c.lt.s     $f2, $f0
/* D3A6C 001D396C 00000000 */  nop
/* D3A70 001D3970 39000145 */  bc1t       .L001D3A58
/* D3A74 001D3974 00000000 */   nop
/* D3A78 001D3978 36100146 */  c.le.s     $f2, $f1
/* D3A7C 001D397C 00000000 */  nop
/* D3A80 001D3980 35000045 */  bc1f       .L001D3A58
/* D3A84 001D3984 00000000 */   nop
/* D3A88 001D3988 6094848F */  lw         $4, -0x6BA0($gp)
/* D3A8C 001D398C FFFF0524 */  addiu      $5, $0, -0x1
/* D3A90 001D3990 28000624 */  addiu      $6, $0, 0x28
/* D3A94 001D3994 01000724 */  addiu      $7, $0, 0x1
/* D3A98 001D3998 A480050C */  jal        ItemGetMes__Fiiii
/* D3A9C 001D399C 00000000 */   nop
/* D3AA0 001D39A0 23000224 */  addiu      $2, $0, 0x23
/* D3AA4 001D39A4 DC01013C */  lui        $at, (0x1DC448C >> 16)
/* D3AA8 001D39A8 8C4422AC */  sw         $2, (0x1DC448C & 0xFFFF)($at)
/* D3AAC 001D39AC 6494828F */  lw         $2, -0x6B9C($gp)
/* D3AB0 001D39B0 01004224 */  addiu      $2, $2, 0x1
/* D3AB4 001D39B4 649482AF */  sw         $2, -0x6B9C($gp)
/* D3AB8 001D39B8 27000010 */  b          .L001D3A58
/* D3ABC 001D39BC 00000000 */   nop
.L001D39C0:
/* D3AC0 001D39C0 CC01023C */  lui        $2, %hi(GamePad)
/* D3AC4 001D39C4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D3AC8 001D39C8 60000524 */  addiu      $5, $0, 0x60
/* D3ACC 001D39CC 1CAE040C */  jal        Down__8CGamePadFi
/* D3AD0 001D39D0 00000000 */   nop
/* D3AD4 001D39D4 20004010 */  beqz       $2, .L001D3A58
/* D3AD8 001D39D8 00000000 */   nop
/* D3ADC 001D39DC C701023C */  lui        $2, %hi(TexManager)
/* D3AE0 001D39E0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D3AE4 001D39E4 1C000524 */  addiu      $5, $0, 0x1C
/* D3AE8 001D39E8 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* D3AEC 001D39EC 00000000 */   nop
/* D3AF0 001D39F0 C701023C */  lui        $2, %hi(TexManager)
/* D3AF4 001D39F4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D3AF8 001D39F8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* D3AFC 001D39FC 00000000 */   nop
/* D3B00 001D3A00 01000424 */  addiu      $4, $0, 0x1
/* D3B04 001D3A04 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D3B08 001D3A08 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D3B0C 001D3A0C 789C828F */  lw         $2, -0x6388($gp)
/* D3B10 001D3A10 0100013C */  lui        $at, (0x10000 >> 16)
/* D3B14 001D3A14 21084100 */  addu       $at, $2, $at
/* D3B18 001D3A18 0C8B20AC */  sw         $0, -0x74F4($at)
/* D3B1C 001D3A1C B004770C */  jal        func_1DC12C0
/* D3B20 001D3A20 00000000 */   nop
/* D3B24 001D3A24 EC9C80AF */  sw         $0, -0x6314($gp)
/* D3B28 001D3A28 F09C80AF */  sw         $0, -0x6310($gp)
/* D3B2C 001D3A2C E49C80AF */  sw         $0, -0x631C($gp)
/* D3B30 001D3A30 E89C80AF */  sw         $0, -0x6318($gp)
/* D3B34 001D3A34 689480AF */  sw         $0, -0x6B98($gp)
/* D3B38 001D3A38 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D3B3C 001D3A3C 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D3B40 001D3A40 3480050C */  jal        ClearSystemMes__Fv
/* D3B44 001D3A44 00000000 */   nop
/* D3B48 001D3A48 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* D3B4C 001D3A4C E0454224 */  addiu      $2, $2, %lo(D_1DC45E0)
/* D3B50 001D3A50 A89C82AF */  sw         $2, -0x6358($gp)
/* D3B54 001D3A54 01001024 */  addiu      $16, $0, 0x1
.L001D3A58:
/* D3B58 001D3A58 28160072 */  paddub     $2, $16, $0
/* D3B5C 001D3A5C 1000BF7B */  lq         $31, 0x10($sp)
/* D3B60 001D3A60 0000B07B */  lq         $16, 0x0($sp)
/* D3B64 001D3A64 5000BD27 */  addiu      $sp, $sp, 0x50
/* D3B68 001D3A68 0800E003 */  jr         $31
/* D3B6C 001D3A6C 00000000 */   nop
