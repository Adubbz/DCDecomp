.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndPlayFootSound__FiiPf
/* 5AC90 0015AB90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5AC94 0015AB94 1000BF7F */  sq         $31, 0x10($sp)
/* 5AC98 0015AB98 0000B07F */  sq         $16, 0x0($sp)
/* 5AC9C 0015AB9C 2A180500 */  slt        $3, $0, $5
/* 5ACA0 0015ABA0 80100400 */  sll        $2, $4, 2
/* 5ACA4 0015ABA4 F4014224 */  addiu      $2, $2, 0x1F4
/* 5ACA8 0015ABA8 21806200 */  addu       $16, $3, $2
/* 5ACAC 0015ABAC 9643023C */  lui        $2, (0x43960000 >> 16)
/* 5ACB0 0015ABB0 00688244 */  mtc1       $2, $f13
/* 5ACB4 0015ABB4 4842023C */  lui        $2, (0x42480000 >> 16)
/* 5ACB8 0015ABB8 00608244 */  mtc1       $2, $f12
/* 5ACBC 0015ABBC 2800A427 */  addiu      $4, $sp, 0x28
/* 5ACC0 0015ABC0 2C00A527 */  addiu      $5, $sp, 0x2C
/* 5ACC4 0015ABC4 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* 5ACC8 0015ABC8 00000000 */   nop
/* 5ACCC 0015ABCC 28260072 */  paddub     $4, $16, $0
/* 5ACD0 0015ABD0 2800ACC7 */  lwc1       $f12, 0x28($sp)
/* 5ACD4 0015ABD4 2C00ADC7 */  lwc1       $f13, 0x2C($sp)
/* 5ACD8 0015ABD8 282E0070 */  paddub     $5, $0, $0
/* 5ACDC 0015ABDC D869050C */  jal        SndSePlay__Fiffi
/* 5ACE0 0015ABE0 00000000 */   nop
/* 5ACE4 0015ABE4 1000BF7B */  lq         $31, 0x10($sp)
/* 5ACE8 0015ABE8 0000B07B */  lq         $16, 0x0($sp)
/* 5ACEC 0015ABEC 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5ACF0 0015ABF0 0800E003 */  jr         $31
/* 5ACF4 0015ABF4 00000000 */   nop
/* 5ACF8 0015ABF8 00000000 */  nop
/* 5ACFC 0015ABFC 00000000 */  nop
