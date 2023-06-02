.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetVol__6CSoundFii
/* 46A60 00146960 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 46A64 00146964 0000BF7F */  sq         $31, 0x0($sp)
/* 46A68 00146968 B000A424 */  addiu      $4, $5, 0xB0
/* 46A6C 0014696C 282EC070 */  paddub     $5, $6, $0
/* 46A70 00146970 801E050C */  jal        ezMidi__Fii
/* 46A74 00146974 00000000 */   nop
/* 46A78 00146978 0000BF7B */  lq         $31, 0x0($sp)
/* 46A7C 0014697C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 46A80 00146980 0800E003 */  jr         $31
/* 46A84 00146984 00000000 */   nop
/* 46A88 00146988 00000000 */  nop
/* 46A8C 0014698C 00000000 */  nop
