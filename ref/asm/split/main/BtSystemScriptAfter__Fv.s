.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSystemScriptAfter__Fv
/* 0BB6E0 001BB5E0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0BB6E4 001BB5E4 2000BF7F */  sq          $31, 0x20($29)
/* 0BB6E8 001BB5E8 1000B17F */  sq          $17, 0x10($29)
/* 0BB6EC 001BB5EC 0000B07F */  sq          $16, 0x0($29)
/* 0BB6F0 001BB5F0 189E80AF */  sw          $0, -0x61E8($28)
/* 0BB6F4 001BB5F4 8C9C80AF */  sw          $0, -0x6374($28)
/* 0BB6F8 001BB5F8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BB6FC 001BB5FC D501013C */  lui         $1, %hi(BtEventInfo + 0x30)
/* 0BB700 001BB600 706722AC */  sw          $2, %lo(BtEventInfo + 0x30)($1)
/* 0BB704 001BB604 01000424 */  addiu       $4, $0, 0x1
/* 0BB708 001BB608 B004770C */  jal         SetMIniMapStatus__Fi
/* 0BB70C 001BB60C 00000000 */   nop
/* 0BB710 001BB610 EA01013C */  lui         $1, %hi(CharaMain + 0xC68)
/* 0BB714 001BB614 882920AC */  sw          $0, %lo(CharaMain + 0xC68)($1)
/* 0BB718 001BB618 EA01013C */  lui         $1, %hi(CharaMain + 0xC64)
/* 0BB71C 001BB61C 842920AC */  sw          $0, %lo(CharaMain + 0xC64)($1)
/* 0BB720 001BB620 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0BB724 001BB624 EA01013C */  lui         $1, %hi(CharaMain + 0xC60)
/* 0BB728 001BB628 802922AC */  sw          $2, %lo(CharaMain + 0xC60)($1)
/* 0BB72C 001BB62C DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0BB730 001BB630 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0BB734 001BB634 FFFF0224 */  addiu       $2, $0, -0x1
/* 0BB738 001BB638 DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 0BB73C 001BB63C 844422AC */  sw          $2, %lo(BtActStatus + 0x4)($1)
/* 0BB740 001BB640 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 0BB744 001BB644 884422AC */  sw          $2, %lo(BtActStatus + 0x8)($1)
/* 0BB748 001BB648 01000224 */  addiu       $2, $0, 0x1
/* 0BB74C 001BB64C DC01013C */  lui         $1, %hi(BtActStatus)
/* 0BB750 001BB650 804422AC */  sw          $2, %lo(BtActStatus)($1)
/* 0BB754 001BB654 DC01013C */  lui         $1, %hi(BtActStatus + 0x58)
/* 0BB758 001BB658 D84422AC */  sw          $2, %lo(BtActStatus + 0x58)($1)
/* 0BB75C 001BB65C DC01013C */  lui         $1, %hi(BtActStatus + 0x54)
/* 0BB760 001BB660 D44422AC */  sw          $2, %lo(BtActStatus + 0x54)($1)
/* 0BB764 001BB664 D401013C */  lui         $1, %hi(EdEventInfo + 0x64)
/* 0BB768 001BB668 34D222AC */  sw          $2, %lo(EdEventInfo + 0x64)($1)
/* 0BB76C 001BB66C D401013C */  lui         $1, %hi(EdEventInfo + 0x60)
/* 0BB770 001BB670 30D222AC */  sw          $2, %lo(EdEventInfo + 0x60)($1)
/* 0BB774 001BB674 045E060C */  jal         EdEventAllClear__Fv
/* 0BB778 001BB678 00000000 */   nop
/* 0BB77C 001BB67C 789C838F */  lw          $3, -0x6388($28)
/* 0BB780 001BB680 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BB784 001BB684 21086100 */  addu        $1, $3, $1
/* 0BB788 001BB688 0C8B20AC */  sw          $0, -0x74F4($1)
/* 0BB78C 001BB68C FFFF0324 */  addiu       $3, $0, -0x1
/* 0BB790 001BB690 F49383AF */  sw          $3, -0x6C0C($28)
/* 0BB794 001BB694 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 0BB798 001BB698 14D2238C */  lw          $3, %lo(EdEventInfo + 0x44)($1)
/* 0BB79C 001BB69C 2D006018 */  blez        $3, .L001BB754
/* 0BB7A0 001BB6A0 00000000 */   nop
/* 0BB7A4 001BB6A4 3000A427 */  addiu       $4, $29, 0x30
/* 0BB7A8 001BB6A8 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0BB7AC 001BB6AC 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0BB7B0 001BB6B0 0C86040C */  jal         sceVu0CopyVector
/* 0BB7B4 001BB6B4 00000000 */   nop
/* 0BB7B8 001BB6B8 EA01023C */  lui         $2, %hi(CharaMain)
/* 0BB7BC 001BB6BC 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 0BB7C0 001BB6C0 4000A527 */  addiu       $5, $29, 0x40
/* 0BB7C4 001BB6C4 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 0BB7C8 001BB6C8 00000000 */   nop
/* 0BB7CC 001BB6CC 4400A1C7 */  lwc1        $f1, 0x44($29)
/* 0BB7D0 001BB6D0 D401013C */  lui         $1, %hi(EdEventInfo + 0x48)
/* 0BB7D4 001BB6D4 18D220C4 */  lwc1        $f0, %lo(EdEventInfo + 0x48)($1)
/* 0BB7D8 001BB6D8 000B0046 */  add.s       $f12, $f1, $f0
/* 0BB7DC 001BB6DC 448480C7 */  lwc1        $f0, -0x7BBC($28)
/* 0BB7E0 001BB6E0 36600046 */  c.le.s      $f12, $f0
/* 0BB7E4 001BB6E4 00000000 */  nop
/* 0BB7E8 001BB6E8 03000145 */  bc1t        .L001BB6F8
/* 0BB7EC 001BB6EC 00000000 */   nop
/* 0BB7F0 001BB6F0 308580C7 */  lwc1        $f0, -0x7AD0($28)
/* 0BB7F4 001BB6F4 01630046 */  sub.s       $f12, $f12, $f0
.L001BB6F8:
/* 0BB7F8 001BB6F8 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB7FC 001BB6FC E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB800 001BB700 CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 0BB804 001BB704 00000000 */   nop
/* 0BB808 001BB708 8041023C */  lui         $2, (0x41800000 >> 16)
/* 0BB80C 001BB70C 00088244 */  mtc1        $2, $f1
/* 0BB810 001BB710 3400A0C7 */  lwc1        $f0, 0x34($29)
/* 0BB814 001BB714 40080046 */  add.s       $f1, $f1, $f0
/* 0BB818 001BB718 4040023C */  lui         $2, (0x40400000 >> 16)
/* 0BB81C 001BB71C 00008244 */  mtc1        $2, $f0
/* 0BB820 001BB720 00000000 */  nop
/* 0BB824 001BB724 410B0046 */  sub.s       $f13, $f1, $f0
/* 0BB828 001BB728 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB82C 001BB72C E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB830 001BB730 3000ACC7 */  lwc1        $f12, 0x30($29)
/* 0BB834 001BB734 3800AEC7 */  lwc1        $f14, 0x38($29)
/* 0BB838 001BB738 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 0BB83C 001BB73C 00000000 */   nop
/* 0BB840 001BB740 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB844 001BB744 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB848 001BB748 FFFF0524 */  addiu       $5, $0, -0x1
/* 0BB84C 001BB74C F491040C */  jal         Step__13CCameraFollowFi
/* 0BB850 001BB750 00000000 */   nop
.L001BB754:
/* 0BB854 001BB754 D401013C */  lui         $1, %hi(EdEventInfo + 0x44)
/* 0BB858 001BB758 14D2238C */  lw          $3, %lo(EdEventInfo + 0x44)($1)
/* 0BB85C 001BB75C 58006104 */  bgez        $3, .L001BB8C0
/* 0BB860 001BB760 00000000 */   nop
/* 0BB864 001BB764 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB868 001BB768 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB86C 001BB76C 3000A527 */  addiu       $5, $29, 0x30
/* 0BB870 001BB770 9C91040C */  jal         GetPos__7CCameraFPf
/* 0BB874 001BB774 00000000 */   nop
/* 0BB878 001BB778 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB87C 001BB77C E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB880 001BB780 4000A527 */  addiu       $5, $29, 0x40
/* 0BB884 001BB784 A891040C */  jal         GetRef__7CCameraFPf
/* 0BB888 001BB788 00000000 */   nop
/* 0BB88C 001BB78C DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB890 001BB790 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB894 001BB794 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0BB898 001BB798 00000000 */   nop
/* 0BB89C 001BB79C DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB8A0 001BB7A0 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB8A4 001BB7A4 3000A527 */  addiu       $5, $29, 0x30
/* 0BB8A8 001BB7A8 A490040C */  jal         SetPos__7CCameraFPf
/* 0BB8AC 001BB7AC 00000000 */   nop
/* 0BB8B0 001BB7B0 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB8B4 001BB7B4 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB8B8 001BB7B8 4000A527 */  addiu       $5, $29, 0x40
/* 0BB8BC 001BB7BC C490040C */  jal         SetRef__7CCameraFPf
/* 0BB8C0 001BB7C0 00000000 */   nop
/* 0BB8C4 001BB7C4 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB8C8 001BB7C8 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB8CC 001BB7CC FFFF0524 */  addiu       $5, $0, -0x1
/* 0BB8D0 001BB7D0 F491040C */  jal         Step__13CCameraFollowFi
/* 0BB8D4 001BB7D4 00000000 */   nop
/* 0BB8D8 001BB7D8 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB8DC 001BB7DC E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB8E0 001BB7E0 01000524 */  addiu       $5, $0, 0x1
/* 0BB8E4 001BB7E4 F491040C */  jal         Step__13CCameraFollowFi
/* 0BB8E8 001BB7E8 00000000 */   nop
/* 0BB8EC 001BB7EC DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB8F0 001BB7F0 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB8F4 001BB7F4 C092040C */  jal         FollowOn__13CCameraFollowFv
/* 0BB8F8 001BB7F8 00000000 */   nop
/* 0BB8FC 001BB7FC 3400A1C7 */  lwc1        $f1, 0x34($29)
/* 0BB900 001BB800 4400B027 */  addiu       $16, $29, 0x44
/* 0BB904 001BB804 000000C6 */  lwc1        $f0, 0x0($16)
/* 0BB908 001BB808 010B0046 */  sub.s       $f12, $f1, $f0
/* 0BB90C 001BB80C DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB910 001BB810 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB914 001BB814 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 0BB918 001BB818 00000000 */   nop
/* 0BB91C 001BB81C 4800B127 */  addiu       $17, $29, 0x48
/* 0BB920 001BB820 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB924 001BB824 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB928 001BB828 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0BB92C 001BB82C 00000DC6 */  lwc1        $f13, 0x0($16)
/* 0BB930 001BB830 00002EC6 */  lwc1        $f14, 0x0($17)
/* 0BB934 001BB834 B892040C */  jal         SetFollow__13CCameraFollowFfff
/* 0BB938 001BB838 00000000 */   nop
/* 0BB93C 001BB83C 3000A1C7 */  lwc1        $f1, 0x30($29)
/* 0BB940 001BB840 4000A0C7 */  lwc1        $f0, 0x40($29)
/* 0BB944 001BB844 010B0046 */  sub.s       $f12, $f1, $f0
/* 0BB948 001BB848 9044040C */  jal         fptodp
/* 0BB94C 001BB84C 00000000 */   nop
/* 0BB950 001BB850 28864070 */  paddub      $16, $2, $0
/* 0BB954 001BB854 3800A1C7 */  lwc1        $f1, 0x38($29)
/* 0BB958 001BB858 000020C6 */  lwc1        $f0, 0x0($17)
/* 0BB95C 001BB85C 010B0046 */  sub.s       $f12, $f1, $f0
/* 0BB960 001BB860 9044040C */  jal         fptodp
/* 0BB964 001BB864 00000000 */   nop
/* 0BB968 001BB868 28260072 */  paddub      $4, $16, $0
/* 0BB96C 001BB86C 282E4070 */  paddub      $5, $2, $0
/* 0BB970 001BB870 8676040C */  jal         atan2
/* 0BB974 001BB874 00000000 */   nop
/* 0BB978 001BB878 28264070 */  paddub      $4, $2, $0
/* 0BB97C 001BB87C 9241040C */  jal         dptofp
/* 0BB980 001BB880 00000000 */   nop
/* 0BB984 001BB884 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB988 001BB888 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB98C 001BB88C 06030046 */  mov.s       $f12, $f0
/* 0BB990 001BB890 CC92040C */  jal         SetAngleSoon__13CCameraFollowFf
/* 0BB994 001BB894 00000000 */   nop
/* 0BB998 001BB898 DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB99C 001BB89C E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB9A0 001BB8A0 FFFF0524 */  addiu       $5, $0, -0x1
/* 0BB9A4 001BB8A4 F491040C */  jal         Step__13CCameraFollowFi
/* 0BB9A8 001BB8A8 00000000 */   nop
/* 0BB9AC 001BB8AC DC01023C */  lui         $2, %hi(MainCamera__4)
/* 0BB9B0 001BB8B0 E0454424 */  addiu       $4, $2, %lo(MainCamera__4)
/* 0BB9B4 001BB8B4 01000524 */  addiu       $5, $0, 0x1
/* 0BB9B8 001BB8B8 F491040C */  jal         Step__13CCameraFollowFi
/* 0BB9BC 001BB8BC 00000000 */   nop
.L001BB8C0:
/* 0BB9C0 001BB8C0 DC01033C */  lui         $3, %hi(MainCamera__4)
/* 0BB9C4 001BB8C4 E0456324 */  addiu       $3, $3, %lo(MainCamera__4)
/* 0BB9C8 001BB8C8 A89C83AF */  sw          $3, -0x6358($28)
/* 0BB9CC 001BB8CC 2000BF7B */  lq          $31, 0x20($29)
/* 0BB9D0 001BB8D0 1000B17B */  lq          $17, 0x10($29)
/* 0BB9D4 001BB8D4 0000B07B */  lq          $16, 0x0($29)
/* 0BB9D8 001BB8D8 5000BD27 */  addiu       $29, $29, 0x50
/* 0BB9DC 001BB8DC 0800E003 */  jr          $31
/* 0BB9E0 001BB8E0 00000000 */   nop
/* 0BB9E4 001BB8E4 00000000 */  nop
/* 0BB9E8 001BB8E8 00000000 */  nop
/* 0BB9EC 001BB8EC 00000000 */  nop
