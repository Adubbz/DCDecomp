.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandEVENT__FPPv
/* 03AD90 0013AC90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03AD94 0013AC94 0000BF7F */  sq          $31, 0x0($29)
/* 03AD98 0013AC98 0400838C */  lw          $3, 0x4($4)
/* 03AD9C 0013AC9C 0000658C */  lw          $5, 0x0($3)
/* 03ADA0 0013ACA0 0900A004 */  bltz        $5, .L0013ACC8
/* 03ADA4 0013ACA4 00000000 */   nop
/* 03ADA8 0013ACA8 0000838C */  lw          $3, 0x0($4)
/* 03ADAC 0013ACAC 0800828C */  lw          $2, 0x8($4)
/* 03ADB0 0013ACB0 A08C848F */  lw          $4, -0x7360($28)
/* 03ADB4 0013ACB4 00006CC4 */  lwc1        $f12, 0x0($3)
/* 03ADB8 0013ACB8 0000468C */  lw          $6, 0x0($2)
/* 03ADBC 0013ACBC C88C878F */  lw          $7, -0x7338($28)
/* 03ADC0 0013ACC0 90E0040C */  jal         SetEvent__10CCharacterFfiii
/* 03ADC4 0013ACC4 00000000 */   nop
.L0013ACC8:
/* 03ADC8 0013ACC8 0000BF7B */  lq          $31, 0x0($29)
/* 03ADCC 0013ACCC 1000BD27 */  addiu       $29, $29, 0x10
/* 03ADD0 0013ACD0 0800E003 */  jr          $31
/* 03ADD4 0013ACD4 00000000 */   nop
/* 03ADD8 0013ACD8 00000000 */  nop
/* 03ADDC 0013ACDC 00000000 */  nop
