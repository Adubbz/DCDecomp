.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuAttachKey__Fv
/* 100640 00200540 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 100644 00200544 3000BF7F */  sq         $31, 0x30($sp)
/* 100648 00200548 2000B27F */  sq         $18, 0x20($sp)
/* 10064C 0020054C 1000B17F */  sq         $17, 0x10($sp)
/* 100650 00200550 0000B07F */  sq         $16, 0x0($sp)
/* 100654 00200554 D8BB080C */  jal        PersonalBoardKey__Fv
/* 100658 00200558 00000000 */   nop
/* 10065C 0020055C 17004010 */  beqz       $2, .L002005BC
/* 100660 00200560 00000000 */   nop
/* 100664 00200564 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100668 00200568 76EA2380 */  lb         $3, -0x158A($at)
/* 10066C 0020056C 0E006010 */  beqz       $3, .L002005A8
/* 100670 00200570 00000000 */   nop
/* 100674 00200574 09000224 */  addiu      $2, $0, 0x9
/* 100678 00200578 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10067C 0020057C 72EA22A4 */  sh         $2, -0x158E($at)
/* 100680 00200580 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* 100684 00200584 00000000 */   nop
/* 100688 00200588 00004484 */  lh         $4, 0x0($2)
/* 10068C 0020058C C4C7080C */  jal        GetWeaponHoleNum__Fi
/* 100690 00200590 00000000 */   nop
/* 100694 00200594 FFFF4324 */  addiu      $3, $2, -0x1
/* 100698 00200598 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10069C 0020059C 90EA23AC */  sw         $3, -0x1570($at)
/* 1006A0 002005A0 7C000010 */  b          .L00200794
/* 1006A4 002005A4 00000000 */   nop
.L002005A8:
/* 1006A8 002005A8 08000324 */  addiu      $3, $0, 0x8
/* 1006AC 002005AC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1006B0 002005B0 72EA23A4 */  sh         $3, -0x158E($at)
/* 1006B4 002005B4 77000010 */  b          .L00200794
/* 1006B8 002005B8 00000000 */   nop
.L002005BC:
/* 1006BC 002005BC CC01023C */  lui        $2, %hi(GamePad)
/* 1006C0 002005C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1006C4 002005C4 40000524 */  addiu      $5, $0, 0x40
/* 1006C8 002005C8 1CAE040C */  jal        Down__8CGamePadFi
/* 1006CC 002005CC 00000000 */   nop
/* 1006D0 002005D0 53004010 */  beqz       $2, .L00200720
/* 1006D4 002005D4 00000000 */   nop
/* 1006D8 002005D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1006DC 002005DC 8CEA248C */  lw         $4, -0x1574($at)
/* 1006E0 002005E0 01000324 */  addiu      $3, $0, 0x1
/* 1006E4 002005E4 12008310 */  beq        $4, $3, .L00200630
/* 1006E8 002005E8 00000000 */   nop
/* 1006EC 002005EC 02000324 */  addiu      $3, $0, 0x2
/* 1006F0 002005F0 03008310 */  beq        $4, $3, .L00200600
/* 1006F4 002005F4 00000000 */   nop
/* 1006F8 002005F8 66000010 */  b          .L00200794
/* 1006FC 002005FC 00000000 */   nop
.L00200600:
/* 100700 00200600 7495848F */  lw         $4, -0x6A8C($gp)
/* 100704 00200604 10B9080C */  jal        InitHaveData__FP9IHAVEITEM
/* 100708 00200608 00000000 */   nop
/* 10070C 0020060C DA01023C */  lui        $2, %hi(D_1D9EBC0)
/* 100710 00200610 C0EB4424 */  addiu      $4, $2, %lo(D_1D9EBC0)
/* 100714 00200614 2CB9080C */  jal        InitHaveAttach__FP11ATTACH_LIST
/* 100718 00200618 00000000 */   nop
/* 10071C 0020061C 02000424 */  addiu      $4, $0, 0x2
/* 100720 00200620 BCB3080C */  jal        ComMenuSePlay__Fi
/* 100724 00200624 00000000 */   nop
/* 100728 00200628 5A000010 */  b          .L00200794
/* 10072C 0020062C 00000000 */   nop
.L00200630:
/* 100730 00200630 D494828F */  lw         $2, -0x6B2C($gp)
/* 100734 00200634 04054324 */  addiu      $3, $2, 0x504
/* 100738 00200638 F87F6324 */  addiu      $3, $3, 0x7FF8
/* 10073C 0020063C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100740 00200640 90EA228C */  lw         $2, -0x1570($at)
/* 100744 00200644 40110200 */  sll        $2, $2, 5
/* 100748 00200648 21806200 */  addu       $16, $3, $2
/* 10074C 0020064C 00000286 */  lh         $2, 0x0($16)
/* 100750 00200650 51004128 */  slti       $at, $2, 0x51
/* 100754 00200654 06002010 */  beqz       $at, .L00200670
/* 100758 00200658 00000000 */   nop
/* 10075C 0020065C 7495828F */  lw         $2, -0x6A8C($gp)
/* 100760 00200660 10004284 */  lh         $2, 0x10($2)
/* 100764 00200664 51004228 */  slti       $2, $2, 0x51
/* 100768 00200668 28004014 */  bnez       $2, .L0020070C
/* 10076C 0020066C 00000000 */   nop
.L00200670:
/* 100770 00200670 01000424 */  addiu      $4, $0, 0x1
/* 100774 00200674 BCB3080C */  jal        ComMenuSePlay__Fi
/* 100778 00200678 00000000 */   nop
/* 10077C 0020067C 7495828F */  lw         $2, -0x6A8C($gp)
/* 100780 00200680 10005184 */  lh         $17, 0x10($2)
/* 100784 00200684 00001286 */  lh         $18, 0x0($16)
/* 100788 00200688 28260072 */  paddub     $4, $16, $0
/* 10078C 0020068C DA01023C */  lui        $2, %hi(D_1D9EBC0)
/* 100790 00200690 C0EB4524 */  addiu      $5, $2, %lo(D_1D9EBC0)
/* 100794 00200694 74B9080C */  jal        MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
/* 100798 00200698 00000000 */   nop
/* 10079C 0020069C 7495838F */  lw         $3, -0x6A8C($gp)
/* 1007A0 002006A0 100072A4 */  sh         $18, 0x10($3)
/* 1007A4 002006A4 000011A6 */  sh         $17, 0x0($16)
/* 1007A8 002006A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1007AC 002006AC 90EA248C */  lw         $4, -0x1570($at)
/* 1007B0 002006B0 7495838F */  lw         $3, -0x6A8C($gp)
/* 1007B4 002006B4 0C0064AC */  sw         $4, 0xC($3)
/* 1007B8 002006B8 0A000424 */  addiu      $4, $0, 0xA
/* 1007BC 002006BC 7495838F */  lw         $3, -0x6A8C($gp)
/* 1007C0 002006C0 040064AC */  sw         $4, 0x4($3)
/* 1007C4 002006C4 7495848F */  lw         $4, -0x6A8C($gp)
/* 1007C8 002006C8 10008384 */  lh         $3, 0x10($4)
/* 1007CC 002006CC 51006328 */  slti       $3, $3, 0x51
/* 1007D0 002006D0 06006014 */  bnez       $3, .L002006EC
/* 1007D4 002006D4 00000000 */   nop
/* 1007D8 002006D8 01000324 */  addiu      $3, $0, 0x1
/* 1007DC 002006DC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1007E0 002006E0 76EA23A0 */  sb         $3, -0x158A($at)
/* 1007E4 002006E4 2B000010 */  b          .L00200794
/* 1007E8 002006E8 00000000 */   nop
.L002006EC:
/* 1007EC 002006EC 10B9080C */  jal        InitHaveData__FP9IHAVEITEM
/* 1007F0 002006F0 00000000 */   nop
/* 1007F4 002006F4 DA01023C */  lui        $2, %hi(D_1D9EBC0)
/* 1007F8 002006F8 C0EB4424 */  addiu      $4, $2, %lo(D_1D9EBC0)
/* 1007FC 002006FC 2CB9080C */  jal        InitHaveAttach__FP11ATTACH_LIST
/* 100800 00200700 00000000 */   nop
/* 100804 00200704 23000010 */  b          .L00200794
/* 100808 00200708 00000000 */   nop
.L0020070C:
/* 10080C 0020070C 02000424 */  addiu      $4, $0, 0x2
/* 100810 00200710 BCB3080C */  jal        ComMenuSePlay__Fi
/* 100814 00200714 00000000 */   nop
/* 100818 00200718 1E000010 */  b          .L00200794
/* 10081C 0020071C 00000000 */   nop
.L00200720:
/* 100820 00200720 CC01023C */  lui        $2, %hi(GamePad)
/* 100824 00200724 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100828 00200728 20000524 */  addiu      $5, $0, 0x20
/* 10082C 0020072C 1CAE040C */  jal        Down__8CGamePadFi
/* 100830 00200730 00000000 */   nop
/* 100834 00200734 08004010 */  beqz       $2, .L00200758
/* 100838 00200738 00000000 */   nop
/* 10083C 0020073C 02000424 */  addiu      $4, $0, 0x2
/* 100840 00200740 BCB3080C */  jal        ComMenuSePlay__Fi
/* 100844 00200744 00000000 */   nop
/* 100848 00200748 ACFD070C */  jal        WepAttachHaveCancel__Fv
/* 10084C 0020074C 00000000 */   nop
/* 100850 00200750 10000010 */  b          .L00200794
/* 100854 00200754 00000000 */   nop
.L00200758:
/* 100858 00200758 CC01023C */  lui        $2, %hi(GamePad)
/* 10085C 0020075C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100860 00200760 80000524 */  addiu      $5, $0, 0x80
/* 100864 00200764 1CAE040C */  jal        Down__8CGamePadFi
/* 100868 00200768 00000000 */   nop
/* 10086C 0020076C 09004010 */  beqz       $2, .L00200794
/* 100870 00200770 00000000 */   nop
/* 100874 00200774 D494828F */  lw         $2, -0x6B2C($gp)
/* 100878 00200778 04054424 */  addiu      $4, $2, 0x504
/* 10087C 0020077C F87F8424 */  addiu      $4, $4, 0x7FF8
/* 100880 00200780 64C7080C */  jal        SeitonAttachBoard__FP11ATTACH_LIST
/* 100884 00200784 00000000 */   nop
/* 100888 00200788 01000424 */  addiu      $4, $0, 0x1
/* 10088C 0020078C BCB3080C */  jal        ComMenuSePlay__Fi
/* 100890 00200790 00000000 */   nop
.L00200794:
/* 100894 00200794 3000BF7B */  lq         $31, 0x30($sp)
/* 100898 00200798 2000B27B */  lq         $18, 0x20($sp)
/* 10089C 0020079C 1000B17B */  lq         $17, 0x10($sp)
/* 1008A0 002007A0 0000B07B */  lq         $16, 0x0($sp)
/* 1008A4 002007A4 4000BD27 */  addiu      $sp, $sp, 0x40
/* 1008A8 002007A8 0800E003 */  jr         $31
/* 1008AC 002007AC 00000000 */   nop