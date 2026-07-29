.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdGetLYf__Fi
/* 0699F0 001698F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0699F4 001698F4 0000BF7F */  sq          $31, 0x0($29)
/* 0699F8 001698F8 F0A5050C */  jal         check_key_mode__Fi
/* 0699FC 001698FC 00000000 */   nop
/* 069A00 00169900 07004010 */  beqz        $2, .L00169920
/* 069A04 00169904 00000000 */   nop
/* 069A08 00169908 CC01023C */  lui         $2, %hi(GamePad)
/* 069A0C 0016990C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 069A10 00169910 D4AD040C */  jal         GetLYf__8CGamePadFv
/* 069A14 00169914 00000000 */   nop
/* 069A18 00169918 02000010 */  b           .L00169924
/* 069A1C 0016991C 00000000 */   nop
.L00169920:
/* 069A20 00169920 00008044 */  mtc1        $0, $f0
.L00169924:
/* 069A24 00169924 0000BF7B */  lq          $31, 0x0($29)
/* 069A28 00169928 1000BD27 */  addiu       $29, $29, 0x10
/* 069A2C 0016992C 0800E003 */  jr          $31
/* 069A30 00169930 00000000 */   nop
/* 069A34 00169934 00000000 */  nop
/* 069A38 00169938 00000000 */  nop
/* 069A3C 0016993C 00000000 */  nop
