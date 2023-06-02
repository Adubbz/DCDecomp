.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMenuWeaponModelReference__Fiii
/* 10D570 0020D470 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 10D574 0020D474 0000BF7F */  sq         $31, 0x0($sp)
/* 10D578 0020D478 0035080C */  jal        GetMenuWeaponModelInfo__Fi
/* 10D57C 0020D47C 00000000 */   nop
/* 10D580 0020D480 000045AC */  sw         $5, 0x0($2)
/* 10D584 0020D484 040046AC */  sw         $6, 0x4($2)
/* 10D588 0020D488 0000BF7B */  lq         $31, 0x0($sp)
/* 10D58C 0020D48C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 10D590 0020D490 0800E003 */  jr         $31
/* 10D594 0020D494 00000000 */   nop
/* 10D598 0020D498 00000000 */  nop
/* 10D59C 0020D49C 00000000 */  nop
