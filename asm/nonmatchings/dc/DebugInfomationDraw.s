.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DebugInfomationDraw__Fv
/* B3880 001B3780 90FEBD27 */  addiu      $sp, $sp, -0x170
/* B3884 001B3784 9000BF7F */  sq         $31, 0x90($sp)
/* B3888 001B3788 8000B57F */  sq         $21, 0x80($sp)
/* B388C 001B378C 7000B47F */  sq         $20, 0x70($sp)
/* B3890 001B3790 6000B37F */  sq         $19, 0x60($sp)
/* B3894 001B3794 5000B27F */  sq         $18, 0x50($sp)
/* B3898 001B3798 4000B17F */  sq         $17, 0x40($sp)
/* B389C 001B379C 3000B07F */  sq         $16, 0x30($sp)
/* B38A0 001B37A0 2C00BFE7 */  swc1       $f31, 0x2C($sp)
/* B38A4 001B37A4 2800BEE7 */  swc1       $f30, 0x28($sp)
/* B38A8 001B37A8 2400BDE7 */  swc1       $f29, 0x24($sp)
/* B38AC 001B37AC 2000BCE7 */  swc1       $f28, 0x20($sp)
/* B38B0 001B37B0 1C00BBE7 */  swc1       $f27, 0x1C($sp)
/* B38B4 001B37B4 1800BAE7 */  swc1       $f26, 0x18($sp)
/* B38B8 001B37B8 1400B9E7 */  swc1       $f25, 0x14($sp)
/* B38BC 001B37BC 1000B8E7 */  swc1       $f24, 0x10($sp)
/* B38C0 001B37C0 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* B38C4 001B37C4 0800B6E7 */  swc1       $f22, 0x8($sp)
/* B38C8 001B37C8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* B38CC 001B37CC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B38D0 001B37D0 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B38D4 001B37D4 6064248C */  lw         $4, (0x1D56460 & 0xFFFF)($at)
/* B38D8 001B37D8 01000324 */  addiu      $3, $0, 0x1
/* B38DC 001B37DC CC018310 */  beq        $4, $3, .L001B3F10
/* B38E0 001B37E0 00000000 */   nop
/* B38E4 001B37E4 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B38E8 001B37E8 7064238C */  lw         $3, (0x1D56470 & 0xFFFF)($at)
/* B38EC 001B37EC C6016010 */  beqz       $3, .L001B3F08
/* B38F0 001B37F0 00000000 */   nop
/* B38F4 001B37F4 EB01023C */  lui        $2, %hi(D_1EB60EC)
/* B38F8 001B37F8 EC604424 */  addiu      $4, $2, %lo(D_1EB60EC)
/* B38FC 001B37FC 2A00023C */  lui        $2, %hi(_1615)
/* B3900 001B3800 50B94524 */  addiu      $5, $2, %lo(_1615)
/* B3904 001B3804 1614040C */  jal        sprintf
/* B3908 001B3808 00000000 */   nop
/* B390C 001B380C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3910 001B3810 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3914 001B3814 B000A427 */  addiu      $4, $sp, 0xB0
/* B3918 001B3818 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* B391C 001B381C 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* B3920 001B3820 0C86040C */  jal        sceVu0CopyVector
/* B3924 001B3824 00000000 */   nop
/* B3928 001B3828 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* B392C 001B382C 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* B3930 001B3830 C000A527 */  addiu      $5, $sp, 0xC0
/* B3934 001B3834 BC5B050C */  jal        GetRotation__7CObjectFPf
/* B3938 001B3838 00000000 */   nop
/* B393C 001B383C A89C848F */  lw         $4, -0x6358($gp)
/* B3940 001B3840 D000A527 */  addiu      $5, $sp, 0xD0
/* B3944 001B3844 9C91040C */  jal        GetPos__7CCameraFPf
/* B3948 001B3848 00000000 */   nop
/* B394C 001B384C A89C848F */  lw         $4, -0x6358($gp)
/* B3950 001B3850 E000A527 */  addiu      $5, $sp, 0xE0
/* B3954 001B3854 A891040C */  jal        GetRef__7CCameraFPf
/* B3958 001B3858 00000000 */   nop
/* B395C 001B385C A89C848F */  lw         $4, -0x6358($gp)
/* B3960 001B3860 D092040C */  jal        GetAngle__13CCameraFollowFv
/* B3964 001B3864 00000000 */   nop
/* B3968 001B3868 A800A0E7 */  swc1       $f0, 0xA8($sp)
/* B396C 001B386C A89C848F */  lw         $4, -0x6358($gp)
/* B3970 001B3870 E092040C */  jal        GetDistance__13CCameraFollowFv
/* B3974 001B3874 00000000 */   nop
/* B3978 001B3878 AC00A0E7 */  swc1       $f0, 0xAC($sp)
/* B397C 001B387C A89C848F */  lw         $4, -0x6358($gp)
/* B3980 001B3880 F092040C */  jal        GetHeight__13CCameraFollowFv
/* B3984 001B3884 00000000 */   nop
/* B3988 001B3888 06050046 */  mov.s      $f20, $f0
/* B398C 001B388C B000BCC7 */  lwc1       $f28, 0xB0($sp)
/* B3990 001B3890 A042023C */  lui        $2, (0x42A00000 >> 16)
/* B3994 001B3894 00008244 */  mtc1       $2, $f0
/* B3998 001B3898 00000000 */  nop
/* B399C 001B389C 41E00046 */  sub.s      $f1, $f28, $f0
/* B39A0 001B38A0 2043023C */  lui        $2, (0x43200000 >> 16)
/* B39A4 001B38A4 00008244 */  mtc1       $2, $f0
/* B39A8 001B38A8 00000000 */  nop
/* B39AC 001B38AC 030B0046 */  div.s      $f12, $f1, $f0
/* B39B0 001B38B0 2C44040C */  jal        fptosi
/* B39B4 001B38B4 00000000 */   nop
/* B39B8 001B38B8 80180200 */  sll        $3, $2, 2
/* B39BC 001B38BC 21106200 */  addu       $2, $3, $2
/* B39C0 001B38C0 40810200 */  sll        $16, $2, 5
/* B39C4 001B38C4 00009044 */  mtc1       $16, $f0
/* B39C8 001B38C8 00000000 */  nop
/* B39CC 001B38CC 20008046 */  cvt.s.w    $f0, $f0
/* B39D0 001B38D0 01E00046 */  sub.s      $f0, $f28, $f0
/* B39D4 001B38D4 2043023C */  lui        $2, (0x43200000 >> 16)
/* B39D8 001B38D8 00088244 */  mtc1       $2, $f1
/* B39DC 001B38DC 00000000 */  nop
/* B39E0 001B38E0 41050146 */  sub.s      $f21, $f0, $f1
/* B39E4 001B38E4 B400BEC7 */  lwc1       $f30, 0xB4($sp)
/* B39E8 001B38E8 B800BDC7 */  lwc1       $f29, 0xB8($sp)
/* B39EC 001B38EC A042023C */  lui        $2, (0x42A00000 >> 16)
/* B39F0 001B38F0 00008244 */  mtc1       $2, $f0
/* B39F4 001B38F4 00000000 */  nop
/* B39F8 001B38F8 01E80046 */  sub.s      $f0, $f29, $f0
/* B39FC 001B38FC 03030146 */  div.s      $f12, $f0, $f1
/* B3A00 001B3900 2C44040C */  jal        fptosi
/* B3A04 001B3904 00000000 */   nop
/* B3A08 001B3908 80180200 */  sll        $3, $2, 2
/* B3A0C 001B390C 21106200 */  addu       $2, $3, $2
/* B3A10 001B3910 40110200 */  sll        $2, $2, 5
/* B3A14 001B3914 00008244 */  mtc1       $2, $f0
/* B3A18 001B3918 00000000 */  nop
/* B3A1C 001B391C 20018046 */  cvt.s.w    $f4, $f0
/* B3A20 001B3920 01E80446 */  sub.s      $f0, $f29, $f4
/* B3A24 001B3924 2043023C */  lui        $2, (0x43200000 >> 16)
/* B3A28 001B3928 00188244 */  mtc1       $2, $f3
/* B3A2C 001B392C 00000000 */  nop
/* B3A30 001B3930 81050346 */  sub.s      $f22, $f0, $f3
/* B3A34 001B3934 D000A2C7 */  lwc1       $f2, 0xD0($sp)
/* B3A38 001B3938 00009044 */  mtc1       $16, $f0
/* B3A3C 001B393C 00000000 */  nop
/* B3A40 001B3940 60008046 */  cvt.s.w    $f1, $f0
/* B3A44 001B3944 01100146 */  sub.s      $f0, $f2, $f1
/* B3A48 001B3948 C1050346 */  sub.s      $f23, $f0, $f3
/* B3A4C 001B394C D400B127 */  addiu      $17, $sp, 0xD4
/* B3A50 001B3950 000038C6 */  lwc1       $f24, 0x0($17)
/* B3A54 001B3954 D800B027 */  addiu      $16, $sp, 0xD8
/* B3A58 001B3958 000000C6 */  lwc1       $f0, 0x0($16)
/* B3A5C 001B395C 01000446 */  sub.s      $f0, $f0, $f4
/* B3A60 001B3960 41060346 */  sub.s      $f25, $f0, $f3
/* B3A64 001B3964 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* B3A68 001B3968 01000146 */  sub.s      $f0, $f0, $f1
/* B3A6C 001B396C 81060346 */  sub.s      $f26, $f0, $f3
/* B3A70 001B3970 E400B327 */  addiu      $19, $sp, 0xE4
/* B3A74 001B3974 00007BC6 */  lwc1       $f27, 0x0($19)
/* B3A78 001B3978 E800B227 */  addiu      $18, $sp, 0xE8
/* B3A7C 001B397C 000040C6 */  lwc1       $f0, 0x0($18)
/* B3A80 001B3980 01000446 */  sub.s      $f0, $f0, $f4
/* B3A84 001B3984 C1070346 */  sub.s      $f31, $f0, $f3
/* B3A88 001B3988 06E30046 */  mov.s      $f12, $f28
/* B3A8C 001B398C 9044040C */  jal        fptodp
/* B3A90 001B3990 00000000 */   nop
/* B3A94 001B3994 28AE4070 */  paddub     $21, $2, $0
/* B3A98 001B3998 06F30046 */  mov.s      $f12, $f30
/* B3A9C 001B399C 9044040C */  jal        fptodp
/* B3AA0 001B39A0 00000000 */   nop
/* B3AA4 001B39A4 28A64070 */  paddub     $20, $2, $0
/* B3AA8 001B39A8 06EB0046 */  mov.s      $f12, $f29
/* B3AAC 001B39AC 9044040C */  jal        fptodp
/* B3AB0 001B39B0 00000000 */   nop
/* B3AB4 001B39B4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3AB8 001B39B8 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3ABC 001B39BC EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3AC0 001B39C0 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3AC4 001B39C4 21186400 */  addu       $3, $3, $4
/* B3AC8 001B39C8 1C006424 */  addiu      $4, $3, 0x1C
/* B3ACC 001B39CC 2A00033C */  lui        $3, %hi(_1616)
/* B3AD0 001B39D0 70B96524 */  addiu      $5, $3, %lo(_1616)
/* B3AD4 001B39D4 2836A072 */  paddub     $6, $21, $0
/* B3AD8 001B39D8 283E8072 */  paddub     $7, $20, $0
/* B3ADC 001B39DC 28464070 */  paddub     $8, $2, $0
/* B3AE0 001B39E0 1614040C */  jal        sprintf
/* B3AE4 001B39E4 00000000 */   nop
/* B3AE8 001B39E8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3AEC 001B39EC E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3AF0 001B39F0 21106200 */  addu       $2, $3, $2
/* B3AF4 001B39F4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3AF8 001B39F8 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3AFC 001B39FC 06AB0046 */  mov.s      $f12, $f21
/* B3B00 001B3A00 9044040C */  jal        fptodp
/* B3B04 001B3A04 00000000 */   nop
/* B3B08 001B3A08 28AE4070 */  paddub     $21, $2, $0
/* B3B0C 001B3A0C 06F30046 */  mov.s      $f12, $f30
/* B3B10 001B3A10 9044040C */  jal        fptodp
/* B3B14 001B3A14 00000000 */   nop
/* B3B18 001B3A18 28A64070 */  paddub     $20, $2, $0
/* B3B1C 001B3A1C 06B30046 */  mov.s      $f12, $f22
/* B3B20 001B3A20 9044040C */  jal        fptodp
/* B3B24 001B3A24 00000000 */   nop
/* B3B28 001B3A28 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3B2C 001B3A2C E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3B30 001B3A30 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3B34 001B3A34 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3B38 001B3A38 21186400 */  addu       $3, $3, $4
/* B3B3C 001B3A3C 1C006424 */  addiu      $4, $3, 0x1C
/* B3B40 001B3A40 2A00033C */  lui        $3, %hi(_1617)
/* B3B44 001B3A44 90B96524 */  addiu      $5, $3, %lo(_1617)
/* B3B48 001B3A48 2836A072 */  paddub     $6, $21, $0
/* B3B4C 001B3A4C 283E8072 */  paddub     $7, $20, $0
/* B3B50 001B3A50 28464070 */  paddub     $8, $2, $0
/* B3B54 001B3A54 1614040C */  jal        sprintf
/* B3B58 001B3A58 00000000 */   nop
/* B3B5C 001B3A5C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3B60 001B3A60 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3B64 001B3A64 21106200 */  addu       $2, $3, $2
/* B3B68 001B3A68 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3B6C 001B3A6C E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3B70 001B3A70 C000ACC7 */  lwc1       $f12, 0xC0($sp)
/* B3B74 001B3A74 9044040C */  jal        fptodp
/* B3B78 001B3A78 00000000 */   nop
/* B3B7C 001B3A7C 28AE4070 */  paddub     $21, $2, $0
/* B3B80 001B3A80 C400ACC7 */  lwc1       $f12, 0xC4($sp)
/* B3B84 001B3A84 9044040C */  jal        fptodp
/* B3B88 001B3A88 00000000 */   nop
/* B3B8C 001B3A8C 28A64070 */  paddub     $20, $2, $0
/* B3B90 001B3A90 C800ACC7 */  lwc1       $f12, 0xC8($sp)
/* B3B94 001B3A94 9044040C */  jal        fptodp
/* B3B98 001B3A98 00000000 */   nop
/* B3B9C 001B3A9C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3BA0 001B3AA0 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3BA4 001B3AA4 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3BA8 001B3AA8 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3BAC 001B3AAC 21186400 */  addu       $3, $3, $4
/* B3BB0 001B3AB0 1C006424 */  addiu      $4, $3, 0x1C
/* B3BB4 001B3AB4 2A00033C */  lui        $3, %hi(_1618)
/* B3BB8 001B3AB8 B0B96524 */  addiu      $5, $3, %lo(_1618)
/* B3BBC 001B3ABC 2836A072 */  paddub     $6, $21, $0
/* B3BC0 001B3AC0 283E8072 */  paddub     $7, $20, $0
/* B3BC4 001B3AC4 28464070 */  paddub     $8, $2, $0
/* B3BC8 001B3AC8 1614040C */  jal        sprintf
/* B3BCC 001B3ACC 00000000 */   nop
/* B3BD0 001B3AD0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3BD4 001B3AD4 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3BD8 001B3AD8 21106200 */  addu       $2, $3, $2
/* B3BDC 001B3ADC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3BE0 001B3AE0 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3BE4 001B3AE4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3BE8 001B3AE8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3BEC 001B3AEC EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B3BF0 001B3AF0 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B3BF4 001B3AF4 21104300 */  addu       $2, $2, $3
/* B3BF8 001B3AF8 1C004424 */  addiu      $4, $2, 0x1C
/* B3BFC 001B3AFC 2A00023C */  lui        $2, %hi(_1619)
/* B3C00 001B3B00 C8B94524 */  addiu      $5, $2, %lo(_1619)
/* B3C04 001B3B04 1614040C */  jal        sprintf
/* B3C08 001B3B08 00000000 */   nop
/* B3C0C 001B3B0C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3C10 001B3B10 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3C14 001B3B14 21106200 */  addu       $2, $3, $2
/* B3C18 001B3B18 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3C1C 001B3B1C E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3C20 001B3B20 D000ACC7 */  lwc1       $f12, 0xD0($sp)
/* B3C24 001B3B24 9044040C */  jal        fptodp
/* B3C28 001B3B28 00000000 */   nop
/* B3C2C 001B3B2C 28A64070 */  paddub     $20, $2, $0
/* B3C30 001B3B30 00002CC6 */  lwc1       $f12, 0x0($17)
/* B3C34 001B3B34 9044040C */  jal        fptodp
/* B3C38 001B3B38 00000000 */   nop
/* B3C3C 001B3B3C 288E4070 */  paddub     $17, $2, $0
/* B3C40 001B3B40 00000CC6 */  lwc1       $f12, 0x0($16)
/* B3C44 001B3B44 9044040C */  jal        fptodp
/* B3C48 001B3B48 00000000 */   nop
/* B3C4C 001B3B4C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3C50 001B3B50 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3C54 001B3B54 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3C58 001B3B58 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3C5C 001B3B5C 21186400 */  addu       $3, $3, $4
/* B3C60 001B3B60 1C006424 */  addiu      $4, $3, 0x1C
/* B3C64 001B3B64 2A00033C */  lui        $3, %hi(_1620)
/* B3C68 001B3B68 D0B96524 */  addiu      $5, $3, %lo(_1620)
/* B3C6C 001B3B6C 28368072 */  paddub     $6, $20, $0
/* B3C70 001B3B70 283E2072 */  paddub     $7, $17, $0
/* B3C74 001B3B74 28464070 */  paddub     $8, $2, $0
/* B3C78 001B3B78 1614040C */  jal        sprintf
/* B3C7C 001B3B7C 00000000 */   nop
/* B3C80 001B3B80 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3C84 001B3B84 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3C88 001B3B88 21106200 */  addu       $2, $3, $2
/* B3C8C 001B3B8C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3C90 001B3B90 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3C94 001B3B94 E000ACC7 */  lwc1       $f12, 0xE0($sp)
/* B3C98 001B3B98 9044040C */  jal        fptodp
/* B3C9C 001B3B9C 00000000 */   nop
/* B3CA0 001B3BA0 288E4070 */  paddub     $17, $2, $0
/* B3CA4 001B3BA4 00006CC6 */  lwc1       $f12, 0x0($19)
/* B3CA8 001B3BA8 9044040C */  jal        fptodp
/* B3CAC 001B3BAC 00000000 */   nop
/* B3CB0 001B3BB0 28864070 */  paddub     $16, $2, $0
/* B3CB4 001B3BB4 00004CC6 */  lwc1       $f12, 0x0($18)
/* B3CB8 001B3BB8 9044040C */  jal        fptodp
/* B3CBC 001B3BBC 00000000 */   nop
/* B3CC0 001B3BC0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3CC4 001B3BC4 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3CC8 001B3BC8 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3CCC 001B3BCC D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3CD0 001B3BD0 21186400 */  addu       $3, $3, $4
/* B3CD4 001B3BD4 1C006424 */  addiu      $4, $3, 0x1C
/* B3CD8 001B3BD8 2A00033C */  lui        $3, %hi(_1621)
/* B3CDC 001B3BDC F0B96524 */  addiu      $5, $3, %lo(_1621)
/* B3CE0 001B3BE0 28362072 */  paddub     $6, $17, $0
/* B3CE4 001B3BE4 283E0072 */  paddub     $7, $16, $0
/* B3CE8 001B3BE8 28464070 */  paddub     $8, $2, $0
/* B3CEC 001B3BEC 1614040C */  jal        sprintf
/* B3CF0 001B3BF0 00000000 */   nop
/* B3CF4 001B3BF4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3CF8 001B3BF8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3CFC 001B3BFC 21106200 */  addu       $2, $3, $2
/* B3D00 001B3C00 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3D04 001B3C04 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3D08 001B3C08 06BB0046 */  mov.s      $f12, $f23
/* B3D0C 001B3C0C 9044040C */  jal        fptodp
/* B3D10 001B3C10 00000000 */   nop
/* B3D14 001B3C14 288E4070 */  paddub     $17, $2, $0
/* B3D18 001B3C18 06C30046 */  mov.s      $f12, $f24
/* B3D1C 001B3C1C 9044040C */  jal        fptodp
/* B3D20 001B3C20 00000000 */   nop
/* B3D24 001B3C24 28864070 */  paddub     $16, $2, $0
/* B3D28 001B3C28 06CB0046 */  mov.s      $f12, $f25
/* B3D2C 001B3C2C 9044040C */  jal        fptodp
/* B3D30 001B3C30 00000000 */   nop
/* B3D34 001B3C34 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3D38 001B3C38 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3D3C 001B3C3C EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3D40 001B3C40 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3D44 001B3C44 21186400 */  addu       $3, $3, $4
/* B3D48 001B3C48 1C006424 */  addiu      $4, $3, 0x1C
/* B3D4C 001B3C4C 2A00033C */  lui        $3, %hi(_1622)
/* B3D50 001B3C50 10BA6524 */  addiu      $5, $3, %lo(_1622)
/* B3D54 001B3C54 28362072 */  paddub     $6, $17, $0
/* B3D58 001B3C58 283E0072 */  paddub     $7, $16, $0
/* B3D5C 001B3C5C 28464070 */  paddub     $8, $2, $0
/* B3D60 001B3C60 1614040C */  jal        sprintf
/* B3D64 001B3C64 00000000 */   nop
/* B3D68 001B3C68 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3D6C 001B3C6C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3D70 001B3C70 21106200 */  addu       $2, $3, $2
/* B3D74 001B3C74 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3D78 001B3C78 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3D7C 001B3C7C 06D30046 */  mov.s      $f12, $f26
/* B3D80 001B3C80 9044040C */  jal        fptodp
/* B3D84 001B3C84 00000000 */   nop
/* B3D88 001B3C88 288E4070 */  paddub     $17, $2, $0
/* B3D8C 001B3C8C 06DB0046 */  mov.s      $f12, $f27
/* B3D90 001B3C90 9044040C */  jal        fptodp
/* B3D94 001B3C94 00000000 */   nop
/* B3D98 001B3C98 28864070 */  paddub     $16, $2, $0
/* B3D9C 001B3C9C 06FB0046 */  mov.s      $f12, $f31
/* B3DA0 001B3CA0 9044040C */  jal        fptodp
/* B3DA4 001B3CA4 00000000 */   nop
/* B3DA8 001B3CA8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3DAC 001B3CAC E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3DB0 001B3CB0 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3DB4 001B3CB4 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3DB8 001B3CB8 21186400 */  addu       $3, $3, $4
/* B3DBC 001B3CBC 1C006424 */  addiu      $4, $3, 0x1C
/* B3DC0 001B3CC0 2A00033C */  lui        $3, %hi(_1623)
/* B3DC4 001B3CC4 30BA6524 */  addiu      $5, $3, %lo(_1623)
/* B3DC8 001B3CC8 28362072 */  paddub     $6, $17, $0
/* B3DCC 001B3CCC 283E0072 */  paddub     $7, $16, $0
/* B3DD0 001B3CD0 28464070 */  paddub     $8, $2, $0
/* B3DD4 001B3CD4 1614040C */  jal        sprintf
/* B3DD8 001B3CD8 00000000 */   nop
/* B3DDC 001B3CDC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3DE0 001B3CE0 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3DE4 001B3CE4 21106200 */  addu       $2, $3, $2
/* B3DE8 001B3CE8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3DEC 001B3CEC E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3DF0 001B3CF0 A800ACC7 */  lwc1       $f12, 0xA8($sp)
/* B3DF4 001B3CF4 9044040C */  jal        fptodp
/* B3DF8 001B3CF8 00000000 */   nop
/* B3DFC 001B3CFC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E00 001B3D00 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3E04 001B3D04 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3E08 001B3D08 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3E0C 001B3D0C 21186400 */  addu       $3, $3, $4
/* B3E10 001B3D10 1C006424 */  addiu      $4, $3, 0x1C
/* B3E14 001B3D14 2A00033C */  lui        $3, %hi(_1624)
/* B3E18 001B3D18 48BA6524 */  addiu      $5, $3, %lo(_1624)
/* B3E1C 001B3D1C 28364070 */  paddub     $6, $2, $0
/* B3E20 001B3D20 1614040C */  jal        sprintf
/* B3E24 001B3D24 00000000 */   nop
/* B3E28 001B3D28 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E2C 001B3D2C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3E30 001B3D30 21106200 */  addu       $2, $3, $2
/* B3E34 001B3D34 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E38 001B3D38 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3E3C 001B3D3C AC00ACC7 */  lwc1       $f12, 0xAC($sp)
/* B3E40 001B3D40 9044040C */  jal        fptodp
/* B3E44 001B3D44 00000000 */   nop
/* B3E48 001B3D48 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E4C 001B3D4C E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3E50 001B3D50 EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3E54 001B3D54 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3E58 001B3D58 21186400 */  addu       $3, $3, $4
/* B3E5C 001B3D5C 1C006424 */  addiu      $4, $3, 0x1C
/* B3E60 001B3D60 2A00033C */  lui        $3, %hi(_1625)
/* B3E64 001B3D64 58BA6524 */  addiu      $5, $3, %lo(_1625)
/* B3E68 001B3D68 28364070 */  paddub     $6, $2, $0
/* B3E6C 001B3D6C 1614040C */  jal        sprintf
/* B3E70 001B3D70 00000000 */   nop
/* B3E74 001B3D74 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E78 001B3D78 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3E7C 001B3D7C 21106200 */  addu       $2, $3, $2
/* B3E80 001B3D80 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E84 001B3D84 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3E88 001B3D88 06A30046 */  mov.s      $f12, $f20
/* B3E8C 001B3D8C 9044040C */  jal        fptodp
/* B3E90 001B3D90 00000000 */   nop
/* B3E94 001B3D94 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3E98 001B3D98 E860248C */  lw         $4, (0x1EB60E8 & 0xFFFF)($at)
/* B3E9C 001B3D9C EB01033C */  lui        $3, %hi(D_1EB60D0)
/* B3EA0 001B3DA0 D0606324 */  addiu      $3, $3, %lo(D_1EB60D0)
/* B3EA4 001B3DA4 21186400 */  addu       $3, $3, $4
/* B3EA8 001B3DA8 1C006424 */  addiu      $4, $3, 0x1C
/* B3EAC 001B3DAC 2A00033C */  lui        $3, %hi(_1626)
/* B3EB0 001B3DB0 68BA6524 */  addiu      $5, $3, %lo(_1626)
/* B3EB4 001B3DB4 28364070 */  paddub     $6, $2, $0
/* B3EB8 001B3DB8 1614040C */  jal        sprintf
/* B3EBC 001B3DBC 00000000 */   nop
/* B3EC0 001B3DC0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3EC4 001B3DC4 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3EC8 001B3DC8 21106200 */  addu       $2, $3, $2
/* B3ECC 001B3DCC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3ED0 001B3DD0 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3ED4 001B3DD4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3ED8 001B3DD8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3EDC 001B3DDC EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B3EE0 001B3DE0 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B3EE4 001B3DE4 21104300 */  addu       $2, $2, $3
/* B3EE8 001B3DE8 C89C838F */  lw         $3, -0x6338($gp)
/* B3EEC 001B3DEC 1C004424 */  addiu      $4, $2, 0x1C
/* B3EF0 001B3DF0 2A00023C */  lui        $2, %hi(_1627_3)
/* B3EF4 001B3DF4 80BA4524 */  addiu      $5, $2, %lo(_1627_3)
/* B3EF8 001B3DF8 6804668C */  lw         $6, 0x468($3)
/* B3EFC 001B3DFC 1614040C */  jal        sprintf
/* B3F00 001B3E00 00000000 */   nop
/* B3F04 001B3E04 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F08 001B3E08 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3F0C 001B3E0C 21106200 */  addu       $2, $3, $2
/* B3F10 001B3E10 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F14 001B3E14 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3F18 001B3E18 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F1C 001B3E1C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3F20 001B3E20 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B3F24 001B3E24 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B3F28 001B3E28 21104300 */  addu       $2, $2, $3
/* B3F2C 001B3E2C 1C004424 */  addiu      $4, $2, 0x1C
/* B3F30 001B3E30 2A00023C */  lui        $2, %hi(_1628)
/* B3F34 001B3E34 A0BA4524 */  addiu      $5, $2, %lo(_1628)
/* B3F38 001B3E38 2494868F */  lw         $6, -0x6BDC($gp)
/* B3F3C 001B3E3C 1614040C */  jal        sprintf
/* B3F40 001B3E40 00000000 */   nop
/* B3F44 001B3E44 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F48 001B3E48 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3F4C 001B3E4C 21106200 */  addu       $2, $3, $2
/* B3F50 001B3E50 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F54 001B3E54 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3F58 001B3E58 D09C848F */  lw         $4, -0x6330($gp)
/* B3F5C 001B3E5C B000A527 */  addiu      $5, $sp, 0xB0
/* B3F60 001B3E60 3433070C */  jal        SearchDataSlotPos__16CDungeonEventManFPf
/* B3F64 001B3E64 00000000 */   nop
/* B3F68 001B3E68 01004010 */  beqz       $2, .L001B3E70
/* B3F6C 001B3E6C 00000000 */   nop
.L001B3E70:
/* B3F70 001B3E70 D09C848F */  lw         $4, -0x6330($gp)
/* B3F74 001B3E74 B432070C */  jal        GetDataNum__16CDungeonEventManFv
/* B3F78 001B3E78 00000000 */   nop
/* B3F7C 001B3E7C 28364070 */  paddub     $6, $2, $0
/* B3F80 001B3E80 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3F84 001B3E84 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3F88 001B3E88 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B3F8C 001B3E8C D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B3F90 001B3E90 21104300 */  addu       $2, $2, $3
/* B3F94 001B3E94 1C004424 */  addiu      $4, $2, 0x1C
/* B3F98 001B3E98 2A00023C */  lui        $2, %hi(_1629)
/* B3F9C 001B3E9C B8BA4524 */  addiu      $5, $2, %lo(_1629)
/* B3FA0 001B3EA0 1614040C */  jal        sprintf
/* B3FA4 001B3EA4 00000000 */   nop
/* B3FA8 001B3EA8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3FAC 001B3EAC E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B3FB0 001B3EB0 21106200 */  addu       $2, $3, $2
/* B3FB4 001B3EB4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B3FB8 001B3EB8 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B3FBC 001B3EBC 00020224 */  addiu      $2, $0, 0x200
/* B3FC0 001B3EC0 3001A2AF */  sw         $2, 0x130($sp)
/* B3FC4 001B3EC4 80020224 */  addiu      $2, $0, 0x280
/* B3FC8 001B3EC8 3401A2AF */  sw         $2, 0x134($sp)
/* B3FCC 001B3ECC 00100224 */  addiu      $2, $0, 0x1000
/* B3FD0 001B3ED0 3801A2AF */  sw         $2, 0x138($sp)
/* B3FD4 001B3ED4 00070224 */  addiu      $2, $0, 0x700
/* B3FD8 001B3ED8 3C01A2AF */  sw         $2, 0x13C($sp)
/* B3FDC 001B3EDC 3001A427 */  addiu      $4, $sp, 0x130
/* B3FE0 001B3EE0 08000524 */  addiu      $5, $0, 0x8
/* B3FE4 001B3EE4 2836A070 */  paddub     $6, $5, $0
/* B3FE8 001B3EE8 283EA070 */  paddub     $7, $5, $0
/* B3FEC 001B3EEC 60000824 */  addiu      $8, $0, 0x60
/* B3FF0 001B3EF0 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* B3FF4 001B3EF4 00000000 */   nop
/* B3FF8 001B3EF8 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B3FFC 001B3EFC D0604424 */  addiu      $4, $2, %lo(D_1EB60D0)
/* B4000 001B3F00 D0F7040C */  jal        Draw__10CDebugFontFv
/* B4004 001B3F04 00000000 */   nop
.L001B3F08:
/* B4008 001B3F08 E3010010 */  b          .L001B4698
/* B400C 001B3F0C 00000000 */   nop
.L001B3F10:
/* B4010 001B3F10 EB01023C */  lui        $2, %hi(D_1EB60EC)
/* B4014 001B3F14 EC604424 */  addiu      $4, $2, %lo(D_1EB60EC)
/* B4018 001B3F18 2A00023C */  lui        $2, %hi(_1630)
/* B401C 001B3F1C C8BA4524 */  addiu      $5, $2, %lo(_1630)
/* B4020 001B3F20 1614040C */  jal        sprintf
/* B4024 001B3F24 00000000 */   nop
/* B4028 001B3F28 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B402C 001B3F2C E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4030 001B3F30 5001A327 */  addiu      $3, $sp, 0x150
/* B4034 001B3F34 B88782DF */  ld         $2, -0x7848($gp)
/* B4038 001B3F38 000062FC */  sd         $2, 0x0($3)
/* B403C 001B3F3C 5801A327 */  addiu      $3, $sp, 0x158
/* B4040 001B3F40 C08782DF */  ld         $2, -0x7840($gp)
/* B4044 001B3F44 000062FC */  sd         $2, 0x0($3)
/* B4048 001B3F48 2700023C */  lui        $2, %hi(_1554)
/* B404C 001B3F4C 60B14224 */  addiu      $2, $2, %lo(_1554)
/* B4050 001B3F50 F000A427 */  addiu      $4, $sp, 0xF0
/* B4054 001B3F54 00004378 */  lq         $3, 0x0($2)
/* B4058 001B3F58 100042DC */  ld         $2, 0x10($2)
/* B405C 001B3F5C 0000837C */  sq         $3, 0x0($4)
/* B4060 001B3F60 100082FC */  sd         $2, 0x10($4)
/* B4064 001B3F64 2700023C */  lui        $2, %hi(_1558)
/* B4068 001B3F68 78B14424 */  addiu      $4, $2, %lo(_1558)
/* B406C 001B3F6C 6001A327 */  addiu      $3, $sp, 0x160
/* B4070 001B3F70 000082DC */  ld         $2, 0x0($4)
/* B4074 001B3F74 080080C4 */  lwc1       $f0, 0x8($4)
/* B4078 001B3F78 000062FC */  sd         $2, 0x0($3)
/* B407C 001B3F7C 080060E4 */  swc1       $f0, 0x8($3)
/* B4080 001B3F80 28860070 */  paddub     $16, $0, $0
/* B4084 001B3F84 AA010010 */  b          .L001B4630
/* B4088 001B3F88 00000000 */   nop
.L001B3F8C:
/* B408C 001B3F8C E493828F */  lw         $2, -0x6C1C($gp)
/* B4090 001B3F90 12005014 */  bne        $2, $16, .L001B3FDC
/* B4094 001B3F94 00000000 */   nop
/* B4098 001B3F98 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B409C 001B3F9C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B40A0 001B3FA0 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B40A4 001B3FA4 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B40A8 001B3FA8 21104300 */  addu       $2, $2, $3
/* B40AC 001B3FAC 1C004424 */  addiu      $4, $2, 0x1C
/* B40B0 001B3FB0 2A00023C */  lui        $2, %hi(_1631)
/* B40B4 001B3FB4 D0BA4524 */  addiu      $5, $2, %lo(_1631)
/* B40B8 001B3FB8 1614040C */  jal        sprintf
/* B40BC 001B3FBC 00000000 */   nop
/* B40C0 001B3FC0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B40C4 001B3FC4 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B40C8 001B3FC8 21106200 */  addu       $2, $3, $2
/* B40CC 001B3FCC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B40D0 001B3FD0 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B40D4 001B3FD4 10000010 */  b          .L001B4018
/* B40D8 001B3FD8 00000000 */   nop
.L001B3FDC:
/* B40DC 001B3FDC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B40E0 001B3FE0 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B40E4 001B3FE4 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B40E8 001B3FE8 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B40EC 001B3FEC 21104300 */  addu       $2, $2, $3
/* B40F0 001B3FF0 1C004424 */  addiu      $4, $2, 0x1C
/* B40F4 001B3FF4 2A00023C */  lui        $2, %hi(_1632_2)
/* B40F8 001B3FF8 D8BA4524 */  addiu      $5, $2, %lo(_1632_2)
/* B40FC 001B3FFC 1614040C */  jal        sprintf
/* B4100 001B4000 00000000 */   nop
/* B4104 001B4004 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4108 001B4008 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B410C 001B400C 21106200 */  addu       $2, $3, $2
/* B4110 001B4010 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4114 001B4014 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
.L001B4018:
/* B4118 001B4018 2700023C */  lui        $2, %hi(DebugInfoCode)
/* B411C 001B401C E0B04224 */  addiu      $2, $2, %lo(DebugInfoCode)
/* B4120 001B4020 21105100 */  addu       $2, $2, $17
/* B4124 001B4024 0000438C */  lw         $3, 0x0($2)
/* B4128 001B4028 8C000224 */  addiu      $2, $0, 0x8C
/* B412C 001B402C 6F016210 */  beq        $3, $2, .L001B45EC
/* B4130 001B4030 00000000 */   nop
/* B4134 001B4034 82000224 */  addiu      $2, $0, 0x82
/* B4138 001B4038 5A016210 */  beq        $3, $2, .L001B45A4
/* B413C 001B403C 00000000 */   nop
/* B4140 001B4040 78000224 */  addiu      $2, $0, 0x78
/* B4144 001B4044 42016210 */  beq        $3, $2, .L001B4550
/* B4148 001B4048 00000000 */   nop
/* B414C 001B404C 5A000224 */  addiu      $2, $0, 0x5A
/* B4150 001B4050 2D016210 */  beq        $3, $2, .L001B4508
/* B4154 001B4054 00000000 */   nop
/* B4158 001B4058 6E000224 */  addiu      $2, $0, 0x6E
/* B415C 001B405C 15016210 */  beq        $3, $2, .L001B44B4
/* B4160 001B4060 00000000 */   nop
/* B4164 001B4064 50000224 */  addiu      $2, $0, 0x50
/* B4168 001B4068 02016210 */  beq        $3, $2, .L001B4474
/* B416C 001B406C 00000000 */   nop
/* B4170 001B4070 64000224 */  addiu      $2, $0, 0x64
/* B4174 001B4074 EB006210 */  beq        $3, $2, .L001B4424
/* B4178 001B4078 00000000 */   nop
/* B417C 001B407C 96000224 */  addiu      $2, $0, 0x96
/* B4180 001B4080 D3006210 */  beq        $3, $2, .L001B43D0
/* B4184 001B4084 00000000 */   nop
/* B4188 001B4088 0A000224 */  addiu      $2, $0, 0xA
/* B418C 001B408C BB006210 */  beq        $3, $2, .L001B437C
/* B4190 001B4090 00000000 */   nop
/* B4194 001B4094 1E000224 */  addiu      $2, $0, 0x1E
/* B4198 001B4098 A3006210 */  beq        $3, $2, .L001B4328
/* B419C 001B409C 00000000 */   nop
/* B41A0 001B40A0 32000224 */  addiu      $2, $0, 0x32
/* B41A4 001B40A4 8B006210 */  beq        $3, $2, .L001B42D4
/* B41A8 001B40A8 00000000 */   nop
/* B41AC 001B40AC 14000224 */  addiu      $2, $0, 0x14
/* B41B0 001B40B0 73006210 */  beq        $3, $2, .L001B4280
/* B41B4 001B40B4 00000000 */   nop
/* B41B8 001B40B8 46000224 */  addiu      $2, $0, 0x46
/* B41BC 001B40BC 5B006210 */  beq        $3, $2, .L001B422C
/* B41C0 001B40C0 00000000 */   nop
/* B41C4 001B40C4 29000224 */  addiu      $2, $0, 0x29
/* B41C8 001B40C8 2A006210 */  beq        $3, $2, .L001B4174
/* B41CC 001B40CC 00000000 */   nop
/* B41D0 001B40D0 28000224 */  addiu      $2, $0, 0x28
/* B41D4 001B40D4 15006210 */  beq        $3, $2, .L001B412C
/* B41D8 001B40D8 00000000 */   nop
/* B41DC 001B40DC 03006010 */  beqz       $3, .L001B40EC
/* B41E0 001B40E0 00000000 */   nop
/* B41E4 001B40E4 51010010 */  b          .L001B462C
/* B41E8 001B40E8 00000000 */   nop
.L001B40EC:
/* B41EC 001B40EC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B41F0 001B40F0 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B41F4 001B40F4 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B41F8 001B40F8 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B41FC 001B40FC 21104300 */  addu       $2, $2, $3
/* B4200 001B4100 1C004424 */  addiu      $4, $2, 0x1C
/* B4204 001B4104 0000458E */  lw         $5, 0x0($18)
/* B4208 001B4108 1614040C */  jal        sprintf
/* B420C 001B410C 00000000 */   nop
/* B4210 001B4110 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4214 001B4114 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4218 001B4118 21106200 */  addu       $2, $3, $2
/* B421C 001B411C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4220 001B4120 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4224 001B4124 41010010 */  b          .L001B462C
/* B4228 001B4128 00000000 */   nop
.L001B412C:
/* B422C 001B412C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4230 001B4130 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4234 001B4134 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4238 001B4138 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B423C 001B413C 21104300 */  addu       $2, $2, $3
/* B4240 001B4140 1C004424 */  addiu      $4, $2, 0x1C
/* B4244 001B4144 0000458E */  lw         $5, 0x0($18)
/* B4248 001B4148 D501013C */  lui        $at, (0x1D56480 >> 16)
/* B424C 001B414C 8064268C */  lw         $6, (0x1D56480 & 0xFFFF)($at)
/* B4250 001B4150 1614040C */  jal        sprintf
/* B4254 001B4154 00000000 */   nop
/* B4258 001B4158 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B425C 001B415C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4260 001B4160 21106200 */  addu       $2, $3, $2
/* B4264 001B4164 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4268 001B4168 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B426C 001B416C 2F010010 */  b          .L001B462C
/* B4270 001B4170 00000000 */   nop
.L001B4174:
/* B4274 001B4174 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B4278 001B4178 8464238C */  lw         $3, (0x1D56484 & 0xFFFF)($at)
/* B427C 001B417C FFFF0224 */  addiu      $2, $0, -0x1
/* B4280 001B4180 13006214 */  bne        $3, $2, .L001B41D0
/* B4284 001B4184 00000000 */   nop
/* B4288 001B4188 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B428C 001B418C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4290 001B4190 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4294 001B4194 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4298 001B4198 21104300 */  addu       $2, $2, $3
/* B429C 001B419C 1C004424 */  addiu      $4, $2, 0x1C
/* B42A0 001B41A0 0000458E */  lw         $5, 0x0($18)
/* B42A4 001B41A4 2A00023C */  lui        $2, %hi(_1542)
/* B42A8 001B41A8 C8B84624 */  addiu      $6, $2, %lo(_1542)
/* B42AC 001B41AC 1614040C */  jal        sprintf
/* B42B0 001B41B0 00000000 */   nop
/* B42B4 001B41B4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B42B8 001B41B8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B42BC 001B41BC 21106200 */  addu       $2, $3, $2
/* B42C0 001B41C0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B42C4 001B41C4 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B42C8 001B41C8 18010010 */  b          .L001B462C
/* B42CC 001B41CC 00000000 */   nop
.L001B41D0:
/* B42D0 001B41D0 01006624 */  addiu      $6, $3, 0x1
/* B42D4 001B41D4 1001A427 */  addiu      $4, $sp, 0x110
/* B42D8 001B41D8 2A00023C */  lui        $2, %hi(_1633)
/* B42DC 001B41DC E0BA4524 */  addiu      $5, $2, %lo(_1633)
/* B42E0 001B41E0 1614040C */  jal        sprintf
/* B42E4 001B41E4 00000000 */   nop
/* B42E8 001B41E8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B42EC 001B41EC E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B42F0 001B41F0 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B42F4 001B41F4 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B42F8 001B41F8 21104300 */  addu       $2, $2, $3
/* B42FC 001B41FC 1C004424 */  addiu      $4, $2, 0x1C
/* B4300 001B4200 0000458E */  lw         $5, 0x0($18)
/* B4304 001B4204 1001A627 */  addiu      $6, $sp, 0x110
/* B4308 001B4208 1614040C */  jal        sprintf
/* B430C 001B420C 00000000 */   nop
/* B4310 001B4210 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4314 001B4214 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4318 001B4218 21106200 */  addu       $2, $3, $2
/* B431C 001B421C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4320 001B4220 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4324 001B4224 01010010 */  b          .L001B462C
/* B4328 001B4228 00000000 */   nop
.L001B422C:
/* B432C 001B422C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4330 001B4230 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4334 001B4234 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4338 001B4238 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B433C 001B423C 21184300 */  addu       $3, $2, $3
/* B4340 001B4240 D501013C */  lui        $at, (0x1D56488 >> 16)
/* B4344 001B4244 8864228C */  lw         $2, (0x1D56488 & 0xFFFF)($at)
/* B4348 001B4248 80100200 */  sll        $2, $2, 2
/* B434C 001B424C 21105D00 */  addu       $2, $2, $sp
/* B4350 001B4250 1C006424 */  addiu      $4, $3, 0x1C
/* B4354 001B4254 0000458E */  lw         $5, 0x0($18)
/* B4358 001B4258 5001468C */  lw         $6, 0x150($2)
/* B435C 001B425C 1614040C */  jal        sprintf
/* B4360 001B4260 00000000 */   nop
/* B4364 001B4264 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4368 001B4268 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B436C 001B426C 21106200 */  addu       $2, $3, $2
/* B4370 001B4270 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4374 001B4274 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4378 001B4278 EC000010 */  b          .L001B462C
/* B437C 001B427C 00000000 */   nop
.L001B4280:
/* B4380 001B4280 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4384 001B4284 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4388 001B4288 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B438C 001B428C D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4390 001B4290 21184300 */  addu       $3, $2, $3
/* B4394 001B4294 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B4398 001B4298 7464228C */  lw         $2, (0x1D56474 & 0xFFFF)($at)
/* B439C 001B429C 80100200 */  sll        $2, $2, 2
/* B43A0 001B42A0 21105D00 */  addu       $2, $2, $sp
/* B43A4 001B42A4 1C006424 */  addiu      $4, $3, 0x1C
/* B43A8 001B42A8 0000458E */  lw         $5, 0x0($18)
/* B43AC 001B42AC 5001468C */  lw         $6, 0x150($2)
/* B43B0 001B42B0 1614040C */  jal        sprintf
/* B43B4 001B42B4 00000000 */   nop
/* B43B8 001B42B8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B43BC 001B42BC E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B43C0 001B42C0 21106200 */  addu       $2, $3, $2
/* B43C4 001B42C4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B43C8 001B42C8 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B43CC 001B42CC D7000010 */  b          .L001B462C
/* B43D0 001B42D0 00000000 */   nop
.L001B42D4:
/* B43D4 001B42D4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B43D8 001B42D8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B43DC 001B42DC EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B43E0 001B42E0 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B43E4 001B42E4 21184300 */  addu       $3, $2, $3
/* B43E8 001B42E8 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B43EC 001B42EC 7064228C */  lw         $2, (0x1D56470 & 0xFFFF)($at)
/* B43F0 001B42F0 80100200 */  sll        $2, $2, 2
/* B43F4 001B42F4 21105D00 */  addu       $2, $2, $sp
/* B43F8 001B42F8 1C006424 */  addiu      $4, $3, 0x1C
/* B43FC 001B42FC 0000458E */  lw         $5, 0x0($18)
/* B4400 001B4300 5001468C */  lw         $6, 0x150($2)
/* B4404 001B4304 1614040C */  jal        sprintf
/* B4408 001B4308 00000000 */   nop
/* B440C 001B430C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4410 001B4310 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4414 001B4314 21106200 */  addu       $2, $3, $2
/* B4418 001B4318 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B441C 001B431C E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4420 001B4320 C2000010 */  b          .L001B462C
/* B4424 001B4324 00000000 */   nop
.L001B4328:
/* B4428 001B4328 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B442C 001B432C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4430 001B4330 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4434 001B4334 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4438 001B4338 21184300 */  addu       $3, $2, $3
/* B443C 001B433C D501013C */  lui        $at, (0x1D56478 >> 16)
/* B4440 001B4340 7864228C */  lw         $2, (0x1D56478 & 0xFFFF)($at)
/* B4444 001B4344 80100200 */  sll        $2, $2, 2
/* B4448 001B4348 21105D00 */  addu       $2, $2, $sp
/* B444C 001B434C 1C006424 */  addiu      $4, $3, 0x1C
/* B4450 001B4350 0000458E */  lw         $5, 0x0($18)
/* B4454 001B4354 5001468C */  lw         $6, 0x150($2)
/* B4458 001B4358 1614040C */  jal        sprintf
/* B445C 001B435C 00000000 */   nop
/* B4460 001B4360 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4464 001B4364 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4468 001B4368 21106200 */  addu       $2, $3, $2
/* B446C 001B436C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4470 001B4370 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4474 001B4374 AD000010 */  b          .L001B462C
/* B4478 001B4378 00000000 */   nop
.L001B437C:
/* B447C 001B437C EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4480 001B4380 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4484 001B4384 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4488 001B4388 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B448C 001B438C 21184300 */  addu       $3, $2, $3
/* B4490 001B4390 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B4494 001B4394 6C64228C */  lw         $2, (0x1D5646C & 0xFFFF)($at)
/* B4498 001B4398 80100200 */  sll        $2, $2, 2
/* B449C 001B439C 21105D00 */  addu       $2, $2, $sp
/* B44A0 001B43A0 1C006424 */  addiu      $4, $3, 0x1C
/* B44A4 001B43A4 0000458E */  lw         $5, 0x0($18)
/* B44A8 001B43A8 5001468C */  lw         $6, 0x150($2)
/* B44AC 001B43AC 1614040C */  jal        sprintf
/* B44B0 001B43B0 00000000 */   nop
/* B44B4 001B43B4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B44B8 001B43B8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B44BC 001B43BC 21106200 */  addu       $2, $3, $2
/* B44C0 001B43C0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B44C4 001B43C4 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B44C8 001B43C8 98000010 */  b          .L001B462C
/* B44CC 001B43CC 00000000 */   nop
.L001B43D0:
/* B44D0 001B43D0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B44D4 001B43D4 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B44D8 001B43D8 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B44DC 001B43DC D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B44E0 001B43E0 21184300 */  addu       $3, $2, $3
/* B44E4 001B43E4 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B44E8 001B43E8 B064228C */  lw         $2, (0x1D564B0 & 0xFFFF)($at)
/* B44EC 001B43EC 80100200 */  sll        $2, $2, 2
/* B44F0 001B43F0 21105D00 */  addu       $2, $2, $sp
/* B44F4 001B43F4 1C006424 */  addiu      $4, $3, 0x1C
/* B44F8 001B43F8 0000458E */  lw         $5, 0x0($18)
/* B44FC 001B43FC 6001468C */  lw         $6, 0x160($2)
/* B4500 001B4400 1614040C */  jal        sprintf
/* B4504 001B4404 00000000 */   nop
/* B4508 001B4408 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B450C 001B440C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4510 001B4410 21106200 */  addu       $2, $3, $2
/* B4514 001B4414 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4518 001B4418 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B451C 001B441C 83000010 */  b          .L001B462C
/* B4520 001B4420 00000000 */   nop
.L001B4424:
/* B4524 001B4424 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4528 001B4428 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B452C 001B442C EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4530 001B4430 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4534 001B4434 21104300 */  addu       $2, $2, $3
/* B4538 001B4438 1C004424 */  addiu      $4, $2, 0x1C
/* B453C 001B443C 0000458E */  lw         $5, 0x0($18)
/* B4540 001B4440 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B4544 001B4444 9864268C */  lw         $6, (0x1D56498 & 0xFFFF)($at)
/* B4548 001B4448 D501013C */  lui        $at, (0x1D5649C >> 16)
/* B454C 001B444C 9C64278C */  lw         $7, (0x1D5649C & 0xFFFF)($at)
/* B4550 001B4450 1614040C */  jal        sprintf
/* B4554 001B4454 00000000 */   nop
/* B4558 001B4458 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B455C 001B445C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4560 001B4460 21106200 */  addu       $2, $3, $2
/* B4564 001B4464 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4568 001B4468 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B456C 001B446C 6F000010 */  b          .L001B462C
/* B4570 001B4470 00000000 */   nop
.L001B4474:
/* B4574 001B4474 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4578 001B4478 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B457C 001B447C EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4580 001B4480 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4584 001B4484 21104300 */  addu       $2, $2, $3
/* B4588 001B4488 1C004424 */  addiu      $4, $2, 0x1C
/* B458C 001B448C 0000458E */  lw         $5, 0x0($18)
/* B4590 001B4490 1614040C */  jal        sprintf
/* B4594 001B4494 00000000 */   nop
/* B4598 001B4498 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B459C 001B449C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B45A0 001B44A0 21106200 */  addu       $2, $3, $2
/* B45A4 001B44A4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B45A8 001B44A8 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B45AC 001B44AC 5F000010 */  b          .L001B462C
/* B45B0 001B44B0 00000000 */   nop
.L001B44B4:
/* B45B4 001B44B4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B45B8 001B44B8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B45BC 001B44BC EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B45C0 001B44C0 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B45C4 001B44C4 21184300 */  addu       $3, $2, $3
/* B45C8 001B44C8 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B45CC 001B44CC A064228C */  lw         $2, (0x1D564A0 & 0xFFFF)($at)
/* B45D0 001B44D0 80100200 */  sll        $2, $2, 2
/* B45D4 001B44D4 21105D00 */  addu       $2, $2, $sp
/* B45D8 001B44D8 1C006424 */  addiu      $4, $3, 0x1C
/* B45DC 001B44DC 0000458E */  lw         $5, 0x0($18)
/* B45E0 001B44E0 5801468C */  lw         $6, 0x158($2)
/* B45E4 001B44E4 1614040C */  jal        sprintf
/* B45E8 001B44E8 00000000 */   nop
/* B45EC 001B44EC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B45F0 001B44F0 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B45F4 001B44F4 21106200 */  addu       $2, $3, $2
/* B45F8 001B44F8 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B45FC 001B44FC E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4600 001B4500 4A000010 */  b          .L001B462C
/* B4604 001B4504 00000000 */   nop
.L001B4508:
/* B4608 001B4508 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B460C 001B450C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4610 001B4510 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B4614 001B4514 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4618 001B4518 21104300 */  addu       $2, $2, $3
/* B461C 001B451C 1C004424 */  addiu      $4, $2, 0x1C
/* B4620 001B4520 0000458E */  lw         $5, 0x0($18)
/* B4624 001B4524 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B4628 001B4528 8C64268C */  lw         $6, (0x1D5648C & 0xFFFF)($at)
/* B462C 001B452C 1614040C */  jal        sprintf
/* B4630 001B4530 00000000 */   nop
/* B4634 001B4534 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4638 001B4538 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B463C 001B453C 21106200 */  addu       $2, $3, $2
/* B4640 001B4540 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4644 001B4544 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B4648 001B4548 38000010 */  b          .L001B462C
/* B464C 001B454C 00000000 */   nop
.L001B4550:
/* B4650 001B4550 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4654 001B4554 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4658 001B4558 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B465C 001B455C D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B4660 001B4560 21184300 */  addu       $3, $2, $3
/* B4664 001B4564 D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B4668 001B4568 A464228C */  lw         $2, (0x1D564A4 & 0xFFFF)($at)
/* B466C 001B456C 80100200 */  sll        $2, $2, 2
/* B4670 001B4570 21105D00 */  addu       $2, $2, $sp
/* B4674 001B4574 1C006424 */  addiu      $4, $3, 0x1C
/* B4678 001B4578 0000458E */  lw         $5, 0x0($18)
/* B467C 001B457C F000468C */  lw         $6, 0xF0($2)
/* B4680 001B4580 1614040C */  jal        sprintf
/* B4684 001B4584 00000000 */   nop
/* B4688 001B4588 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B468C 001B458C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4690 001B4590 21106200 */  addu       $2, $3, $2
/* B4694 001B4594 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4698 001B4598 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B469C 001B459C 23000010 */  b          .L001B462C
/* B46A0 001B45A0 00000000 */   nop
.L001B45A4:
/* B46A4 001B45A4 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B46A8 001B45A8 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B46AC 001B45AC EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B46B0 001B45B0 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B46B4 001B45B4 21104300 */  addu       $2, $2, $3
/* B46B8 001B45B8 1C004424 */  addiu      $4, $2, 0x1C
/* B46BC 001B45BC 0000458E */  lw         $5, 0x0($18)
/* B46C0 001B45C0 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B46C4 001B45C4 A864268C */  lw         $6, (0x1D564A8 & 0xFFFF)($at)
/* B46C8 001B45C8 1614040C */  jal        sprintf
/* B46CC 001B45CC 00000000 */   nop
/* B46D0 001B45D0 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B46D4 001B45D4 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B46D8 001B45D8 21106200 */  addu       $2, $3, $2
/* B46DC 001B45DC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B46E0 001B45E0 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
/* B46E4 001B45E4 11000010 */  b          .L001B462C
/* B46E8 001B45E8 00000000 */   nop
.L001B45EC:
/* B46EC 001B45EC EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B46F0 001B45F0 E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B46F4 001B45F4 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B46F8 001B45F8 D0604224 */  addiu      $2, $2, %lo(D_1EB60D0)
/* B46FC 001B45FC 21104300 */  addu       $2, $2, $3
/* B4700 001B4600 1C004424 */  addiu      $4, $2, 0x1C
/* B4704 001B4604 0000458E */  lw         $5, 0x0($18)
/* B4708 001B4608 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B470C 001B460C AC64268C */  lw         $6, (0x1D564AC & 0xFFFF)($at)
/* B4710 001B4610 1614040C */  jal        sprintf
/* B4714 001B4614 00000000 */   nop
/* B4718 001B4618 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B471C 001B461C E860238C */  lw         $3, (0x1EB60E8 & 0xFFFF)($at)
/* B4720 001B4620 21106200 */  addu       $2, $3, $2
/* B4724 001B4624 EB01013C */  lui        $at, (0x1EB60E8 >> 16)
/* B4728 001B4628 E86022AC */  sw         $2, (0x1EB60E8 & 0xFFFF)($at)
.L001B462C:
/* B472C 001B462C 01001026 */  addiu      $16, $16, 0x1
.L001B4630:
/* B4730 001B4630 80881000 */  sll        $17, $16, 2
/* B4734 001B4634 2700023C */  lui        $2, %hi(DebugInfoMsg)
/* B4738 001B4638 20B14224 */  addiu      $2, $2, %lo(DebugInfoMsg)
/* B473C 001B463C 21905100 */  addu       $18, $2, $17
/* B4740 001B4640 0000428E */  lw         $2, 0x0($18)
/* B4744 001B4644 51FE4014 */  bnez       $2, .L001B3F8C
/* B4748 001B4648 00000000 */   nop
/* B474C 001B464C 00020224 */  addiu      $2, $0, 0x200
/* B4750 001B4650 4001A2AF */  sw         $2, 0x140($sp)
/* B4754 001B4654 80020224 */  addiu      $2, $0, 0x280
/* B4758 001B4658 4401A2AF */  sw         $2, 0x144($sp)
/* B475C 001B465C 00100224 */  addiu      $2, $0, 0x1000
/* B4760 001B4660 4801A2AF */  sw         $2, 0x148($sp)
/* B4764 001B4664 00070224 */  addiu      $2, $0, 0x700
/* B4768 001B4668 4C01A2AF */  sw         $2, 0x14C($sp)
/* B476C 001B466C 4001A427 */  addiu      $4, $sp, 0x140
/* B4770 001B4670 08000524 */  addiu      $5, $0, 0x8
/* B4774 001B4674 2836A070 */  paddub     $6, $5, $0
/* B4778 001B4678 283EA070 */  paddub     $7, $5, $0
/* B477C 001B467C 60000824 */  addiu      $8, $0, 0x60
/* B4780 001B4680 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* B4784 001B4684 00000000 */   nop
/* B4788 001B4688 EB01023C */  lui        $2, %hi(D_1EB60D0)
/* B478C 001B468C D0604424 */  addiu      $4, $2, %lo(D_1EB60D0)
/* B4790 001B4690 D0F7040C */  jal        Draw__10CDebugFontFv
/* B4794 001B4694 00000000 */   nop
.L001B4698:
/* B4798 001B4698 9000BF7B */  lq         $31, 0x90($sp)
/* B479C 001B469C 8000B57B */  lq         $21, 0x80($sp)
/* B47A0 001B46A0 7000B47B */  lq         $20, 0x70($sp)
/* B47A4 001B46A4 6000B37B */  lq         $19, 0x60($sp)
/* B47A8 001B46A8 5000B27B */  lq         $18, 0x50($sp)
/* B47AC 001B46AC 4000B17B */  lq         $17, 0x40($sp)
/* B47B0 001B46B0 3000B07B */  lq         $16, 0x30($sp)
/* B47B4 001B46B4 2C00BFC7 */  lwc1       $f31, 0x2C($sp)
/* B47B8 001B46B8 2800BEC7 */  lwc1       $f30, 0x28($sp)
/* B47BC 001B46BC 2400BDC7 */  lwc1       $f29, 0x24($sp)
/* B47C0 001B46C0 2000BCC7 */  lwc1       $f28, 0x20($sp)
/* B47C4 001B46C4 1C00BBC7 */  lwc1       $f27, 0x1C($sp)
/* B47C8 001B46C8 1800BAC7 */  lwc1       $f26, 0x18($sp)
/* B47CC 001B46CC 1400B9C7 */  lwc1       $f25, 0x14($sp)
/* B47D0 001B46D0 1000B8C7 */  lwc1       $f24, 0x10($sp)
/* B47D4 001B46D4 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* B47D8 001B46D8 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* B47DC 001B46DC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* B47E0 001B46E0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B47E4 001B46E4 7001BD27 */  addiu      $sp, $sp, 0x170
/* B47E8 001B46E8 0800E003 */  jr         $31
/* B47EC 001B46EC 00000000 */   nop
