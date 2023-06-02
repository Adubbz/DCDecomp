.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSystemScriptAfter__Fv
/* BB6E0 001BB5E0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* BB6E4 001BB5E4 2000BF7F */  sq         $31, 0x20($sp)
/* BB6E8 001BB5E8 1000B17F */  sq         $17, 0x10($sp)
/* BB6EC 001BB5EC 0000B07F */  sq         $16, 0x0($sp)
/* BB6F0 001BB5F0 189E80AF */  sw         $0, -0x61E8($gp)
/* BB6F4 001BB5F4 8C9C80AF */  sw         $0, -0x6374($gp)
/* BB6F8 001BB5F8 FFFF0224 */  addiu      $2, $0, -0x1
/* BB6FC 001BB5FC D501013C */  lui        $at, (0x1D56770 >> 16)
/* BB700 001BB600 706722AC */  sw         $2, (0x1D56770 & 0xFFFF)($at)
/* BB704 001BB604 01000424 */  addiu      $4, $0, 0x1
/* BB708 001BB608 B004770C */  jal        func_1DC12C0
/* BB70C 001BB60C 00000000 */   nop
/* BB710 001BB610 EA01013C */  lui        $at, (0x1EA2988 >> 16)
/* BB714 001BB614 882920AC */  sw         $0, (0x1EA2988 & 0xFFFF)($at)
/* BB718 001BB618 EA01013C */  lui        $at, (0x1EA2984 >> 16)
/* BB71C 001BB61C 842920AC */  sw         $0, (0x1EA2984 & 0xFFFF)($at)
/* BB720 001BB620 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* BB724 001BB624 EA01013C */  lui        $at, (0x1EA2980 >> 16)
/* BB728 001BB628 802922AC */  sw         $2, (0x1EA2980 & 0xFFFF)($at)
/* BB72C 001BB62C DC01013C */  lui        $at, (0x1DC448C >> 16)
/* BB730 001BB630 8C4420AC */  sw         $0, (0x1DC448C & 0xFFFF)($at)
/* BB734 001BB634 FFFF0224 */  addiu      $2, $0, -0x1
/* BB738 001BB638 DC01013C */  lui        $at, (0x1DC4484 >> 16)
/* BB73C 001BB63C 844422AC */  sw         $2, (0x1DC4484 & 0xFFFF)($at)
/* BB740 001BB640 DC01013C */  lui        $at, (0x1DC4488 >> 16)
/* BB744 001BB644 884422AC */  sw         $2, (0x1DC4488 & 0xFFFF)($at)
/* BB748 001BB648 01000224 */  addiu      $2, $0, 0x1
/* BB74C 001BB64C DC01013C */  lui        $at, (0x1DC4480 >> 16)
/* BB750 001BB650 804422AC */  sw         $2, (0x1DC4480 & 0xFFFF)($at)
/* BB754 001BB654 DC01013C */  lui        $at, (0x1DC44D8 >> 16)
/* BB758 001BB658 D84422AC */  sw         $2, (0x1DC44D8 & 0xFFFF)($at)
/* BB75C 001BB65C DC01013C */  lui        $at, (0x1DC44D4 >> 16)
/* BB760 001BB660 D44422AC */  sw         $2, (0x1DC44D4 & 0xFFFF)($at)
/* BB764 001BB664 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB768 001BB668 34D222AC */  sw         $2, -0x2DCC($at)
/* BB76C 001BB66C D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB770 001BB670 30D222AC */  sw         $2, -0x2DD0($at)
/* BB774 001BB674 045E060C */  jal        EdEventAllClear__Fv
/* BB778 001BB678 00000000 */   nop
/* BB77C 001BB67C 789C838F */  lw         $3, -0x6388($gp)
/* BB780 001BB680 0100013C */  lui        $at, (0x10000 >> 16)
/* BB784 001BB684 21086100 */  addu       $at, $3, $at
/* BB788 001BB688 0C8B20AC */  sw         $0, -0x74F4($at)
/* BB78C 001BB68C FFFF0324 */  addiu      $3, $0, -0x1
/* BB790 001BB690 F49383AF */  sw         $3, -0x6C0C($gp)
/* BB794 001BB694 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB798 001BB698 14D2238C */  lw         $3, -0x2DEC($at)
/* BB79C 001BB69C 2D006018 */  blez       $3, .L001BB754
/* BB7A0 001BB6A0 00000000 */   nop
/* BB7A4 001BB6A4 3000A427 */  addiu      $4, $sp, 0x30
/* BB7A8 001BB6A8 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* BB7AC 001BB6AC 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* BB7B0 001BB6B0 0C86040C */  jal        sceVu0CopyVector
/* BB7B4 001BB6B4 00000000 */   nop
/* BB7B8 001BB6B8 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* BB7BC 001BB6BC 201D4424 */  addiu      $4, $2, %lo(D_1EA1D20)
/* BB7C0 001BB6C0 4000A527 */  addiu      $5, $sp, 0x40
/* BB7C4 001BB6C4 BC5B050C */  jal        GetRotation__7CObjectFPf
/* BB7C8 001BB6C8 00000000 */   nop
/* BB7CC 001BB6CC 4400A1C7 */  lwc1       $f1, 0x44($sp)
/* BB7D0 001BB6D0 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB7D4 001BB6D4 18D220C4 */  lwc1       $f0, -0x2DE8($at)
/* BB7D8 001BB6D8 000B0046 */  add.s      $f12, $f1, $f0
/* BB7DC 001BB6DC 448480C7 */  lwc1       $f0, -0x7BBC($gp)
/* BB7E0 001BB6E0 36600046 */  c.le.s     $f12, $f0
/* BB7E4 001BB6E4 00000000 */  nop
/* BB7E8 001BB6E8 03000145 */  bc1t       .L001BB6F8
/* BB7EC 001BB6EC 00000000 */   nop
/* BB7F0 001BB6F0 308580C7 */  lwc1       $f0, -0x7AD0($gp)
/* BB7F4 001BB6F4 01630046 */  sub.s      $f12, $f12, $f0
.L001BB6F8:
/* BB7F8 001BB6F8 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB7FC 001BB6FC E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB800 001BB700 CC92040C */  jal        SetAngleSoon__13CCameraFollowFf
/* BB804 001BB704 00000000 */   nop
/* BB808 001BB708 8041023C */  lui        $2, (0x41800000 >> 16)
/* BB80C 001BB70C 00088244 */  mtc1       $2, $f1
/* BB810 001BB710 3400A0C7 */  lwc1       $f0, 0x34($sp)
/* BB814 001BB714 40080046 */  add.s      $f1, $f1, $f0
/* BB818 001BB718 4040023C */  lui        $2, (0x40400000 >> 16)
/* BB81C 001BB71C 00008244 */  mtc1       $2, $f0
/* BB820 001BB720 00000000 */  nop
/* BB824 001BB724 410B0046 */  sub.s      $f13, $f1, $f0
/* BB828 001BB728 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB82C 001BB72C E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB830 001BB730 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* BB834 001BB734 3800AEC7 */  lwc1       $f14, 0x38($sp)
/* BB838 001BB738 B892040C */  jal        SetFollow__13CCameraFollowFfff
/* BB83C 001BB73C 00000000 */   nop
/* BB840 001BB740 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB844 001BB744 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB848 001BB748 FFFF0524 */  addiu      $5, $0, -0x1
/* BB84C 001BB74C F491040C */  jal        Step__13CCameraFollowFi
/* BB850 001BB750 00000000 */   nop
.L001BB754:
/* BB854 001BB754 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB858 001BB758 14D2238C */  lw         $3, -0x2DEC($at)
/* BB85C 001BB75C 58006104 */  bgez       $3, .L001BB8C0
/* BB860 001BB760 00000000 */   nop
/* BB864 001BB764 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* BB868 001BB768 E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* BB86C 001BB76C 3000A527 */  addiu      $5, $sp, 0x30
/* BB870 001BB770 9C91040C */  jal        GetPos__7CCameraFPf
/* BB874 001BB774 00000000 */   nop
/* BB878 001BB778 DC01023C */  lui        $2, %hi(D_1DC48E0)
/* BB87C 001BB77C E0484424 */  addiu      $4, $2, %lo(D_1DC48E0)
/* BB880 001BB780 4000A527 */  addiu      $5, $sp, 0x40
/* BB884 001BB784 A891040C */  jal        GetRef__7CCameraFPf
/* BB888 001BB788 00000000 */   nop
/* BB88C 001BB78C DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB890 001BB790 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB894 001BB794 C492040C */  jal        FollowOff__13CCameraFollowFv
/* BB898 001BB798 00000000 */   nop
/* BB89C 001BB79C DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB8A0 001BB7A0 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB8A4 001BB7A4 3000A527 */  addiu      $5, $sp, 0x30
/* BB8A8 001BB7A8 A490040C */  jal        SetPos__7CCameraFPf
/* BB8AC 001BB7AC 00000000 */   nop
/* BB8B0 001BB7B0 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB8B4 001BB7B4 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB8B8 001BB7B8 4000A527 */  addiu      $5, $sp, 0x40
/* BB8BC 001BB7BC C490040C */  jal        SetRef__7CCameraFPf
/* BB8C0 001BB7C0 00000000 */   nop
/* BB8C4 001BB7C4 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB8C8 001BB7C8 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB8CC 001BB7CC FFFF0524 */  addiu      $5, $0, -0x1
/* BB8D0 001BB7D0 F491040C */  jal        Step__13CCameraFollowFi
/* BB8D4 001BB7D4 00000000 */   nop
/* BB8D8 001BB7D8 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB8DC 001BB7DC E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB8E0 001BB7E0 01000524 */  addiu      $5, $0, 0x1
/* BB8E4 001BB7E4 F491040C */  jal        Step__13CCameraFollowFi
/* BB8E8 001BB7E8 00000000 */   nop
/* BB8EC 001BB7EC DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB8F0 001BB7F0 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB8F4 001BB7F4 C092040C */  jal        FollowOn__13CCameraFollowFv
/* BB8F8 001BB7F8 00000000 */   nop
/* BB8FC 001BB7FC 3400A1C7 */  lwc1       $f1, 0x34($sp)
/* BB900 001BB800 4400B027 */  addiu      $16, $sp, 0x44
/* BB904 001BB804 000000C6 */  lwc1       $f0, 0x0($16)
/* BB908 001BB808 010B0046 */  sub.s      $f12, $f1, $f0
/* BB90C 001BB80C DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB910 001BB810 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB914 001BB814 EC92040C */  jal        SetHeight__13CCameraFollowFf
/* BB918 001BB818 00000000 */   nop
/* BB91C 001BB81C 4800B127 */  addiu      $17, $sp, 0x48
/* BB920 001BB820 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB924 001BB824 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB928 001BB828 4000ACC7 */  lwc1       $f12, 0x40($sp)
/* BB92C 001BB82C 00000DC6 */  lwc1       $f13, 0x0($16)
/* BB930 001BB830 00002EC6 */  lwc1       $f14, 0x0($17)
/* BB934 001BB834 B892040C */  jal        SetFollow__13CCameraFollowFfff
/* BB938 001BB838 00000000 */   nop
/* BB93C 001BB83C 3000A1C7 */  lwc1       $f1, 0x30($sp)
/* BB940 001BB840 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* BB944 001BB844 010B0046 */  sub.s      $f12, $f1, $f0
/* BB948 001BB848 9044040C */  jal        fptodp
/* BB94C 001BB84C 00000000 */   nop
/* BB950 001BB850 28864070 */  paddub     $16, $2, $0
/* BB954 001BB854 3800A1C7 */  lwc1       $f1, 0x38($sp)
/* BB958 001BB858 000020C6 */  lwc1       $f0, 0x0($17)
/* BB95C 001BB85C 010B0046 */  sub.s      $f12, $f1, $f0
/* BB960 001BB860 9044040C */  jal        fptodp
/* BB964 001BB864 00000000 */   nop
/* BB968 001BB868 28260072 */  paddub     $4, $16, $0
/* BB96C 001BB86C 282E4070 */  paddub     $5, $2, $0
/* BB970 001BB870 8676040C */  jal        atan2
/* BB974 001BB874 00000000 */   nop
/* BB978 001BB878 28264070 */  paddub     $4, $2, $0
/* BB97C 001BB87C 9241040C */  jal        dptofp
/* BB980 001BB880 00000000 */   nop
/* BB984 001BB884 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB988 001BB888 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB98C 001BB88C 06030046 */  mov.s      $f12, $f0
/* BB990 001BB890 CC92040C */  jal        SetAngleSoon__13CCameraFollowFf
/* BB994 001BB894 00000000 */   nop
/* BB998 001BB898 DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB99C 001BB89C E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB9A0 001BB8A0 FFFF0524 */  addiu      $5, $0, -0x1
/* BB9A4 001BB8A4 F491040C */  jal        Step__13CCameraFollowFi
/* BB9A8 001BB8A8 00000000 */   nop
/* BB9AC 001BB8AC DC01023C */  lui        $2, %hi(D_1DC45E0)
/* BB9B0 001BB8B0 E0454424 */  addiu      $4, $2, %lo(D_1DC45E0)
/* BB9B4 001BB8B4 01000524 */  addiu      $5, $0, 0x1
/* BB9B8 001BB8B8 F491040C */  jal        Step__13CCameraFollowFi
/* BB9BC 001BB8BC 00000000 */   nop
.L001BB8C0:
/* BB9C0 001BB8C0 DC01033C */  lui        $3, %hi(D_1DC45E0)
/* BB9C4 001BB8C4 E0456324 */  addiu      $3, $3, %lo(D_1DC45E0)
/* BB9C8 001BB8C8 A89C83AF */  sw         $3, -0x6358($gp)
/* BB9CC 001BB8CC 2000BF7B */  lq         $31, 0x20($sp)
/* BB9D0 001BB8D0 1000B17B */  lq         $17, 0x10($sp)
/* BB9D4 001BB8D4 0000B07B */  lq         $16, 0x0($sp)
/* BB9D8 001BB8D8 5000BD27 */  addiu      $sp, $sp, 0x50
/* BB9DC 001BB8DC 0800E003 */  jr         $31
/* BB9E0 001BB8E0 00000000 */   nop
/* BB9E4 001BB8E4 00000000 */  nop
/* BB9E8 001BB8E8 00000000 */  nop
/* BB9EC 001BB8EC 00000000 */  nop
