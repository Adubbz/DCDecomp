.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardKeySub__Fv
/* 12ED80 0022EC80 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 12ED84 0022EC84 4000BF7F */  sq         $31, 0x40($sp)
/* 12ED88 0022EC88 3000B37F */  sq         $19, 0x30($sp)
/* 12ED8C 0022EC8C 2000B27F */  sq         $18, 0x20($sp)
/* 12ED90 0022EC90 1000B17F */  sq         $17, 0x10($sp)
/* 12ED94 0022EC94 0000B07F */  sq         $16, 0x0($sp)
/* 12ED98 0022EC98 28860070 */  paddub     $16, $0, $0
/* 12ED9C 0022EC9C A897828F */  lw         $2, -0x6858($gp)
/* 12EDA0 0022ECA0 0800518C */  lw         $17, 0x8($2)
/* 12EDA4 0022ECA4 0400448C */  lw         $4, 0x4($2)
/* 12EDA8 0022ECA8 0C005224 */  addiu      $18, $2, 0xC
/* 12EDAC 0022ECAC D8BD080C */  jal        PersonalRetMax__Fi
/* 12EDB0 0022ECB0 00000000 */   nop
/* 12EDB4 0022ECB4 289E4070 */  paddub     $19, $2, $0
/* 12EDB8 0022ECB8 CC01023C */  lui        $2, %hi(GamePad)
/* 12EDBC 0022ECBC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EDC0 0022ECC0 00100524 */  addiu      $5, $0, 0x1000
/* 12EDC4 0022ECC4 1CAE040C */  jal        Down__8CGamePadFi
/* 12EDC8 0022ECC8 00000000 */   nop
/* 12EDCC 0022ECCC 21004010 */  beqz       $2, .L0022ED54
/* 12EDD0 0022ECD0 00000000 */   nop
/* 12EDD4 0022ECD4 A897828F */  lw         $2, -0x6858($gp)
/* 12EDD8 0022ECD8 0800438C */  lw         $3, 0x8($2)
/* 12EDDC 0022ECDC 02000224 */  addiu      $2, $0, 0x2
/* 12EDE0 0022ECE0 1C006210 */  beq        $3, $2, .L0022ED54
/* 12EDE4 0022ECE4 00000000 */   nop
/* 12EDE8 0022ECE8 01000224 */  addiu      $2, $0, 0x1
/* 12EDEC 0022ECEC 03006210 */  beq        $3, $2, .L0022ECFC
/* 12EDF0 0022ECF0 00000000 */   nop
/* 12EDF4 0022ECF4 17000010 */  b          .L0022ED54
/* 12EDF8 0022ECF8 00000000 */   nop
.L0022ECFC:
/* 12EDFC 0022ECFC 0000428E */  lw         $2, 0x0($18)
/* 12EE00 0022ED00 05004128 */  slti       $at, $2, 0x5
/* 12EE04 0022ED04 03002014 */  bnez       $at, .L0022ED14
/* 12EE08 0022ED08 00000000 */   nop
/* 12EE0C 0022ED0C FBFF4224 */  addiu      $2, $2, -0x5
/* 12EE10 0022ED10 000042AE */  sw         $2, 0x0($18)
.L0022ED14:
/* 12EE14 0022ED14 0000438E */  lw         $3, 0x0($18)
/* 12EE18 0022ED18 05000224 */  addiu      $2, $0, 0x5
/* 12EE1C 0022ED1C 1A006200 */  div        $0, $3, $2
/* 12EE20 0022ED20 02004014 */  bnez       $2, .L0022ED2C
/* 12EE24 0022ED24 00000000 */   nop
/* 12EE28 0022ED28 CD010000 */  break      0, 7
.L0022ED2C:
/* 12EE2C 0022ED2C 12180000 */  mflo       $3
/* 12EE30 0022ED30 A897828F */  lw         $2, -0x6858($gp)
/* 12EE34 0022ED34 18004424 */  addiu      $4, $2, 0x18
/* 12EE38 0022ED38 1800428C */  lw         $2, 0x18($2)
/* 12EE3C 0022ED3C 2A086200 */  slt        $at, $3, $2
/* 12EE40 0022ED40 04002010 */  beqz       $at, .L0022ED54
/* 12EE44 0022ED44 00000000 */   nop
/* 12EE48 0022ED48 0000828C */  lw         $2, 0x0($4)
/* 12EE4C 0022ED4C FFFF4224 */  addiu      $2, $2, -0x1
/* 12EE50 0022ED50 000082AC */  sw         $2, 0x0($4)
.L0022ED54:
/* 12EE54 0022ED54 CC01023C */  lui        $2, %hi(GamePad)
/* 12EE58 0022ED58 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EE5C 0022ED5C 00400524 */  addiu      $5, $0, 0x4000
/* 12EE60 0022ED60 1CAE040C */  jal        Down__8CGamePadFi
/* 12EE64 0022ED64 00000000 */   nop
/* 12EE68 0022ED68 23004010 */  beqz       $2, .L0022EDF8
/* 12EE6C 0022ED6C 00000000 */   nop
/* 12EE70 0022ED70 A897828F */  lw         $2, -0x6858($gp)
/* 12EE74 0022ED74 0800438C */  lw         $3, 0x8($2)
/* 12EE78 0022ED78 02000224 */  addiu      $2, $0, 0x2
/* 12EE7C 0022ED7C 1E006210 */  beq        $3, $2, .L0022EDF8
/* 12EE80 0022ED80 00000000 */   nop
/* 12EE84 0022ED84 01000224 */  addiu      $2, $0, 0x1
/* 12EE88 0022ED88 03006210 */  beq        $3, $2, .L0022ED98
/* 12EE8C 0022ED8C 00000000 */   nop
/* 12EE90 0022ED90 19000010 */  b          .L0022EDF8
/* 12EE94 0022ED94 00000000 */   nop
.L0022ED98:
/* 12EE98 0022ED98 0000438E */  lw         $3, 0x0($18)
/* 12EE9C 0022ED9C FBFF6226 */  addiu      $2, $19, -0x5
/* 12EEA0 0022EDA0 2A086200 */  slt        $at, $3, $2
/* 12EEA4 0022EDA4 03002010 */  beqz       $at, .L0022EDB4
/* 12EEA8 0022EDA8 00000000 */   nop
/* 12EEAC 0022EDAC 05006224 */  addiu      $2, $3, 0x5
/* 12EEB0 0022EDB0 000042AE */  sw         $2, 0x0($18)
.L0022EDB4:
/* 12EEB4 0022EDB4 0000438E */  lw         $3, 0x0($18)
/* 12EEB8 0022EDB8 05000224 */  addiu      $2, $0, 0x5
/* 12EEBC 0022EDBC 1A006200 */  div        $0, $3, $2
/* 12EEC0 0022EDC0 02004014 */  bnez       $2, .L0022EDCC
/* 12EEC4 0022EDC4 00000000 */   nop
/* 12EEC8 0022EDC8 CD010000 */  break      0, 7
.L0022EDCC:
/* 12EECC 0022EDCC 12180000 */  mflo       $3
/* 12EED0 0022EDD0 A897828F */  lw         $2, -0x6858($gp)
/* 12EED4 0022EDD4 18004424 */  addiu      $4, $2, 0x18
/* 12EED8 0022EDD8 1800428C */  lw         $2, 0x18($2)
/* 12EEDC 0022EDDC 03004224 */  addiu      $2, $2, 0x3
/* 12EEE0 0022EDE0 2A084300 */  slt        $at, $2, $3
/* 12EEE4 0022EDE4 04002010 */  beqz       $at, .L0022EDF8
/* 12EEE8 0022EDE8 00000000 */   nop
/* 12EEEC 0022EDEC 0000828C */  lw         $2, 0x0($4)
/* 12EEF0 0022EDF0 01004224 */  addiu      $2, $2, 0x1
/* 12EEF4 0022EDF4 000082AC */  sw         $2, 0x0($4)
.L0022EDF8:
/* 12EEF8 0022EDF8 CC01023C */  lui        $2, %hi(GamePad)
/* 12EEFC 0022EDFC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EF00 0022EE00 00200524 */  addiu      $5, $0, 0x2000
/* 12EF04 0022EE04 1CAE040C */  jal        Down__8CGamePadFi
/* 12EF08 0022EE08 00000000 */   nop
/* 12EF0C 0022EE0C 21004010 */  beqz       $2, .L0022EE94
/* 12EF10 0022EE10 00000000 */   nop
/* 12EF14 0022EE14 A897858F */  lw         $5, -0x6858($gp)
/* 12EF18 0022EE18 0800A624 */  addiu      $6, $5, 0x8
/* 12EF1C 0022EE1C 0800A38C */  lw         $3, 0x8($5)
/* 12EF20 0022EE20 01000224 */  addiu      $2, $0, 0x1
/* 12EF24 0022EE24 06006210 */  beq        $3, $2, .L0022EE40
/* 12EF28 0022EE28 00000000 */   nop
/* 12EF2C 0022EE2C 02000224 */  addiu      $2, $0, 0x2
/* 12EF30 0022EE30 18006210 */  beq        $3, $2, .L0022EE94
/* 12EF34 0022EE34 00000000 */   nop
/* 12EF38 0022EE38 16000010 */  b          .L0022EE94
/* 12EF3C 0022EE3C 00000000 */   nop
.L0022EE40:
/* 12EF40 0022EE40 0000438E */  lw         $3, 0x0($18)
/* 12EF44 0022EE44 05000224 */  addiu      $2, $0, 0x5
/* 12EF48 0022EE48 1A006200 */  div        $0, $3, $2
/* 12EF4C 0022EE4C 00000000 */  nop
/* 12EF50 0022EE50 00000000 */  nop
/* 12EF54 0022EE54 10200000 */  mfhi       $4
/* 12EF58 0022EE58 04008128 */  slti       $at, $4, 0x4
/* 12EF5C 0022EE5C 05002010 */  beqz       $at, .L0022EE74
/* 12EF60 0022EE60 00000000 */   nop
/* 12EF64 0022EE64 01006224 */  addiu      $2, $3, 0x1
/* 12EF68 0022EE68 000042AE */  sw         $2, 0x0($18)
/* 12EF6C 0022EE6C 09000010 */  b          .L0022EE94
/* 12EF70 0022EE70 00000000 */   nop
.L0022EE74:
/* 12EF74 0022EE74 04000224 */  addiu      $2, $0, 0x4
/* 12EF78 0022EE78 06008214 */  bne        $4, $2, .L0022EE94
/* 12EF7C 0022EE7C 00000000 */   nop
/* 12EF80 0022EE80 0000A38C */  lw         $3, 0x0($5)
/* 12EF84 0022EE84 02000224 */  addiu      $2, $0, 0x2
/* 12EF88 0022EE88 02006210 */  beq        $3, $2, .L0022EE94
/* 12EF8C 0022EE8C 00000000 */   nop
/* 12EF90 0022EE90 0000C2AC */  sw         $2, 0x0($6)
.L0022EE94:
/* 12EF94 0022EE94 CC01023C */  lui        $2, %hi(GamePad)
/* 12EF98 0022EE98 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 12EF9C 0022EE9C 00800534 */  ori        $5, $0, 0x8000
/* 12EFA0 0022EEA0 1CAE040C */  jal        Down__8CGamePadFi
/* 12EFA4 0022EEA4 00000000 */   nop
/* 12EFA8 0022EEA8 1C004010 */  beqz       $2, .L0022EF1C
/* 12EFAC 0022EEAC 00000000 */   nop
/* 12EFB0 0022EEB0 A897828F */  lw         $2, -0x6858($gp)
/* 12EFB4 0022EEB4 08004524 */  addiu      $5, $2, 0x8
/* 12EFB8 0022EEB8 0800438C */  lw         $3, 0x8($2)
/* 12EFBC 0022EEBC 01000424 */  addiu      $4, $0, 0x1
/* 12EFC0 0022EEC0 09006410 */  beq        $3, $4, .L0022EEE8
/* 12EFC4 0022EEC4 00000000 */   nop
/* 12EFC8 0022EEC8 02000224 */  addiu      $2, $0, 0x2
/* 12EFCC 0022EECC 03006210 */  beq        $3, $2, .L0022EEDC
/* 12EFD0 0022EED0 00000000 */   nop
/* 12EFD4 0022EED4 11000010 */  b          .L0022EF1C
/* 12EFD8 0022EED8 00000000 */   nop
.L0022EEDC:
/* 12EFDC 0022EEDC 0000A4AC */  sw         $4, 0x0($5)
/* 12EFE0 0022EEE0 0E000010 */  b          .L0022EF1C
/* 12EFE4 0022EEE4 00000000 */   nop
.L0022EEE8:
/* 12EFE8 0022EEE8 0000438E */  lw         $3, 0x0($18)
/* 12EFEC 0022EEEC 05000224 */  addiu      $2, $0, 0x5
/* 12EFF0 0022EEF0 1A006200 */  div        $0, $3, $2
/* 12EFF4 0022EEF4 00000000 */  nop
/* 12EFF8 0022EEF8 00000000 */  nop
/* 12EFFC 0022EEFC 10100000 */  mfhi       $2
/* 12F000 0022EF00 04004014 */  bnez       $2, .L0022EF14
/* 12F004 0022EF04 00000000 */   nop
/* 12F008 0022EF08 28868070 */  paddub     $16, $4, $0
/* 12F00C 0022EF0C 03000010 */  b          .L0022EF1C
/* 12F010 0022EF10 00000000 */   nop
.L0022EF14:
/* 12F014 0022EF14 FFFF6224 */  addiu      $2, $3, -0x1
/* 12F018 0022EF18 000042AE */  sw         $2, 0x0($18)
.L0022EF1C:
/* 12F01C 0022EF1C A897828F */  lw         $2, -0x6858($gp)
/* 12F020 0022EF20 0800428C */  lw         $2, 0x8($2)
/* 12F024 0022EF24 04002212 */  beq        $17, $2, .L0022EF38
/* 12F028 0022EF28 00000000 */   nop
/* 12F02C 0022EF2C 28260070 */  paddub     $4, $0, $0
/* 12F030 0022EF30 BCB3080C */  jal        ComMenuSePlay__Fi
/* 12F034 0022EF34 00000000 */   nop
.L0022EF38:
/* 12F038 0022EF38 28160072 */  paddub     $2, $16, $0
/* 12F03C 0022EF3C 4000BF7B */  lq         $31, 0x40($sp)
/* 12F040 0022EF40 3000B37B */  lq         $19, 0x30($sp)
/* 12F044 0022EF44 2000B27B */  lq         $18, 0x20($sp)
/* 12F048 0022EF48 1000B17B */  lq         $17, 0x10($sp)
/* 12F04C 0022EF4C 0000B07B */  lq         $16, 0x0($sp)
/* 12F050 0022EF50 5000BD27 */  addiu      $sp, $sp, 0x50
/* 12F054 0022EF54 0800E003 */  jr         $31
/* 12F058 0022EF58 00000000 */   nop
/* 12F05C 0022EF5C 00000000 */  nop
