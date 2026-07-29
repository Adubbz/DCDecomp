.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndAmbientSetVol__Fi
/* 05B2E0 0015B1E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05B2E4 0015B1E4 0000BF7F */  sq          $31, 0x0($29)
/* 05B2E8 0015B1E8 28368070 */  paddub      $6, $4, $0
/* 05B2EC 0015B1EC 208E838F */  lw          $3, -0x71E0($28)
/* 05B2F0 0015B1F0 0F006004 */  bltz        $3, .L0015B230
/* 05B2F4 0015B1F4 00000000 */   nop
/* 05B2F8 0015B1F8 248E838F */  lw          $3, -0x71DC($28)
/* 05B2FC 0015B1FC 0C006610 */  beq         $3, $6, .L0015B230
/* 05B300 0015B200 00000000 */   nop
/* 05B304 0015B204 0A00C004 */  bltz        $6, .L0015B230
/* 05B308 0015B208 00000000 */   nop
/* 05B30C 0015B20C 8000C128 */  slti        $1, $6, 0x80
/* 05B310 0015B210 02002014 */  bnez        $1, .L0015B21C
/* 05B314 0015B214 00000000 */   nop
/* 05B318 0015B218 7F000624 */  addiu       $6, $0, 0x7F
.L0015B21C:
/* 05B31C 0015B21C 248E86AF */  sw          $6, -0x71DC($28)
/* 05B320 0015B220 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05B324 0015B224 01000524 */  addiu       $5, $0, 0x1
/* 05B328 0015B228 581A050C */  jal         SetVol__6CSoundFii
/* 05B32C 0015B22C 00000000 */   nop
.L0015B230:
/* 05B330 0015B230 0000BF7B */  lq          $31, 0x0($29)
/* 05B334 0015B234 1000BD27 */  addiu       $29, $29, 0x10
/* 05B338 0015B238 0800E003 */  jr          $31
/* 05B33C 0015B23C 00000000 */   nop
