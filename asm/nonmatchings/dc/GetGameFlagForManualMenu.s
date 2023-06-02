.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGameFlagForManualMenu__Fv
/* 133660 00233560 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 133664 00233564 1000BF7F */  sq         $31, 0x10($sp)
/* 133668 00233568 0000B07F */  sq         $16, 0x0($sp)
/* 13366C 0023356C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 133670 00233570 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 133674 00233574 00000000 */   nop
/* 133678 00233578 04004014 */  bnez       $2, .L0023358C
/* 13367C 0023357C 00000000 */   nop
/* 133680 00233580 01000224 */  addiu      $2, $0, 0x1
/* 133684 00233584 0A000010 */  b          .L002335B0
/* 133688 00233588 00000000 */   nop
.L0023358C:
/* 13368C 0023358C 28860070 */  paddub     $16, $0, $0
/* 133690 00233590 28264070 */  paddub     $4, $2, $0
/* 133694 00233594 FD000524 */  addiu      $5, $0, 0xFD
/* 133698 00233598 50F6060C */  jal        SearchItemIndexNo__14CDngStatusDataFi
/* 13369C 0023359C 00000000 */   nop
/* 1336A0 002335A0 02004004 */  bltz       $2, .L002335AC
/* 1336A4 002335A4 00000000 */   nop
/* 1336A8 002335A8 01001026 */  addiu      $16, $16, 0x1
.L002335AC:
/* 1336AC 002335AC 28160072 */  paddub     $2, $16, $0
.L002335B0:
/* 1336B0 002335B0 1000BF7B */  lq         $31, 0x10($sp)
/* 1336B4 002335B4 0000B07B */  lq         $16, 0x0($sp)
/* 1336B8 002335B8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1336BC 002335BC 0800E003 */  jr         $31
/* 1336C0 002335C0 00000000 */   nop
/* 1336C4 002335C4 00000000 */  nop
/* 1336C8 002335C8 00000000 */  nop
/* 1336CC 002335CC 00000000 */  nop
