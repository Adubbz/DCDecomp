.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishRecordViewBoard__Fiii
/* F36F0 001F35F0 60FEBD27 */  addiu      $sp, $sp, -0x1A0
/* F36F4 001F35F4 9000BF7F */  sq         $31, 0x90($sp)
/* F36F8 001F35F8 8000BE7F */  sq         $fp, 0x80($sp)
/* F36FC 001F35FC 7000B77F */  sq         $23, 0x70($sp)
/* F3700 001F3600 6000B67F */  sq         $22, 0x60($sp)
/* F3704 001F3604 5000B57F */  sq         $21, 0x50($sp)
/* F3708 001F3608 4000B47F */  sq         $20, 0x40($sp)
/* F370C 001F360C 3000B37F */  sq         $19, 0x30($sp)
/* F3710 001F3610 2000B27F */  sq         $18, 0x20($sp)
/* F3714 001F3614 1000B17F */  sq         $17, 0x10($sp)
/* F3718 001F3618 0000B07F */  sq         $16, 0x0($sp)
/* F371C 001F361C 28AE8070 */  paddub     $21, $4, $0
/* F3720 001F3620 28A6A070 */  paddub     $20, $5, $0
/* F3724 001F3624 289EC070 */  paddub     $19, $6, $0
/* F3728 001F3628 D901013C */  lui        $at, (0x1D90390 >> 16)
/* F372C 001F362C 90032484 */  lh         $4, (0x1D90390 & 0xFFFF)($at)
/* F3730 001F3630 38B4080C */  jal        MenuTextureReload__Fi
/* F3734 001F3634 00000000 */   nop
/* F3738 001F3638 F000A0AF */  sw         $0, 0xF0($sp)
/* F373C 001F363C F400A0AF */  sw         $0, 0xF4($sp)
/* F3740 001F3640 60010324 */  addiu      $3, $0, 0x160
/* F3744 001F3644 F800A3AF */  sw         $3, 0xF8($sp)
/* F3748 001F3648 D0000224 */  addiu      $2, $0, 0xD0
/* F374C 001F364C FC00A2AF */  sw         $2, 0xFC($sp)
/* F3750 001F3650 E000B5AF */  sw         $21, 0xE0($sp)
/* F3754 001F3654 E400B4AF */  sw         $20, 0xE4($sp)
/* F3758 001F3658 E800A3AF */  sw         $3, 0xE8($sp)
/* F375C 001F365C EC00A2AF */  sw         $2, 0xEC($sp)
/* F3760 001F3660 C894848F */  lw         $4, -0x6B38($gp)
/* F3764 001F3664 E000A527 */  addiu      $5, $sp, 0xE0
/* F3768 001F3668 F000A627 */  addiu      $6, $sp, 0xF0
/* F376C 001F366C 283E6072 */  paddub     $7, $19, $0
/* F3770 001F3670 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3774 001F3674 00000000 */   nop
/* F3778 001F3678 F2FF9E26 */  addiu      $fp, $20, -0xE
/* F377C 001F367C 1000B026 */  addiu      $16, $21, 0x10
/* F3780 001F3680 60010224 */  addiu      $2, $0, 0x160
/* F3784 001F3684 A000A2AF */  sw         $2, 0xA0($sp)
/* F3788 001F3688 1A000224 */  addiu      $2, $0, 0x1A
/* F378C 001F368C A400B227 */  addiu      $18, $sp, 0xA4
/* F3790 001F3690 000042AE */  sw         $2, 0x0($18)
/* F3794 001F3694 44000224 */  addiu      $2, $0, 0x44
/* F3798 001F3698 A800B727 */  addiu      $23, $sp, 0xA8
/* F379C 001F369C 0000E2AE */  sw         $2, 0x0($23)
/* F37A0 001F36A0 1C000224 */  addiu      $2, $0, 0x1C
/* F37A4 001F36A4 AC00B627 */  addiu      $22, $sp, 0xAC
/* F37A8 001F36A8 0000C2AE */  sw         $2, 0x0($22)
/* F37AC 001F36AC 2900023C */  lui        $2, %hi(_3333)
/* F37B0 001F36B0 E82A4624 */  addiu      $6, $2, %lo(_3333)
/* F37B4 001F36B4 9001A327 */  addiu      $3, $sp, 0x190
/* F37B8 001F36B8 0000C2DC */  ld         $2, 0x0($6)
/* F37BC 001F36BC 0800C0C4 */  lwc1       $f0, 0x8($6)
/* F37C0 001F36C0 000062FC */  sd         $2, 0x0($3)
/* F37C4 001F36C4 080060E4 */  swc1       $f0, 0x8($3)
/* F37C8 001F36C8 288E0070 */  paddub     $17, $0, $0
/* F37CC 001F36CC 1C000010 */  b          .L001F3740
/* F37D0 001F36D0 00000000 */   nop
.L001F36D4:
/* F37D4 001F36D4 02000224 */  addiu      $2, $0, 0x2
/* F37D8 001F36D8 03002216 */  bne        $17, $2, .L001F36E8
/* F37DC 001F36DC 00000000 */   nop
/* F37E0 001F36E0 74000224 */  addiu      $2, $0, 0x74
/* F37E4 001F36E4 0000E2AE */  sw         $2, 0x0($23)
.L001F36E8:
/* F37E8 001F36E8 0000C28E */  lw         $2, 0x0($22)
/* F37EC 001F36EC FFFF4324 */  addiu      $3, $2, -0x1
/* F37F0 001F36F0 0000E28E */  lw         $2, 0x0($23)
/* F37F4 001F36F4 0001B0AF */  sw         $16, 0x100($sp)
/* F37F8 001F36F8 0401BEAF */  sw         $fp, 0x104($sp)
/* F37FC 001F36FC 0801A2AF */  sw         $2, 0x108($sp)
/* F3800 001F3700 0C01A3AF */  sw         $3, 0x10C($sp)
/* F3804 001F3704 C894848F */  lw         $4, -0x6B38($gp)
/* F3808 001F3708 0001A527 */  addiu      $5, $sp, 0x100
/* F380C 001F370C A000A627 */  addiu      $6, $sp, 0xA0
/* F3810 001F3710 283E6072 */  paddub     $7, $19, $0
/* F3814 001F3714 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3818 001F3718 00000000 */   nop
/* F381C 001F371C 80101100 */  sll        $2, $17, 2
/* F3820 001F3720 21105D00 */  addu       $2, $2, $sp
/* F3824 001F3724 9001428C */  lw         $2, 0x190($2)
/* F3828 001F3728 21800202 */  addu       $16, $16, $2
/* F382C 001F372C 01003126 */  addiu      $17, $17, 0x1
/* F3830 001F3730 0000438E */  lw         $3, 0x0($18)
/* F3834 001F3734 0000C28E */  lw         $2, 0x0($22)
/* F3838 001F3738 21106200 */  addu       $2, $3, $2
/* F383C 001F373C 000042AE */  sw         $2, 0x0($18)
.L001F3740:
/* F3840 001F3740 0300212A */  slti       $at, $17, 0x3
/* F3844 001F3744 E3FF2014 */  bnez       $at, .L001F36D4
/* F3848 001F3748 00000000 */   nop
/* F384C 001F374C 4401B026 */  addiu      $16, $21, 0x144
/* F3850 001F3750 2A008226 */  addiu      $2, $20, 0x2A
/* F3854 001F3754 00008244 */  mtc1       $2, $f0
/* F3858 001F3758 00000000 */  nop
/* F385C 001F375C A0008046 */  cvt.s.w    $f2, $f0
/* F3860 001F3760 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3864 001F3764 C40320C4 */  lwc1       $f0, (0x1D903C4 & 0xFFFF)($at)
/* F3868 001F3768 60008046 */  cvt.s.w    $f1, $f0
/* F386C 001F376C 188380C7 */  lwc1       $f0, -0x7CE8($gp)
/* F3870 001F3770 02000146 */  mul.s      $f0, $f0, $f1
/* F3874 001F3774 00130046 */  add.s      $f12, $f2, $f0
/* F3878 001F3778 2C44040C */  jal        fptosi
/* F387C 001F377C 00000000 */   nop
/* F3880 001F3780 288E4070 */  paddub     $17, $2, $0
/* F3884 001F3784 10010224 */  addiu      $2, $0, 0x110
/* F3888 001F3788 B000A2AF */  sw         $2, 0xB0($sp)
/* F388C 001F378C D0000224 */  addiu      $2, $0, 0xD0
/* F3890 001F3790 B400B227 */  addiu      $18, $sp, 0xB4
/* F3894 001F3794 000042AE */  sw         $2, 0x0($18)
/* F3898 001F3798 08000324 */  addiu      $3, $0, 0x8
/* F389C 001F379C B800A3AF */  sw         $3, 0xB8($sp)
/* F38A0 001F37A0 04000224 */  addiu      $2, $0, 0x4
/* F38A4 001F37A4 BC00A2AF */  sw         $2, 0xBC($sp)
/* F38A8 001F37A8 1001B0AF */  sw         $16, 0x110($sp)
/* F38AC 001F37AC 1401B1AF */  sw         $17, 0x114($sp)
/* F38B0 001F37B0 1801A3AF */  sw         $3, 0x118($sp)
/* F38B4 001F37B4 1C01A2AF */  sw         $2, 0x11C($sp)
/* F38B8 001F37B8 C894848F */  lw         $4, -0x6B38($gp)
/* F38BC 001F37BC 1001A527 */  addiu      $5, $sp, 0x110
/* F38C0 001F37C0 B000A627 */  addiu      $6, $sp, 0xB0
/* F38C4 001F37C4 283E6072 */  paddub     $7, $19, $0
/* F38C8 001F37C8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F38CC 001F37CC 00000000 */   nop
/* F38D0 001F37D0 0000428E */  lw         $2, 0x0($18)
/* F38D4 001F37D4 04004224 */  addiu      $2, $2, 0x4
/* F38D8 001F37D8 000042AE */  sw         $2, 0x0($18)
/* F38DC 001F37DC 2001B0AF */  sw         $16, 0x120($sp)
/* F38E0 001F37E0 04002226 */  addiu      $2, $17, 0x4
/* F38E4 001F37E4 2401A2AF */  sw         $2, 0x124($sp)
/* F38E8 001F37E8 08000224 */  addiu      $2, $0, 0x8
/* F38EC 001F37EC 2801A2AF */  sw         $2, 0x128($sp)
/* F38F0 001F37F0 BC41023C */  lui        $2, (0x41BC0000 >> 16)
/* F38F4 001F37F4 00608244 */  mtc1       $2, $f12
/* F38F8 001F37F8 2C44040C */  jal        fptosi
/* F38FC 001F37FC 00000000 */   nop
/* F3900 001F3800 2C01A2AF */  sw         $2, 0x12C($sp)
/* F3904 001F3804 C894848F */  lw         $4, -0x6B38($gp)
/* F3908 001F3808 2001A527 */  addiu      $5, $sp, 0x120
/* F390C 001F380C B000A627 */  addiu      $6, $sp, 0xB0
/* F3910 001F3810 283E6072 */  paddub     $7, $19, $0
/* F3914 001F3814 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3918 001F3818 00000000 */   nop
/* F391C 001F381C 0000428E */  lw         $2, 0x0($18)
/* F3920 001F3820 04004224 */  addiu      $2, $2, 0x4
/* F3924 001F3824 000042AE */  sw         $2, 0x0($18)
/* F3928 001F3828 3001B0AF */  sw         $16, 0x130($sp)
/* F392C 001F382C 04002226 */  addiu      $2, $17, 0x4
/* F3930 001F3830 00008244 */  mtc1       $2, $f0
/* F3934 001F3834 00000000 */  nop
/* F3938 001F3838 60008046 */  cvt.s.w    $f1, $f0
/* F393C 001F383C BC41023C */  lui        $2, (0x41BC0000 >> 16)
/* F3940 001F3840 00008244 */  mtc1       $2, $f0
/* F3944 001F3844 00000000 */  nop
/* F3948 001F3848 000B0046 */  add.s      $f12, $f1, $f0
/* F394C 001F384C 2C44040C */  jal        fptosi
/* F3950 001F3850 00000000 */   nop
/* F3954 001F3854 3401A2AF */  sw         $2, 0x134($sp)
/* F3958 001F3858 08000224 */  addiu      $2, $0, 0x8
/* F395C 001F385C 3801A2AF */  sw         $2, 0x138($sp)
/* F3960 001F3860 04000224 */  addiu      $2, $0, 0x4
/* F3964 001F3864 3C01A2AF */  sw         $2, 0x13C($sp)
/* F3968 001F3868 C894848F */  lw         $4, -0x6B38($gp)
/* F396C 001F386C 3001A527 */  addiu      $5, $sp, 0x130
/* F3970 001F3870 B000A627 */  addiu      $6, $sp, 0xB0
/* F3974 001F3874 283E6072 */  paddub     $7, $19, $0
/* F3978 001F3878 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F397C 001F387C 00000000 */   nop
/* F3980 001F3880 1200B026 */  addiu      $16, $21, 0x12
/* F3984 001F3884 06009126 */  addiu      $17, $20, 0x6
/* F3988 001F3888 28960070 */  paddub     $18, $0, $0
/* F398C 001F388C 86000010 */  b          .L001F3AA8
/* F3990 001F3890 00000000 */   nop
.L001F3894:
/* F3994 001F3894 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3998 001F3898 C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F399C 001F389C 21B05200 */  addu       $22, $2, $18
/* F39A0 001F38A0 2826C072 */  paddub     $4, $22, $0
/* F39A4 001F38A4 94CB070C */  jal        GetFishingRankData__Fi
/* F39A8 001F38A8 00000000 */   nop
/* F39AC 001F38AC 28F64070 */  paddub     $fp, $2, $0
/* F39B0 001F38B0 2900023C */  lui        $2, %hi(_3345)
/* F39B4 001F38B4 002B4224 */  addiu      $2, $2, %lo(_3345)
/* F39B8 001F38B8 C000A327 */  addiu      $3, $sp, 0xC0
/* F39BC 001F38BC 00004278 */  lq         $2, 0x0($2)
/* F39C0 001F38C0 0000627C */  sq         $2, 0x0($3)
/* F39C4 001F38C4 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F39C8 001F38C8 C003248C */  lw         $4, (0x1D903C0 & 0xFFFF)($at)
/* F39CC 001F38CC 0500C416 */  bne        $22, $4, .L001F38E4
/* F39D0 001F38D0 00000000 */   nop
/* F39D4 001F38D4 C400A38F */  lw         $3, 0xC4($sp)
/* F39D8 001F38D8 CC00A28F */  lw         $2, 0xCC($sp)
/* F39DC 001F38DC 21106200 */  addu       $2, $3, $2
/* F39E0 001F38E0 C400A2AF */  sw         $2, 0xC4($sp)
.L001F38E4:
/* F39E4 001F38E4 60010224 */  addiu      $2, $0, 0x160
/* F39E8 001F38E8 D000A2AF */  sw         $2, 0xD0($sp)
/* F39EC 001F38EC D400A0AF */  sw         $0, 0xD4($sp)
/* F39F0 001F38F0 20000224 */  addiu      $2, $0, 0x20
/* F39F4 001F38F4 D800A527 */  addiu      $5, $sp, 0xD8
/* F39F8 001F38F8 0000A2AC */  sw         $2, 0x0($5)
/* F39FC 001F38FC 1B000224 */  addiu      $2, $0, 0x1B
/* F3A00 001F3900 DC00A327 */  addiu      $3, $sp, 0xDC
/* F3A04 001F3904 000062AC */  sw         $2, 0x0($3)
/* F3A08 001F3908 10001726 */  addiu      $23, $16, 0x10
/* F3A0C 001F390C 0900C012 */  beqz       $22, .L001F3934
/* F3A10 001F3910 00000000 */   nop
/* F3A14 001F3914 D000A28F */  lw         $2, 0xD0($sp)
/* F3A18 001F3918 20004224 */  addiu      $2, $2, 0x20
/* F3A1C 001F391C D000A2AF */  sw         $2, 0xD0($sp)
/* F3A20 001F3920 0400C416 */  bne        $22, $4, .L001F3934
/* F3A24 001F3924 00000000 */   nop
/* F3A28 001F3928 D000A28F */  lw         $2, 0xD0($sp)
/* F3A2C 001F392C 20004224 */  addiu      $2, $2, 0x20
/* F3A30 001F3930 D000A2AF */  sw         $2, 0xD0($sp)
.L001F3934:
/* F3A34 001F3934 0000628C */  lw         $2, 0x0($3)
/* F3A38 001F3938 FFFF4424 */  addiu      $4, $2, -0x1
/* F3A3C 001F393C 0000A38C */  lw         $3, 0x0($5)
/* F3A40 001F3940 4001B7AF */  sw         $23, 0x140($sp)
/* F3A44 001F3944 14002226 */  addiu      $2, $17, 0x14
/* F3A48 001F3948 4401A2AF */  sw         $2, 0x144($sp)
/* F3A4C 001F394C 4801A3AF */  sw         $3, 0x148($sp)
/* F3A50 001F3950 4C01A4AF */  sw         $4, 0x14C($sp)
/* F3A54 001F3954 C894848F */  lw         $4, -0x6B38($gp)
/* F3A58 001F3958 4001A527 */  addiu      $5, $sp, 0x140
/* F3A5C 001F395C D000A627 */  addiu      $6, $sp, 0xD0
/* F3A60 001F3960 283E6072 */  paddub     $7, $19, $0
/* F3A64 001F3964 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3A68 001F3968 00000000 */   nop
/* F3A6C 001F396C 1400F726 */  addiu      $23, $23, 0x14
/* F3A70 001F3970 0100C426 */  addiu      $4, $22, 0x1
/* F3A74 001F3974 C0B7080C */  jal        GetNumberKeta__Fi
/* F3A78 001F3978 00000000 */   nop
/* F3A7C 001F397C 02004228 */  slti       $2, $2, 0x2
/* F3A80 001F3980 04004014 */  bnez       $2, .L001F3994
/* F3A84 001F3984 00000000 */   nop
/* F3A88 001F3988 C800A28F */  lw         $2, 0xC8($sp)
/* F3A8C 001F398C 43100200 */  sra        $2, $2, 1
/* F3A90 001F3990 21B8E202 */  addu       $23, $23, $2
.L001F3994:
/* F3A94 001F3994 0100C426 */  addiu      $4, $22, 0x1
/* F3A98 001F3998 18002626 */  addiu      $6, $17, 0x18
/* F3A9C 001F399C 282EE072 */  paddub     $5, $23, $0
/* F3AA0 001F39A0 C894878F */  lw         $7, -0x6B38($gp)
/* F3AA4 001F39A4 C000A827 */  addiu      $8, $sp, 0xC0
/* F3AA8 001F39A8 01000924 */  addiu      $9, $0, 0x1
/* F3AAC 001F39AC 28566072 */  paddub     $10, $19, $0
/* F3AB0 001F39B0 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F3AB4 001F39B4 00000000 */   nop
/* F3AB8 001F39B8 28160070 */  paddub     $2, $0, $0
/* F3ABC 001F39BC 0400C013 */  beqz       $fp, .L001F39D0
/* F3AC0 001F39C0 00000000 */   nop
/* F3AC4 001F39C4 0400CCC7 */  lwc1       $f12, 0x4($fp)
/* F3AC8 001F39C8 2C44040C */  jal        fptosi
/* F3ACC 001F39CC 00000000 */   nop
.L001F39D0:
/* F3AD0 001F39D0 33004018 */  blez       $2, .L001F3AA0
/* F3AD4 001F39D4 00000000 */   nop
/* F3AD8 001F39D8 FE000526 */  addiu      $5, $16, 0xFE
/* F3ADC 001F39DC 18002626 */  addiu      $6, $17, 0x18
/* F3AE0 001F39E0 28264070 */  paddub     $4, $2, $0
/* F3AE4 001F39E4 C894878F */  lw         $7, -0x6B38($gp)
/* F3AE8 001F39E8 C000A827 */  addiu      $8, $sp, 0xC0
/* F3AEC 001F39EC 01000924 */  addiu      $9, $0, 0x1
/* F3AF0 001F39F0 28566072 */  paddub     $10, $19, $0
/* F3AF4 001F39F4 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F3AF8 001F39F8 00000000 */   nop
/* F3AFC 001F39FC CC00A68F */  lw         $6, 0xCC($sp)
/* F3B00 001F3A00 C800A38F */  lw         $3, 0xC8($sp)
/* F3B04 001F3A04 40280300 */  sll        $5, $3, 1
/* F3B08 001F3A08 C400A48F */  lw         $4, 0xC4($sp)
/* F3B0C 001F3A0C 80100300 */  sll        $2, $3, 2
/* F3B10 001F3A10 21104300 */  addu       $2, $2, $3
/* F3B14 001F3A14 40180200 */  sll        $3, $2, 1
/* F3B18 001F3A18 C000A28F */  lw         $2, 0xC0($sp)
/* F3B1C 001F3A1C 21104300 */  addu       $2, $2, $3
/* F3B20 001F3A20 6001A2AF */  sw         $2, 0x160($sp)
/* F3B24 001F3A24 6401A4AF */  sw         $4, 0x164($sp)
/* F3B28 001F3A28 6801A5AF */  sw         $5, 0x168($sp)
/* F3B2C 001F3A2C 6C01A6AF */  sw         $6, 0x16C($sp)
/* F3B30 001F3A30 FE000226 */  addiu      $2, $16, 0xFE
/* F3B34 001F3A34 5001A2AF */  sw         $2, 0x150($sp)
/* F3B38 001F3A38 16002226 */  addiu      $2, $17, 0x16
/* F3B3C 001F3A3C 5401A2AF */  sw         $2, 0x154($sp)
/* F3B40 001F3A40 5801A5AF */  sw         $5, 0x158($sp)
/* F3B44 001F3A44 5C01A6AF */  sw         $6, 0x15C($sp)
/* F3B48 001F3A48 C894848F */  lw         $4, -0x6B38($gp)
/* F3B4C 001F3A4C 5001A527 */  addiu      $5, $sp, 0x150
/* F3B50 001F3A50 6001A627 */  addiu      $6, $sp, 0x160
/* F3B54 001F3A54 283E6072 */  paddub     $7, $19, $0
/* F3B58 001F3A58 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3B5C 001F3A5C 00000000 */   nop
/* F3B60 001F3A60 0F004006 */  bltz       $18, .L001F3AA0
/* F3B64 001F3A64 00000000 */   nop
/* F3B68 001F3A68 0A00412A */  slti       $at, $18, 0xA
/* F3B6C 001F3A6C 0C002010 */  beqz       $at, .L001F3AA0
/* F3B70 001F3A70 00000000 */   nop
/* F3B74 001F3A74 3E000326 */  addiu      $3, $16, 0x3E
/* F3B78 001F3A78 C0201200 */  sll        $4, $18, 3
/* F3B7C 001F3A7C DA01023C */  lui        $2, %hi(D_1DA6A20)
/* F3B80 001F3A80 206A4224 */  addiu      $2, $2, %lo(D_1DA6A20)
/* F3B84 001F3A84 21104400 */  addu       $2, $2, $4
/* F3B88 001F3A88 000043AC */  sw         $3, 0x0($2)
/* F3B8C 001F3A8C 14002326 */  addiu      $3, $17, 0x14
/* F3B90 001F3A90 DA01023C */  lui        $2, %hi(D_1DA6A24)
/* F3B94 001F3A94 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* F3B98 001F3A98 21104400 */  addu       $2, $2, $4
/* F3B9C 001F3A9C 000043AC */  sw         $3, 0x0($2)
.L001F3AA0:
/* F3BA0 001F3AA0 01005226 */  addiu      $18, $18, 0x1
/* F3BA4 001F3AA4 22003126 */  addiu      $17, $17, 0x22
.L001F3AA8:
/* F3BA8 001F3AA8 0500422A */  slti       $2, $18, 0x5
/* F3BAC 001F3AAC 79FF4014 */  bnez       $2, .L001F3894
/* F3BB0 001F3AB0 00000000 */   nop
/* F3BB4 001F3AB4 9CC4070C */  jal        GetMardanGareyanFlag__Fv
/* F3BB8 001F3AB8 00000000 */   nop
/* F3BBC 001F3ABC 14004010 */  beqz       $2, .L001F3B10
/* F3BC0 001F3AC0 00000000 */   nop
/* F3BC4 001F3AC4 3401B026 */  addiu      $16, $21, 0x134
/* F3BC8 001F3AC8 B6009126 */  addiu      $17, $20, 0xB6
/* F3BCC 001F3ACC D8010224 */  addiu      $2, $0, 0x1D8
/* F3BD0 001F3AD0 8001A2AF */  sw         $2, 0x180($sp)
/* F3BD4 001F3AD4 B4000224 */  addiu      $2, $0, 0xB4
/* F3BD8 001F3AD8 8401A2AF */  sw         $2, 0x184($sp)
/* F3BDC 001F3ADC 28000224 */  addiu      $2, $0, 0x28
/* F3BE0 001F3AE0 8801A2AF */  sw         $2, 0x188($sp)
/* F3BE4 001F3AE4 8C01A2AF */  sw         $2, 0x18C($sp)
/* F3BE8 001F3AE8 7001B0AF */  sw         $16, 0x170($sp)
/* F3BEC 001F3AEC 7401B1AF */  sw         $17, 0x174($sp)
/* F3BF0 001F3AF0 7801A2AF */  sw         $2, 0x178($sp)
/* F3BF4 001F3AF4 7C01A2AF */  sw         $2, 0x17C($sp)
/* F3BF8 001F3AF8 C894848F */  lw         $4, -0x6B38($gp)
/* F3BFC 001F3AFC 7001A527 */  addiu      $5, $sp, 0x170
/* F3C00 001F3B00 8001A627 */  addiu      $6, $sp, 0x180
/* F3C04 001F3B04 283E6072 */  paddub     $7, $19, $0
/* F3C08 001F3B08 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F3C0C 001F3B0C 00000000 */   nop
.L001F3B10:
/* F3C10 001F3B10 D901013C */  lui        $at, (0x1D903C0 >> 16)
/* F3C14 001F3B14 C003238C */  lw         $3, (0x1D903C0 & 0xFFFF)($at)
/* F3C18 001F3B18 D901013C */  lui        $at, (0x1D903C4 >> 16)
/* F3C1C 001F3B1C C403228C */  lw         $2, (0x1D903C4 & 0xFFFF)($at)
/* F3C20 001F3B20 23306200 */  subu       $6, $3, $2
/* F3C24 001F3B24 14008326 */  addiu      $3, $20, 0x14
/* F3C28 001F3B28 00110600 */  sll        $2, $6, 4
/* F3C2C 001F3B2C 21104600 */  addu       $2, $2, $6
/* F3C30 001F3B30 40100200 */  sll        $2, $2, 1
/* F3C34 001F3B34 21886200 */  addu       $17, $3, $2
/* F3C38 001F3B38 1600B026 */  addiu      $16, $21, 0x16
/* F3C3C 001F3B3C E4FF1026 */  addiu      $16, $16, -0x1C
/* F3C40 001F3B40 D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3C44 001F3B44 D403228C */  lw         $2, (0x1D903D4 & 0xFFFF)($at)
/* F3C48 001F3B48 23102202 */  subu       $2, $17, $2
/* F3C4C 001F3B4C 00008244 */  mtc1       $2, $f0
/* F3C50 001F3B50 00000000 */  nop
/* F3C54 001F3B54 60008046 */  cvt.s.w    $f1, $f0
/* F3C58 001F3B58 8040023C */  lui        $2, (0x40800000 >> 16)
/* F3C5C 001F3B5C 00008244 */  mtc1       $2, $f0
/* F3C60 001F3B60 00000000 */  nop
/* F3C64 001F3B64 030B0046 */  div.s      $f12, $f1, $f0
/* F3C68 001F3B68 2C44040C */  jal        fptosi
/* F3C6C 001F3B6C 00000000 */   nop
/* F3C70 001F3B70 D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3C74 001F3B74 D403238C */  lw         $3, (0x1D903D4 & 0xFFFF)($at)
/* F3C78 001F3B78 21106200 */  addu       $2, $3, $2
/* F3C7C 001F3B7C D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3C80 001F3B80 D40322AC */  sw         $2, (0x1D903D4 & 0xFFFF)($at)
/* F3C84 001F3B84 D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3C88 001F3B88 D403228C */  lw         $2, (0x1D903D4 & 0xFFFF)($at)
/* F3C8C 001F3B8C 23205100 */  subu       $4, $2, $17
/* F3C90 001F3B90 7200040C */  jal        abs
/* F3C94 001F3B94 00000000 */   nop
/* F3C98 001F3B98 02004128 */  slti       $at, $2, 0x2
/* F3C9C 001F3B9C 03002010 */  beqz       $at, .L001F3BAC
/* F3CA0 001F3BA0 00000000 */   nop
/* F3CA4 001F3BA4 D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3CA8 001F3BA8 D40331AC */  sw         $17, (0x1D903D4 & 0xFFFF)($at)
.L001F3BAC:
/* F3CAC 001F3BAC D901013C */  lui        $at, (0x1D903D4 >> 16)
/* F3CB0 001F3BB0 D403318C */  lw         $17, (0x1D903D4 & 0xFFFF)($at)
/* F3CB4 001F3BB4 DA01013C */  lui        $at, (0x1DA3A9C >> 16)
/* F3CB8 001F3BB8 9C3A248C */  lw         $4, (0x1DA3A9C & 0xFFFF)($at)
/* F3CBC 001F3BBC 38B4080C */  jal        MenuTextureReload__Fi
/* F3CC0 001F3BC0 00000000 */   nop
/* F3CC4 001F3BC4 DA01013C */  lui        $at, (0x1DA69A4 >> 16)
/* F3CC8 001F3BC8 A46933AC */  sw         $19, (0x1DA69A4 & 0xFFFF)($at)
/* F3CCC 001F3BCC DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F3CD0 001F3BD0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F3CD4 001F3BD4 6437050C */  jal        Step__6ClsMesFv
/* F3CD8 001F3BD8 00000000 */   nop
/* F3CDC 001F3BDC DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F3CE0 001F3BE0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F3CE4 001F3BE4 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F3CE8 001F3BE8 00000000 */   nop
/* F3CEC 001F3BEC 28260072 */  paddub     $4, $16, $0
/* F3CF0 001F3BF0 282E2072 */  paddub     $5, $17, $0
/* F3CF4 001F3BF4 01000624 */  addiu      $6, $0, 0x1
/* F3CF8 001F3BF8 40000724 */  addiu      $7, $0, 0x40
/* F3CFC 001F3BFC D05B080C */  jal        DrawMenuObjectVibe__Fiiii
/* F3D00 001F3C00 00000000 */   nop
/* F3D04 001F3C04 9000BF7B */  lq         $31, 0x90($sp)
/* F3D08 001F3C08 8000BE7B */  lq         $fp, 0x80($sp)
/* F3D0C 001F3C0C 7000B77B */  lq         $23, 0x70($sp)
/* F3D10 001F3C10 6000B67B */  lq         $22, 0x60($sp)
/* F3D14 001F3C14 5000B57B */  lq         $21, 0x50($sp)
/* F3D18 001F3C18 4000B47B */  lq         $20, 0x40($sp)
/* F3D1C 001F3C1C 3000B37B */  lq         $19, 0x30($sp)
/* F3D20 001F3C20 2000B27B */  lq         $18, 0x20($sp)
/* F3D24 001F3C24 1000B17B */  lq         $17, 0x10($sp)
/* F3D28 001F3C28 0000B07B */  lq         $16, 0x0($sp)
/* F3D2C 001F3C2C A001BD27 */  addiu      $sp, $sp, 0x1A0
/* F3D30 001F3C30 0800E003 */  jr         $31
/* F3D34 001F3C34 00000000 */   nop
/* F3D38 001F3C38 00000000 */  nop
/* F3D3C 001F3C3C 00000000 */  nop
