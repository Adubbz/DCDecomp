.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_TALKNPC_INFO_ID__FP12RS_STACKDATAi
/* 91590 00191490 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 91594 00191494 1000BF7F */  sq         $31, 0x10($sp)
/* 91598 00191498 0000B07F */  sq         $16, 0x0($sp)
/* 9159C 0019149C 28868070 */  paddub     $16, $4, $0
/* 915A0 001914A0 0400A01C */  bgtz       $5, .L001914B4
/* 915A4 001914A4 00000000 */   nop
/* 915A8 001914A8 28160070 */  paddub     $2, $0, $0
/* 915AC 001914AC 08000010 */  b          .L001914D0
/* 915B0 001914B0 00000000 */   nop
.L001914B4:
/* 915B4 001914B4 2064060C */  jal        EdNowTalkCharaInfoID__Fv
/* 915B8 001914B8 00000000 */   nop
/* 915BC 001914BC 28260072 */  paddub     $4, $16, $0
/* 915C0 001914C0 282E4070 */  paddub     $5, $2, $0
/* 915C4 001914C4 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 915C8 001914C8 00000000 */   nop
/* 915CC 001914CC 01000224 */  addiu      $2, $0, 0x1
.L001914D0:
/* 915D0 001914D0 1000BF7B */  lq         $31, 0x10($sp)
/* 915D4 001914D4 0000B07B */  lq         $16, 0x0($sp)
/* 915D8 001914D8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 915DC 001914DC 0800E003 */  jr         $31
/* 915E0 001914E0 00000000 */   nop
/* 915E4 001914E4 00000000 */  nop
/* 915E8 001914E8 00000000 */  nop
/* 915EC 001914EC 00000000 */  nop
