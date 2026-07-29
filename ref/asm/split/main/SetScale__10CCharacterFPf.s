.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetScale__10CCharacterFPf
/* 0393E0 001392E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0393E4 001392E4 0000BF7F */  sq          $31, 0x0($29)
/* 0393E8 001392E8 0000ACC4 */  lwc1        $f12, 0x0($5)
/* 0393EC 001392EC 0400ADC4 */  lwc1        $f13, 0x4($5)
/* 0393F0 001392F0 0800AEC4 */  lwc1        $f14, 0x8($5)
/* 0393F4 001392F4 94E4040C */  jal         SetScale__10CCharacterFfff
/* 0393F8 001392F8 00000000 */   nop
/* 0393FC 001392FC 0000BF7B */  lq          $31, 0x0($29)
/* 039400 00139300 1000BD27 */  addiu       $29, $29, 0x10
/* 039404 00139304 0800E003 */  jr          $31
/* 039408 00139308 00000000 */   nop
/* 03940C 0013930C 00000000 */  nop
