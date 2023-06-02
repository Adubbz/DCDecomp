.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveChara__Fv
/* 7F560 0017F460 00FFBD27 */  addiu      $sp, $sp, -0x100
/* 7F564 0017F464 2000BF7F */  sq         $31, 0x20($sp)
/* 7F568 0017F468 1000B17F */  sq         $17, 0x10($sp)
/* 7F56C 0017F46C 0000B07F */  sq         $16, 0x0($sp)
/* 7F570 0017F470 049180C7 */  lwc1       $f0, -0x6EFC($gp)
/* 7F574 0017F474 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F578 0017F478 709620E4 */  swc1       $f0, -0x6990($at)
/* 7F57C 0017F47C D301023C */  lui        $2, %hi(MainCamera)
/* 7F580 0017F480 40454224 */  addiu      $2, $2, %lo(MainCamera)
/* 7F584 0017F484 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F588 0017F488 789622AC */  sw         $2, -0x6988($at)
/* 7F58C 0017F48C D301023C */  lui        $2, %hi(ViewCamera)
/* 7F590 0017F490 40544424 */  addiu      $4, $2, %lo(ViewCamera)
/* 7F594 0017F494 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 7F598 0017F498 00000000 */   nop
/* 7F59C 0017F49C D301023C */  lui        $2, %hi(ViewCamera)
/* 7F5A0 0017F4A0 40544224 */  addiu      $2, $2, %lo(ViewCamera)
/* 7F5A4 0017F4A4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5A8 0017F4A8 7C9622AC */  sw         $2, -0x6984($at)
/* 7F5AC 0017F4AC 8490828F */  lw         $2, -0x6F7C($gp)
/* 7F5B0 0017F4B0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5B4 0017F4B4 809622AC */  sw         $2, -0x6980($at)
/* 7F5B8 0017F4B8 6487828F */  lw         $2, -0x789C($gp)
/* 7F5BC 0017F4BC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5C0 0017F4C0 749622AC */  sw         $2, -0x698C($at)
/* 7F5C4 0017F4C4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5C8 0017F4C8 889620AC */  sw         $0, -0x6978($at)
/* 7F5CC 0017F4CC E890828F */  lw         $2, -0x6F18($gp)
/* 7F5D0 0017F4D0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5D4 0017F4D4 8C9622AC */  sw         $2, -0x6974($at)
/* 7F5D8 0017F4D8 6090838F */  lw         $3, -0x6FA0($gp)
/* 7F5DC 0017F4DC 0200013C */  lui        $at, (0x23260 >> 16)
/* 7F5E0 0017F4E0 60322134 */  ori        $at, $at, (0x23260 & 0xFFFF)
/* 7F5E4 0017F4E4 21106100 */  addu       $2, $3, $at
/* 7F5E8 0017F4E8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F5EC 0017F4EC 009722AC */  sw         $2, -0x6900($at)
/* 7F5F0 0017F4F0 0200013C */  lui        $at, (0x20000 >> 16)
/* 7F5F4 0017F4F4 21086100 */  addu       $at, $3, $at
/* 7F5F8 0017F4F8 50A2228C */  lw         $2, -0x5DB0($at)
/* 7F5FC 0017F4FC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F600 0017F500 049722AC */  sw         $2, -0x68FC($at)
/* 7F604 0017F504 6087828F */  lw         $2, -0x78A0($gp)
/* 7F608 0017F508 10004238 */  xori       $2, $2, 0x10
/* 7F60C 0017F50C 0100422C */  sltiu      $2, $2, 0x1
/* 7F610 0017F510 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F614 0017F514 149722AC */  sw         $2, -0x68EC($at)
/* 7F618 0017F518 58A8050C */  jal        EdMoveChara__Fv
/* 7F61C 0017F51C 00000000 */   nop
/* 7F620 0017F520 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F624 0017F524 0C97248C */  lw         $4, -0x68F4($at)
/* 7F628 0017F528 07008018 */  blez       $4, .L0017F548
/* 7F62C 0017F52C 00000000 */   nop
/* 7F630 0017F530 D301023C */  lui        $2, %hi(MainCamera)
/* 7F634 0017F534 40454524 */  addiu      $5, $2, %lo(MainCamera)
/* 7F638 0017F538 B0DE050C */  jal        RunSystemEvent__FiP7CCamera
/* 7F63C 0017F53C 00000000 */   nop
/* 7F640 0017F540 D5000010 */  b          .L0017F898
/* 7F644 0017F544 00000000 */   nop
.L0017F548:
/* 7F648 0017F548 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F64C 0017F54C 0897248C */  lw         $4, -0x68F8($at)
/* 7F650 0017F550 07008018 */  blez       $4, .L0017F570
/* 7F654 0017F554 00000000 */   nop
/* 7F658 0017F558 D301023C */  lui        $2, %hi(MainCamera)
/* 7F65C 0017F55C 40454524 */  addiu      $5, $2, %lo(MainCamera)
/* 7F660 0017F560 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7F664 0017F564 00000000 */   nop
/* 7F668 0017F568 CB000010 */  b          .L0017F898
/* 7F66C 0017F56C 00000000 */   nop
.L0017F570:
/* 7F670 0017F570 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F674 0017F574 9896228C */  lw         $2, -0x6968($at)
/* 7F678 0017F578 3B004010 */  beqz       $2, .L0017F668
/* 7F67C 0017F57C 00000000 */   nop
/* 7F680 0017F580 D201023C */  lui        $2, %hi(D_1D196A0)
/* 7F684 0017F584 A0965024 */  addiu      $16, $2, %lo(D_1D196A0)
/* 7F688 0017F588 0000038E */  lw         $3, 0x0($16)
/* 7F68C 0017F58C 01000224 */  addiu      $2, $0, 0x1
/* 7F690 0017F590 C1006214 */  bne        $3, $2, .L0017F898
/* 7F694 0017F594 00000000 */   nop
/* 7F698 0017F598 5000028E */  lw         $2, 0x50($16)
/* 7F69C 0017F59C 30004424 */  addiu      $4, $2, 0x30
/* 7F6A0 0017F5A0 2A00023C */  lui        $2, %hi(_2488)
/* 7F6A4 0017F5A4 80AC4524 */  addiu      $5, $2, %lo(_2488)
/* 7F6A8 0017F5A8 0815040C */  jal        strcmp
/* 7F6AC 0017F5AC 00000000 */   nop
/* 7F6B0 0017F5B0 08004014 */  bnez       $2, .L0017F5D4
/* 7F6B4 0017F5B4 00000000 */   nop
/* 7F6B8 0017F5B8 82000424 */  addiu      $4, $0, 0x82
/* 7F6BC 0017F5BC D301023C */  lui        $2, %hi(MainCamera)
/* 7F6C0 0017F5C0 40454524 */  addiu      $5, $2, %lo(MainCamera)
/* 7F6C4 0017F5C4 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7F6C8 0017F5C8 00000000 */   nop
/* 7F6CC 0017F5CC B2000010 */  b          .L0017F898
/* 7F6D0 0017F5D0 00000000 */   nop
.L0017F5D4:
/* 7F6D4 0017F5D4 40000424 */  addiu      $4, $0, 0x40
/* 7F6D8 0017F5D8 01000524 */  addiu      $5, $0, 0x1
/* 7F6DC 0017F5DC 64A6050C */  jal        EdPadDown__Fii
/* 7F6E0 0017F5E0 00000000 */   nop
/* 7F6E4 0017F5E4 AC004010 */  beqz       $2, .L0017F898
/* 7F6E8 0017F5E8 00000000 */   nop
/* 7F6EC 0017F5EC 48A8050C */  jal        EdCheckViewMode__Fv
/* 7F6F0 0017F5F0 00000000 */   nop
/* 7F6F4 0017F5F4 A8004014 */  bnez       $2, .L0017F898
/* 7F6F8 0017F5F8 00000000 */   nop
/* 7F6FC 0017F5FC 8490828F */  lw         $2, -0x6F7C($gp)
/* 7F700 0017F600 A5004014 */  bnez       $2, .L0017F898
/* 7F704 0017F604 00000000 */   nop
/* 7F708 0017F608 5000038E */  lw         $3, 0x50($16)
/* 7F70C 0017F60C 2400628C */  lw         $2, 0x24($3)
/* 7F710 0017F610 0C004018 */  blez       $2, .L0017F644
/* 7F714 0017F614 00000000 */   nop
/* 7F718 0017F618 D401023C */  lui        $2, %hi(EdEventInfo)
/* 7F71C 0017F61C D0D14424 */  addiu      $4, $2, %lo(EdEventInfo)
/* 7F720 0017F620 282E0072 */  paddub     $5, $16, $0
/* 7F724 0017F624 FCB5050C */  jal        EdInitGotoInterior__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
/* 7F728 0017F628 00000000 */   nop
/* 7F72C 0017F62C 28264070 */  paddub     $4, $2, $0
/* 7F730 0017F630 0091858F */  lw         $5, -0x6F00($gp)
/* 7F734 0017F634 7CDE050C */  jal        RunEvent__FiP7CCamera
/* 7F738 0017F638 00000000 */   nop
/* 7F73C 0017F63C 96000010 */  b          .L0017F898
/* 7F740 0017F640 00000000 */   nop
.L0017F644:
/* 7F744 0017F644 30006424 */  addiu      $4, $3, 0x30
/* 7F748 0017F648 0400058E */  lw         $5, 0x4($16)
/* 7F74C 0017F64C 1C00668C */  lw         $6, 0x1C($3)
/* 7F750 0017F650 283E0072 */  paddub     $7, $16, $0
/* 7F754 0017F654 FFFF0824 */  addiu      $8, $0, -0x1
/* 7F758 0017F658 78FB050C */  jal        GotoInterior__FPciiP14ED_EVENT_PARAMi
/* 7F75C 0017F65C 00000000 */   nop
/* 7F760 0017F660 8D000010 */  b          .L0017F898
/* 7F764 0017F664 00000000 */   nop
.L0017F668:
/* 7F768 0017F668 9090828F */  lw         $2, -0x6F70($gp)
/* 7F76C 0017F66C 3D004128 */  slti       $at, $2, 0x3D
/* 7F770 0017F670 2A002014 */  bnez       $at, .L0017F71C
/* 7F774 0017F674 00000000 */   nop
/* 7F778 0017F678 6487848F */  lw         $4, -0x789C($gp)
/* 7F77C 0017F67C 3000A527 */  addiu      $5, $sp, 0x30
/* 7F780 0017F680 A000998C */  lw         $25, 0xA0($4)
/* 7F784 0017F684 A000398F */  lw         $25, 0xA0($25)
/* 7F788 0017F688 09F82003 */  jalr       $25
/* 7F78C 0017F68C 00000000 */   nop
/* 7F790 0017F690 E890848F */  lw         $4, -0x6F18($gp)
/* 7F794 0017F694 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 7F798 0017F698 3400ADC7 */  lwc1       $f13, 0x34($sp)
/* 7F79C 0017F69C 3800AEC7 */  lwc1       $f14, 0x38($sp)
/* 7F7A0 0017F6A0 5886060C */  jal        GetParts__11CEditGroundFfff
/* 7F7A4 0017F6A4 00000000 */   nop
/* 7F7A8 0017F6A8 1C004010 */  beqz       $2, .L0017F71C
/* 7F7AC 0017F6AC 00000000 */   nop
/* 7F7B0 0017F6B0 F000508C */  lw         $16, 0xF0($2)
/* 7F7B4 0017F6B4 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7F7B8 0017F6B8 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7F7BC 0017F6BC 282E0072 */  paddub     $5, $16, $0
/* 7F7C0 0017F6C0 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* 7F7C4 0017F6C4 00000000 */   nop
/* 7F7C8 0017F6C8 14004010 */  beqz       $2, .L0017F71C
/* 7F7CC 0017F6CC 00000000 */   nop
/* 7F7D0 0017F6D0 1400448C */  lw         $4, 0x14($2)
/* 7F7D4 0017F6D4 02000324 */  addiu      $3, $0, 0x2
/* 7F7D8 0017F6D8 10008314 */  bne        $4, $3, .L0017F71C
/* 7F7DC 0017F6DC 00000000 */   nop
/* 7F7E0 0017F6E0 0400428C */  lw         $2, 0x4($2)
/* 7F7E4 0017F6E4 01004230 */  andi       $2, $2, 0x1
/* 7F7E8 0017F6E8 0C004014 */  bnez       $2, .L0017F71C
/* 7F7EC 0017F6EC 00000000 */   nop
/* 7F7F0 0017F6F0 D201023C */  lui        $2, %hi(EditPartsInfo)
/* 7F7F4 0017F6F4 F09B4424 */  addiu      $4, $2, %lo(EditPartsInfo)
/* 7F7F8 0017F6F8 282E0072 */  paddub     $5, $16, $0
/* 7F7FC 0017F6FC 0868060C */  jal        CheckComplete__14CEditPartsInfoFi
/* 7F800 0017F700 00000000 */   nop
/* 7F804 0017F704 05004010 */  beqz       $2, .L0017F71C
/* 7F808 0017F708 00000000 */   nop
/* 7F80C 0017F70C C8000426 */  addiu      $4, $16, 0xC8
/* 7F810 0017F710 282E0070 */  paddub     $5, $0, $0
/* 7F814 0017F714 DCDE050C */  jal        FadeOutToEvent__Fii
/* 7F818 0017F718 00000000 */   nop
.L0017F71C:
/* 7F81C 0017F71C CC01023C */  lui        $2, %hi(GamePad)
/* 7F820 0017F720 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 7F824 0017F724 40000524 */  addiu      $5, $0, 0x40
/* 7F828 0017F728 1CAE040C */  jal        Down__8CGamePadFi
/* 7F82C 0017F72C 00000000 */   nop
/* 7F830 0017F730 59004010 */  beqz       $2, .L0017F898
/* 7F834 0017F734 00000000 */   nop
/* 7F838 0017F738 6487848F */  lw         $4, -0x789C($gp)
/* 7F83C 0017F73C 3000A527 */  addiu      $5, $sp, 0x30
/* 7F840 0017F740 A000998C */  lw         $25, 0xA0($4)
/* 7F844 0017F744 A000398F */  lw         $25, 0xA0($25)
/* 7F848 0017F748 09F82003 */  jalr       $25
/* 7F84C 0017F74C 00000000 */   nop
/* 7F850 0017F750 3400B127 */  addiu      $17, $sp, 0x34
/* 7F854 0017F754 E890848F */  lw         $4, -0x6F18($gp)
/* 7F858 0017F758 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 7F85C 0017F75C 00002DC6 */  lwc1       $f13, 0x0($17)
/* 7F860 0017F760 3800AEC7 */  lwc1       $f14, 0x38($sp)
/* 7F864 0017F764 5886060C */  jal        GetParts__11CEditGroundFfff
/* 7F868 0017F768 00000000 */   nop
/* 7F86C 0017F76C 28864070 */  paddub     $16, $2, $0
/* 7F870 0017F770 43000012 */  beqz       $16, .L0017F880
/* 7F874 0017F774 00000000 */   nop
/* 7F878 0017F778 28260072 */  paddub     $4, $16, $0
/* 7F87C 0017F77C 5000A527 */  addiu      $5, $sp, 0x50
/* 7F880 0017F780 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* 7F884 0017F784 00000000 */   nop
/* 7F888 0017F788 28260072 */  paddub     $4, $16, $0
/* 7F88C 0017F78C 4000A527 */  addiu      $5, $sp, 0x40
/* 7F890 0017F790 A000198E */  lw         $25, 0xA0($16)
/* 7F894 0017F794 5800398F */  lw         $25, 0x58($25)
/* 7F898 0017F798 09F82003 */  jalr       $25
/* 7F89C 0017F79C 00000000 */   nop
/* 7F8A0 0017F7A0 6000A427 */  addiu      $4, $sp, 0x60
/* 7F8A4 0017F7A4 2A86040C */  jal        sceVu0UnitMatrix
/* 7F8A8 0017F7A8 00000000 */   nop
/* 7F8AC 0017F7AC 4400B027 */  addiu      $16, $sp, 0x44
/* 7F8B0 0017F7B0 6000A427 */  addiu      $4, $sp, 0x60
/* 7F8B4 0017F7B4 282E8070 */  paddub     $5, $4, $0
/* 7F8B8 0017F7B8 00000CC6 */  lwc1       $f12, 0x0($16)
/* 7F8BC 0017F7BC A686040C */  jal        sceVu0RotMatrixY
/* 7F8C0 0017F7C0 00000000 */   nop
/* 7F8C4 0017F7C4 9000A427 */  addiu      $4, $sp, 0x90
/* 7F8C8 0017F7C8 5000A527 */  addiu      $5, $sp, 0x50
/* 7F8CC 0017F7CC 0C86040C */  jal        sceVu0CopyVector
/* 7F8D0 0017F7D0 00000000 */   nop
/* 7F8D4 0017F7D4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7F8D8 0017F7D8 9C00A2AF */  sw         $2, 0x9C($sp)
/* 7F8DC 0017F7DC A000A427 */  addiu      $4, $sp, 0xA0
/* 7F8E0 0017F7E0 6000A527 */  addiu      $5, $sp, 0x60
/* 7F8E4 0017F7E4 B285040C */  jal        sceVu0InversMatrix
/* 7F8E8 0017F7E8 00000000 */   nop
/* 7F8EC 0017F7EC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7F8F0 0017F7F0 3C00A2AF */  sw         $2, 0x3C($sp)
/* 7F8F4 0017F7F4 3000A427 */  addiu      $4, $sp, 0x30
/* 7F8F8 0017F7F8 A000A527 */  addiu      $5, $sp, 0xA0
/* 7F8FC 0017F7FC 28368070 */  paddub     $6, $4, $0
/* 7F900 0017F800 6285040C */  jal        sceVu0ApplyMatrix
/* 7F904 0017F804 00000000 */   nop
/* 7F908 0017F808 6487848F */  lw         $4, -0x789C($gp)
/* 7F90C 0017F80C 3000A527 */  addiu      $5, $sp, 0x30
/* 7F910 0017F810 A000998C */  lw         $25, 0xA0($4)
/* 7F914 0017F814 5800398F */  lw         $25, 0x58($25)
/* 7F918 0017F818 09F82003 */  jalr       $25
/* 7F91C 0017F81C 00000000 */   nop
/* 7F920 0017F820 000021C6 */  lwc1       $f1, 0x0($17)
/* 7F924 0017F824 000000C6 */  lwc1       $f0, 0x0($16)
/* 7F928 0017F828 41080046 */  sub.s      $f1, $f1, $f0
/* 7F92C 0017F82C 000021E6 */  swc1       $f1, 0x0($17)
/* 7F930 0017F830 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 7F934 0017F834 36080046 */  c.le.s     $f1, $f0
/* 7F938 0017F838 00000000 */  nop
/* 7F93C 0017F83C 05000145 */  bc1t       .L0017F854
/* 7F940 0017F840 00000000 */   nop
/* 7F944 0017F844 000021C6 */  lwc1       $f1, 0x0($17)
/* 7F948 0017F848 B08280C7 */  lwc1       $f0, -0x7D50($gp)
/* 7F94C 0017F84C 01080046 */  sub.s      $f0, $f1, $f0
/* 7F950 0017F850 000020E6 */  swc1       $f0, 0x0($17)
.L0017F854:
/* 7F954 0017F854 000021C6 */  lwc1       $f1, 0x0($17)
/* 7F958 0017F858 348380C7 */  lwc1       $f0, -0x7CCC($gp)
/* 7F95C 0017F85C 34080046 */  c.lt.s     $f1, $f0
/* 7F960 0017F860 00000000 */  nop
/* 7F964 0017F864 0C000045 */  bc1f       .L0017F898
/* 7F968 0017F868 00000000 */   nop
/* 7F96C 0017F86C 388380C7 */  lwc1       $f0, -0x7CC8($gp)
/* 7F970 0017F870 00080046 */  add.s      $f0, $f1, $f0
/* 7F974 0017F874 000020E6 */  swc1       $f0, 0x0($17)
/* 7F978 0017F878 07000010 */  b          .L0017F898
/* 7F97C 0017F87C 00000000 */   nop
.L0017F880:
/* 7F980 0017F880 6487848F */  lw         $4, -0x789C($gp)
/* 7F984 0017F884 3000A527 */  addiu      $5, $sp, 0x30
/* 7F988 0017F888 A000998C */  lw         $25, 0xA0($4)
/* 7F98C 0017F88C 5800398F */  lw         $25, 0x58($25)
/* 7F990 0017F890 09F82003 */  jalr       $25
/* 7F994 0017F894 00000000 */   nop
.L0017F898:
/* 7F998 0017F898 9442023C */  lui        $2, (0x42940000 >> 16)
/* 7F99C 0017F89C 00708244 */  mtc1       $2, $f14
/* 7F9A0 0017F8A0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F9A4 0017F8A4 1C972CC4 */  lwc1       $f12, -0x68E4($at)
/* 7F9A8 0017F8A8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F9AC 0017F8AC 18972DC4 */  lwc1       $f13, -0x68E8($at)
/* 7F9B0 0017F8B0 A4DD050C */  jal        CheckMotionTime__Ffff
/* 7F9B4 0017F8B4 00000000 */   nop
/* 7F9B8 0017F8B8 0C004010 */  beqz       $2, .L0017F8EC
/* 7F9BC 0017F8BC 00000000 */   nop
/* 7F9C0 0017F8C0 6487848F */  lw         $4, -0x789C($gp)
/* 7F9C4 0017F8C4 E000A527 */  addiu      $5, $sp, 0xE0
/* 7F9C8 0017F8C8 A000998C */  lw         $25, 0xA0($4)
/* 7F9CC 0017F8CC A000398F */  lw         $25, 0xA0($25)
/* 7F9D0 0017F8D0 09F82003 */  jalr       $25
/* 7F9D4 0017F8D4 00000000 */   nop
/* 7F9D8 0017F8D8 D301023C */  lui        $2, %hi(RunEffect)
/* 7F9DC 0017F8DC 60444424 */  addiu      $4, $2, %lo(RunEffect)
/* 7F9E0 0017F8E0 E000A527 */  addiu      $5, $sp, 0xE0
/* 7F9E4 0017F8E4 3C8E050C */  jal        Set__10CRunEffectFPf
/* 7F9E8 0017F8E8 00000000 */   nop
.L0017F8EC:
/* 7F9EC 0017F8EC A842023C */  lui        $2, (0x42A80000 >> 16)
/* 7F9F0 0017F8F0 00708244 */  mtc1       $2, $f14
/* 7F9F4 0017F8F4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7F9F8 0017F8F8 1C972CC4 */  lwc1       $f12, -0x68E4($at)
/* 7F9FC 0017F8FC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7FA00 0017F900 18972DC4 */  lwc1       $f13, -0x68E8($at)
/* 7FA04 0017F904 A4DD050C */  jal        CheckMotionTime__Ffff
/* 7FA08 0017F908 00000000 */   nop
/* 7FA0C 0017F90C 0C004010 */  beqz       $2, .L0017F940
/* 7FA10 0017F910 00000000 */   nop
/* 7FA14 0017F914 6487848F */  lw         $4, -0x789C($gp)
/* 7FA18 0017F918 F000A527 */  addiu      $5, $sp, 0xF0
/* 7FA1C 0017F91C A000998C */  lw         $25, 0xA0($4)
/* 7FA20 0017F920 A000398F */  lw         $25, 0xA0($25)
/* 7FA24 0017F924 09F82003 */  jalr       $25
/* 7FA28 0017F928 00000000 */   nop
/* 7FA2C 0017F92C D301023C */  lui        $2, %hi(RunEffect)
/* 7FA30 0017F930 60444424 */  addiu      $4, $2, %lo(RunEffect)
/* 7FA34 0017F934 F000A527 */  addiu      $5, $sp, 0xF0
/* 7FA38 0017F938 3C8E050C */  jal        Set__10CRunEffectFPf
/* 7FA3C 0017F93C 00000000 */   nop
.L0017F940:
/* 7FA40 0017F940 6087848F */  lw         $4, -0x78A0($gp)
/* 7FA44 0017F944 01000324 */  addiu      $3, $0, 0x1
/* 7FA48 0017F948 0F008314 */  bne        $4, $3, .L0017F988
/* 7FA4C 0017F94C 00000000 */   nop
/* 7FA50 0017F950 288D828F */  lw         $2, -0x72D8($gp)
/* 7FA54 0017F954 0A004128 */  slti       $at, $2, 0xA
/* 7FA58 0017F958 07002010 */  beqz       $at, .L0017F978
/* 7FA5C 0017F95C 00000000 */   nop
/* 7FA60 0017F960 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7FA64 0017F964 D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 7FA68 0017F968 BC1B060C */  jal        EdMoveVillager__FP13VILLAGER_INFO
/* 7FA6C 0017F96C 00000000 */   nop
/* 7FA70 0017F970 05000010 */  b          .L0017F988
/* 7FA74 0017F974 00000000 */   nop
.L0017F978:
/* 7FA78 0017F978 D301023C */  lui        $2, %hi(EdVillagerInfo)
/* 7FA7C 0017F97C D0294424 */  addiu      $4, $2, %lo(EdVillagerInfo)
/* 7FA80 0017F980 2C1D060C */  jal        EdMoveVillagerSubMap__FP13VILLAGER_INFO
/* 7FA84 0017F984 00000000 */   nop
.L0017F988:
/* 7FA88 0017F988 2000BF7B */  lq         $31, 0x20($sp)
/* 7FA8C 0017F98C 1000B17B */  lq         $17, 0x10($sp)
/* 7FA90 0017F990 0000B07B */  lq         $16, 0x0($sp)
/* 7FA94 0017F994 0001BD27 */  addiu      $sp, $sp, 0x100
/* 7FA98 0017F998 0800E003 */  jr         $31
/* 7FA9C 0017F99C 00000000 */   nop
