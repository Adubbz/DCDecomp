.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CMajinBeemFv
/* 435F0 001434F0 A40680AC */  sw         $0, 0x6A4($4)
/* 435F4 001434F4 A00680AC */  sw         $0, 0x6A0($4)
/* 435F8 001434F8 0800E003 */  jr         $31
/* 435FC 001434FC 00000000 */   nop
