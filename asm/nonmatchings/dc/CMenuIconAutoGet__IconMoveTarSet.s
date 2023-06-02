.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IconMoveTarSet__16CMenuIconAutoGetFiiiiff
/* 138460 00238360 00190500 */  sll        $3, $5, 4
/* 138464 00238364 21186400 */  addu       $3, $3, $4
/* 138468 00238368 0A0066A4 */  sh         $6, 0xA($3)
/* 13846C 0023836C 080067A4 */  sh         $7, 0x8($3)
/* 138470 00238370 0C0068A4 */  sh         $8, 0xC($3)
/* 138474 00238374 00006CE4 */  swc1       $f12, 0x0($3)
/* 138478 00238378 04006DE4 */  swc1       $f13, 0x4($3)
/* 13847C 0023837C 0800E003 */  jr         $31
/* 138480 00238380 00000000 */   nop
/* 138484 00238384 00000000 */  nop
/* 138488 00238388 00000000 */  nop
/* 13848C 0023838C 00000000 */  nop
