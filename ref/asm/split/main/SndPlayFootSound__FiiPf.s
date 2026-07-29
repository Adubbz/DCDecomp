.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndPlayFootSound__FiiPf
/* 05AC90 0015AB90 D0FFBD27 */  addiu       $29, $29, -0x30
/* 05AC94 0015AB94 1000BF7F */  sq          $31, 0x10($29)
/* 05AC98 0015AB98 0000B07F */  sq          $16, 0x0($29)
/* 05AC9C 0015AB9C 2A180500 */  slt         $3, $0, $5
/* 05ACA0 0015ABA0 80100400 */  sll         $2, $4, 2
/* 05ACA4 0015ABA4 F4014224 */  addiu       $2, $2, 0x1F4
/* 05ACA8 0015ABA8 21806200 */  addu        $16, $3, $2
/* 05ACAC 0015ABAC 9643023C */  lui         $2, (0x43960000 >> 16)
/* 05ACB0 0015ABB0 00688244 */  mtc1        $2, $f13
/* 05ACB4 0015ABB4 4842023C */  lui         $2, (0x42480000 >> 16)
/* 05ACB8 0015ABB8 00608244 */  mtc1        $2, $f12
/* 05ACBC 0015ABBC 2800A427 */  addiu       $4, $29, 0x28
/* 05ACC0 0015ABC0 2C00A527 */  addiu       $5, $29, 0x2C
/* 05ACC4 0015ABC4 006B050C */  jal         SndGetVolPan__FPfPfPfff
/* 05ACC8 0015ABC8 00000000 */   nop
/* 05ACCC 0015ABCC 28260072 */  paddub      $4, $16, $0
/* 05ACD0 0015ABD0 2800ACC7 */  lwc1        $f12, 0x28($29)
/* 05ACD4 0015ABD4 2C00ADC7 */  lwc1        $f13, 0x2C($29)
/* 05ACD8 0015ABD8 282E0070 */  paddub      $5, $0, $0
/* 05ACDC 0015ABDC D869050C */  jal         SndSePlay__Fiffi
/* 05ACE0 0015ABE0 00000000 */   nop
/* 05ACE4 0015ABE4 1000BF7B */  lq          $31, 0x10($29)
/* 05ACE8 0015ABE8 0000B07B */  lq          $16, 0x0($29)
/* 05ACEC 0015ABEC 3000BD27 */  addiu       $29, $29, 0x30
/* 05ACF0 0015ABF0 0800E003 */  jr          $31
/* 05ACF4 0015ABF4 00000000 */   nop
/* 05ACF8 0015ABF8 00000000 */  nop
/* 05ACFC 0015ABFC 00000000 */  nop
