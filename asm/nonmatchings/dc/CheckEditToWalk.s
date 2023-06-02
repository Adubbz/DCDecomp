.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckEditToWalk__FPf
/* 7FE20 0017FD20 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* 7FE24 0017FD24 A000BF7F */  sq         $31, 0xA0($sp)
/* 7FE28 0017FD28 9000BE7F */  sq         $fp, 0x90($sp)
/* 7FE2C 0017FD2C 8000B77F */  sq         $23, 0x80($sp)
/* 7FE30 0017FD30 7000B67F */  sq         $22, 0x70($sp)
/* 7FE34 0017FD34 6000B57F */  sq         $21, 0x60($sp)
/* 7FE38 0017FD38 5000B47F */  sq         $20, 0x50($sp)
/* 7FE3C 0017FD3C 4000B37F */  sq         $19, 0x40($sp)
/* 7FE40 0017FD40 3000B27F */  sq         $18, 0x30($sp)
/* 7FE44 0017FD44 2000B17F */  sq         $17, 0x20($sp)
/* 7FE48 0017FD48 1000B07F */  sq         $16, 0x10($sp)
/* 7FE4C 0017FD4C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 7FE50 0017FD50 28AE8070 */  paddub     $21, $4, $0
/* 7FE54 0017FD54 7087828F */  lw         $2, -0x7890($gp)
/* 7FE58 0017FD58 B000A427 */  addiu      $4, $sp, 0xB0
/* 7FE5C 0017FD5C 20024524 */  addiu      $5, $2, 0x220
/* 7FE60 0017FD60 0C86040C */  jal        sceVu0CopyVector
/* 7FE64 0017FD64 00000000 */   nop
/* 7FE68 0017FD68 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 7FE6C 0017FD6C BC00A2AF */  sw         $2, 0xBC($sp)
/* 7FE70 0017FD70 988B828F */  lw         $2, -0x7468($gp)
/* 7FE74 0017FD74 080040AC */  sw         $0, 0x8($2)
/* 7FE78 0017FD78 988B848F */  lw         $4, -0x7468($gp)
/* 7FE7C 0017FD7C 00040524 */  addiu      $5, $0, 0x400
/* 7FE80 0017FD80 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 7FE84 0017FD84 00000000 */   nop
/* 7FE88 0017FD88 28864070 */  paddub     $16, $2, $0
/* 7FE8C 0017FD8C C842023C */  lui        $2, (0x42C80000 >> 16)
/* 7FE90 0017FD90 00088244 */  mtc1       $2, $f1
/* 7FE94 0017FD94 B000A2C7 */  lwc1       $f2, 0xB0($sp)
/* 7FE98 0017FD98 00080246 */  add.s      $f0, $f1, $f2
/* 7FE9C 0017FD9C C000A0E7 */  swc1       $f0, 0xC0($sp)
/* 7FEA0 0017FDA0 01100146 */  sub.s      $f0, $f2, $f1
/* 7FEA4 0017FDA4 D000A0E7 */  swc1       $f0, 0xD0($sp)
/* 7FEA8 0017FDA8 B800BE27 */  addiu      $fp, $sp, 0xB8
/* 7FEAC 0017FDAC 0000C2C7 */  lwc1       $f2, 0x0($fp)
/* 7FEB0 0017FDB0 00080246 */  add.s      $f0, $f1, $f2
/* 7FEB4 0017FDB4 C800A0E7 */  swc1       $f0, 0xC8($sp)
/* 7FEB8 0017FDB8 01100146 */  sub.s      $f0, $f2, $f1
/* 7FEBC 0017FDBC D800A0E7 */  swc1       $f0, 0xD8($sp)
/* 7FEC0 0017FDC0 204E0224 */  addiu      $2, $0, 0x4E20
/* 7FEC4 0017FDC4 00008244 */  mtc1       $2, $f0
/* 7FEC8 0017FDC8 00000000 */  nop
/* 7FECC 0017FDCC 20008046 */  cvt.s.w    $f0, $f0
/* 7FED0 0017FDD0 C400A0E7 */  swc1       $f0, 0xC4($sp)
/* 7FED4 0017FDD4 E0B10224 */  addiu      $2, $0, -0x4E20
/* 7FED8 0017FDD8 00008244 */  mtc1       $2, $f0
/* 7FEDC 0017FDDC 00000000 */  nop
/* 7FEE0 0017FDE0 20008046 */  cvt.s.w    $f0, $f0
/* 7FEE4 0017FDE4 D400A0E7 */  swc1       $f0, 0xD4($sp)
/* 7FEE8 0017FDE8 B400B427 */  addiu      $20, $sp, 0xB4
/* 7FEEC 0017FDEC 000081C6 */  lwc1       $f1, 0x0($20)
/* 7FEF0 0017FDF0 FA43023C */  lui        $2, (0x43FA0000 >> 16)
/* 7FEF4 0017FDF4 00008244 */  mtc1       $2, $f0
/* 7FEF8 0017FDF8 00000000 */  nop
/* 7FEFC 0017FDFC 00080046 */  add.s      $f0, $f1, $f0
/* 7FF00 0017FE00 000080E6 */  swc1       $f0, 0x0($20)
/* 7FF04 0017FE04 E890848F */  lw         $4, -0x6F18($gp)
/* 7FF08 0017FE08 282E0072 */  paddub     $5, $16, $0
/* 7FF0C 0017FE0C C000A627 */  addiu      $6, $sp, 0xC0
/* 7FF10 0017FE10 283E0070 */  paddub     $7, $0, $0
/* 7FF14 0017FE14 D493060C */  jal        PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i
/* 7FF18 0017FE18 00000000 */   nop
/* 7FF1C 0017FE1C 288E4070 */  paddub     $17, $2, $0
/* 7FF20 0017FE20 01001224 */  addiu      $18, $0, 0x1
/* 7FF24 0017FE24 289E0070 */  paddub     $19, $0, $0
/* 7FF28 0017FE28 8F000010 */  b          .L00180068
/* 7FF2C 0017FE2C 00000000 */   nop
.L0017FE30:
/* 7FF30 0017FE30 F000A427 */  addiu      $4, $sp, 0xF0
/* 7FF34 0017FE34 B000A527 */  addiu      $5, $sp, 0xB0
/* 7FF38 0017FE38 0C86040C */  jal        sceVu0CopyVector
/* 7FF3C 0017FE3C 00000000 */   nop
/* 7FF40 0017FE40 01000224 */  addiu      $2, $0, 0x1
/* 7FF44 0017FE44 05006216 */  bne        $19, $2, .L0017FE5C
/* 7FF48 0017FE48 00000000 */   nop
/* 7FF4C 0017FE4C F000A1C7 */  lwc1       $f1, 0xF0($sp)
/* 7FF50 0017FE50 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 7FF54 0017FE54 00080046 */  add.s      $f0, $f1, $f0
/* 7FF58 0017FE58 F000A0E7 */  swc1       $f0, 0xF0($sp)
.L0017FE5C:
/* 7FF5C 0017FE5C 01000224 */  addiu      $2, $0, 0x1
/* 7FF60 0017FE60 05006216 */  bne        $19, $2, .L0017FE78
/* 7FF64 0017FE64 00000000 */   nop
/* 7FF68 0017FE68 F800A1C7 */  lwc1       $f1, 0xF8($sp)
/* 7FF6C 0017FE6C 588380C7 */  lwc1       $f0, -0x7CA8($gp)
/* 7FF70 0017FE70 00080046 */  add.s      $f0, $f1, $f0
/* 7FF74 0017FE74 F800A0E7 */  swc1       $f0, 0xF8($sp)
.L0017FE78:
/* 7FF78 0017FE78 02000224 */  addiu      $2, $0, 0x2
/* 7FF7C 0017FE7C 05006216 */  bne        $19, $2, .L0017FE94
/* 7FF80 0017FE80 00000000 */   nop
/* 7FF84 0017FE84 F000A1C7 */  lwc1       $f1, 0xF0($sp)
/* 7FF88 0017FE88 5C8380C7 */  lwc1       $f0, -0x7CA4($gp)
/* 7FF8C 0017FE8C 01080046 */  sub.s      $f0, $f1, $f0
/* 7FF90 0017FE90 F000A0E7 */  swc1       $f0, 0xF0($sp)
.L0017FE94:
/* 7FF94 0017FE94 02000224 */  addiu      $2, $0, 0x2
/* 7FF98 0017FE98 05006216 */  bne        $19, $2, .L0017FEB0
/* 7FF9C 0017FE9C 00000000 */   nop
/* 7FFA0 0017FEA0 F800A1C7 */  lwc1       $f1, 0xF8($sp)
/* 7FFA4 0017FEA4 608380C7 */  lwc1       $f0, -0x7CA0($gp)
/* 7FFA8 0017FEA8 01080046 */  sub.s      $f0, $f1, $f0
/* 7FFAC 0017FEAC F800A0E7 */  swc1       $f0, 0xF8($sp)
.L0017FEB0:
/* 7FFB0 0017FEB0 03000224 */  addiu      $2, $0, 0x3
/* 7FFB4 0017FEB4 05006216 */  bne        $19, $2, .L0017FECC
/* 7FFB8 0017FEB8 00000000 */   nop
/* 7FFBC 0017FEBC F000A1C7 */  lwc1       $f1, 0xF0($sp)
/* 7FFC0 0017FEC0 648380C7 */  lwc1       $f0, -0x7C9C($gp)
/* 7FFC4 0017FEC4 00080046 */  add.s      $f0, $f1, $f0
/* 7FFC8 0017FEC8 F000A0E7 */  swc1       $f0, 0xF0($sp)
.L0017FECC:
/* 7FFCC 0017FECC 03000224 */  addiu      $2, $0, 0x3
/* 7FFD0 0017FED0 05006216 */  bne        $19, $2, .L0017FEE8
/* 7FFD4 0017FED4 00000000 */   nop
/* 7FFD8 0017FED8 F800A1C7 */  lwc1       $f1, 0xF8($sp)
/* 7FFDC 0017FEDC 688380C7 */  lwc1       $f0, -0x7C98($gp)
/* 7FFE0 0017FEE0 01080046 */  sub.s      $f0, $f1, $f0
/* 7FFE4 0017FEE4 F800A0E7 */  swc1       $f0, 0xF8($sp)
.L0017FEE8:
/* 7FFE8 0017FEE8 0001A427 */  addiu      $4, $sp, 0x100
/* 7FFEC 0017FEEC F000A527 */  addiu      $5, $sp, 0xF0
/* 7FFF0 0017FEF0 0C86040C */  jal        sceVu0CopyVector
/* 7FFF4 0017FEF4 00000000 */   nop
/* 7FFF8 0017FEF8 0401A1C7 */  lwc1       $f1, 0x104($sp)
/* 7FFFC 0017FEFC 7A44023C */  lui        $2, (0x447A0000 >> 16)
/* 80000 0017FF00 00008244 */  mtc1       $2, $f0
/* 80004 0017FF04 00000000 */  nop
/* 80008 0017FF08 01080046 */  sub.s      $f0, $f1, $f0
/* 8000C 0017FF0C 0401A0E7 */  swc1       $f0, 0x104($sp)
/* 80010 0017FF10 28260072 */  paddub     $4, $16, $0
/* 80014 0017FF14 282E2072 */  paddub     $5, $17, $0
/* 80018 0017FF18 F000A627 */  addiu      $6, $sp, 0xF0
/* 8001C 0017FF1C 0001A727 */  addiu      $7, $sp, 0x100
/* 80020 0017FF20 E000A827 */  addiu      $8, $sp, 0xE0
/* 80024 0017FF24 01000924 */  addiu      $9, $0, 0x1
/* 80028 0017FF28 28560070 */  paddub     $10, $0, $0
/* 8002C 0017FF2C 5427050C */  jal        CheckHit__FP6CCPolyiPfPfPfii
/* 80030 0017FF30 00000000 */   nop
/* 80034 0017FF34 4A004004 */  bltz       $2, .L00180060
/* 80038 0017FF38 00000000 */   nop
/* 8003C 0017FF3C 4C8F828F */  lw         $2, -0x70B4($gp)
/* 80040 0017FF40 3F00401C */  bgtz       $2, .L00180040
/* 80044 0017FF44 00000000 */   nop
/* 80048 0017FF48 F400B627 */  addiu      $22, $sp, 0xF4
/* 8004C 0017FF4C F800B727 */  addiu      $23, $sp, 0xF8
/* 80050 0017FF50 E890848F */  lw         $4, -0x6F18($gp)
/* 80054 0017FF54 F000ACC7 */  lwc1       $f12, 0xF0($sp)
/* 80058 0017FF58 0000CDC6 */  lwc1       $f13, 0x0($22)
/* 8005C 0017FF5C 0000EEC6 */  lwc1       $f14, 0x0($23)
/* 80060 0017FF60 D885060C */  jal        GetAlt__11CEditGroundFfff
/* 80064 0017FF64 00000000 */   nop
/* 80068 0017FF68 06050046 */  mov.s      $f20, $f0
/* 8006C 0017FF6C E890848F */  lw         $4, -0x6F18($gp)
/* 80070 0017FF70 F000ACC7 */  lwc1       $f12, 0xF0($sp)
/* 80074 0017FF74 0000CDC6 */  lwc1       $f13, 0x0($22)
/* 80078 0017FF78 0000EEC6 */  lwc1       $f14, 0x0($23)
/* 8007C 0017FF7C AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* 80080 0017FF80 00000000 */   nop
/* 80084 0017FF84 E400B627 */  addiu      $22, $sp, 0xE4
/* 80088 0017FF88 0000C2C6 */  lwc1       $f2, 0x0($22)
/* 8008C 0017FF8C 41101446 */  sub.s      $f1, $f2, $f20
/* 80090 0017FF90 00008044 */  mtc1       $0, $f0
/* 80094 0017FF94 00000000 */  nop
/* 80098 0017FF98 34080046 */  c.lt.s     $f1, $f0
/* 8009C 0017FF9C 00000000 */  nop
/* 800A0 0017FFA0 04000045 */  bc1f       .L0017FFB4
/* 800A4 0017FFA4 00000000 */   nop
/* 800A8 0017FFA8 47080046 */  neg.s      $f1, $f1
/* 800AC 0017FFAC 01000010 */  b          .L0017FFB4
/* 800B0 0017FFB0 00000000 */   nop
.L0017FFB4:
/* 800B4 0017FFB4 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 800B8 0017FFB8 34080046 */  c.lt.s     $f1, $f0
/* 800BC 0017FFBC 00000000 */  nop
/* 800C0 0017FFC0 0A000045 */  bc1f       .L0017FFEC
/* 800C4 0017FFC4 00000000 */   nop
/* 800C8 0017FFC8 08004004 */  bltz       $2, .L0017FFEC
/* 800CC 0017FFCC 00000000 */   nop
/* 800D0 0017FFD0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 800D4 0017FFD4 00008244 */  mtc1       $2, $f0
/* 800D8 0017FFD8 00000000 */  nop
/* 800DC 0017FFDC 00000246 */  add.s      $f0, $f0, $f2
/* 800E0 0017FFE0 000080E6 */  swc1       $f0, 0x0($20)
/* 800E4 0017FFE4 02000010 */  b          .L0017FFF0
/* 800E8 0017FFE8 00000000 */   nop
.L0017FFEC:
/* 800EC 0017FFEC 28960070 */  paddub     $18, $0, $0
.L0017FFF0:
/* 800F0 0017FFF0 E890848F */  lw         $4, -0x6F18($gp)
/* 800F4 0017FFF4 B000ACC7 */  lwc1       $f12, 0xB0($sp)
/* 800F8 0017FFF8 00008DC6 */  lwc1       $f13, 0x0($20)
/* 800FC 0017FFFC 0000CEC7 */  lwc1       $f14, 0x0($fp)
/* 80100 00180000 5886060C */  jal        GetParts__11CEditGroundFfff
/* 80104 00180004 00000000 */   nop
/* 80108 00180008 16004010 */  beqz       $2, .L00180064
/* 8010C 0018000C 00000000 */   nop
/* 80110 00180010 1801428C */  lw         $2, 0x118($2)
/* 80114 00180014 01000324 */  addiu      $3, $0, 0x1
/* 80118 00180018 12004314 */  bne        $2, $3, .L00180064
/* 8011C 0018001C 00000000 */   nop
/* 80120 00180020 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 80124 00180024 00088244 */  mtc1       $2, $f1
/* 80128 00180028 0000C0C6 */  lwc1       $f0, 0x0($22)
/* 8012C 0018002C 00080046 */  add.s      $f0, $f1, $f0
/* 80130 00180030 000080E6 */  swc1       $f0, 0x0($20)
/* 80134 00180034 28966070 */  paddub     $18, $3, $0
/* 80138 00180038 0A000010 */  b          .L00180064
/* 8013C 0018003C 00000000 */   nop
.L00180040:
/* 80140 00180040 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 80144 00180044 00088244 */  mtc1       $2, $f1
/* 80148 00180048 E400A0C7 */  lwc1       $f0, 0xE4($sp)
/* 8014C 0018004C 00080046 */  add.s      $f0, $f1, $f0
/* 80150 00180050 000080E6 */  swc1       $f0, 0x0($20)
/* 80154 00180054 01001224 */  addiu      $18, $0, 0x1
/* 80158 00180058 02000010 */  b          .L00180064
/* 8015C 0018005C 00000000 */   nop
.L00180060:
/* 80160 00180060 28960070 */  paddub     $18, $0, $0
.L00180064:
/* 80164 00180064 01007326 */  addiu      $19, $19, 0x1
.L00180068:
/* 80168 00180068 0400622A */  slti       $2, $19, 0x4
/* 8016C 0018006C 70FF4014 */  bnez       $2, .L0017FE30
/* 80170 00180070 00000000 */   nop
/* 80174 00180074 2826A072 */  paddub     $4, $21, $0
/* 80178 00180078 B000A527 */  addiu      $5, $sp, 0xB0
/* 8017C 0018007C 0C86040C */  jal        sceVu0CopyVector
/* 80180 00180080 00000000 */   nop
/* 80184 00180084 28164072 */  paddub     $2, $18, $0
/* 80188 00180088 A000BF7B */  lq         $31, 0xA0($sp)
/* 8018C 0018008C 9000BE7B */  lq         $fp, 0x90($sp)
/* 80190 00180090 8000B77B */  lq         $23, 0x80($sp)
/* 80194 00180094 7000B67B */  lq         $22, 0x70($sp)
/* 80198 00180098 6000B57B */  lq         $21, 0x60($sp)
/* 8019C 0018009C 5000B47B */  lq         $20, 0x50($sp)
/* 801A0 001800A0 4000B37B */  lq         $19, 0x40($sp)
/* 801A4 001800A4 3000B27B */  lq         $18, 0x30($sp)
/* 801A8 001800A8 2000B17B */  lq         $17, 0x20($sp)
/* 801AC 001800AC 1000B07B */  lq         $16, 0x10($sp)
/* 801B0 001800B0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 801B4 001800B4 1001BD27 */  addiu      $sp, $sp, 0x110
/* 801B8 001800B8 0800E003 */  jr         $31
/* 801BC 001800BC 00000000 */   nop
