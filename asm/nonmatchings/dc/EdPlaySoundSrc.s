.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdPlaySoundSrc__Fv
/* 71970 00171870 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 71974 00171874 4000BF7F */  sq         $31, 0x40($sp)
/* 71978 00171878 3000B27F */  sq         $18, 0x30($sp)
/* 7197C 0017187C 2000B17F */  sq         $17, 0x20($sp)
/* 71980 00171880 1000B07F */  sq         $16, 0x10($sp)
/* 71984 00171884 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 71988 00171888 28860070 */  paddub     $16, $0, $0
/* 7198C 0017188C 07000010 */  b          .L001718AC
/* 71990 00171890 00000000 */   nop
.L00171894:
/* 71994 00171894 80201000 */  sll        $4, $16, 2
/* 71998 00171898 D201033C */  lui        $3, %hi(now_play_se_flag)
/* 7199C 0017189C 50996324 */  addiu      $3, $3, %lo(now_play_se_flag)
/* 719A0 001718A0 21186400 */  addu       $3, $3, $4
/* 719A4 001718A4 000060AC */  sw         $0, 0x0($3)
/* 719A8 001718A8 01001026 */  addiu      $16, $16, 0x1
.L001718AC:
/* 719AC 001718AC 0400032A */  slti       $3, $16, 0x4
/* 719B0 001718B0 F8FF6014 */  bnez       $3, .L00171894
/* 719B4 001718B4 00000000 */   nop
/* 719B8 001718B8 28860070 */  paddub     $16, $0, $0
/* 719BC 001718BC 60000010 */  b          .L00171A40
/* 719C0 001718C0 00000000 */   nop
.L001718C4:
/* 719C4 001718C4 00191000 */  sll        $3, $16, 4
/* 719C8 001718C8 21187000 */  addu       $3, $3, $16
/* 719CC 001718CC C0900300 */  sll        $18, $3, 3
/* 719D0 001718D0 D201033C */  lui        $3, %hi(sound_src)
/* 719D4 001718D4 20976324 */  addiu      $3, $3, %lo(sound_src)
/* 719D8 001718D8 21187200 */  addu       $3, $3, $18
/* 719DC 001718DC 0000718C */  lw         $17, 0x0($3)
/* 719E0 001718E0 56002006 */  bltz       $17, .L00171A3C
/* 719E4 001718E4 00000000 */   nop
/* 719E8 001718E8 28262072 */  paddub     $4, $17, $0
/* 719EC 001718EC CCC5050C */  jal        check_se_play__Fi
/* 719F0 001718F0 00000000 */   nop
/* 719F4 001718F4 51004004 */  bltz       $2, .L00171A3C
/* 719F8 001718F8 00000000 */   nop
/* 719FC 001718FC 05004014 */  bnez       $2, .L00171914
/* 71A00 00171900 00000000 */   nop
/* 71A04 00171904 282E0070 */  paddub     $5, $0, $0
/* 71A08 00171908 28360070 */  paddub     $6, $0, $0
/* 71A0C 0017190C AC69050C */  jal        SndSePlay__Fiii
/* 71A10 00171910 00000000 */   nop
.L00171914:
/* 71A14 00171914 00608044 */  mtc1       $0, $f12
/* 71A18 00171918 28260070 */  paddub     $4, $0, $0
/* 71A1C 0017191C 09000010 */  b          .L00171944
/* 71A20 00171920 00000000 */   nop
.L00171924:
/* 71A24 00171924 D201023C */  lui        $2, %hi(D_1D19728)
/* 71A28 00171928 28974224 */  addiu      $2, $2, %lo(D_1D19728)
/* 71A2C 0017192C 21185200 */  addu       $3, $2, $18
/* 71A30 00171930 80100400 */  sll        $2, $4, 2
/* 71A34 00171934 21104300 */  addu       $2, $2, $3
/* 71A38 00171938 000040C4 */  lwc1       $f0, 0x0($2)
/* 71A3C 0017193C 00630046 */  add.s      $f12, $f12, $f0
/* 71A40 00171940 01008424 */  addiu      $4, $4, 0x1
.L00171944:
/* 71A44 00171944 D201023C */  lui        $2, %hi(D_1D19724)
/* 71A48 00171948 24974224 */  addiu      $2, $2, %lo(D_1D19724)
/* 71A4C 0017194C 21105200 */  addu       $2, $2, $18
/* 71A50 00171950 0000468C */  lw         $6, 0x0($2)
/* 71A54 00171954 2A108600 */  slt        $2, $4, $6
/* 71A58 00171958 F2FF4014 */  bnez       $2, .L00171924
/* 71A5C 0017195C 00000000 */   nop
/* 71A60 00171960 00A08044 */  mtc1       $0, $f20
/* 71A64 00171964 28260070 */  paddub     $4, $0, $0
/* 71A68 00171968 10000010 */  b          .L001719AC
/* 71A6C 0017196C 00000000 */   nop
.L00171970:
/* 71A70 00171970 80280400 */  sll        $5, $4, 2
/* 71A74 00171974 D201023C */  lui        $2, %hi(D_1D19768)
/* 71A78 00171978 68974224 */  addiu      $2, $2, %lo(D_1D19768)
/* 71A7C 0017197C 21105200 */  addu       $2, $2, $18
/* 71A80 00171980 2118A200 */  addu       $3, $5, $2
/* 71A84 00171984 D201023C */  lui        $2, %hi(D_1D19728)
/* 71A88 00171988 28974224 */  addiu      $2, $2, %lo(D_1D19728)
/* 71A8C 0017198C 21105200 */  addu       $2, $2, $18
/* 71A90 00171990 2110A200 */  addu       $2, $5, $2
/* 71A94 00171994 000061C4 */  lwc1       $f1, 0x0($3)
/* 71A98 00171998 000040C4 */  lwc1       $f0, 0x0($2)
/* 71A9C 0017199C 02080046 */  mul.s      $f0, $f1, $f0
/* 71AA0 001719A0 03000C46 */  div.s      $f0, $f0, $f12
/* 71AA4 001719A4 00A50046 */  add.s      $f20, $f20, $f0
/* 71AA8 001719A8 01008424 */  addiu      $4, $4, 0x1
.L001719AC:
/* 71AAC 001719AC 2A108600 */  slt        $2, $4, $6
/* 71AB0 001719B0 EFFF4014 */  bnez       $2, .L00171970
/* 71AB4 001719B4 00000000 */   nop
/* 71AB8 001719B8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 71ABC 001719BC 00008244 */  mtc1       $2, $f0
/* 71AC0 001719C0 00000000 */  nop
/* 71AC4 001719C4 36600046 */  c.le.s     $f12, $f0
/* 71AC8 001719C8 00000000 */  nop
/* 71ACC 001719CC 02000145 */  bc1t       .L001719D8
/* 71AD0 001719D0 00000000 */   nop
/* 71AD4 001719D4 06030046 */  mov.s      $f12, $f0
.L001719D8:
/* 71AD8 001719D8 28262072 */  paddub     $4, $17, $0
/* 71ADC 001719DC 282E0070 */  paddub     $5, $0, $0
/* 71AE0 001719E0 AC6A050C */  jal        SndSetSeVolf__Fifi
/* 71AE4 001719E4 00000000 */   nop
/* 71AE8 001719E8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 71AEC 001719EC 00008244 */  mtc1       $2, $f0
/* 71AF0 001719F0 00000000 */  nop
/* 71AF4 001719F4 36A00046 */  c.le.s     $f20, $f0
/* 71AF8 001719F8 00000000 */  nop
/* 71AFC 001719FC 02000145 */  bc1t       .L00171A08
/* 71B00 00171A00 00000000 */   nop
/* 71B04 00171A04 06050046 */  mov.s      $f20, $f0
.L00171A08:
/* 71B08 00171A08 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 71B0C 00171A0C 00008244 */  mtc1       $2, $f0
/* 71B10 00171A10 00000000 */  nop
/* 71B14 00171A14 34A00046 */  c.lt.s     $f20, $f0
/* 71B18 00171A18 00000000 */  nop
/* 71B1C 00171A1C 02000045 */  bc1f       .L00171A28
/* 71B20 00171A20 00000000 */   nop
/* 71B24 00171A24 06050046 */  mov.s      $f20, $f0
.L00171A28:
/* 71B28 00171A28 28262072 */  paddub     $4, $17, $0
/* 71B2C 00171A2C 06A30046 */  mov.s      $f12, $f20
/* 71B30 00171A30 282E0070 */  paddub     $5, $0, $0
/* 71B34 00171A34 C46A050C */  jal        SndSetSePanf__Fifi
/* 71B38 00171A38 00000000 */   nop
.L00171A3C:
/* 71B3C 00171A3C 01001026 */  addiu      $16, $16, 0x1
.L00171A40:
/* 71B40 00171A40 0400032A */  slti       $3, $16, 0x4
/* 71B44 00171A44 9FFF6014 */  bnez       $3, .L001718C4
/* 71B48 00171A48 00000000 */   nop
/* 71B4C 00171A4C 28860070 */  paddub     $16, $0, $0
/* 71B50 00171A50 14000010 */  b          .L00171AA4
/* 71B54 00171A54 00000000 */   nop
.L00171A58:
/* 71B58 00171A58 80201000 */  sll        $4, $16, 2
/* 71B5C 00171A5C D201033C */  lui        $3, %hi(now_play_se_flag)
/* 71B60 00171A60 50996324 */  addiu      $3, $3, %lo(now_play_se_flag)
/* 71B64 00171A64 21186400 */  addu       $3, $3, $4
/* 71B68 00171A68 0000638C */  lw         $3, 0x0($3)
/* 71B6C 00171A6C 0C006014 */  bnez       $3, .L00171AA0
/* 71B70 00171A70 00000000 */   nop
/* 71B74 00171A74 D201033C */  lui        $3, %hi(now_play_se)
/* 71B78 00171A78 40996324 */  addiu      $3, $3, %lo(now_play_se)
/* 71B7C 00171A7C 21886400 */  addu       $17, $3, $4
/* 71B80 00171A80 0000248E */  lw         $4, 0x0($17)
/* 71B84 00171A84 06008004 */  bltz       $4, .L00171AA0
/* 71B88 00171A88 00000000 */   nop
/* 71B8C 00171A8C 282E0070 */  paddub     $5, $0, $0
/* 71B90 00171A90 2C6A050C */  jal        SndSeStop__Fii
/* 71B94 00171A94 00000000 */   nop
/* 71B98 00171A98 FFFF0324 */  addiu      $3, $0, -0x1
/* 71B9C 00171A9C 000023AE */  sw         $3, 0x0($17)
.L00171AA0:
/* 71BA0 00171AA0 01001026 */  addiu      $16, $16, 0x1
.L00171AA4:
/* 71BA4 00171AA4 0400032A */  slti       $3, $16, 0x4
/* 71BA8 00171AA8 EBFF6014 */  bnez       $3, .L00171A58
/* 71BAC 00171AAC 00000000 */   nop
/* 71BB0 00171AB0 4000BF7B */  lq         $31, 0x40($sp)
/* 71BB4 00171AB4 3000B27B */  lq         $18, 0x30($sp)
/* 71BB8 00171AB8 2000B17B */  lq         $17, 0x20($sp)
/* 71BBC 00171ABC 1000B07B */  lq         $16, 0x10($sp)
/* 71BC0 00171AC0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 71BC4 00171AC4 5000BD27 */  addiu      $sp, $sp, 0x50
/* 71BC8 00171AC8 0800E003 */  jr         $31
/* 71BCC 00171ACC 00000000 */   nop
