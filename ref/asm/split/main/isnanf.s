.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel isnanf
/* 004B98 00104A98 00600344 */  mfc1        $3, $f12
/* 004B9C 00104A9C 2D106000 */  daddu       $2, $3, $0
/* 004BA0 00104AA0 FF7F043C */  lui         $4, (0x7FFFFFFF >> 16)
/* 004BA4 00104AA4 FFFF8434 */  ori         $4, $4, (0x7FFFFFFF & 0xFFFF)
/* 004BA8 00104AA8 807F033C */  lui         $3, (0x7F800000 >> 16)
/* 004BAC 00104AAC 24104400 */  and         $2, $2, $4
/* 004BB0 00104AB0 23106200 */  subu        $2, $3, $2
/* 004BB4 00104AB4 0800E003 */  jr          $31
/* 004BB8 00104AB8 C2170200 */   srl        $2, $2, 31
/* 004BBC 00104ABC 00000000 */  nop
