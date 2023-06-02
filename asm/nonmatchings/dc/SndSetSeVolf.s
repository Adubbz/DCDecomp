.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSetSeVolf__Fifi
/* 5ABB0 0015AAB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5ABB4 0015AAB4 2000BF7F */  sq         $31, 0x20($sp)
/* 5ABB8 0015AAB8 1000B17F */  sq         $17, 0x10($sp)
/* 5ABBC 0015AABC 0000B07F */  sq         $16, 0x0($sp)
/* 5ABC0 0015AAC0 288E8070 */  paddub     $17, $4, $0
/* 5ABC4 0015AAC4 2886A070 */  paddub     $16, $5, $0
/* 5ABC8 0015AAC8 2C68050C */  jal        GetSeInfo__Fi
/* 5ABCC 0015AACC 00000000 */   nop
/* 5ABD0 0015AAD0 08004010 */  beqz       $2, .L0015AAF4
/* 5ABD4 0015AAD4 00000000 */   nop
/* 5ABD8 0015AAD8 5C6A050C */  jal        SndGetVolf__Fif
/* 5ABDC 0015AADC 00000000 */   nop
/* 5ABE0 0015AAE0 28262072 */  paddub     $4, $17, $0
/* 5ABE4 0015AAE4 282E4070 */  paddub     $5, $2, $0
/* 5ABE8 0015AAE8 28360072 */  paddub     $6, $16, $0
/* 5ABEC 0015AAEC 406A050C */  jal        SndSetSeVol__Fiii
/* 5ABF0 0015AAF0 00000000 */   nop
.L0015AAF4:
/* 5ABF4 0015AAF4 2000BF7B */  lq         $31, 0x20($sp)
/* 5ABF8 0015AAF8 1000B17B */  lq         $17, 0x10($sp)
/* 5ABFC 0015AAFC 0000B07B */  lq         $16, 0x0($sp)
/* 5AC00 0015AB00 3000BD27 */  addiu      $sp, $sp, 0x30
/* 5AC04 0015AB04 0800E003 */  jr         $31
/* 5AC08 0015AB08 00000000 */   nop
/* 5AC0C 0015AB0C 00000000 */  nop
