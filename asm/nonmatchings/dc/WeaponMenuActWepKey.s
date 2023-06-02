.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WeaponMenuActWepKey__Fv
/* FFB90 001FFA90 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* FFB94 001FFA94 0000BF7F */  sq         $31, 0x0($sp)
/* FFB98 001FFA98 CC01023C */  lui        $2, %hi(GamePad)
/* FFB9C 001FFA9C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFBA0 001FFAA0 00200524 */  addiu      $5, $0, 0x2000
/* FFBA4 001FFAA4 1CAE040C */  jal        Down__8CGamePadFi
/* FFBA8 001FFAA8 00000000 */   nop
/* FFBAC 001FFAAC 0D004010 */  beqz       $2, .L001FFAE4
/* FFBB0 001FFAB0 00000000 */   nop
/* FFBB4 001FFAB4 0A000324 */  addiu      $3, $0, 0xA
/* FFBB8 001FFAB8 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFBBC 001FFABC 72EA23A4 */  sh         $3, -0x158E($at)
/* FFBC0 001FFAC0 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFBC4 001FFAC4 9CEA248C */  lw         $4, -0x1564($at)
/* FFBC8 001FFAC8 80180400 */  sll        $3, $4, 2
/* FFBCC 001FFACC 21186400 */  addu       $3, $3, $4
/* FFBD0 001FFAD0 0A006324 */  addiu      $3, $3, 0xA
/* FFBD4 001FFAD4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFBD8 001FFAD8 90EA23AC */  sw         $3, -0x1570($at)
/* FFBDC 001FFADC 1B000010 */  b          .L001FFB4C
/* FFBE0 001FFAE0 00000000 */   nop
.L001FFAE4:
/* FFBE4 001FFAE4 CC01023C */  lui        $2, %hi(GamePad)
/* FFBE8 001FFAE8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFBEC 001FFAEC 00400524 */  addiu      $5, $0, 0x4000
/* FFBF0 001FFAF0 1CAE040C */  jal        Down__8CGamePadFi
/* FFBF4 001FFAF4 00000000 */   nop
/* FFBF8 001FFAF8 08004010 */  beqz       $2, .L001FFB1C
/* FFBFC 001FFAFC 00000000 */   nop
/* FFC00 001FFB00 0B000324 */  addiu      $3, $0, 0xB
/* FFC04 001FFB04 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFC08 001FFB08 72EA23A4 */  sh         $3, -0x158E($at)
/* FFC0C 001FFB0C DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* FFC10 001FFB10 E9EB20A0 */  sb         $0, -0x1417($at)
/* FFC14 001FFB14 0D000010 */  b          .L001FFB4C
/* FFC18 001FFB18 00000000 */   nop
.L001FFB1C:
/* FFC1C 001FFB1C CC01023C */  lui        $2, %hi(GamePad)
/* FFC20 001FFB20 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* FFC24 001FFB24 20000524 */  addiu      $5, $0, 0x20
/* FFC28 001FFB28 1CAE040C */  jal        Down__8CGamePadFi
/* FFC2C 001FFB2C 00000000 */   nop
/* FFC30 001FFB30 06004010 */  beqz       $2, .L001FFB4C
/* FFC34 001FFB34 00000000 */   nop
/* FFC38 001FFB38 02000424 */  addiu      $4, $0, 0x2
/* FFC3C 001FFB3C BCB3080C */  jal        ComMenuSePlay__Fi
/* FFC40 001FFB40 00000000 */   nop
/* FFC44 001FFB44 ACFD070C */  jal        WepAttachHaveCancel__Fv
/* FFC48 001FFB48 00000000 */   nop
.L001FFB4C:
/* FFC4C 001FFB4C 0000BF7B */  lq         $31, 0x0($sp)
/* FFC50 001FFB50 1000BD27 */  addiu      $sp, $sp, 0x10
/* FFC54 001FFB54 0800E003 */  jr         $31
/* FFC58 001FFB58 00000000 */   nop
/* FFC5C 001FFB5C 00000000 */  nop
