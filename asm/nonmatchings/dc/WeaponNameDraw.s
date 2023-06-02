.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponNameDraw__Fiii
/* F97D0 001F96D0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* F97D4 001F96D4 9000BF7F */  sq         $31, 0x90($sp)
/* F97D8 001F96D8 8000BE7F */  sq         $fp, 0x80($sp)
/* F97DC 001F96DC 7000B77F */  sq         $23, 0x70($sp)
/* F97E0 001F96E0 6000B67F */  sq         $22, 0x60($sp)
/* F97E4 001F96E4 5000B57F */  sq         $21, 0x50($sp)
/* F97E8 001F96E8 4000B47F */  sq         $20, 0x40($sp)
/* F97EC 001F96EC 3000B37F */  sq         $19, 0x30($sp)
/* F97F0 001F96F0 2000B27F */  sq         $18, 0x20($sp)
/* F97F4 001F96F4 1000B17F */  sq         $17, 0x10($sp)
/* F97F8 001F96F8 0000B07F */  sq         $16, 0x0($sp)
/* F97FC 001F96FC 28AE8070 */  paddub     $21, $4, $0
/* F9800 001F9700 28F6A070 */  paddub     $fp, $5, $0
/* F9804 001F9704 28B6C070 */  paddub     $22, $6, $0
/* F9808 001F9708 DA01013C */  lui        $at, (0x1DA6A1C >> 16)
/* F980C 001F970C 1C6A248C */  lw         $4, (0x1DA6A1C & 0xFFFF)($at)
/* F9810 001F9710 38B4080C */  jal        MenuTextureReload__Fi
/* F9814 001F9714 00000000 */   nop
/* F9818 001F9718 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F981C 001F971C 74EA2280 */  lb         $2, -0x158C($at)
/* F9820 001F9720 FFFF5024 */  addiu      $16, $2, -0x1
/* F9824 001F9724 28360070 */  paddub     $6, $0, $0
/* F9828 001F9728 0E000010 */  b          .L001F9764
/* F982C 001F972C 00000000 */   nop
.L001F9730:
/* F9830 001F9730 80380600 */  sll        $7, $6, 2
/* F9834 001F9734 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F9838 001F9738 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F983C 001F973C 21104700 */  addu       $2, $2, $7
/* F9840 001F9740 0000428C */  lw         $2, 0x0($2)
/* F9844 001F9744 2118FD00 */  addu       $3, $7, $sp
/* F9848 001F9748 A00062AC */  sw         $2, 0xA0($3)
/* F984C 001F974C DA01023C */  lui        $2, %hi(D_1DA69D8)
/* F9850 001F9750 D8694224 */  addiu      $2, $2, %lo(D_1DA69D8)
/* F9854 001F9754 21104700 */  addu       $2, $2, $7
/* F9858 001F9758 0000428C */  lw         $2, 0x0($2)
/* F985C 001F975C B00062AC */  sw         $2, 0xB0($3)
/* F9860 001F9760 0100C624 */  addiu      $6, $6, 0x1
.L001F9764:
/* F9864 001F9764 0400C228 */  slti       $2, $6, 0x4
/* F9868 001F9768 F1FF4014 */  bnez       $2, .L001F9730
/* F986C 001F976C 00000000 */   nop
/* F9870 001F9770 B041023C */  lui        $2, (0x41B00000 >> 16)
/* F9874 001F9774 00088244 */  mtc1       $2, $f1
/* F9878 001F9778 7C9580C7 */  lwc1       $f0, -0x6A84($gp)
/* F987C 001F977C 40080046 */  add.s      $f1, $f1, $f0
/* F9880 001F9780 D6000224 */  addiu      $2, $0, 0xD6
/* F9884 001F9784 18100202 */  mult       $2, $16, $2
/* F9888 001F9788 00008244 */  mtc1       $2, $f0
/* F988C 001F978C 00000000 */  nop
/* F9890 001F9790 20008046 */  cvt.s.w    $f0, $f0
/* F9894 001F9794 000B0046 */  add.s      $f12, $f1, $f0
/* F9898 001F9798 2C44040C */  jal        fptosi
/* F989C 001F979C 00000000 */   nop
/* F98A0 001F97A0 288E4070 */  paddub     $17, $2, $0
/* F98A4 001F97A4 01000224 */  addiu      $2, $0, 0x1
/* F98A8 001F97A8 DA01013C */  lui        $at, (0x1DA69FC >> 16)
/* F98AC 001F97AC FC6922AC */  sw         $2, (0x1DA69FC & 0xFFFF)($at)
/* F98B0 001F97B0 28960070 */  paddub     $18, $0, $0
/* F98B4 001F97B4 83000010 */  b          .L001F99C4
/* F98B8 001F97B8 00000000 */   nop
.L001F97BC:
/* F98BC 001F97BC 28A60070 */  paddub     $20, $0, $0
/* F98C0 001F97C0 74FF222A */  slti       $2, $17, -0x8C
/* F98C4 001F97C4 34004014 */  bnez       $2, .L001F9898
/* F98C8 001F97C8 00000000 */   nop
/* F98CC 001F97CC 7702212A */  slti       $at, $17, 0x277
/* F98D0 001F97D0 31002010 */  beqz       $at, .L001F9898
/* F98D4 001F97D4 00000000 */   nop
/* F98D8 001F97D8 01000224 */  addiu      $2, $0, 0x1
/* F98DC 001F97DC 0500C217 */  bne        $fp, $2, .L001F97F4
/* F98E0 001F97E0 00000000 */   nop
/* F98E4 001F97E4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F98E8 001F97E8 74EA2280 */  lb         $2, -0x158C($at)
/* F98EC 001F97EC 2A000216 */  bne        $16, $2, .L001F9898
/* F98F0 001F97F0 00000000 */   nop
.L001F97F4:
/* F98F4 001F97F4 28000006 */  bltz       $16, .L001F9898
/* F98F8 001F97F8 00000000 */   nop
/* F98FC 001F97FC 0A00012A */  slti       $at, $16, 0xA
/* F9900 001F9800 25002010 */  beqz       $at, .L001F9898
/* F9904 001F9804 00000000 */   nop
/* F9908 001F9808 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F990C 001F980C 7CEA2384 */  lh         $3, -0x1584($at)
/* F9910 001F9810 08000224 */  addiu      $2, $0, 0x8
/* F9914 001F9814 04006210 */  beq        $3, $2, .L001F9828
/* F9918 001F9818 00000000 */   nop
/* F991C 001F981C 09000224 */  addiu      $2, $0, 0x9
/* F9920 001F9820 05006214 */  bne        $3, $2, .L001F9838
/* F9924 001F9824 00000000 */   nop
.L001F9828:
/* F9928 001F9828 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F992C 001F982C 74EA2280 */  lb         $2, -0x158C($at)
/* F9930 001F9830 19000212 */  beq        $16, $2, .L001F9898
/* F9934 001F9834 00000000 */   nop
.L001F9838:
/* F9938 001F9838 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F993C 001F983C 72EA2284 */  lh         $2, -0x158E($at)
/* F9940 001F9840 05004018 */  blez       $2, .L001F9858
/* F9944 001F9844 00000000 */   nop
/* F9948 001F9848 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F994C 001F984C 74EA2280 */  lb         $2, -0x158C($at)
/* F9950 001F9850 11000216 */  bne        $16, $2, .L001F9898
/* F9954 001F9854 00000000 */   nop
.L001F9858:
/* F9958 001F9858 0A000224 */  addiu      $2, $0, 0xA
/* F995C 001F985C 07006210 */  beq        $3, $2, .L001F987C
/* F9960 001F9860 00000000 */   nop
/* F9964 001F9864 08006228 */  slti       $2, $3, 0x8
/* F9968 001F9868 04004014 */  bnez       $2, .L001F987C
/* F996C 001F986C 00000000 */   nop
/* F9970 001F9870 0B006228 */  slti       $2, $3, 0xB
/* F9974 001F9874 08004014 */  bnez       $2, .L001F9898
/* F9978 001F9878 00000000 */   nop
.L001F987C:
/* F997C 001F987C 07000224 */  addiu      $2, $0, 0x7
/* F9980 001F9880 08006214 */  bne        $3, $2, .L001F98A4
/* F9984 001F9884 00000000 */   nop
/* F9988 001F9888 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F998C 001F988C 74EA2280 */  lb         $2, -0x158C($at)
/* F9990 001F9890 04000212 */  beq        $16, $2, .L001F98A4
/* F9994 001F9894 00000000 */   nop
.L001F9898:
/* F9998 001F9898 E7031324 */  addiu      $19, $0, 0x3E7
/* F999C 001F989C 1A000010 */  b          .L001F9908
/* F99A0 001F98A0 00000000 */   nop
.L001F98A4:
/* F99A4 001F98A4 40111000 */  sll        $2, $16, 5
/* F99A8 001F98A8 23105000 */  subu       $2, $2, $16
/* F99AC 001F98AC C0B80200 */  sll        $23, $2, 3
/* F99B0 001F98B0 1495828F */  lw         $2, -0x6AEC($gp)
/* F99B4 001F98B4 21205700 */  addu       $4, $2, $23
/* F99B8 001F98B8 F8A9080C */  jal        GetWeaponMsgNo__FP11WEAPON_HAVE
/* F99BC 001F98BC 00000000 */   nop
/* F99C0 001F98C0 289E4070 */  paddub     $19, $2, $0
/* F99C4 001F98C4 03006006 */  bltz       $19, .L001F98D4
/* F99C8 001F98C8 00000000 */   nop
/* F99CC 001F98CC 02000106 */  bgez       $16, .L001F98D8
/* F99D0 001F98D0 00000000 */   nop
.L001F98D4:
/* F99D4 001F98D4 E7031324 */  addiu      $19, $0, 0x3E7
.L001F98D8:
/* F99D8 001F98D8 6500612A */  slti       $at, $19, 0x65
/* F99DC 001F98DC 0A002014 */  bnez       $at, .L001F9908
/* F99E0 001F98E0 00000000 */   nop
/* F99E4 001F98E4 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F99E8 001F98E8 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F99EC 001F98EC 282E6072 */  paddub     $5, $19, $0
/* F99F0 001F98F0 C83C050C */  jal        GetMesWidth_system__6ClsMesFi
/* F99F4 001F98F4 00000000 */   nop
/* F99F8 001F98F8 1495828F */  lw         $2, -0x6AEC($gp)
/* F99FC 001F98FC 2110E202 */  addu       $2, $23, $2
/* F9A00 001F9900 02005484 */  lh         $20, 0x2($2)
/* F9A04 001F9904 00000000 */  nop
.L001F9908:
/* F9A08 001F9908 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F9A0C 001F990C D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F9A10 001F9910 282E6072 */  paddub     $5, $19, $0
/* F9A14 001F9914 C83C050C */  jal        GetMesWidth_system__6ClsMesFi
/* F9A18 001F9918 00000000 */   nop
/* F9A1C 001F991C 80201200 */  sll        $4, $18, 2
/* F9A20 001F9920 DA01033C */  lui        $3, %hi(D_1DA69B0)
/* F9A24 001F9924 B0696324 */  addiu      $3, $3, %lo(D_1DA69B0)
/* F9A28 001F9928 21186400 */  addu       $3, $3, $4
/* F9A2C 001F992C 000073AC */  sw         $19, 0x0($3)
/* F9A30 001F9930 DA01033C */  lui        $3, %hi(D_1DA69D8)
/* F9A34 001F9934 D8696324 */  addiu      $3, $3, %lo(D_1DA69D8)
/* F9A38 001F9938 21186400 */  addu       $3, $3, $4
/* F9A3C 001F993C 000074AC */  sw         $20, 0x0($3)
/* F9A40 001F9940 42002426 */  addiu      $4, $17, 0x42
/* F9A44 001F9944 282E4070 */  paddub     $5, $2, $0
/* F9A48 001F9948 B0E5070C */  jal        GetWeaponNamePutX__Fii
/* F9A4C 001F994C 00000000 */   nop
/* F9A50 001F9950 0B00801A */  blez       $20, .L001F9980
/* F9A54 001F9954 00000000 */   nop
/* F9A58 001F9958 F8FF4224 */  addiu      $2, $2, -0x8
/* F9A5C 001F995C 0A000324 */  addiu      $3, $0, 0xA
/* F9A60 001F9960 1A008302 */  div        $0, $20, $3
/* F9A64 001F9964 02006014 */  bnez       $3, .L001F9970
/* F9A68 001F9968 00000000 */   nop
/* F9A6C 001F996C CD010000 */  break      0, 7
.L001F9970:
/* F9A70 001F9970 12180000 */  mflo       $3
/* F9A74 001F9974 02006018 */  blez       $3, .L001F9980
/* F9A78 001F9978 00000000 */   nop
/* F9A7C 001F997C F8FF4224 */  addiu      $2, $2, -0x8
.L001F9980:
/* F9A80 001F9980 0D004006 */  bltz       $18, .L001F99B8
/* F9A84 001F9984 00000000 */   nop
/* F9A88 001F9988 0A00412A */  slti       $at, $18, 0xA
/* F9A8C 001F998C 0A002010 */  beqz       $at, .L001F99B8
/* F9A90 001F9990 00000000 */   nop
/* F9A94 001F9994 C0201200 */  sll        $4, $18, 3
/* F9A98 001F9998 DA01033C */  lui        $3, %hi(D_1DA6A20)
/* F9A9C 001F999C 206A6324 */  addiu      $3, $3, %lo(D_1DA6A20)
/* F9AA0 001F99A0 21186400 */  addu       $3, $3, $4
/* F9AA4 001F99A4 000062AC */  sw         $2, 0x0($3)
/* F9AA8 001F99A8 DA01023C */  lui        $2, %hi(D_1DA6A24)
/* F9AAC 001F99AC 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* F9AB0 001F99B0 21104400 */  addu       $2, $2, $4
/* F9AB4 001F99B4 000055AC */  sw         $21, 0x0($2)
.L001F99B8:
/* F9AB8 001F99B8 D6003126 */  addiu      $17, $17, 0xD6
/* F9ABC 001F99BC 01001026 */  addiu      $16, $16, 0x1
/* F9AC0 001F99C0 01005226 */  addiu      $18, $18, 0x1
.L001F99C4:
/* F9AC4 001F99C4 0300422A */  slti       $2, $18, 0x3
/* F9AC8 001F99C8 7CFF4014 */  bnez       $2, .L001F97BC
/* F9ACC 001F99CC 00000000 */   nop
/* F9AD0 001F99D0 282E0070 */  paddub     $5, $0, $0
/* F9AD4 001F99D4 11000010 */  b          .L001F9A1C
/* F9AD8 001F99D8 00000000 */   nop
.L001F99DC:
/* F9ADC 001F99DC C0180500 */  sll        $3, $5, 3
/* F9AE0 001F99E0 DA01023C */  lui        $2, %hi(D_1DA6A24)
/* F9AE4 001F99E4 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* F9AE8 001F99E8 21184300 */  addu       $3, $2, $3
/* F9AEC 001F99EC 0000628C */  lw         $2, 0x0($3)
/* F9AF0 001F99F0 B5004128 */  slti       $at, $2, 0xB5
/* F9AF4 001F99F4 08002014 */  bnez       $at, .L001F9A18
/* F9AF8 001F99F8 00000000 */   nop
/* F9AFC 001F99FC 000075AC */  sw         $21, 0x0($3)
/* F9B00 001F9A00 E7030424 */  addiu      $4, $0, 0x3E7
/* F9B04 001F9A04 80180500 */  sll        $3, $5, 2
/* F9B08 001F9A08 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F9B0C 001F9A0C B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F9B10 001F9A10 21104300 */  addu       $2, $2, $3
/* F9B14 001F9A14 000044AC */  sw         $4, 0x0($2)
.L001F9A18:
/* F9B18 001F9A18 0100A524 */  addiu      $5, $5, 0x1
.L001F9A1C:
/* F9B1C 001F9A1C 0400A228 */  slti       $2, $5, 0x4
/* F9B20 001F9A20 EEFF4014 */  bnez       $2, .L001F99DC
/* F9B24 001F9A24 00000000 */   nop
/* F9B28 001F9A28 282E0070 */  paddub     $5, $0, $0
/* F9B2C 001F9A2C 1E000010 */  b          .L001F9AA8
/* F9B30 001F9A30 00000000 */   nop
.L001F9A34:
/* F9B34 001F9A34 80300500 */  sll        $6, $5, 2
/* F9B38 001F9A38 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* F9B3C 001F9A3C B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* F9B40 001F9A40 21104600 */  addu       $2, $2, $6
/* F9B44 001F9A44 2120DD00 */  addu       $4, $6, $sp
/* F9B48 001F9A48 0000438C */  lw         $3, 0x0($2)
/* F9B4C 001F9A4C A000828C */  lw         $2, 0xA0($4)
/* F9B50 001F9A50 26106200 */  xor        $2, $3, $2
/* F9B54 001F9A54 2B100200 */  sltu       $2, $0, $2
/* F9B58 001F9A58 08004014 */  bnez       $2, .L001F9A7C
/* F9B5C 001F9A5C 00000000 */   nop
/* F9B60 001F9A60 DA01023C */  lui        $2, %hi(D_1DA69D8)
/* F9B64 001F9A64 D8694224 */  addiu      $2, $2, %lo(D_1DA69D8)
/* F9B68 001F9A68 21104600 */  addu       $2, $2, $6
/* F9B6C 001F9A6C 0000438C */  lw         $3, 0x0($2)
/* F9B70 001F9A70 B000828C */  lw         $2, 0xB0($4)
/* F9B74 001F9A74 0B006210 */  beq        $3, $2, .L001F9AA4
/* F9B78 001F9A78 00000000 */   nop
.L001F9A7C:
/* F9B7C 001F9A7C FFFF0224 */  addiu      $2, $0, -0x1
/* F9B80 001F9A80 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* F9B84 001F9A84 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* F9B88 001F9A88 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F9B8C 001F9A8C D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F9B90 001F9A90 96000524 */  addiu      $5, $0, 0x96
/* F9B94 001F9A94 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F9B98 001F9A98 00000000 */   nop
/* F9B9C 001F9A9C 05000010 */  b          .L001F9AB4
/* F9BA0 001F9AA0 00000000 */   nop
.L001F9AA4:
/* F9BA4 001F9AA4 0100A524 */  addiu      $5, $5, 0x1
.L001F9AA8:
/* F9BA8 001F9AA8 0400A228 */  slti       $2, $5, 0x4
/* F9BAC 001F9AAC E1FF4014 */  bnez       $2, .L001F9A34
/* F9BB0 001F9AB0 00000000 */   nop
.L001F9AB4:
/* F9BB4 001F9AB4 DA01013C */  lui        $at, (0x1DA69A4 >> 16)
/* F9BB8 001F9AB8 A46936AC */  sw         $22, (0x1DA69A4 & 0xFFFF)($at)
/* F9BBC 001F9ABC DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F9BC0 001F9AC0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F9BC4 001F9AC4 6437050C */  jal        Step__6ClsMesFv
/* F9BC8 001F9AC8 00000000 */   nop
/* F9BCC 001F9ACC DA01023C */  lui        $2, %hi(AtoraNameMes)
/* F9BD0 001F9AD0 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* F9BD4 001F9AD4 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* F9BD8 001F9AD8 00000000 */   nop
/* F9BDC 001F9ADC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F9BE0 001F9AE0 72EA2384 */  lh         $3, -0x158E($at)
/* F9BE4 001F9AE4 41006014 */  bnez       $3, .L001F9BEC
/* F9BE8 001F9AE8 00000000 */   nop
/* F9BEC 001F9AEC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* F9BF0 001F9AF0 7CEA2384 */  lh         $3, -0x1584($at)
/* F9BF4 001F9AF4 3D006014 */  bnez       $3, .L001F9BEC
/* F9BF8 001F9AF8 00000000 */   nop
/* F9BFC 001F9AFC C701023C */  lui        $2, %hi(TexManager)
/* F9C00 001F9B00 70584424 */  addiu      $4, $2, %lo(TexManager)
/* F9C04 001F9B04 2A00023C */  lui        $2, %hi(_924_2)
/* F9C08 001F9B08 E8D44524 */  addiu      $5, $2, %lo(_924_2)
/* F9C0C 001F9B0C FFFF0624 */  addiu      $6, $0, -0x1
/* F9C10 001F9B10 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* F9C14 001F9B14 00000000 */   nop
/* F9C18 001F9B18 28864070 */  paddub     $16, $2, $0
/* F9C1C 001F9B1C 33000012 */  beqz       $16, .L001F9BEC
/* F9C20 001F9B20 00000000 */   nop
/* F9C24 001F9B24 A0B8040C */  jal        GetVif1Packet__Fv
/* F9C28 001F9B28 00000000 */   nop
/* F9C2C 001F9B2C 00000686 */  lh         $6, 0x0($16)
/* F9C30 001F9B30 C701033C */  lui        $3, %hi(TexManager)
/* F9C34 001F9B34 70586424 */  addiu      $4, $3, %lo(TexManager)
/* F9C38 001F9B38 282E4070 */  paddub     $5, $2, $0
/* F9C3C 001F9B3C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* F9C40 001F9B40 00000000 */   nop
/* F9C44 001F9B44 2C000492 */  lbu        $4, 0x2C($16)
/* F9C48 001F9B48 01000230 */  andi       $2, $0, 0x1
/* F9C4C 001F9B4C 80180200 */  sll        $3, $2, 2
/* F9C50 001F9B50 FBFF0224 */  addiu      $2, $0, -0x5
/* F9C54 001F9B54 24108200 */  and        $2, $4, $2
/* F9C58 001F9B58 25104300 */  or         $2, $2, $3
/* F9C5C 001F9B5C 2C0002A2 */  sb         $2, 0x2C($16)
/* F9C60 001F9B60 D800A427 */  addiu      $4, $sp, 0xD8
/* F9C64 001F9B64 008C82DF */  ld         $2, -0x7400($gp)
/* F9C68 001F9B68 000082FC */  sd         $2, 0x0($4)
/* F9C6C 001F9B6C D900A593 */  lbu        $5, 0xD9($sp)
/* F9C70 001F9B70 80000364 */  daddiu     $3, $0, 0x80
/* F9C74 001F9B74 7FFF0224 */  addiu      $2, $0, -0x81
/* F9C78 001F9B78 2410A200 */  and        $2, $5, $2
/* F9C7C 001F9B7C 25104300 */  or         $2, $2, $3
/* F9C80 001F9B80 D900A2A3 */  sb         $2, 0xD9($sp)
/* F9C84 001F9B84 80000224 */  addiu      $2, $0, 0x80
/* F9C88 001F9B88 D800A2A3 */  sb         $2, 0xD8($sp)
/* F9C8C 001F9B8C 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* F9C90 001F9B90 00000000 */   nop
/* F9C94 001F9B94 C000A0AF */  sw         $0, 0xC0($sp)
/* F9C98 001F9B98 4A010224 */  addiu      $2, $0, 0x14A
/* F9C9C 001F9B9C C400A2AF */  sw         $2, 0xC4($sp)
/* F9CA0 001F9BA0 04010224 */  addiu      $2, $0, 0x104
/* F9CA4 001F9BA4 C800A2AF */  sw         $2, 0xC8($sp)
/* F9CA8 001F9BA8 76000224 */  addiu      $2, $0, 0x76
/* F9CAC 001F9BAC CC00A2AF */  sw         $2, 0xCC($sp)
/* F9CB0 001F9BB0 A0B8040C */  jal        GetVif1Packet__Fv
/* F9CB4 001F9BB4 00000000 */   nop
/* F9CB8 001F9BB8 FF00CB32 */  andi       $11, $22, 0xFF
/* F9CBC 001F9BBC 28264070 */  paddub     $4, $2, $0
/* F9CC0 001F9BC0 282E0072 */  paddub     $5, $16, $0
/* F9CC4 001F9BC4 C000A627 */  addiu      $6, $sp, 0xC0
/* F9CC8 001F9BC8 283EC070 */  paddub     $7, $6, $0
/* F9CCC 001F9BCC 40000824 */  addiu      $8, $0, 0x40
/* F9CD0 001F9BD0 284E0071 */  paddub     $9, $8, $0
/* F9CD4 001F9BD4 28560071 */  paddub     $10, $8, $0
/* F9CD8 001F9BD8 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* F9CDC 001F9BDC 00000000 */   nop
/* F9CE0 001F9BE0 28260070 */  paddub     $4, $0, $0
/* F9CE4 001F9BE4 18BC040C */  jal        MGSetGsTEXA__FP9sceGsTexa
/* F9CE8 001F9BE8 00000000 */   nop
.L001F9BEC:
/* F9CEC 001F9BEC 9000BF7B */  lq         $31, 0x90($sp)
/* F9CF0 001F9BF0 8000BE7B */  lq         $fp, 0x80($sp)
/* F9CF4 001F9BF4 7000B77B */  lq         $23, 0x70($sp)
/* F9CF8 001F9BF8 6000B67B */  lq         $22, 0x60($sp)
/* F9CFC 001F9BFC 5000B57B */  lq         $21, 0x50($sp)
/* F9D00 001F9C00 4000B47B */  lq         $20, 0x40($sp)
/* F9D04 001F9C04 3000B37B */  lq         $19, 0x30($sp)
/* F9D08 001F9C08 2000B27B */  lq         $18, 0x20($sp)
/* F9D0C 001F9C0C 1000B17B */  lq         $17, 0x10($sp)
/* F9D10 001F9C10 0000B07B */  lq         $16, 0x0($sp)
/* F9D14 001F9C14 E000BD27 */  addiu      $sp, $sp, 0xE0
/* F9D18 001F9C18 0800E003 */  jr         $31
/* F9D1C 001F9C1C 00000000 */   nop
