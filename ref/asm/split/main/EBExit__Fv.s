.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EBExit__Fv
/* 068660 00168560 F0FFBD27 */  addiu       $29, $29, -0x10
/* 068664 00168564 0000BF7F */  sq          $31, 0x0($29)
/* 068668 00168568 9C8E80AF */  sw          $0, -0x7164($28)
/* 06866C 0016856C A88E80AF */  sw          $0, -0x7158($28)
/* 068670 00168570 CC01023C */  lui         $2, %hi(GamePad)
/* 068674 00168574 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 068678 00168578 4CAE040C */  jal         MenuModeOff__8CGamePadFv
/* 06867C 0016857C 00000000 */   nop
/* 068680 00168580 A08E80AF */  sw          $0, -0x7160($28)
/* 068684 00168584 AC8E80AF */  sw          $0, -0x7154($28)
/* 068688 00168588 08A5050C */  jal         init_draw_ok__Fv
/* 06868C 0016858C 00000000 */   nop
.L00168590:
/* 068690 00168590 006E050C */  jal         SndSPSeSyncBG__Fv
/* 068694 00168594 00000000 */   nop
/* 068698 00168598 FDFF4014 */  bnez        $2, .L00168590
/* 06869C 0016859C 00000000 */   nop
/* 0686A0 001685A0 94FA040C */  jal         InitReadBG__Fv
/* 0686A4 001685A4 00000000 */   nop
/* 0686A8 001685A8 0000BF7B */  lq          $31, 0x0($29)
/* 0686AC 001685AC 1000BD27 */  addiu       $29, $29, 0x10
/* 0686B0 001685B0 0800E003 */  jr          $31
/* 0686B4 001685B4 00000000 */   nop
/* 0686B8 001685B8 00000000 */  nop
/* 0686BC 001685BC 00000000 */  nop
