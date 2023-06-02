.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBLoop__Fv
/* 68790 00168690 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 68794 00168694 5000BF7F */  sq         $31, 0x50($sp)
/* 68798 00168698 4000B37F */  sq         $19, 0x40($sp)
/* 6879C 0016869C 3000B27F */  sq         $18, 0x30($sp)
/* 687A0 001686A0 2000B17F */  sq         $17, 0x20($sp)
/* 687A4 001686A4 1000B07F */  sq         $16, 0x10($sp)
/* 687A8 001686A8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 687AC 001686AC 9C8E828F */  lw         $2, -0x7164($gp)
/* 687B0 001686B0 04004014 */  bnez       $2, .L001686C4
/* 687B4 001686B4 00000000 */   nop
/* 687B8 001686B8 01000224 */  addiu      $2, $0, 0x1
/* 687BC 001686BC 24010010 */  b          .L00168B50
/* 687C0 001686C0 00000000 */   nop
.L001686C4:
/* 687C4 001686C4 AC8E838F */  lw         $3, -0x7154($gp)
/* 687C8 001686C8 0E006018 */  blez       $3, .L00168704
/* 687CC 001686CC 00000000 */   nop
/* 687D0 001686D0 01000224 */  addiu      $2, $0, 0x1
/* 687D4 001686D4 06006214 */  bne        $3, $2, .L001686F0
/* 687D8 001686D8 00000000 */   nop
/* 687DC 001686DC 58A1050C */  jal        EBExit__Fv
/* 687E0 001686E0 00000000 */   nop
/* 687E4 001686E4 B48E828F */  lw         $2, -0x714C($gp)
/* 687E8 001686E8 19010010 */  b          .L00168B50
/* 687EC 001686EC 00000000 */   nop
.L001686F0:
/* 687F0 001686F0 FFFF6224 */  addiu      $2, $3, -0x1
/* 687F4 001686F4 AC8E82AF */  sw         $2, -0x7154($gp)
/* 687F8 001686F8 28160070 */  paddub     $2, $0, $0
/* 687FC 001686FC 14010010 */  b          .L00168B50
/* 68800 00168700 00000000 */   nop
.L00168704:
/* 68804 00168704 A48E828F */  lw         $2, -0x715C($gp)
/* 68808 00168708 0B004014 */  bnez       $2, .L00168738
/* 6880C 0016870C 00000000 */   nop
/* 68810 00168710 C88E828F */  lw         $2, -0x7138($gp)
/* 68814 00168714 08004010 */  beqz       $2, .L00168738
/* 68818 00168718 00000000 */   nop
/* 6881C 0016871C 30FB040C */  jal        StartReadBG__Fv
/* 68820 00168720 00000000 */   nop
/* 68824 00168724 2F000424 */  addiu      $4, $0, 0x2F
/* 68828 00168728 948B858F */  lw         $5, -0x746C($gp)
/* 6882C 0016872C 6C00A627 */  addiu      $6, $sp, 0x6C
/* 68830 00168730 D86D050C */  jal        SndSPSeLoadBG__FiPUiPi
/* 68834 00168734 00000000 */   nop
.L00168738:
/* 68838 00168738 38FB040C */  jal        ReadBG__Fv
/* 6883C 0016873C 00000000 */   nop
/* 68840 00168740 1C8794C7 */  lwc1       $f20, -0x78E4($gp)
/* 68844 00168744 288E0070 */  paddub     $17, $0, $0
/* 68848 00168748 28960070 */  paddub     $18, $0, $0
/* 6884C 0016874C 28860070 */  paddub     $16, $0, $0
/* 68850 00168750 5A000010 */  b          .L001688BC
/* 68854 00168754 00000000 */   nop
.L00168758:
/* 68858 00168758 C0101000 */  sll        $2, $16, 3
/* 6885C 0016875C 23105000 */  subu       $2, $2, $16
/* 68860 00168760 80180200 */  sll        $3, $2, 2
/* 68864 00168764 D201023C */  lui        $2, %hi(eb_key)
/* 68868 00168768 708F4224 */  addiu      $2, $2, %lo(eb_key)
/* 6886C 0016876C 21204300 */  addu       $4, $2, $3
/* 68870 00168770 A48E838F */  lw         $3, -0x715C($gp)
/* 68874 00168774 0000828C */  lw         $2, 0x0($4)
/* 68878 00168778 23106200 */  subu       $2, $3, $2
/* 6887C 0016877C 00008244 */  mtc1       $2, $f0
/* 68880 00168780 00000000 */  nop
/* 68884 00168784 A0008046 */  cvt.s.w    $f2, $f0
/* 68888 00168788 82101446 */  mul.s      $f2, $f2, $f20
/* 6888C 0016878C 281E0070 */  paddub     $3, $0, $0
/* 68890 00168790 0800858C */  lw         $5, 0x8($4)
/* 68894 00168794 0400A018 */  blez       $5, .L001687A8
/* 68898 00168798 00000000 */   nop
/* 6889C 0016879C 06000224 */  addiu      $2, $0, 0x6
/* 688A0 001687A0 23104500 */  subu       $2, $2, $5
/* 688A4 001687A4 80190200 */  sll        $3, $2, 6
.L001687A8:
/* 688A8 001687A8 180080AC */  sw         $0, 0x18($4)
/* 688AC 001687AC 00008044 */  mtc1       $0, $f0
/* 688B0 001687B0 00000000 */  nop
/* 688B4 001687B4 36100046 */  c.le.s     $f2, $f0
/* 688B8 001687B8 00000000 */  nop
/* 688BC 001687BC 17000145 */  bc1t       .L0016881C
/* 688C0 001687C0 00000000 */   nop
/* 688C4 001687C4 4042023C */  lui        $2, (0x42400000 >> 16)
/* 688C8 001687C8 00008244 */  mtc1       $2, $f0
/* 688CC 001687CC 00000000 */  nop
/* 688D0 001687D0 34100046 */  c.lt.s     $f2, $f0
/* 688D4 001687D4 00000000 */  nop
/* 688D8 001687D8 04000045 */  bc1f       .L001687EC
/* 688DC 001687DC 00000000 */   nop
/* 688E0 001687E0 288E8070 */  paddub     $17, $4, $0
/* 688E4 001687E4 03000010 */  b          .L001687F4
/* 688E8 001687E8 00000000 */   nop
.L001687EC:
/* 688EC 001687EC 01000224 */  addiu      $2, $0, 0x1
/* 688F0 001687F0 140082AC */  sw         $2, 0x14($4)
.L001687F4:
/* 688F4 001687F4 C041023C */  lui        $2, (0x41C00000 >> 16)
/* 688F8 001687F8 00008244 */  mtc1       $2, $f0
/* 688FC 001687FC 00000000 */  nop
/* 68900 00168800 34100046 */  c.lt.s     $f2, $f0
/* 68904 00168804 00000000 */  nop
/* 68908 00168808 1A000045 */  bc1f       .L00168874
/* 6890C 0016880C 00000000 */   nop
/* 68910 00168810 01001224 */  addiu      $18, $0, 0x1
/* 68914 00168814 17000010 */  b          .L00168874
/* 68918 00168818 00000000 */   nop
.L0016881C:
/* 6891C 0016881C 80C1023C */  lui        $2, (0xC1800000 >> 16)
/* 68920 00168820 00008244 */  mtc1       $2, $f0
/* 68924 00168824 00000000 */  nop
/* 68928 00168828 36100046 */  c.le.s     $f2, $f0
/* 6892C 0016882C 00000000 */  nop
/* 68930 00168830 02000145 */  bc1t       .L0016883C
/* 68934 00168834 00000000 */   nop
/* 68938 00168838 288E8070 */  paddub     $17, $4, $0
.L0016883C:
/* 6893C 0016883C 0D006018 */  blez       $3, .L00168874
/* 68940 00168840 00000000 */   nop
/* 68944 00168844 8041023C */  lui        $2, (0x41800000 >> 16)
/* 68948 00168848 00088244 */  mtc1       $2, $f1
/* 6894C 0016884C 00008344 */  mtc1       $3, $f0
/* 68950 00168850 00000000 */  nop
/* 68954 00168854 20008046 */  cvt.s.w    $f0, $f0
/* 68958 00168858 01080046 */  sub.s      $f0, $f1, $f0
/* 6895C 0016885C 36100046 */  c.le.s     $f2, $f0
/* 68960 00168860 00000000 */  nop
/* 68964 00168864 03000045 */  bc1f       .L00168874
/* 68968 00168868 00000000 */   nop
/* 6896C 0016886C 01000224 */  addiu      $2, $0, 0x1
/* 68970 00168870 180082AC */  sw         $2, 0x18($4)
.L00168874:
/* 68974 00168874 D48E828F */  lw         $2, -0x712C($gp)
/* 68978 00168878 0F004010 */  beqz       $2, .L001688B8
/* 6897C 0016887C 00000000 */   nop
/* 68980 00168880 A48E838F */  lw         $3, -0x715C($gp)
/* 68984 00168884 0000828C */  lw         $2, 0x0($4)
/* 68988 00168888 0B006214 */  bne        $3, $2, .L001688B8
/* 6898C 0016888C 00000000 */   nop
/* 68990 00168890 09000424 */  addiu      $4, $0, 0x9
/* 68994 00168894 FFFF0524 */  addiu      $5, $0, -0x1
/* 68998 00168898 28360070 */  paddub     $6, $0, $0
/* 6899C 0016889C AC69050C */  jal        SndSePlay__Fiii
/* 689A0 001688A0 00000000 */   nop
/* 689A4 001688A4 01000424 */  addiu      $4, $0, 0x1
/* 689A8 001688A8 FFFF0524 */  addiu      $5, $0, -0x1
/* 689AC 001688AC 28360070 */  paddub     $6, $0, $0
/* 689B0 001688B0 AC69050C */  jal        SndSePlay__Fiii
/* 689B4 001688B4 00000000 */   nop
.L001688B8:
/* 689B8 001688B8 01001026 */  addiu      $16, $16, 0x1
.L001688BC:
/* 689BC 001688BC E08E828F */  lw         $2, -0x7120($gp)
/* 689C0 001688C0 2A100202 */  slt        $2, $16, $2
/* 689C4 001688C4 A4FF4014 */  bnez       $2, .L00168758
/* 689C8 001688C8 00000000 */   nop
/* 689CC 001688CC 289E0070 */  paddub     $19, $0, $0
/* 689D0 001688D0 3B002012 */  beqz       $17, .L001689C0
/* 689D4 001688D4 00000000 */   nop
/* 689D8 001688D8 CC01023C */  lui        $2, %hi(GamePad)
/* 689DC 001688DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 689E0 001688E0 8CAD040C */  jal        GetPadDown__8CGamePadFv
/* 689E4 001688E4 00000000 */   nop
/* 689E8 001688E8 0C00238E */  lw         $3, 0xC($17)
/* 689EC 001688EC 25106200 */  or         $2, $3, $2
/* 689F0 001688F0 0C0022AE */  sw         $2, 0xC($17)
/* 689F4 001688F4 0C00238E */  lw         $3, 0xC($17)
/* 689F8 001688F8 0400228E */  lw         $2, 0x4($17)
/* 689FC 001688FC 26006214 */  bne        $3, $2, .L00168998
/* 68A00 00168900 00000000 */   nop
/* 68A04 00168904 1000228E */  lw         $2, 0x10($17)
/* 68A08 00168908 21004014 */  bnez       $2, .L00168990
/* 68A0C 0016890C 00000000 */   nop
/* 68A10 00168910 08004012 */  beqz       $18, .L00168934
/* 68A14 00168914 00000000 */   nop
/* 68A18 00168918 0A000424 */  addiu      $4, $0, 0xA
/* 68A1C 0016891C FFFF0524 */  addiu      $5, $0, -0x1
/* 68A20 00168920 28360070 */  paddub     $6, $0, $0
/* 68A24 00168924 AC69050C */  jal        SndSePlay__Fiii
/* 68A28 00168928 00000000 */   nop
/* 68A2C 0016892C 06000010 */  b          .L00168948
/* 68A30 00168930 00000000 */   nop
.L00168934:
/* 68A34 00168934 09000424 */  addiu      $4, $0, 0x9
/* 68A38 00168938 FFFF0524 */  addiu      $5, $0, -0x1
/* 68A3C 0016893C 28360070 */  paddub     $6, $0, $0
/* 68A40 00168940 AC69050C */  jal        SndSePlay__Fiii
/* 68A44 00168944 00000000 */   nop
.L00168948:
/* 68A48 00168948 D201023C */  lui        $2, %hi(eb_key)
/* 68A4C 0016894C 708F4224 */  addiu      $2, $2, %lo(eb_key)
/* 68A50 00168950 23182202 */  subu       $3, $17, $2
/* 68A54 00168954 1C000224 */  addiu      $2, $0, 0x1C
/* 68A58 00168958 1A006200 */  div        $0, $3, $2
/* 68A5C 0016895C 02004014 */  bnez       $2, .L00168968
/* 68A60 00168960 00000000 */   nop
/* 68A64 00168964 CD010000 */  break      0, 7
.L00168968:
/* 68A68 00168968 12280000 */  mflo       $5
/* 68A6C 0016896C 28264072 */  paddub     $4, $18, $0
/* 68A70 00168970 10A5050C */  jal        set_draw_ok__Fii
/* 68A74 00168974 00000000 */   nop
/* 68A78 00168978 1487828F */  lw         $2, -0x78EC($gp)
/* 68A7C 0016897C 24105200 */  and        $2, $2, $18
/* 68A80 00168980 148782AF */  sw         $2, -0x78EC($gp)
/* 68A84 00168984 B88E828F */  lw         $2, -0x7148($gp)
/* 68A88 00168988 01004224 */  addiu      $2, $2, 0x1
/* 68A8C 0016898C B88E82AF */  sw         $2, -0x7148($gp)
.L00168990:
/* 68A90 00168990 01000224 */  addiu      $2, $0, 0x1
/* 68A94 00168994 100022AE */  sw         $2, 0x10($17)
.L00168998:
/* 68A98 00168998 0400238E */  lw         $3, 0x4($17)
/* 68A9C 0016899C 0C00228E */  lw         $2, 0xC($17)
/* 68AA0 001689A0 25106200 */  or         $2, $3, $2
/* 68AA4 001689A4 26106200 */  xor        $2, $3, $2
/* 68AA8 001689A8 2B100200 */  sltu       $2, $0, $2
/* 68AAC 001689AC 0B004010 */  beqz       $2, .L001689DC
/* 68AB0 001689B0 00000000 */   nop
/* 68AB4 001689B4 01001324 */  addiu      $19, $0, 0x1
/* 68AB8 001689B8 08000010 */  b          .L001689DC
/* 68ABC 001689BC 00000000 */   nop
.L001689C0:
/* 68AC0 001689C0 CC01023C */  lui        $2, %hi(GamePad)
/* 68AC4 001689C4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 68AC8 001689C8 8CAD040C */  jal        GetPadDown__8CGamePadFv
/* 68ACC 001689CC 00000000 */   nop
/* 68AD0 001689D0 02004010 */  beqz       $2, .L001689DC
/* 68AD4 001689D4 00000000 */   nop
/* 68AD8 001689D8 01001324 */  addiu      $19, $0, 0x1
.L001689DC:
/* 68ADC 001689DC 28860070 */  paddub     $16, $0, $0
/* 68AE0 001689E0 10000010 */  b          .L00168A24
/* 68AE4 001689E4 00000000 */   nop
.L001689E8:
/* 68AE8 001689E8 C0101000 */  sll        $2, $16, 3
/* 68AEC 001689EC 23105000 */  subu       $2, $2, $16
/* 68AF0 001689F0 80180200 */  sll        $3, $2, 2
/* 68AF4 001689F4 D201023C */  lui        $2, %hi(eb_key)
/* 68AF8 001689F8 708F4224 */  addiu      $2, $2, %lo(eb_key)
/* 68AFC 001689FC 21204300 */  addu       $4, $2, $3
/* 68B00 00168A00 1400828C */  lw         $2, 0x14($4)
/* 68B04 00168A04 0B004010 */  beqz       $2, .L00168A34
/* 68B08 00168A08 00000000 */   nop
/* 68B0C 00168A0C 0400838C */  lw         $3, 0x4($4)
/* 68B10 00168A10 0C00828C */  lw         $2, 0xC($4)
/* 68B14 00168A14 02006210 */  beq        $3, $2, .L00168A20
/* 68B18 00168A18 00000000 */   nop
/* 68B1C 00168A1C 01001324 */  addiu      $19, $0, 0x1
.L00168A20:
/* 68B20 00168A20 01001026 */  addiu      $16, $16, 0x1
.L00168A24:
/* 68B24 00168A24 E08E858F */  lw         $5, -0x7120($gp)
/* 68B28 00168A28 2A100502 */  slt        $2, $16, $5
/* 68B2C 00168A2C EEFF4014 */  bnez       $2, .L001689E8
/* 68B30 00168A30 00000000 */   nop
.L00168A34:
/* 68B34 00168A34 19006012 */  beqz       $19, .L00168A9C
/* 68B38 00168A38 00000000 */   nop
/* 68B3C 00168A3C D48E828F */  lw         $2, -0x712C($gp)
/* 68B40 00168A40 16004014 */  bnez       $2, .L00168A9C
/* 68B44 00168A44 00000000 */   nop
/* 68B48 00168A48 B88E828F */  lw         $2, -0x7148($gp)
/* 68B4C 00168A4C 2A084500 */  slt        $at, $2, $5
/* 68B50 00168A50 12002010 */  beqz       $at, .L00168A9C
/* 68B54 00168A54 00000000 */   nop
/* 68B58 00168A58 448F828F */  lw         $2, -0x70BC($gp)
/* 68B5C 00168A5C 0F004014 */  bnez       $2, .L00168A9C
/* 68B60 00168A60 00000000 */   nop
/* 68B64 00168A64 28000424 */  addiu      $4, $0, 0x28
/* 68B68 00168A68 282E0070 */  paddub     $5, $0, $0
/* 68B6C 00168A6C C467050C */  jal        SndBgmFadeOut__Fii
/* 68B70 00168A70 00000000 */   nop
/* 68B74 00168A74 50000224 */  addiu      $2, $0, 0x50
/* 68B78 00168A78 AC8E82AF */  sw         $2, -0x7154($gp)
/* 68B7C 00168A7C FFFF0224 */  addiu      $2, $0, -0x1
/* 68B80 00168A80 B48E82AF */  sw         $2, -0x714C($gp)
/* 68B84 00168A84 A48E828F */  lw         $2, -0x715C($gp)
/* 68B88 00168A88 01004224 */  addiu      $2, $2, 0x1
/* 68B8C 00168A8C A48E82AF */  sw         $2, -0x715C($gp)
/* 68B90 00168A90 28160070 */  paddub     $2, $0, $0
/* 68B94 00168A94 2E000010 */  b          .L00168B50
/* 68B98 00168A98 00000000 */   nop
.L00168A9C:
/* 68B9C 00168A9C A48E838F */  lw         $3, -0x715C($gp)
/* 68BA0 00168AA0 B08E828F */  lw         $2, -0x7150($gp)
/* 68BA4 00168AA4 9CFF4224 */  addiu      $2, $2, -0x64
/* 68BA8 00168AA8 08006214 */  bne        $3, $2, .L00168ACC
/* 68BAC 00168AAC 00000000 */   nop
/* 68BB0 00168AB0 C48E828F */  lw         $2, -0x713C($gp)
/* 68BB4 00168AB4 05004010 */  beqz       $2, .L00168ACC
/* 68BB8 00168AB8 00000000 */   nop
/* 68BBC 00168ABC 64000424 */  addiu      $4, $0, 0x64
/* 68BC0 00168AC0 282E0070 */  paddub     $5, $0, $0
/* 68BC4 00168AC4 C467050C */  jal        SndBgmFadeOut__Fii
/* 68BC8 00168AC8 00000000 */   nop
.L00168ACC:
/* 68BCC 00168ACC A48E838F */  lw         $3, -0x715C($gp)
/* 68BD0 00168AD0 B08E828F */  lw         $2, -0x7150($gp)
/* 68BD4 00168AD4 2A106200 */  slt        $2, $3, $2
/* 68BD8 00168AD8 15004014 */  bnez       $2, .L00168B30
/* 68BDC 00168ADC 00000000 */   nop
/* 68BE0 00168AE0 C88E828F */  lw         $2, -0x7138($gp)
/* 68BE4 00168AE4 09004010 */  beqz       $2, .L00168B0C
/* 68BE8 00168AE8 00000000 */   nop
.L00168AEC:
/* 68BEC 00168AEC 006E050C */  jal        SndSPSeSyncBG__Fv
/* 68BF0 00168AF0 00000000 */   nop
/* 68BF4 00168AF4 FDFF4014 */  bnez       $2, .L00168AEC
/* 68BF8 00168AF8 00000000 */   nop
/* 68BFC 00168AFC 2F000424 */  addiu      $4, $0, 0x2F
/* 68C00 00168B00 FFFF0524 */  addiu      $5, $0, -0x1
/* 68C04 00168B04 206E050C */  jal        SndSPSePlay__Fii
/* 68C08 00168B08 00000000 */   nop
.L00168B0C:
/* 68C0C 00168B0C A0000224 */  addiu      $2, $0, 0xA0
/* 68C10 00168B10 AC8E82AF */  sw         $2, -0x7154($gp)
/* 68C14 00168B14 1487828F */  lw         $2, -0x78EC($gp)
/* 68C18 00168B18 2B100200 */  sltu       $2, $0, $2
/* 68C1C 00168B1C 01004224 */  addiu      $2, $2, 0x1
/* 68C20 00168B20 B48E82AF */  sw         $2, -0x714C($gp)
/* 68C24 00168B24 28160070 */  paddub     $2, $0, $0
/* 68C28 00168B28 09000010 */  b          .L00168B50
/* 68C2C 00168B2C 00000000 */   nop
.L00168B30:
/* 68C30 00168B30 CC8E80C7 */  lwc1       $f0, -0x7134($gp)
/* 68C34 00168B34 188780E7 */  swc1       $f0, -0x78E8($gp)
/* 68C38 00168B38 18A5050C */  jal        draw_ok_loop__Fv
/* 68C3C 00168B3C 00000000 */   nop
/* 68C40 00168B40 A48E828F */  lw         $2, -0x715C($gp)
/* 68C44 00168B44 01004224 */  addiu      $2, $2, 0x1
/* 68C48 00168B48 A48E82AF */  sw         $2, -0x715C($gp)
/* 68C4C 00168B4C 28160070 */  paddub     $2, $0, $0
.L00168B50:
/* 68C50 00168B50 5000BF7B */  lq         $31, 0x50($sp)
/* 68C54 00168B54 4000B37B */  lq         $19, 0x40($sp)
/* 68C58 00168B58 3000B27B */  lq         $18, 0x30($sp)
/* 68C5C 00168B5C 2000B17B */  lq         $17, 0x20($sp)
/* 68C60 00168B60 1000B07B */  lq         $16, 0x10($sp)
/* 68C64 00168B64 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 68C68 00168B68 7000BD27 */  addiu      $sp, $sp, 0x70
/* 68C6C 00168B6C 0800E003 */  jr         $31
/* 68C70 00168B70 00000000 */   nop
/* 68C74 00168B74 00000000 */  nop
/* 68C78 00168B78 00000000 */  nop
/* 68C7C 00168B7C 00000000 */  nop