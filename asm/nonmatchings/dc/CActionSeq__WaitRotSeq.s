.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WaitRotSeq__10CActionSeqFv
/* 552A0 001551A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 552A4 001551A4 0000BF7F */  sq         $31, 0x0($sp)
/* 552A8 001551A8 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 552AC 001551AC 00000000 */   nop
/* 552B0 001551B0 04004010 */  beqz       $2, .L001551C4
/* 552B4 001551B4 00000000 */   nop
/* 552B8 001551B8 08000324 */  addiu      $3, $0, 0x8
/* 552BC 001551BC 000043AC */  sw         $3, 0x0($2)
/* 552C0 001551C0 040040AC */  sw         $0, 0x4($2)
.L001551C4:
/* 552C4 001551C4 0000BF7B */  lq         $31, 0x0($sp)
/* 552C8 001551C8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 552CC 001551CC 0800E003 */  jr         $31
/* 552D0 001551D0 00000000 */   nop
/* 552D4 001551D4 00000000 */  nop
/* 552D8 001551D8 00000000 */  nop
/* 552DC 001551DC 00000000 */  nop
