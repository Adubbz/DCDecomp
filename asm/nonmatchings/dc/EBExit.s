.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EBExit__Fv
/* 68660 00168560 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 68664 00168564 0000BF7F */  sq         $31, 0x0($sp)
/* 68668 00168568 9C8E80AF */  sw         $0, -0x7164($gp)
/* 6866C 0016856C A88E80AF */  sw         $0, -0x7158($gp)
/* 68670 00168570 CC01023C */  lui        $2, %hi(GamePad)
/* 68674 00168574 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 68678 00168578 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 6867C 0016857C 00000000 */   nop
/* 68680 00168580 A08E80AF */  sw         $0, -0x7160($gp)
/* 68684 00168584 AC8E80AF */  sw         $0, -0x7154($gp)
/* 68688 00168588 08A5050C */  jal        init_draw_ok__Fv
/* 6868C 0016858C 00000000 */   nop
.L00168590:
/* 68690 00168590 006E050C */  jal        SndSPSeSyncBG__Fv
/* 68694 00168594 00000000 */   nop
/* 68698 00168598 FDFF4014 */  bnez       $2, .L00168590
/* 6869C 0016859C 00000000 */   nop
/* 686A0 001685A0 94FA040C */  jal        InitReadBG__Fv
/* 686A4 001685A4 00000000 */   nop
/* 686A8 001685A8 0000BF7B */  lq         $31, 0x0($sp)
/* 686AC 001685AC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 686B0 001685B0 0800E003 */  jr         $31
/* 686B4 001685B4 00000000 */   nop
/* 686B8 001685B8 00000000 */  nop
/* 686BC 001685BC 00000000 */  nop
