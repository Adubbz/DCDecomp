.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGGetProjection__Fv
/* 2DA90 0012D990 C701013C */  lui        $at, (0x1C75520 >> 16)
/* 2DA94 0012D994 205520C4 */  lwc1       $f0, (0x1C75520 & 0xFFFF)($at)
/* 2DA98 0012D998 0800E003 */  jr         $31
/* 2DA9C 0012D99C 00000000 */   nop
