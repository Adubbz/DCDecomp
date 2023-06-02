.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterNameMake__Fi
/* 10EE90 0020ED90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 10EE94 0020ED94 1000BF7F */  sq         $31, 0x10($sp)
/* 10EE98 0020ED98 0000B07F */  sq         $16, 0x0($sp)
/* 10EE9C 0020ED9C 1896858F */  lw         $5, -0x69E8($gp)
/* 10EEA0 0020EDA0 1300A010 */  beqz       $5, .L0020EDF0
/* 10EEA4 0020EDA4 00000000 */   nop
/* 10EEA8 0020EDA8 B80B9024 */  addiu      $16, $4, 0xBB8
/* 10EEAC 0020EDAC BC16A38C */  lw         $3, 0x16BC($5)
/* 10EEB0 0020EDB0 0F007010 */  beq        $3, $16, .L0020EDF0
/* 10EEB4 0020EDB4 00000000 */   nop
/* 10EEB8 0020EDB8 2826A070 */  paddub     $4, $5, $0
/* 10EEBC 0020EDBC 282E0072 */  paddub     $5, $16, $0
/* 10EEC0 0020EDC0 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 10EEC4 0020EDC4 00000000 */   nop
/* 10EEC8 0020EDC8 B80B0324 */  addiu      $3, $0, 0xBB8
/* 10EECC 0020EDCC 05000316 */  bne        $16, $3, .L0020EDE4
/* 10EED0 0020EDD0 00000000 */   nop
/* 10EED4 0020EDD4 1896838F */  lw         $3, -0x69E8($gp)
/* 10EED8 0020EDD8 980060AC */  sw         $0, 0x98($3)
/* 10EEDC 0020EDDC 04000010 */  b          .L0020EDF0
/* 10EEE0 0020EDE0 00000000 */   nop
.L0020EDE4:
/* 10EEE4 0020EDE4 01000424 */  addiu      $4, $0, 0x1
/* 10EEE8 0020EDE8 1896838F */  lw         $3, -0x69E8($gp)
/* 10EEEC 0020EDEC 980064AC */  sw         $4, 0x98($3)
.L0020EDF0:
/* 10EEF0 0020EDF0 1000BF7B */  lq         $31, 0x10($sp)
/* 10EEF4 0020EDF4 0000B07B */  lq         $16, 0x0($sp)
/* 10EEF8 0020EDF8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 10EEFC 0020EDFC 0800E003 */  jr         $31
/* 10EF00 0020EE00 00000000 */   nop
/* 10EF04 0020EE04 00000000 */  nop
/* 10EF08 0020EE08 00000000 */  nop
/* 10EF0C 0020EE0C 00000000 */  nop
