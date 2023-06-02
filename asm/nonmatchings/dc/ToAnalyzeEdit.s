.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ToAnalyzeEdit__Fv
/* 112E10 00212D10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 112E14 00212D14 0000BF7F */  sq         $31, 0x0($sp)
/* 112E18 00212D18 CC01023C */  lui        $2, %hi(GamePad)
/* 112E1C 00212D1C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 112E20 00212D20 0CAD040C */  jal        AllOn__8CGamePadFv
/* 112E24 00212D24 00000000 */   nop
/* 112E28 00212D28 06004010 */  beqz       $2, .L00212D44
/* 112E2C 00212D2C 00000000 */   nop
/* 112E30 00212D30 02000324 */  addiu      $3, $0, 0x2
/* 112E34 00212D34 709683A7 */  sh         $3, -0x6990($gp)
/* 112E38 00212D38 5C96838F */  lw         $3, -0x69A4($gp)
/* 112E3C 00212D3C 04006324 */  addiu      $3, $3, 0x4
/* 112E40 00212D40 5C9683AF */  sw         $3, -0x69A4($gp)
.L00212D44:
/* 112E44 00212D44 0000BF7B */  lq         $31, 0x0($sp)
/* 112E48 00212D48 1000BD27 */  addiu      $sp, $sp, 0x10
/* 112E4C 00212D4C 0800E003 */  jr         $31
/* 112E50 00212D50 00000000 */   nop
/* 112E54 00212D54 00000000 */  nop
/* 112E58 00212D58 00000000 */  nop
/* 112E5C 00212D5C 00000000 */  nop
