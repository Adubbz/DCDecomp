.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtStatusErrStep__Fv
/* B1B50 001B1A50 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B1B54 001B1A54 3000BF7F */  sq         $31, 0x30($sp)
/* B1B58 001B1A58 2000B27F */  sq         $18, 0x20($sp)
/* B1B5C 001B1A5C 1000B17F */  sq         $17, 0x10($sp)
/* B1B60 001B1A60 0000B07F */  sq         $16, 0x0($sp)
/* B1B64 001B1A64 789C918F */  lw         $17, -0x6388($gp)
/* B1B68 001B1A68 04002426 */  addiu      $4, $17, 0x4
/* B1B6C 001B1A6C 04002282 */  lb         $2, 0x4($17)
/* B1B70 001B1A70 80100200 */  sll        $2, $2, 2
/* B1B74 001B1A74 21105100 */  addu       $2, $2, $17
/* B1B78 001B1A78 C842438C */  lw         $3, 0x42C8($2)
/* B1B7C 001B1A7C D893828F */  lw         $2, -0x6C28($gp)
/* B1B80 001B1A80 01004224 */  addiu      $2, $2, 0x1
/* B1B84 001B1A84 D89382AF */  sw         $2, -0x6C28($gp)
/* B1B88 001B1A88 10006230 */  andi       $2, $3, 0x10
/* B1B8C 001B1A8C 37004010 */  beqz       $2, .L001B1B6C
/* B1B90 001B1A90 00000000 */   nop
/* B1B94 001B1A94 D893828F */  lw         $2, -0x6C28($gp)
/* B1B98 001B1A98 B4004228 */  slti       $2, $2, 0xB4
/* B1B9C 001B1A9C 33004014 */  bnez       $2, .L001B1B6C
/* B1BA0 001B1AA0 00000000 */   nop
/* B1BA4 001B1AA4 00009280 */  lb         $18, 0x0($4)
/* B1BA8 001B1AA8 40101200 */  sll        $2, $18, 1
/* B1BAC 001B1AAC 21105100 */  addu       $2, $2, $17
/* B1BB0 001B1AB0 06004484 */  lh         $4, 0x6($2)
/* B1BB4 001B1AB4 708090DF */  ld         $16, -0x7F90($gp)
/* B1BB8 001B1AB8 FC40040C */  jal        litodp
/* B1BBC 001B1ABC 00000000 */   nop
/* B1BC0 001B1AC0 28260072 */  paddub     $4, $16, $0
/* B1BC4 001B1AC4 282E4070 */  paddub     $5, $2, $0
/* B1BC8 001B1AC8 9E3F040C */  jal        dpmul
/* B1BCC 001B1ACC 00000000 */   nop
/* B1BD0 001B1AD0 28264070 */  paddub     $4, $2, $0
/* B1BD4 001B1AD4 2A41040C */  jal        dptoli
/* B1BD8 001B1AD8 00000000 */   nop
/* B1BDC 001B1ADC 28864070 */  paddub     $16, $2, $0
/* B1BE0 001B1AE0 3C2E1200 */  dsll32     $5, $18, 24
/* B1BE4 001B1AE4 3F2E0500 */  dsra32     $5, $5, 24
/* B1BE8 001B1AE8 23101000 */  negu       $2, $16
/* B1BEC 001B1AEC 3C340200 */  dsll32     $6, $2, 16
/* B1BF0 001B1AF0 3F340600 */  dsra32     $6, $6, 16
/* B1BF4 001B1AF4 2041023C */  lui        $2, (0x41200000 >> 16)
/* B1BF8 001B1AF8 00608244 */  mtc1       $2, $f12
/* B1BFC 001B1AFC 28262072 */  paddub     $4, $17, $0
/* B1C00 001B1B00 C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* B1C04 001B1B04 00000000 */   nop
/* B1C08 001B1B08 2700023C */  lui        $2, %hi(_1188_2)
/* B1C0C 001B1B0C 60B04224 */  addiu      $2, $2, %lo(_1188_2)
/* B1C10 001B1B10 4000A527 */  addiu      $5, $sp, 0x40
/* B1C14 001B1B14 00004278 */  lq         $2, 0x0($2)
/* B1C18 001B1B18 0000A27C */  sq         $2, 0x0($5)
/* B1C1C 001B1B1C 789C868F */  lw         $6, -0x6388($gp)
/* B1C20 001B1B20 2700023C */  lui        $2, %hi(_345_5)
/* B1C24 001B1B24 40B04224 */  addiu      $2, $2, %lo(_345_5)
/* B1C28 001B1B28 5000A427 */  addiu      $4, $sp, 0x50
/* B1C2C 001B1B2C 00004378 */  lq         $3, 0x0($2)
/* B1C30 001B1B30 100042DC */  ld         $2, 0x10($2)
/* B1C34 001B1B34 0000837C */  sq         $3, 0x0($4)
/* B1C38 001B1B38 100082FC */  sd         $2, 0x10($4)
/* B1C3C 001B1B3C 0400C280 */  lb         $2, 0x4($6)
/* B1C40 001B1B40 80100200 */  sll        $2, $2, 2
/* B1C44 001B1B44 21105D00 */  addu       $2, $2, $sp
/* B1C48 001B1B48 500040C4 */  lwc1       $f0, 0x50($2)
/* B1C4C 001B1B4C 4400A0E7 */  swc1       $f0, 0x44($sp)
/* B1C50 001B1B50 E09D848F */  lw         $4, -0x6220($gp)
/* B1C54 001B1B54 28360072 */  paddub     $6, $16, $0
/* B1C58 001B1B58 02000724 */  addiu      $7, $0, 0x2
/* B1C5C 001B1B5C EA01013C */  lui        $at, (0x1EA1DDC >> 16)
/* B1C60 001B1B60 DC1D288C */  lw         $8, (0x1EA1DDC & 0xFFFF)($at)
/* B1C64 001B1B64 C0D8060C */  jal        HitValueEntry__FP9CHitValuePfiiP6CFrame
/* B1C68 001B1B68 00000000 */   nop
.L001B1B6C:
/* B1C6C 001B1B6C D893828F */  lw         $2, -0x6C28($gp)
/* B1C70 001B1B70 B4004228 */  slti       $2, $2, 0xB4
/* B1C74 001B1B74 02004014 */  bnez       $2, .L001B1B80
/* B1C78 001B1B78 00000000 */   nop
/* B1C7C 001B1B7C D89380AF */  sw         $0, -0x6C28($gp)
.L001B1B80:
/* B1C80 001B1B80 58C6060C */  jal        BtStatusErrColorSet__Fv
/* B1C84 001B1B84 00000000 */   nop
/* B1C88 001B1B88 3000BF7B */  lq         $31, 0x30($sp)
/* B1C8C 001B1B8C 2000B27B */  lq         $18, 0x20($sp)
/* B1C90 001B1B90 1000B17B */  lq         $17, 0x10($sp)
/* B1C94 001B1B94 0000B07B */  lq         $16, 0x0($sp)
/* B1C98 001B1B98 7000BD27 */  addiu      $sp, $sp, 0x70
/* B1C9C 001B1B9C 0800E003 */  jr         $31
/* B1CA0 001B1BA0 00000000 */   nop
/* B1CA4 001B1BA4 00000000 */  nop
/* B1CA8 001B1BA8 00000000 */  nop
/* B1CAC 001B1BAC 00000000 */  nop
