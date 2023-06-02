.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetWorkFlag__Fi
/* 8A410 0018A310 04008004 */  bltz       $4, .L0018A324
/* 8A414 0018A314 00000000 */   nop
/* 8A418 0018A318 20008228 */  slti       $2, $4, 0x20
/* 8A41C 0018A31C 04004014 */  bnez       $2, .L0018A330
/* 8A420 0018A320 00000000 */   nop
.L0018A324:
/* 8A424 0018A324 28160070 */  paddub     $2, $0, $0
/* 8A428 0018A328 07000010 */  b          .L0018A348
/* 8A42C 0018A32C 00000000 */   nop
.L0018A330:
/* 8A430 0018A330 80180400 */  sll        $3, $4, 2
/* 8A434 0018A334 D401023C */  lui        $2, %hi(work_flag)
/* 8A438 0018A338 90EF4224 */  addiu      $2, $2, %lo(work_flag)
/* 8A43C 0018A33C 21104300 */  addu       $2, $2, $3
/* 8A440 0018A340 0000428C */  lw         $2, 0x0($2)
/* 8A444 0018A344 00000000 */  nop
.L0018A348:
/* 8A448 0018A348 0800E003 */  jr         $31
/* 8A44C 0018A34C 00000000 */   nop
