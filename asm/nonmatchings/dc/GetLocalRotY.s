.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLocalRotY__Ff
/* 8B660 0018B560 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B664 0018B564 F4EE20C4 */  lwc1       $f0, -0x110C($at)
/* 8B668 0018B568 01630046 */  sub.s      $f12, $f12, $f0
/* 8B66C 0018B56C 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 8B670 0018B570 36600046 */  c.le.s     $f12, $f0
/* 8B674 0018B574 00000000 */  nop
/* 8B678 0018B578 03000145 */  bc1t       .L0018B588
/* 8B67C 0018B57C 00000000 */   nop
/* 8B680 0018B580 348180C7 */  lwc1       $f0, -0x7ECC($gp)
/* 8B684 0018B584 01630046 */  sub.s      $f12, $f12, $f0
.L0018B588:
/* 8B688 0018B588 488180C7 */  lwc1       $f0, -0x7EB8($gp)
/* 8B68C 0018B58C 34600046 */  c.lt.s     $f12, $f0
/* 8B690 0018B590 00000000 */  nop
/* 8B694 0018B594 03000045 */  bc1f       .L0018B5A4
/* 8B698 0018B598 00000000 */   nop
/* 8B69C 0018B59C 4C8180C7 */  lwc1       $f0, -0x7EB4($gp)
/* 8B6A0 0018B5A0 00630046 */  add.s      $f12, $f12, $f0
.L0018B5A4:
/* 8B6A4 0018B5A4 06600046 */  mov.s      $f0, $f12
/* 8B6A8 0018B5A8 0800E003 */  jr         $31
/* 8B6AC 0018B5AC 00000000 */   nop
