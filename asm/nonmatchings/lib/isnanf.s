.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isnanf
/* 4B98 00104A98 00600344 */  mfc1       $3, $f12
/* 4B9C 00104A9C 2D106000 */  daddu      $2, $3, $0
/* 4BA0 00104AA0 FF7F043C */  lui        $4, (0x7FFFFFFF >> 16)
/* 4BA4 00104AA4 FFFF8434 */  ori        $4, $4, (0x7FFFFFFF & 0xFFFF)
/* 4BA8 00104AA8 807F033C */  lui        $3, (0x7F800000 >> 16)
/* 4BAC 00104AAC 24104400 */  and        $2, $2, $4
/* 4BB0 00104AB0 23106200 */  subu       $2, $3, $2
/* 4BB4 00104AB4 0800E003 */  jr         $31
/* 4BB8 00104AB8 C2170200 */   srl       $2, $2, 31
/* 4BBC 00104ABC 00000000 */  nop
