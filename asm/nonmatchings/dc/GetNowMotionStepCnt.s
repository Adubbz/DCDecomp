.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowMotionStepCnt__Fi
/* 10DF80 0020DE80 28160070 */  paddub     $2, $0, $0
/* 10DF84 0020DE84 40008330 */  andi       $3, $4, 0x40
/* 10DF88 0020DE88 02006010 */  beqz       $3, .L0020DE94
/* 10DF8C 0020DE8C 00000000 */   nop
/* 10DF90 0020DE90 01000224 */  addiu      $2, $0, 0x1
.L0020DE94:
/* 10DF94 0020DE94 04008330 */  andi       $3, $4, 0x4
/* 10DF98 0020DE98 04006014 */  bnez       $3, .L0020DEAC
/* 10DF9C 0020DE9C 00000000 */   nop
/* 10DFA0 0020DEA0 02008330 */  andi       $3, $4, 0x2
/* 10DFA4 0020DEA4 02006010 */  beqz       $3, .L0020DEB0
/* 10DFA8 0020DEA8 00000000 */   nop
.L0020DEAC:
/* 10DFAC 0020DEAC 02000224 */  addiu      $2, $0, 0x2
.L0020DEB0:
/* 10DFB0 0020DEB0 0800E003 */  jr         $31
/* 10DFB4 0020DEB4 00000000 */   nop
/* 10DFB8 0020DEB8 00000000 */  nop
/* 10DFBC 0020DEBC 00000000 */  nop
