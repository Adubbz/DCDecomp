.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RotAngleSeq__10CActionSeqFff
/* 0551B0 001550B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0551B4 001550B4 1000BF7F */  sq          $31, 0x10($29)
/* 0551B8 001550B8 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0551BC 001550BC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0551C0 001550C0 46650046 */  mov.s       $f21, $f12
/* 0551C4 001550C4 066D0046 */  mov.s       $f20, $f13
/* 0551C8 001550C8 4053050C */  jal         NextMoveSeq__10CActionSeqFv
/* 0551CC 001550CC 00000000 */   nop
/* 0551D0 001550D0 08004010 */  beqz        $2, .L001550F4
/* 0551D4 001550D4 00000000 */   nop
/* 0551D8 001550D8 06000324 */  addiu       $3, $0, 0x6
/* 0551DC 001550DC 000043AC */  sw          $3, 0x0($2)
/* 0551E0 001550E0 100040AC */  sw          $0, 0x10($2)
/* 0551E4 001550E4 140055E4 */  swc1        $f21, 0x14($2)
/* 0551E8 001550E8 180040AC */  sw          $0, 0x18($2)
/* 0551EC 001550EC 1C0054E4 */  swc1        $f20, 0x1C($2)
/* 0551F0 001550F0 040040AC */  sw          $0, 0x4($2)
.L001550F4:
/* 0551F4 001550F4 1000BF7B */  lq          $31, 0x10($29)
/* 0551F8 001550F8 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0551FC 001550FC 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 055200 00155100 2000BD27 */  addiu       $29, $29, 0x20
/* 055204 00155104 0800E003 */  jr          $31
/* 055208 00155108 00000000 */   nop
/* 05520C 0015510C 00000000 */  nop
