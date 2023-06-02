.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _CLEAR_EVENT_BUFF__FP12RS_STACKDATAi
/* 8D5F0 0018D4F0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D5F4 0018D4F4 68B3248C */  lw         $4, -0x4C98($at)
/* 8D5F8 0018D4F8 00190400 */  sll        $3, $4, 4
/* 8D5FC 0018D4FC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D600 0018D500 60B3228C */  lw         $2, -0x4CA0($at)
/* 8D604 0018D504 21184300 */  addu       $3, $2, $3
/* 8D608 0018D508 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D60C 0018D50C 6CB3228C */  lw         $2, -0x4C94($at)
/* 8D610 0018D510 23104400 */  subu       $2, $2, $4
/* 8D614 0018D514 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D618 0018D518 70B323AC */  sw         $3, -0x4C90($at)
/* 8D61C 0018D51C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D620 0018D520 7CB322AC */  sw         $2, -0x4C84($at)
/* 8D624 0018D524 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 8D628 0018D528 78B320AC */  sw         $0, -0x4C88($at)
/* 8D62C 0018D52C 01000224 */  addiu      $2, $0, 0x1
/* 8D630 0018D530 0800E003 */  jr         $31
/* 8D634 0018D534 00000000 */   nop
/* 8D638 0018D538 00000000 */  nop
/* 8D63C 0018D53C 00000000 */  nop
