.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__10CCharacterFPf
/* 0392E0 001391E0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0392E4 001391E4 0000BF7F */  sq          $31, 0x0($29)
/* 0392E8 001391E8 0000ACC4 */  lwc1        $f12, 0x0($5)
/* 0392EC 001391EC 0400ADC4 */  lwc1        $f13, 0x4($5)
/* 0392F0 001391F0 0800AEC4 */  lwc1        $f14, 0x8($5)
/* 0392F4 001391F4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 0392F8 001391F8 00000000 */   nop
/* 0392FC 001391FC 0000BF7B */  lq          $31, 0x0($29)
/* 039300 00139200 1000BD27 */  addiu       $29, $29, 0x10
/* 039304 00139204 0800E003 */  jr          $31
/* 039308 00139208 00000000 */   nop
/* 03930C 0013920C 00000000 */  nop
