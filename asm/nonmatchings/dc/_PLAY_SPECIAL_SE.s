.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _PLAY_SPECIAL_SE__FP12RS_STACKDATAi
/* 96380 00196280 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 96384 00196284 3000BF7F */  sq         $31, 0x30($sp)
/* 96388 00196288 2000B27F */  sq         $18, 0x20($sp)
/* 9638C 0019628C 1000B17F */  sq         $17, 0x10($sp)
/* 96390 00196290 0000B07F */  sq         $16, 0x0($sp)
/* 96394 00196294 288EA070 */  paddub     $17, $5, $0
/* 96398 00196298 08009224 */  addiu      $18, $4, 0x8
/* 9639C 0019629C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 963A0 001962A0 00000000 */   nop
/* 963A4 001962A4 28864070 */  paddub     $16, $2, $0
/* 963A8 001962A8 FFFF0224 */  addiu      $2, $0, -0x1
/* 963AC 001962AC 0200232A */  slti       $3, $17, 0x2
/* 963B0 001962B0 04006014 */  bnez       $3, .L001962C4
/* 963B4 001962B4 00000000 */   nop
/* 963B8 001962B8 28264072 */  paddub     $4, $18, $0
/* 963BC 001962BC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 963C0 001962C0 00000000 */   nop
.L001962C4:
/* 963C4 001962C4 28260072 */  paddub     $4, $16, $0
/* 963C8 001962C8 282E4070 */  paddub     $5, $2, $0
/* 963CC 001962CC 206E050C */  jal        SndSPSePlay__Fii
/* 963D0 001962D0 00000000 */   nop
/* 963D4 001962D4 01000224 */  addiu      $2, $0, 0x1
/* 963D8 001962D8 3000BF7B */  lq         $31, 0x30($sp)
/* 963DC 001962DC 2000B27B */  lq         $18, 0x20($sp)
/* 963E0 001962E0 1000B17B */  lq         $17, 0x10($sp)
/* 963E4 001962E4 0000B07B */  lq         $16, 0x0($sp)
/* 963E8 001962E8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 963EC 001962EC 0800E003 */  jr         $31
/* 963F0 001962F0 00000000 */   nop
/* 963F4 001962F4 00000000 */  nop
/* 963F8 001962F8 00000000 */  nop
/* 963FC 001962FC 00000000 */  nop
