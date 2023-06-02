.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RotAngleSeq__10CActionSeqFff
/* 551B0 001550B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 551B4 001550B4 1000BF7F */  sq         $31, 0x10($sp)
/* 551B8 001550B8 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 551BC 001550BC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 551C0 001550C0 46650046 */  mov.s      $f21, $f12
/* 551C4 001550C4 066D0046 */  mov.s      $f20, $f13
/* 551C8 001550C8 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 551CC 001550CC 00000000 */   nop
/* 551D0 001550D0 08004010 */  beqz       $2, .L001550F4
/* 551D4 001550D4 00000000 */   nop
/* 551D8 001550D8 06000324 */  addiu      $3, $0, 0x6
/* 551DC 001550DC 000043AC */  sw         $3, 0x0($2)
/* 551E0 001550E0 100040AC */  sw         $0, 0x10($2)
/* 551E4 001550E4 140055E4 */  swc1       $f21, 0x14($2)
/* 551E8 001550E8 180040AC */  sw         $0, 0x18($2)
/* 551EC 001550EC 1C0054E4 */  swc1       $f20, 0x1C($2)
/* 551F0 001550F0 040040AC */  sw         $0, 0x4($2)
.L001550F4:
/* 551F4 001550F4 1000BF7B */  lq         $31, 0x10($sp)
/* 551F8 001550F8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 551FC 001550FC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 55200 00155100 2000BD27 */  addiu      $sp, $sp, 0x20
/* 55204 00155104 0800E003 */  jr         $31
/* 55208 00155108 00000000 */   nop
/* 5520C 0015510C 00000000 */  nop
