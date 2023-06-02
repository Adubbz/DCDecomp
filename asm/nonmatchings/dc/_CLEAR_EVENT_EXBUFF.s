.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CLEAR_EVENT_EXBUFF__FP12RS_STACKDATAi
/* 8D640 0018D540 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D644 0018D544 78B3248C */  lw         $4, -0x4C88($at)
/* 8D648 0018D548 00190400 */  sll        $3, $4, 4
/* 8D64C 0018D54C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D650 0018D550 70B3228C */  lw         $2, -0x4C90($at)
/* 8D654 0018D554 21184300 */  addu       $3, $2, $3
/* 8D658 0018D558 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D65C 0018D55C 7CB3228C */  lw         $2, -0x4C84($at)
/* 8D660 0018D560 23104400 */  subu       $2, $2, $4
/* 8D664 0018D564 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D668 0018D568 80B323AC */  sw         $3, -0x4C80($at)
/* 8D66C 0018D56C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D670 0018D570 8CB322AC */  sw         $2, -0x4C74($at)
/* 8D674 0018D574 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D678 0018D578 88B320AC */  sw         $0, -0x4C78($at)
/* 8D67C 0018D57C 01000224 */  addiu      $2, $0, 0x1
/* 8D680 0018D580 0800E003 */  jr         $31
/* 8D684 0018D584 00000000 */   nop
/* 8D688 0018D588 00000000 */  nop
/* 8D68C 0018D58C 00000000 */  nop
