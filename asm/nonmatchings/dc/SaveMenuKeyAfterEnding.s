.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyAfterEnding__Fv
/* 122370 00222270 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 122374 00222274 0000BF7F */  sq         $31, 0x0($sp)
/* 122378 00222278 CC01023C */  lui        $2, %hi(GamePad)
/* 12237C 0022227C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 122380 00222280 40000524 */  addiu      $5, $0, 0x40
/* 122384 00222284 1CAE040C */  jal        Down__8CGamePadFi
/* 122388 00222288 00000000 */   nop
/* 12238C 0022228C 06004010 */  beqz       $2, .L002222A8
/* 122390 00222290 00000000 */   nop
/* 122394 00222294 03000224 */  addiu      $2, $0, 0x3
/* 122398 00222298 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 12239C 0022229C D48A22AC */  sw         $2, -0x752C($at)
/* 1223A0 002222A0 0D000010 */  b          .L002222D8
/* 1223A4 002222A4 00000000 */   nop
.L002222A8:
/* 1223A8 002222A8 CC01023C */  lui        $2, %hi(GamePad)
/* 1223AC 002222AC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 1223B0 002222B0 20000524 */  addiu      $5, $0, 0x20
/* 1223B4 002222B4 1CAE040C */  jal        Down__8CGamePadFi
/* 1223B8 002222B8 00000000 */   nop
/* 1223BC 002222BC 06004010 */  beqz       $2, .L002222D8
/* 1223C0 002222C0 00000000 */   nop
/* 1223C4 002222C4 01000224 */  addiu      $2, $0, 0x1
/* 1223C8 002222C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 1223CC 002222CC D48A22AC */  sw         $2, -0x752C($at)
/* 1223D0 002222D0 607F080C */  jal        ExitSaveSelect__Fv
/* 1223D4 002222D4 00000000 */   nop
.L002222D8:
/* 1223D8 002222D8 01000224 */  addiu      $2, $0, 0x1
/* 1223DC 002222DC 0000BF7B */  lq         $31, 0x0($sp)
/* 1223E0 002222E0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 1223E4 002222E4 0800E003 */  jr         $31
/* 1223E8 002222E8 00000000 */   nop
/* 1223EC 002222EC 00000000 */  nop
