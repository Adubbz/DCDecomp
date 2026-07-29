.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndAmbientPlay__Fi
/* 05B210 0015B110 E0FFBD27 */  addiu       $29, $29, -0x20
/* 05B214 0015B114 1000BF7F */  sq          $31, 0x10($29)
/* 05B218 0015B118 0000B07F */  sq          $16, 0x0($29)
/* 05B21C 0015B11C 28868070 */  paddub      $16, $4, $0
/* 05B220 0015B120 208E838F */  lw          $3, -0x71E0($28)
/* 05B224 0015B124 05007014 */  bne         $3, $16, .L0015B13C
/* 05B228 0015B128 00000000 */   nop
/* 05B22C 0015B12C 288E848F */  lw          $4, -0x71D8($28)
/* 05B230 0015B130 01000324 */  addiu       $3, $0, 0x1
/* 05B234 0015B134 0E008310 */  beq         $4, $3, .L0015B170
/* 05B238 0015B138 00000000 */   nop
.L0015B13C:
/* 05B23C 0015B13C 646C050C */  jal         SndAmbientStop__Fv
/* 05B240 0015B140 00000000 */   nop
/* 05B244 0015B144 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05B248 0015B148 01000524 */  addiu       $5, $0, 0x1
/* 05B24C 0015B14C 28360072 */  paddub      $6, $16, $0
/* 05B250 0015B150 8814050C */  jal         SQ_Play__6CSoundFii
/* 05B254 0015B154 00000000 */   nop
/* 05B258 0015B158 208E90AF */  sw          $16, -0x71E0($28)
/* 05B25C 0015B15C A86C050C */  jal         SndGetAmbientDefaultVol__Fv
/* 05B260 0015B160 00000000 */   nop
/* 05B264 0015B164 248E82AF */  sw          $2, -0x71DC($28)
/* 05B268 0015B168 01000324 */  addiu       $3, $0, 0x1
/* 05B26C 0015B16C 288E83AF */  sw          $3, -0x71D8($28)
.L0015B170:
/* 05B270 0015B170 1000BF7B */  lq          $31, 0x10($29)
/* 05B274 0015B174 0000B07B */  lq          $16, 0x0($29)
/* 05B278 0015B178 2000BD27 */  addiu       $29, $29, 0x20
/* 05B27C 0015B17C 0800E003 */  jr          $31
/* 05B280 0015B180 00000000 */   nop
/* 05B284 0015B184 00000000 */  nop
/* 05B288 0015B188 00000000 */  nop
/* 05B28C 0015B18C 00000000 */  nop
