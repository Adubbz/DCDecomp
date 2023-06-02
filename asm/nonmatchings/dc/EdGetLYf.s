.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetLYf__Fi
/* 699F0 001698F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 699F4 001698F4 0000BF7F */  sq         $31, 0x0($sp)
/* 699F8 001698F8 F0A5050C */  jal        check_key_mode__Fi
/* 699FC 001698FC 00000000 */   nop
/* 69A00 00169900 07004010 */  beqz       $2, .L00169920
/* 69A04 00169904 00000000 */   nop
/* 69A08 00169908 CC01023C */  lui        $2, %hi(GamePad)
/* 69A0C 0016990C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 69A10 00169910 D4AD040C */  jal        GetLYf__8CGamePadFv
/* 69A14 00169914 00000000 */   nop
/* 69A18 00169918 02000010 */  b          .L00169924
/* 69A1C 0016991C 00000000 */   nop
.L00169920:
/* 69A20 00169920 00008044 */  mtc1       $0, $f0
.L00169924:
/* 69A24 00169924 0000BF7B */  lq         $31, 0x0($sp)
/* 69A28 00169928 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69A2C 0016992C 0800E003 */  jr         $31
/* 69A30 00169930 00000000 */   nop
/* 69A34 00169934 00000000 */  nop
/* 69A38 00169938 00000000 */  nop
/* 69A3C 0016993C 00000000 */  nop
