.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel WeaponMenuActWepKey__Fv
/* 0FFB90 001FFA90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0FFB94 001FFA94 0000BF7F */  sq          $31, 0x0($29)
/* 0FFB98 001FFA98 CC01023C */  lui         $2, %hi(GamePad)
/* 0FFB9C 001FFA9C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FFBA0 001FFAA0 00200524 */  addiu       $5, $0, 0x2000
/* 0FFBA4 001FFAA4 1CAE040C */  jal         Down__8CGamePadFi
/* 0FFBA8 001FFAA8 00000000 */   nop
/* 0FFBAC 001FFAAC 0D004010 */  beqz        $2, .L001FFAE4
/* 0FFBB0 001FFAB0 00000000 */   nop
/* 0FFBB4 001FFAB4 0A000324 */  addiu       $3, $0, 0xA
/* 0FFBB8 001FFAB8 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FFBBC 001FFABC 72EA23A4 */  sh          $3, %lo(WepMenu + 0x2)($1)
/* 0FFBC0 001FFAC0 DA01013C */  lui         $1, %hi(WepMenu + 0x2C)
/* 0FFBC4 001FFAC4 9CEA248C */  lw          $4, %lo(WepMenu + 0x2C)($1)
/* 0FFBC8 001FFAC8 80180400 */  sll         $3, $4, 2
/* 0FFBCC 001FFACC 21186400 */  addu        $3, $3, $4
/* 0FFBD0 001FFAD0 0A006324 */  addiu       $3, $3, 0xA
/* 0FFBD4 001FFAD4 DA01013C */  lui         $1, %hi(WepMenu + 0x20)
/* 0FFBD8 001FFAD8 90EA23AC */  sw          $3, %lo(WepMenu + 0x20)($1)
/* 0FFBDC 001FFADC 1B000010 */  b           .L001FFB4C
/* 0FFBE0 001FFAE0 00000000 */   nop
.L001FFAE4:
/* 0FFBE4 001FFAE4 CC01023C */  lui         $2, %hi(GamePad)
/* 0FFBE8 001FFAE8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FFBEC 001FFAEC 00400524 */  addiu       $5, $0, 0x4000
/* 0FFBF0 001FFAF0 1CAE040C */  jal         Down__8CGamePadFi
/* 0FFBF4 001FFAF4 00000000 */   nop
/* 0FFBF8 001FFAF8 08004010 */  beqz        $2, .L001FFB1C
/* 0FFBFC 001FFAFC 00000000 */   nop
/* 0FFC00 001FFB00 0B000324 */  addiu       $3, $0, 0xB
/* 0FFC04 001FFB04 DA01013C */  lui         $1, %hi(WepMenu + 0x2)
/* 0FFC08 001FFB08 72EA23A4 */  sh          $3, %lo(WepMenu + 0x2)($1)
/* 0FFC0C 001FFB0C DA01013C */  lui         $1, %hi(WepMenu + 0x179)
/* 0FFC10 001FFB10 E9EB20A0 */  sb          $0, %lo(WepMenu + 0x179)($1)
/* 0FFC14 001FFB14 0D000010 */  b           .L001FFB4C
/* 0FFC18 001FFB18 00000000 */   nop
.L001FFB1C:
/* 0FFC1C 001FFB1C CC01023C */  lui         $2, %hi(GamePad)
/* 0FFC20 001FFB20 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0FFC24 001FFB24 20000524 */  addiu       $5, $0, 0x20
/* 0FFC28 001FFB28 1CAE040C */  jal         Down__8CGamePadFi
/* 0FFC2C 001FFB2C 00000000 */   nop
/* 0FFC30 001FFB30 06004010 */  beqz        $2, .L001FFB4C
/* 0FFC34 001FFB34 00000000 */   nop
/* 0FFC38 001FFB38 02000424 */  addiu       $4, $0, 0x2
/* 0FFC3C 001FFB3C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0FFC40 001FFB40 00000000 */   nop
/* 0FFC44 001FFB44 ACFD070C */  jal         WepAttachHaveCancel__Fv
/* 0FFC48 001FFB48 00000000 */   nop
.L001FFB4C:
/* 0FFC4C 001FFB4C 0000BF7B */  lq          $31, 0x0($29)
/* 0FFC50 001FFB50 1000BD27 */  addiu       $29, $29, 0x10
/* 0FFC54 001FFB54 0800E003 */  jr          $31
/* 0FFC58 001FFB58 00000000 */   nop
/* 0FFC5C 001FFB5C 00000000 */  nop
