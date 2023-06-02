.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_TALKNPC_ID__FP12RS_STACKDATAi
/* 915F0 001914F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 915F4 001914F4 0000BF7F */  sq         $31, 0x0($sp)
/* 915F8 001914F8 0400A01C */  bgtz       $5, .L0019150C
/* 915FC 001914FC 00000000 */   nop
/* 91600 00191500 28160070 */  paddub     $2, $0, $0
/* 91604 00191504 06000010 */  b          .L00191520
/* 91608 00191508 00000000 */   nop
.L0019150C:
/* 9160C 0019150C D401013C */  lui        $at, (0x1D40000 >> 16)
/* 91610 00191510 30D4258C */  lw         $5, -0x2BD0($at)
/* 91614 00191514 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 91618 00191518 00000000 */   nop
/* 9161C 0019151C 01000224 */  addiu      $2, $0, 0x1
.L00191520:
/* 91620 00191520 0000BF7B */  lq         $31, 0x0($sp)
/* 91624 00191524 1000BD27 */  addiu      $sp, $sp, 0x10
/* 91628 00191528 0800E003 */  jr         $31
/* 9162C 0019152C 00000000 */   nop
