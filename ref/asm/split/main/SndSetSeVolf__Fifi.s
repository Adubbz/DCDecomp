.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSetSeVolf__Fifi
/* 05ABB0 0015AAB0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 05ABB4 0015AAB4 2000BF7F */  sq          $31, 0x20($29)
/* 05ABB8 0015AAB8 1000B17F */  sq          $17, 0x10($29)
/* 05ABBC 0015AABC 0000B07F */  sq          $16, 0x0($29)
/* 05ABC0 0015AAC0 288E8070 */  paddub      $17, $4, $0
/* 05ABC4 0015AAC4 2886A070 */  paddub      $16, $5, $0
/* 05ABC8 0015AAC8 2C68050C */  jal         GetSeInfo__Fi
/* 05ABCC 0015AACC 00000000 */   nop
/* 05ABD0 0015AAD0 08004010 */  beqz        $2, .L0015AAF4
/* 05ABD4 0015AAD4 00000000 */   nop
/* 05ABD8 0015AAD8 5C6A050C */  jal         SndGetVolf__Fif
/* 05ABDC 0015AADC 00000000 */   nop
/* 05ABE0 0015AAE0 28262072 */  paddub      $4, $17, $0
/* 05ABE4 0015AAE4 282E4070 */  paddub      $5, $2, $0
/* 05ABE8 0015AAE8 28360072 */  paddub      $6, $16, $0
/* 05ABEC 0015AAEC 406A050C */  jal         SndSetSeVol__Fiii
/* 05ABF0 0015AAF0 00000000 */   nop
.L0015AAF4:
/* 05ABF4 0015AAF4 2000BF7B */  lq          $31, 0x20($29)
/* 05ABF8 0015AAF8 1000B17B */  lq          $17, 0x10($29)
/* 05ABFC 0015AAFC 0000B07B */  lq          $16, 0x0($29)
/* 05AC00 0015AB00 3000BD27 */  addiu       $29, $29, 0x30
/* 05AC04 0015AB04 0800E003 */  jr          $31
/* 05AC08 0015AB08 00000000 */   nop
/* 05AC0C 0015AB0C 00000000 */  nop
