.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWorldRotY__Ff
/* 8B580 0018B480 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8B584 0018B484 F4EE20C4 */  lwc1       $f0, -0x110C($at)
/* 8B588 0018B488 00630046 */  add.s      $f12, $f12, $f0
/* 8B58C 0018B48C 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 8B590 0018B490 36600046 */  c.le.s     $f12, $f0
/* 8B594 0018B494 00000000 */  nop
/* 8B598 0018B498 03000145 */  bc1t       .L0018B4A8
/* 8B59C 0018B49C 00000000 */   nop
/* 8B5A0 0018B4A0 2C8180C7 */  lwc1       $f0, -0x7ED4($gp)
/* 8B5A4 0018B4A4 01630046 */  sub.s      $f12, $f12, $f0
.L0018B4A8:
/* 8B5A8 0018B4A8 308180C7 */  lwc1       $f0, -0x7ED0($gp)
/* 8B5AC 0018B4AC 34600046 */  c.lt.s     $f12, $f0
/* 8B5B0 0018B4B0 00000000 */  nop
/* 8B5B4 0018B4B4 03000045 */  bc1f       .L0018B4C4
/* 8B5B8 0018B4B8 00000000 */   nop
/* 8B5BC 0018B4BC 348180C7 */  lwc1       $f0, -0x7ECC($gp)
/* 8B5C0 0018B4C0 00630046 */  add.s      $f12, $f12, $f0
.L0018B4C4:
/* 8B5C4 0018B4C4 06600046 */  mov.s      $f0, $f12
/* 8B5C8 0018B4C8 0800E003 */  jr         $31
/* 8B5CC 0018B4CC 00000000 */   nop
