.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuTagKey__Fv
/* FFC60 001FFB60 D0FEBD27 */  addiu      $sp, $sp, -0x130
/* FFC64 001FFB64 2000BF7F */  sq         $31, 0x20($sp)
/* FFC68 001FFB68 1000B17F */  sq         $17, 0x10($sp)
/* FFC6C 001FFB6C 0000B07F */  sq         $16, 0x0($sp)
/* FFC70 001FFB70 28860070 */  paddub     $16, $0, $0
/* FFC74 001FFB74 2801A327 */  addiu      $3, $sp, 0x128
/* FFC78 001FFB78 888880C7 */  lwc1       $f0, -0x7778($gp)
/* FFC7C 001FFB7C 8C888287 */  lh         $2, -0x7774($gp)
/* FFC80 001FFB80 000060E4 */  swc1       $f0, 0x0($3)
/* FFC84 001FFB84 040062A4 */  sh         $2, 0x4($3)
/* FFC88 001FFB88 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFC8C 001FFB8C E9EB2280 */  lb         $2, -0x1417($at)
/* FFC90 001FFB90 03004104 */  bgez       $2, .L001FFBA0
/* FFC94 001FFB94 00000000 */   nop
/* FFC98 001FFB98 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFC9C 001FFB9C E9EB20A0 */  sb         $0, -0x1417($at)
.L001FFBA0:
/* FFCA0 001FFBA0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFCA4 001FFBA4 E8EB2280 */  lb         $2, -0x1418($at)
/* FFCA8 001FFBA8 40100200 */  sll        $2, $2, 1
/* FFCAC 001FFBAC 21105D00 */  addu       $2, $2, $sp
/* FFCB0 001FFBB0 28014424 */  addiu      $4, $2, 0x128
/* FFCB4 001FFBB4 00008384 */  lh         $3, 0x0($4)
/* FFCB8 001FFBB8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFCBC 001FFBBC E9EB2280 */  lb         $2, -0x1417($at)
/* FFCC0 001FFBC0 2A086200 */  slt        $at, $3, $2
/* FFCC4 001FFBC4 04002010 */  beqz       $at, .L001FFBD8
/* FFCC8 001FFBC8 00000000 */   nop
/* FFCCC 001FFBCC 00008280 */  lb         $2, 0x0($4)
/* FFCD0 001FFBD0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFCD4 001FFBD4 E9EB22A0 */  sb         $2, -0x1417($at)
.L001FFBD8:
/* FFCD8 001FFBD8 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FFCDC 001FFBDC 00000000 */   nop
/* FFCE0 001FFBE0 00004484 */  lh         $4, 0x0($2)
/* FFCE4 001FFBE4 C4C7080C */  jal        GetWeaponHoleNum__Fi
/* FFCE8 001FFBE8 00000000 */   nop
/* FFCEC 001FFBEC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFCF0 001FFBF0 E8EB2480 */  lb         $4, -0x1418($at)
/* FFCF4 001FFBF4 02000324 */  addiu      $3, $0, 0x2
/* FFCF8 001FFBF8 A5008310 */  beq        $4, $3, .L001FFE90
/* FFCFC 001FFBFC 00000000 */   nop
/* FFD00 001FFC00 01000324 */  addiu      $3, $0, 0x1
/* FFD04 001FFC04 49008310 */  beq        $4, $3, .L001FFD2C
/* FFD08 001FFC08 00000000 */   nop
/* FFD0C 001FFC0C 03008010 */  beqz       $4, .L001FFC1C
/* FFD10 001FFC10 00000000 */   nop
/* FFD14 001FFC14 F6000010 */  b          .L001FFFF0
/* FFD18 001FFC18 00000000 */   nop
.L001FFC1C:
/* FFD1C 001FFC1C CC01023C */  lui        $2, %hi(GamePad)
/* FFD20 001FFC20 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFD24 001FFC24 00100524 */  addiu      $5, $0, 0x1000
/* FFD28 001FFC28 1CAE040C */  jal        Down__8CGamePadFi
/* FFD2C 001FFC2C 00000000 */   nop
/* FFD30 001FFC30 1A004010 */  beqz       $2, .L001FFC9C
/* FFD34 001FFC34 00000000 */   nop
/* FFD38 001FFC38 01001024 */  addiu      $16, $0, 0x1
/* FFD3C 001FFC3C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFD40 001FFC40 E9EB2380 */  lb         $3, -0x1417($at)
/* FFD44 001FFC44 2A080300 */  slt        $at, $0, $3
/* FFD48 001FFC48 06002010 */  beqz       $at, .L001FFC64
/* FFD4C 001FFC4C 00000000 */   nop
/* FFD50 001FFC50 FFFF6324 */  addiu      $3, $3, -0x1
/* FFD54 001FFC54 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFD58 001FFC58 E9EB23A0 */  sb         $3, -0x1417($at)
/* FFD5C 001FFC5C E4000010 */  b          .L001FFFF0
/* FFD60 001FFC60 00000000 */   nop
.L001FFC64:
/* FFD64 001FFC64 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFD68 001FFC68 76EA2380 */  lb         $3, -0x158A($at)
/* FFD6C 001FFC6C 06006010 */  beqz       $3, .L001FFC88
/* FFD70 001FFC70 00000000 */   nop
/* FFD74 001FFC74 09000324 */  addiu      $3, $0, 0x9
/* FFD78 001FFC78 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFD7C 001FFC7C 72EA23A4 */  sh         $3, -0x158E($at)
/* FFD80 001FFC80 DB000010 */  b          .L001FFFF0
/* FFD84 001FFC84 00000000 */   nop
.L001FFC88:
/* FFD88 001FFC88 08000324 */  addiu      $3, $0, 0x8
/* FFD8C 001FFC8C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFD90 001FFC90 72EA23A4 */  sh         $3, -0x158E($at)
/* FFD94 001FFC94 D6000010 */  b          .L001FFFF0
/* FFD98 001FFC98 00000000 */   nop
.L001FFC9C:
/* FFD9C 001FFC9C CC01023C */  lui        $2, %hi(GamePad)
/* FFDA0 001FFCA0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFDA4 001FFCA4 00400524 */  addiu      $5, $0, 0x4000
/* FFDA8 001FFCA8 1CAE040C */  jal        Down__8CGamePadFi
/* FFDAC 001FFCAC 00000000 */   nop
/* FFDB0 001FFCB0 11004010 */  beqz       $2, .L001FFCF8
/* FFDB4 001FFCB4 00000000 */   nop
/* FFDB8 001FFCB8 01001024 */  addiu      $16, $0, 0x1
/* FFDBC 001FFCBC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFDC0 001FFCC0 E9EB2480 */  lb         $4, -0x1417($at)
/* FFDC4 001FFCC4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFDC8 001FFCC8 E8EB2380 */  lb         $3, -0x1418($at)
/* FFDCC 001FFCCC 40180300 */  sll        $3, $3, 1
/* FFDD0 001FFCD0 21187D00 */  addu       $3, $3, $sp
/* FFDD4 001FFCD4 28016384 */  lh         $3, 0x128($3)
/* FFDD8 001FFCD8 2A088300 */  slt        $at, $4, $3
/* FFDDC 001FFCDC C4002010 */  beqz       $at, .L001FFFF0
/* FFDE0 001FFCE0 00000000 */   nop
/* FFDE4 001FFCE4 01008324 */  addiu      $3, $4, 0x1
/* FFDE8 001FFCE8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFDEC 001FFCEC E9EB23A0 */  sb         $3, -0x1417($at)
/* FFDF0 001FFCF0 BF000010 */  b          .L001FFFF0
/* FFDF4 001FFCF4 00000000 */   nop
.L001FFCF8:
/* FFDF8 001FFCF8 CC01023C */  lui        $2, %hi(GamePad)
/* FFDFC 001FFCFC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFE00 001FFD00 40000524 */  addiu      $5, $0, 0x40
/* FFE04 001FFD04 1CAE040C */  jal        Down__8CGamePadFi
/* FFE08 001FFD08 00000000 */   nop
/* FFE0C 001FFD0C B8004010 */  beqz       $2, .L001FFFF0
/* FFE10 001FFD10 00000000 */   nop
/* FFE14 001FFD14 01001024 */  addiu      $16, $0, 0x1
/* FFE18 001FFD18 02000424 */  addiu      $4, $0, 0x2
/* FFE1C 001FFD1C BCB3080C */  jal        ComMenuSePlay__Fi
/* FFE20 001FFD20 00000000 */   nop
/* FFE24 001FFD24 B2000010 */  b          .L001FFFF0
/* FFE28 001FFD28 00000000 */   nop
.L001FFD2C:
/* FFE2C 001FFD2C CC01023C */  lui        $2, %hi(GamePad)
/* FFE30 001FFD30 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFE34 001FFD34 00100524 */  addiu      $5, $0, 0x1000
/* FFE38 001FFD38 1CAE040C */  jal        Down__8CGamePadFi
/* FFE3C 001FFD3C 00000000 */   nop
/* FFE40 001FFD40 1A004010 */  beqz       $2, .L001FFDAC
/* FFE44 001FFD44 00000000 */   nop
/* FFE48 001FFD48 01001024 */  addiu      $16, $0, 0x1
/* FFE4C 001FFD4C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFE50 001FFD50 E9EB2380 */  lb         $3, -0x1417($at)
/* FFE54 001FFD54 2A080300 */  slt        $at, $0, $3
/* FFE58 001FFD58 06002010 */  beqz       $at, .L001FFD74
/* FFE5C 001FFD5C 00000000 */   nop
/* FFE60 001FFD60 FFFF6324 */  addiu      $3, $3, -0x1
/* FFE64 001FFD64 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFE68 001FFD68 E9EB23A0 */  sb         $3, -0x1417($at)
/* FFE6C 001FFD6C A0000010 */  b          .L001FFFF0
/* FFE70 001FFD70 00000000 */   nop
.L001FFD74:
/* FFE74 001FFD74 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFE78 001FFD78 76EA2380 */  lb         $3, -0x158A($at)
/* FFE7C 001FFD7C 06006010 */  beqz       $3, .L001FFD98
/* FFE80 001FFD80 00000000 */   nop
/* FFE84 001FFD84 09000324 */  addiu      $3, $0, 0x9
/* FFE88 001FFD88 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFE8C 001FFD8C 72EA23A4 */  sh         $3, -0x158E($at)
/* FFE90 001FFD90 97000010 */  b          .L001FFFF0
/* FFE94 001FFD94 00000000 */   nop
.L001FFD98:
/* FFE98 001FFD98 08000324 */  addiu      $3, $0, 0x8
/* FFE9C 001FFD9C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFEA0 001FFDA0 72EA23A4 */  sh         $3, -0x158E($at)
/* FFEA4 001FFDA4 92000010 */  b          .L001FFFF0
/* FFEA8 001FFDA8 00000000 */   nop
.L001FFDAC:
/* FFEAC 001FFDAC CC01023C */  lui        $2, %hi(GamePad)
/* FFEB0 001FFDB0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFEB4 001FFDB4 00400524 */  addiu      $5, $0, 0x4000
/* FFEB8 001FFDB8 1CAE040C */  jal        Down__8CGamePadFi
/* FFEBC 001FFDBC 00000000 */   nop
/* FFEC0 001FFDC0 11004010 */  beqz       $2, .L001FFE08
/* FFEC4 001FFDC4 00000000 */   nop
/* FFEC8 001FFDC8 01001024 */  addiu      $16, $0, 0x1
/* FFECC 001FFDCC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFED0 001FFDD0 E9EB2480 */  lb         $4, -0x1417($at)
/* FFED4 001FFDD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFED8 001FFDD8 E8EB2380 */  lb         $3, -0x1418($at)
/* FFEDC 001FFDDC 40180300 */  sll        $3, $3, 1
/* FFEE0 001FFDE0 21187D00 */  addu       $3, $3, $sp
/* FFEE4 001FFDE4 28016384 */  lh         $3, 0x128($3)
/* FFEE8 001FFDE8 2A088300 */  slt        $at, $4, $3
/* FFEEC 001FFDEC 80002010 */  beqz       $at, .L001FFFF0
/* FFEF0 001FFDF0 00000000 */   nop
/* FFEF4 001FFDF4 01008324 */  addiu      $3, $4, 0x1
/* FFEF8 001FFDF8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFEFC 001FFDFC E9EB23A0 */  sb         $3, -0x1417($at)
/* FFF00 001FFE00 7B000010 */  b          .L001FFFF0
/* FFF04 001FFE04 00000000 */   nop
.L001FFE08:
/* FFF08 001FFE08 CC01023C */  lui        $2, %hi(GamePad)
/* FFF0C 001FFE0C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFF10 001FFE10 40000524 */  addiu      $5, $0, 0x40
/* FFF14 001FFE14 1CAE040C */  jal        Down__8CGamePadFi
/* FFF18 001FFE18 00000000 */   nop
/* FFF1C 001FFE1C 74004010 */  beqz       $2, .L001FFFF0
/* FFF20 001FFE20 00000000 */   nop
/* FFF24 001FFE24 01001024 */  addiu      $16, $0, 0x1
/* FFF28 001FFE28 C0CF070C */  jal        GetNowSelectWeapon__Fv
/* FFF2C 001FFE2C 00000000 */   nop
/* FFF30 001FFE30 288E4070 */  paddub     $17, $2, $0
/* FFF34 001FFE34 28262072 */  paddub     $4, $17, $0
/* FFF38 001FFE38 3000A527 */  addiu      $5, $sp, 0x30
/* FFF3C 001FFE3C 28360070 */  paddub     $6, $0, $0
/* FFF40 001FFE40 D896080C */  jal        WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* FFF44 001FFE44 00000000 */   nop
/* FFF48 001FFE48 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFF4C 001FFE4C E9EB2680 */  lb         $6, -0x1417($at)
/* FFF50 001FFE50 28262072 */  paddub     $4, $17, $0
/* FFF54 001FFE54 3000A527 */  addiu      $5, $sp, 0x30
/* FFF58 001FFE58 44F0070C */  jal        WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* FFF5C 001FFE5C 00000000 */   nop
/* FFF60 001FFE60 06004010 */  beqz       $2, .L001FFE7C
/* FFF64 001FFE64 00000000 */   nop
/* FFF68 001FFE68 02000424 */  addiu      $4, $0, 0x2
/* FFF6C 001FFE6C BCB3080C */  jal        ComMenuSePlay__Fi
/* FFF70 001FFE70 00000000 */   nop
/* FFF74 001FFE74 5E000010 */  b          .L001FFFF0
/* FFF78 001FFE78 00000000 */   nop
.L001FFE7C:
/* FFF7C 001FFE7C 28260072 */  paddub     $4, $16, $0
/* FFF80 001FFE80 BCB3080C */  jal        ComMenuSePlay__Fi
/* FFF84 001FFE84 00000000 */   nop
/* FFF88 001FFE88 59000010 */  b          .L001FFFF0
/* FFF8C 001FFE8C 00000000 */   nop
.L001FFE90:
/* FFF90 001FFE90 CC01023C */  lui        $2, %hi(GamePad)
/* FFF94 001FFE94 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFF98 001FFE98 00100524 */  addiu      $5, $0, 0x1000
/* FFF9C 001FFE9C 1CAE040C */  jal        Down__8CGamePadFi
/* FFFA0 001FFEA0 00000000 */   nop
/* FFFA4 001FFEA4 1E004010 */  beqz       $2, .L001FFF20
/* FFFA8 001FFEA8 00000000 */   nop
/* FFFAC 001FFEAC 01001024 */  addiu      $16, $0, 0x1
/* FFFB0 001FFEB0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFFB4 001FFEB4 E9EB2480 */  lb         $4, -0x1417($at)
/* FFFB8 001FFEB8 05000324 */  addiu      $3, $0, 0x5
/* FFFBC 001FFEBC 1A008300 */  div        $0, $4, $3
/* FFFC0 001FFEC0 00000000 */  nop
/* FFFC4 001FFEC4 00000000 */  nop
/* FFFC8 001FFEC8 10180000 */  mfhi       $3
/* FFFCC 001FFECC 06006010 */  beqz       $3, .L001FFEE8
/* FFFD0 001FFED0 00000000 */   nop
/* FFFD4 001FFED4 FFFF8324 */  addiu      $3, $4, -0x1
/* FFFD8 001FFED8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFFDC 001FFEDC E9EB23A0 */  sb         $3, -0x1417($at)
/* FFFE0 001FFEE0 43000010 */  b          .L001FFFF0
/* FFFE4 001FFEE4 00000000 */   nop
.L001FFEE8:
/* FFFE8 001FFEE8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFFEC 001FFEEC 76EA2380 */  lb         $3, -0x158A($at)
/* FFFF0 001FFEF0 06006010 */  beqz       $3, .L001FFF0C
/* FFFF4 001FFEF4 00000000 */   nop
/* FFFF8 001FFEF8 09000324 */  addiu      $3, $0, 0x9
/* FFFFC 001FFEFC DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100000 001FFF00 72EA23A4 */  sh         $3, -0x158E($at)
/* 100004 001FFF04 3A000010 */  b          .L001FFFF0
/* 100008 001FFF08 00000000 */   nop
.L001FFF0C:
/* 10000C 001FFF0C 08000324 */  addiu      $3, $0, 0x8
/* 100010 001FFF10 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100014 001FFF14 72EA23A4 */  sh         $3, -0x158E($at)
/* 100018 001FFF18 35000010 */  b          .L001FFFF0
/* 10001C 001FFF1C 00000000 */   nop
.L001FFF20:
/* 100020 001FFF20 CC01023C */  lui        $2, %hi(GamePad)
/* 100024 001FFF24 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100028 001FFF28 00400524 */  addiu      $5, $0, 0x4000
/* 10002C 001FFF2C 1CAE040C */  jal        Down__8CGamePadFi
/* 100030 001FFF30 00000000 */   nop
/* 100034 001FFF34 11004010 */  beqz       $2, .L001FFF7C
/* 100038 001FFF38 00000000 */   nop
/* 10003C 001FFF3C 01001024 */  addiu      $16, $0, 0x1
/* 100040 001FFF40 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100044 001FFF44 E9EB2580 */  lb         $5, -0x1417($at)
/* 100048 001FFF48 05000324 */  addiu      $3, $0, 0x5
/* 10004C 001FFF4C 1A00A300 */  div        $0, $5, $3
/* 100050 001FFF50 00000000 */  nop
/* 100054 001FFF54 00000000 */  nop
/* 100058 001FFF58 10200000 */  mfhi       $4
/* 10005C 001FFF5C 04000324 */  addiu      $3, $0, 0x4
/* 100060 001FFF60 23008310 */  beq        $4, $3, .L001FFFF0
/* 100064 001FFF64 00000000 */   nop
/* 100068 001FFF68 0100A324 */  addiu      $3, $5, 0x1
/* 10006C 001FFF6C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100070 001FFF70 E9EB23A0 */  sb         $3, -0x1417($at)
/* 100074 001FFF74 1E000010 */  b          .L001FFFF0
/* 100078 001FFF78 00000000 */   nop
.L001FFF7C:
/* 10007C 001FFF7C CC01023C */  lui        $2, %hi(GamePad)
/* 100080 001FFF80 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100084 001FFF84 00800534 */  ori        $5, $0, 0x8000
/* 100088 001FFF88 1CAE040C */  jal        Down__8CGamePadFi
/* 10008C 001FFF8C 00000000 */   nop
/* 100090 001FFF90 0C004010 */  beqz       $2, .L001FFFC4
/* 100094 001FFF94 00000000 */   nop
/* 100098 001FFF98 01001024 */  addiu      $16, $0, 0x1
/* 10009C 001FFF9C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1000A0 001FFFA0 E9EB2480 */  lb         $4, -0x1417($at)
/* 1000A4 001FFFA4 05008328 */  slti       $3, $4, 0x5
/* 1000A8 001FFFA8 11006014 */  bnez       $3, .L001FFFF0
/* 1000AC 001FFFAC 00000000 */   nop
/* 1000B0 001FFFB0 FBFF8324 */  addiu      $3, $4, -0x5
/* 1000B4 001FFFB4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1000B8 001FFFB8 E9EB23A0 */  sb         $3, -0x1417($at)
/* 1000BC 001FFFBC 0C000010 */  b          .L001FFFF0
/* 1000C0 001FFFC0 00000000 */   nop
.L001FFFC4:
/* 1000C4 001FFFC4 CC01023C */  lui        $2, %hi(GamePad)
/* 1000C8 001FFFC8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1000CC 001FFFCC 40000524 */  addiu      $5, $0, 0x40
/* 1000D0 001FFFD0 1CAE040C */  jal        Down__8CGamePadFi
/* 1000D4 001FFFD4 00000000 */   nop
/* 1000D8 001FFFD8 05004010 */  beqz       $2, .L001FFFF0
/* 1000DC 001FFFDC 00000000 */   nop
/* 1000E0 001FFFE0 01001024 */  addiu      $16, $0, 0x1
/* 1000E4 001FFFE4 02000424 */  addiu      $4, $0, 0x2
/* 1000E8 001FFFE8 BCB3080C */  jal        ComMenuSePlay__Fi
/* 1000EC 001FFFEC 00000000 */   nop
.L001FFFF0:
/* 1000F0 001FFFF0 42000016 */  bnez       $16, .L002000FC
/* 1000F4 001FFFF4 00000000 */   nop
/* 1000F8 001FFFF8 CC01023C */  lui        $2, %hi(GamePad)
/* 1000FC 001FFFFC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100100 00200000 20000524 */  addiu      $5, $0, 0x20
/* 100104 00200004 1CAE040C */  jal        Down__8CGamePadFi
/* 100108 00200008 00000000 */   nop
/* 10010C 0020000C 08004010 */  beqz       $2, .L00200030
/* 100110 00200010 00000000 */   nop
/* 100114 00200014 02000424 */  addiu      $4, $0, 0x2
/* 100118 00200018 BCB3080C */  jal        ComMenuSePlay__Fi
/* 10011C 0020001C 00000000 */   nop
/* 100120 00200020 ACFD070C */  jal        WepAttachHaveCancel__Fv
/* 100124 00200024 00000000 */   nop
/* 100128 00200028 34000010 */  b          .L002000FC
/* 10012C 0020002C 00000000 */   nop
.L00200030:
/* 100130 00200030 CC01023C */  lui        $2, %hi(GamePad)
/* 100134 00200034 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 100138 00200038 00200524 */  addiu      $5, $0, 0x2000
/* 10013C 0020003C 1CAE040C */  jal        Down__8CGamePadFi
/* 100140 00200040 00000000 */   nop
/* 100144 00200044 2D004010 */  beqz       $2, .L002000FC
/* 100148 00200048 00000000 */   nop
/* 10014C 0020004C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100150 00200050 E8EB2480 */  lb         $4, -0x1418($at)
/* 100154 00200054 01000324 */  addiu      $3, $0, 0x1
/* 100158 00200058 1E008310 */  beq        $4, $3, .L002000D4
/* 10015C 0020005C 00000000 */   nop
/* 100160 00200060 1C008010 */  beqz       $4, .L002000D4
/* 100164 00200064 00000000 */   nop
/* 100168 00200068 02000324 */  addiu      $3, $0, 0x2
/* 10016C 0020006C 03008310 */  beq        $4, $3, .L0020007C
/* 100170 00200070 00000000 */   nop
/* 100174 00200074 21000010 */  b          .L002000FC
/* 100178 00200078 00000000 */   nop
.L0020007C:
/* 10017C 0020007C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100180 00200080 E9EB2380 */  lb         $3, -0x1417($at)
/* 100184 00200084 05006128 */  slti       $at, $3, 0x5
/* 100188 00200088 06002010 */  beqz       $at, .L002000A4
/* 10018C 0020008C 00000000 */   nop
/* 100190 00200090 05006324 */  addiu      $3, $3, 0x5
/* 100194 00200094 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 100198 00200098 E9EB23A0 */  sb         $3, -0x1417($at)
/* 10019C 0020009C 17000010 */  b          .L002000FC
/* 1001A0 002000A0 00000000 */   nop
.L002000A4:
/* 1001A4 002000A4 0A000324 */  addiu      $3, $0, 0xA
/* 1001A8 002000A8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001AC 002000AC 72EA23A4 */  sh         $3, -0x158E($at)
/* 1001B0 002000B0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001B4 002000B4 9CEA238C */  lw         $3, -0x1564($at)
/* 1001B8 002000B8 02006424 */  addiu      $4, $3, 0x2
/* 1001BC 002000BC 80180400 */  sll        $3, $4, 2
/* 1001C0 002000C0 21186400 */  addu       $3, $3, $4
/* 1001C4 002000C4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001C8 002000C8 90EA23AC */  sw         $3, -0x1570($at)
/* 1001CC 002000CC 0B000010 */  b          .L002000FC
/* 1001D0 002000D0 00000000 */   nop
.L002000D4:
/* 1001D4 002000D4 0A000324 */  addiu      $3, $0, 0xA
/* 1001D8 002000D8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001DC 002000DC 72EA23A4 */  sh         $3, -0x158E($at)
/* 1001E0 002000E0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001E4 002000E4 9CEA238C */  lw         $3, -0x1564($at)
/* 1001E8 002000E8 02006424 */  addiu      $4, $3, 0x2
/* 1001EC 002000EC 80180400 */  sll        $3, $4, 2
/* 1001F0 002000F0 21186400 */  addu       $3, $3, $4
/* 1001F4 002000F4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 1001F8 002000F8 90EA23AC */  sw         $3, -0x1570($at)
.L002000FC:
/* 1001FC 002000FC 2000BF7B */  lq         $31, 0x20($sp)
/* 100200 00200100 1000B17B */  lq         $17, 0x10($sp)
/* 100204 00200104 0000B07B */  lq         $16, 0x0($sp)
/* 100208 00200108 3001BD27 */  addiu      $sp, $sp, 0x130
/* 10020C 0020010C 0800E003 */  jr         $31
/* 100210 00200110 00000000 */   nop
/* 100214 00200114 00000000 */  nop
/* 100218 00200118 00000000 */  nop
/* 10021C 0020011C 00000000 */  nop
