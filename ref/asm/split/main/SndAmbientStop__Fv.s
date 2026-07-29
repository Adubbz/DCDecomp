.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndAmbientStop__Fv
/* 05B290 0015B190 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05B294 0015B194 0000BF7F */  sq          $31, 0x0($29)
/* 05B298 0015B198 208E838F */  lw          $3, -0x71E0($28)
/* 05B29C 0015B19C 09006004 */  bltz        $3, .L0015B1C4
/* 05B2A0 0015B1A0 00000000 */   nop
/* 05B2A4 0015B1A4 288E838F */  lw          $3, -0x71D8($28)
/* 05B2A8 0015B1A8 06006010 */  beqz        $3, .L0015B1C4
/* 05B2AC 0015B1AC 00000000 */   nop
/* 05B2B0 0015B1B0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05B2B4 0015B1B4 01000524 */  addiu       $5, $0, 0x1
/* 05B2B8 0015B1B8 441A050C */  jal         Stop__6CSoundFi
/* 05B2BC 0015B1BC 00000000 */   nop
/* 05B2C0 0015B1C0 288E80AF */  sw          $0, -0x71D8($28)
.L0015B1C4:
/* 05B2C4 0015B1C4 0000BF7B */  lq          $31, 0x0($29)
/* 05B2C8 0015B1C8 1000BD27 */  addiu       $29, $29, 0x10
/* 05B2CC 0015B1CC 0800E003 */  jr          $31
/* 05B2D0 0015B1D0 00000000 */   nop
/* 05B2D4 0015B1D4 00000000 */  nop
/* 05B2D8 0015B1D8 00000000 */  nop
/* 05B2DC 0015B1DC 00000000 */  nop
