.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTextureInfo__FP8CTexturePcP8TM2_head
/* 34860 00134760 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 34864 00134764 7000BF7F */  sq         $31, 0x70($sp)
/* 34868 00134768 6000B67F */  sq         $22, 0x60($sp)
/* 3486C 0013476C 5000B57F */  sq         $21, 0x50($sp)
/* 34870 00134770 4000B47F */  sq         $20, 0x40($sp)
/* 34874 00134774 3000B37F */  sq         $19, 0x30($sp)
/* 34878 00134778 2000B27F */  sq         $18, 0x20($sp)
/* 3487C 0013477C 1000B17F */  sq         $17, 0x10($sp)
/* 34880 00134780 0000B07F */  sq         $16, 0x0($sp)
/* 34884 00134784 28B68070 */  paddub     $22, $4, $0
/* 34888 00134788 1000C224 */  addiu      $2, $6, 0x10
/* 3488C 0013478C 2400D094 */  lhu        $16, 0x24($6)
/* 34890 00134790 2600D194 */  lhu        $17, 0x26($6)
/* 34894 00134794 289E0070 */  paddub     $19, $0, $0
/* 34898 00134798 2300C690 */  lbu        $6, 0x23($6)
/* 3489C 0013479C 05000324 */  addiu      $3, $0, 0x5
/* 348A0 001347A0 1E00C310 */  beq        $6, $3, .L0013481C
/* 348A4 001347A4 00000000 */   nop
/* 348A8 001347A8 04000424 */  addiu      $4, $0, 0x4
/* 348AC 001347AC 1700C410 */  beq        $6, $4, .L0013480C
/* 348B0 001347B0 00000000 */   nop
/* 348B4 001347B4 03000324 */  addiu      $3, $0, 0x3
/* 348B8 001347B8 1100C310 */  beq        $6, $3, .L00134800
/* 348BC 001347BC 00000000 */   nop
/* 348C0 001347C0 02000424 */  addiu      $4, $0, 0x2
/* 348C4 001347C4 0A00C410 */  beq        $6, $4, .L001347F0
/* 348C8 001347C8 00000000 */   nop
/* 348CC 001347CC 01000324 */  addiu      $3, $0, 0x1
/* 348D0 001347D0 0300C310 */  beq        $6, $3, .L001347E0
/* 348D4 001347D4 00000000 */   nop
/* 348D8 001347D8 12000010 */  b          .L00134824
/* 348DC 001347DC 00000000 */   nop
.L001347E0:
/* 348E0 001347E0 289E8070 */  paddub     $19, $4, $0
/* 348E4 001347E4 28968070 */  paddub     $18, $4, $0
/* 348E8 001347E8 0E000010 */  b          .L00134824
/* 348EC 001347EC 00000000 */   nop
.L001347F0:
/* 348F0 001347F0 01001324 */  addiu      $19, $0, 0x1
/* 348F4 001347F4 28966070 */  paddub     $18, $3, $0
/* 348F8 001347F8 0A000010 */  b          .L00134824
/* 348FC 001347FC 00000000 */   nop
.L00134800:
/* 34900 00134800 28968070 */  paddub     $18, $4, $0
/* 34904 00134804 07000010 */  b          .L00134824
/* 34908 00134808 00000000 */   nop
.L0013480C:
/* 3490C 0013480C 14001324 */  addiu      $19, $0, 0x14
/* 34910 00134810 28960070 */  paddub     $18, $0, $0
/* 34914 00134814 03000010 */  b          .L00134824
/* 34918 00134818 00000000 */   nop
.L0013481C:
/* 3491C 0013481C 13001324 */  addiu      $19, $0, 0x13
/* 34920 00134820 01001224 */  addiu      $18, $0, 0x1
.L00134824:
/* 34924 00134824 28A60070 */  paddub     $20, $0, $0
/* 34928 00134828 0C004394 */  lhu        $3, 0xC($2)
/* 3492C 0013482C 21A84300 */  addu       $21, $2, $3
/* 34930 00134830 0200412A */  slti       $at, $18, 0x2
/* 34934 00134834 03002010 */  beqz       $at, .L00134844
/* 34938 00134838 00000000 */   nop
/* 3493C 0013483C 0800438C */  lw         $3, 0x8($2)
/* 34940 00134840 21A0A302 */  addu       $20, $21, $3
.L00134844:
/* 34944 00134844 2500033C */  lui        $3, %hi(_1090)
/* 34948 00134848 A00E6324 */  addiu      $3, $3, %lo(_1090)
/* 3494C 0013484C 8000A427 */  addiu      $4, $sp, 0x80
/* 34950 00134850 00006378 */  lq         $3, 0x0($3)
/* 34954 00134854 0000837C */  sq         $3, 0x0($4)
/* 34958 00134858 11004890 */  lbu        $8, 0x11($2)
/* 3495C 0013485C 02000129 */  slti       $at, $8, 0x2
/* 34960 00134860 10002014 */  bnez       $at, .L001348A4
/* 34964 00134864 00000000 */   nop
/* 34968 00134868 4000438C */  lw         $3, 0x40($2)
/* 3496C 0013486C 2120A302 */  addu       $4, $21, $3
/* 34970 00134870 01000624 */  addiu      $6, $0, 0x1
/* 34974 00134874 08000010 */  b          .L00134898
/* 34978 00134878 00000000 */   nop
.L0013487C:
/* 3497C 0013487C 80380600 */  sll        $7, $6, 2
/* 34980 00134880 2118FD00 */  addu       $3, $7, $sp
/* 34984 00134884 800064AC */  sw         $4, 0x80($3)
/* 34988 00134888 2118E200 */  addu       $3, $7, $2
/* 3498C 0013488C 4000638C */  lw         $3, 0x40($3)
/* 34990 00134890 21208300 */  addu       $4, $4, $3
/* 34994 00134894 0100C624 */  addiu      $6, $6, 0x1
.L00134898:
/* 34998 00134898 2A18C800 */  slt        $3, $6, $8
/* 3499C 0013489C F7FF6014 */  bnez       $3, .L0013487C
/* 349A0 001348A0 00000000 */   nop
.L001348A4:
/* 349A4 001348A4 0800C426 */  addiu      $4, $22, 0x8
/* 349A8 001348A8 5A15040C */  jal        strcpy
/* 349AC 001348AC 00000000 */   nop
/* 349B0 001348B0 0200D0A6 */  sh         $16, 0x2($22)
/* 349B4 001348B4 0400D1A6 */  sh         $17, 0x4($22)
/* 349B8 001348B8 0600D2A6 */  sh         $18, 0x6($22)
/* 349BC 001348BC 3800D5AE */  sw         $21, 0x38($22)
/* 349C0 001348C0 01000524 */  addiu      $5, $0, 0x1
/* 349C4 001348C4 07000010 */  b          .L001348E4
/* 349C8 001348C8 00000000 */   nop
.L001348CC:
/* 349CC 001348CC 80300500 */  sll        $6, $5, 2
/* 349D0 001348D0 2118DD00 */  addu       $3, $6, $sp
/* 349D4 001348D4 8000648C */  lw         $4, 0x80($3)
/* 349D8 001348D8 2118D600 */  addu       $3, $6, $22
/* 349DC 001348DC 380064AC */  sw         $4, 0x38($3)
/* 349E0 001348E0 0100A524 */  addiu      $5, $5, 0x1
.L001348E4:
/* 349E4 001348E4 0400A328 */  slti       $3, $5, 0x4
/* 349E8 001348E8 F8FF6014 */  bnez       $3, .L001348CC
/* 349EC 001348EC 00000000 */   nop
/* 349F0 001348F0 4800D4AE */  sw         $20, 0x48($22)
/* 349F4 001348F4 28360070 */  paddub     $6, $0, $0
/* 349F8 001348F8 281E0070 */  paddub     $3, $0, $0
/* 349FC 001348FC 282E0072 */  paddub     $5, $16, $0
/* 34A00 00134900 03000010 */  b          .L00134910
/* 34A04 00134904 00000000 */   nop
.L00134908:
/* 34A08 00134908 43280500 */  sra        $5, $5, 1
/* 34A0C 0013490C 0100C624 */  addiu      $6, $6, 0x1
.L00134910:
/* 34A10 00134910 0200A128 */  slti       $at, $5, 0x2
/* 34A14 00134914 FCFF2010 */  beqz       $at, .L00134908
/* 34A18 00134918 00000000 */   nop
/* 34A1C 0013491C 01000524 */  addiu      $5, $0, 0x1
/* 34A20 00134920 283E0070 */  paddub     $7, $0, $0
/* 34A24 00134924 03000010 */  b          .L00134934
/* 34A28 00134928 00000000 */   nop
.L0013492C:
/* 34A2C 0013492C 40280500 */  sll        $5, $5, 1
/* 34A30 00134930 0100E724 */  addiu      $7, $7, 0x1
.L00134934:
/* 34A34 00134934 2A20E600 */  slt        $4, $7, $6
/* 34A38 00134938 FCFF8014 */  bnez       $4, .L0013492C
/* 34A3C 0013493C 00000000 */   nop
/* 34A40 00134940 02000512 */  beq        $16, $5, .L0013494C
/* 34A44 00134944 00000000 */   nop
/* 34A48 00134948 0100C624 */  addiu      $6, $6, 0x1
.L0013494C:
/* 34A4C 0013494C 282E2072 */  paddub     $5, $17, $0
/* 34A50 00134950 03000010 */  b          .L00134960
/* 34A54 00134954 00000000 */   nop
.L00134958:
/* 34A58 00134958 43280500 */  sra        $5, $5, 1
/* 34A5C 0013495C 01006324 */  addiu      $3, $3, 0x1
.L00134960:
/* 34A60 00134960 0200A128 */  slti       $at, $5, 0x2
/* 34A64 00134964 FCFF2010 */  beqz       $at, .L00134958
/* 34A68 00134968 00000000 */   nop
/* 34A6C 0013496C 01000524 */  addiu      $5, $0, 0x1
/* 34A70 00134970 283E0070 */  paddub     $7, $0, $0
/* 34A74 00134974 03000010 */  b          .L00134984
/* 34A78 00134978 00000000 */   nop
.L0013497C:
/* 34A7C 0013497C 40280500 */  sll        $5, $5, 1
/* 34A80 00134980 0100E724 */  addiu      $7, $7, 0x1
.L00134984:
/* 34A84 00134984 2A20E300 */  slt        $4, $7, $3
/* 34A88 00134988 FCFF8014 */  bnez       $4, .L0013497C
/* 34A8C 0013498C 00000000 */   nop
/* 34A90 00134990 02002512 */  beq        $17, $5, .L0013499C
/* 34A94 00134994 00000000 */   nop
/* 34A98 00134998 01006324 */  addiu      $3, $3, 0x1
.L0013499C:
/* 34A9C 0013499C 83291000 */  sra        $5, $16, 6
/* 34AA0 001349A0 0200A01C */  bgtz       $5, .L001349AC
/* 34AA4 001349A4 00000000 */   nop
/* 34AA8 001349A8 01000524 */  addiu      $5, $0, 0x1
.L001349AC:
/* 34AAC 001349AC 0600C486 */  lh         $4, 0x6($22)
/* 34AB0 001349B0 02008128 */  slti       $at, $4, 0x2
/* 34AB4 001349B4 16002014 */  bnez       $at, .L00134A10
/* 34AB8 001349B8 00000000 */   nop
/* 34ABC 001349BC 3C200500 */  dsll32     $4, $5, 0
/* 34AC0 001349C0 3F200400 */  dsra32     $4, $4, 0
/* 34AC4 001349C4 B82B0400 */  dsll       $5, $4, 14
/* 34AC8 001349C8 3C201300 */  dsll32     $4, $19, 0
/* 34ACC 001349CC 3F200400 */  dsra32     $4, $4, 0
/* 34AD0 001349D0 38250400 */  dsll       $4, $4, 20
/* 34AD4 001349D4 2528A400 */  or         $5, $5, $4
/* 34AD8 001349D8 3C200600 */  dsll32     $4, $6, 0
/* 34ADC 001349DC 3F200400 */  dsra32     $4, $4, 0
/* 34AE0 001349E0 B8260400 */  dsll       $4, $4, 26
/* 34AE4 001349E4 25208500 */  or         $4, $4, $5
/* 34AE8 001349E8 3C180300 */  dsll32     $3, $3, 0
/* 34AEC 001349EC 3F180300 */  dsra32     $3, $3, 0
/* 34AF0 001349F0 B81F0300 */  dsll       $3, $3, 30
/* 34AF4 001349F4 25206400 */  or         $4, $3, $4
/* 34AF8 001349F8 04000324 */  addiu      $3, $0, 0x4
/* 34AFC 001349FC 3C180300 */  dsll32     $3, $3, 0
/* 34B00 00134A00 25188300 */  or         $3, $4, $3
/* 34B04 00134A04 2800C3FE */  sd         $3, 0x28($22)
/* 34B08 00134A08 15000010 */  b          .L00134A60
/* 34B0C 00134A0C 00000000 */   nop
.L00134A10:
/* 34B10 00134A10 3C200500 */  dsll32     $4, $5, 0
/* 34B14 00134A14 3F200400 */  dsra32     $4, $4, 0
/* 34B18 00134A18 B82B0400 */  dsll       $5, $4, 14
/* 34B1C 00134A1C 3C201300 */  dsll32     $4, $19, 0
/* 34B20 00134A20 3F200400 */  dsra32     $4, $4, 0
/* 34B24 00134A24 38250400 */  dsll       $4, $4, 20
/* 34B28 00134A28 2528A400 */  or         $5, $5, $4
/* 34B2C 00134A2C 3C200600 */  dsll32     $4, $6, 0
/* 34B30 00134A30 3F200400 */  dsra32     $4, $4, 0
/* 34B34 00134A34 B8260400 */  dsll       $4, $4, 26
/* 34B38 00134A38 25208500 */  or         $4, $4, $5
/* 34B3C 00134A3C 3C180300 */  dsll32     $3, $3, 0
/* 34B40 00134A40 3F180300 */  dsra32     $3, $3, 0
/* 34B44 00134A44 B81F0300 */  dsll       $3, $3, 30
/* 34B48 00134A48 25206400 */  or         $4, $3, $4
/* 34B4C 00134A4C 0020033C */  lui        $3, (0x20000004 >> 16)
/* 34B50 00134A50 04006334 */  ori        $3, $3, (0x20000004 & 0xFFFF)
/* 34B54 00134A54 3C180300 */  dsll32     $3, $3, 0
/* 34B58 00134A58 25188300 */  or         $3, $4, $3
/* 34B5C 00134A5C 2800C3FE */  sd         $3, 0x28($22)
.L00134A60:
/* 34B60 00134A60 7000BF7B */  lq         $31, 0x70($sp)
/* 34B64 00134A64 6000B67B */  lq         $22, 0x60($sp)
/* 34B68 00134A68 5000B57B */  lq         $21, 0x50($sp)
/* 34B6C 00134A6C 4000B47B */  lq         $20, 0x40($sp)
/* 34B70 00134A70 3000B37B */  lq         $19, 0x30($sp)
/* 34B74 00134A74 2000B27B */  lq         $18, 0x20($sp)
/* 34B78 00134A78 1000B17B */  lq         $17, 0x10($sp)
/* 34B7C 00134A7C 0000B07B */  lq         $16, 0x0($sp)
/* 34B80 00134A80 9000BD27 */  addiu      $sp, $sp, 0x90
/* 34B84 00134A84 0800E003 */  jr         $31
/* 34B88 00134A88 00000000 */   nop
/* 34B8C 00134A8C 00000000 */  nop