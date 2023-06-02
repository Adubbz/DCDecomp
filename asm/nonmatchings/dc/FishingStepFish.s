.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingStepFish__Fv
/* A9A40 001A9940 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9A44 001A9944 1000BF7F */  sq         $31, 0x10($sp)
/* A9A48 001A9948 0000B07F */  sq         $16, 0x0($sp)
/* A9A4C 001A994C 2000A427 */  addiu      $4, $sp, 0x20
/* A9A50 001A9950 F0A6060C */  jal        GetHookPos__FPf
/* A9A54 001A9954 00000000 */   nop
/* A9A58 001A9958 2400A1C7 */  lwc1       $f1, 0x24($sp)
/* A9A5C 001A995C 4040033C */  lui        $3, (0x40400000 >> 16)
/* A9A60 001A9960 00008344 */  mtc1       $3, $f0
/* A9A64 001A9964 00000000 */  nop
/* A9A68 001A9968 01080046 */  sub.s      $f0, $f1, $f0
/* A9A6C 001A996C 2400A0E7 */  swc1       $f0, 0x24($sp)
/* A9A70 001A9970 6893838F */  lw         $3, -0x6C98($gp)
/* A9A74 001A9974 3B006010 */  beqz       $3, .L001A9A64
/* A9A78 001A9978 00000000 */   nop
/* A9A7C 001A997C 6C93848F */  lw         $4, -0x6C94($gp)
/* A9A80 001A9980 05008010 */  beqz       $4, .L001A9998
/* A9A84 001A9984 00000000 */   nop
/* A9A88 001A9988 2001090C */  jal        Step__5CFishFv
/* A9A8C 001A998C 00000000 */   nop
/* A9A90 001A9990 34000010 */  b          .L001A9A64
/* A9A94 001A9994 00000000 */   nop
.L001A9998:
/* A9A98 001A9998 28860070 */  paddub     $16, $0, $0
/* A9A9C 001A999C 2E000010 */  b          .L001A9A58
/* A9AA0 001A99A0 00000000 */   nop
.L001A99A4:
/* A9AA4 001A99A4 5093858F */  lw         $5, -0x6CB0($gp)
/* A9AA8 001A99A8 0400A004 */  bltz       $5, .L001A99BC
/* A9AAC 001A99AC 00000000 */   nop
/* A9AB0 001A99B0 4C93828F */  lw         $2, -0x6CB4($gp)
/* A9AB4 001A99B4 0F004014 */  bnez       $2, .L001A99F4
/* A9AB8 001A99B8 00000000 */   nop
.L001A99BC:
/* A9ABC 001A99BC 00608044 */  mtc1       $0, $f12
/* A9AC0 001A99C0 C0101000 */  sll        $2, $16, 3
/* A9AC4 001A99C4 21105000 */  addu       $2, $2, $16
/* A9AC8 001A99C8 80110200 */  sll        $2, $2, 6
/* A9ACC 001A99CC 21105000 */  addu       $2, $2, $16
/* A9AD0 001A99D0 00190200 */  sll        $3, $2, 4
/* A9AD4 001A99D4 6893828F */  lw         $2, -0x6C98($gp)
/* A9AD8 001A99D8 21204300 */  addu       $4, $2, $3
/* A9ADC 001A99DC FFFF0524 */  addiu      $5, $0, -0x1
/* A9AE0 001A99E0 2000A627 */  addiu      $6, $sp, 0x20
/* A9AE4 001A99E4 3403090C */  jal        SetFoodPos__5CFishFiPff
/* A9AE8 001A99E8 00000000 */   nop
/* A9AEC 001A99EC 10000010 */  b          .L001A9A30
/* A9AF0 001A99F0 00000000 */   nop
.L001A99F4:
/* A9AF4 001A99F4 C0180500 */  sll        $3, $5, 3
/* A9AF8 001A99F8 2700023C */  lui        $2, %hi(esa_info + 0x4)
/* A9AFC 001A99FC 94AE4224 */  addiu      $2, $2, %lo(esa_info + 0x4)
/* A9B00 001A9A00 21104300 */  addu       $2, $2, $3
/* A9B04 001A9A04 00004CC4 */  lwc1       $f12, 0x0($2)
/* A9B08 001A9A08 C0101000 */  sll        $2, $16, 3
/* A9B0C 001A9A0C 21105000 */  addu       $2, $2, $16
/* A9B10 001A9A10 80110200 */  sll        $2, $2, 6
/* A9B14 001A9A14 21105000 */  addu       $2, $2, $16
/* A9B18 001A9A18 00190200 */  sll        $3, $2, 4
/* A9B1C 001A9A1C 6893828F */  lw         $2, -0x6C98($gp)
/* A9B20 001A9A20 21204300 */  addu       $4, $2, $3
/* A9B24 001A9A24 2000A627 */  addiu      $6, $sp, 0x20
/* A9B28 001A9A28 3403090C */  jal        SetFoodPos__5CFishFiPff
/* A9B2C 001A9A2C 00000000 */   nop
.L001A9A30:
/* A9B30 001A9A30 C0101000 */  sll        $2, $16, 3
/* A9B34 001A9A34 21105000 */  addu       $2, $2, $16
/* A9B38 001A9A38 80110200 */  sll        $2, $2, 6
/* A9B3C 001A9A3C 21105000 */  addu       $2, $2, $16
/* A9B40 001A9A40 00190200 */  sll        $3, $2, 4
/* A9B44 001A9A44 6893828F */  lw         $2, -0x6C98($gp)
/* A9B48 001A9A48 21204300 */  addu       $4, $2, $3
/* A9B4C 001A9A4C 2001090C */  jal        Step__5CFishFv
/* A9B50 001A9A50 00000000 */   nop
/* A9B54 001A9A54 01001026 */  addiu      $16, $16, 0x1
.L001A9A58:
/* A9B58 001A9A58 0600032A */  slti       $3, $16, 0x6
/* A9B5C 001A9A5C D1FF6014 */  bnez       $3, .L001A99A4
/* A9B60 001A9A60 00000000 */   nop
.L001A9A64:
/* A9B64 001A9A64 1000BF7B */  lq         $31, 0x10($sp)
/* A9B68 001A9A68 0000B07B */  lq         $16, 0x0($sp)
/* A9B6C 001A9A6C 3000BD27 */  addiu      $sp, $sp, 0x30
/* A9B70 001A9A70 0800E003 */  jr         $31
/* A9B74 001A9A74 00000000 */   nop
/* A9B78 001A9A78 00000000 */  nop
/* A9B7C 001A9A7C 00000000 */  nop
