.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyEndSave__Fv
/* 121BB0 00221AB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 121BB4 00221AB4 0000BF7F */  sq         $31, 0x0($sp)
/* 121BB8 00221AB8 CC01023C */  lui        $2, %hi(GamePad)
/* 121BBC 00221ABC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121BC0 00221AC0 40000524 */  addiu      $5, $0, 0x40
/* 121BC4 00221AC4 1CAE040C */  jal        Down__8CGamePadFi
/* 121BC8 00221AC8 00000000 */   nop
/* 121BCC 00221ACC 08004014 */  bnez       $2, .L00221AF0
/* 121BD0 00221AD0 00000000 */   nop
/* 121BD4 00221AD4 CC01023C */  lui        $2, %hi(GamePad)
/* 121BD8 00221AD8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 121BDC 00221ADC 20000524 */  addiu      $5, $0, 0x20
/* 121BE0 00221AE0 1CAE040C */  jal        Down__8CGamePadFi
/* 121BE4 00221AE4 00000000 */   nop
/* 121BE8 00221AE8 09004010 */  beqz       $2, .L00221B10
/* 121BEC 00221AEC 00000000 */   nop
.L00221AF0:
/* 121BF0 00221AF0 DB01023C */  lui        $2, %hi(McAccess)
/* 121BF4 00221AF4 80824424 */  addiu      $4, $2, %lo(McAccess)
/* 121BF8 00221AF8 01000524 */  addiu      $5, $0, 0x1
/* 121BFC 00221AFC E44E080C */  jal        SetFuncNo__17CMemoryCardAccessFi
/* 121C00 00221B00 00000000 */   nop
/* 121C04 00221B04 07000224 */  addiu      $2, $0, 0x7
/* 121C08 00221B08 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 121C0C 00221B0C D48A22AC */  sw         $2, -0x752C($at)
.L00221B10:
/* 121C10 00221B10 01000224 */  addiu      $2, $0, 0x1
/* 121C14 00221B14 0000BF7B */  lq         $31, 0x0($sp)
/* 121C18 00221B18 1000BD27 */  addiu      $sp, $sp, 0x10
/* 121C1C 00221B1C 0800E003 */  jr         $31
/* 121C20 00221B20 00000000 */   nop
/* 121C24 00221B24 00000000 */  nop
/* 121C28 00221B28 00000000 */  nop
/* 121C2C 00221B2C 00000000 */  nop
