.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGifPkInit
/* 20850 00120750 000085AC */  sw         $5, 0x0($4)
/* 20854 00120754 080080AC */  sw         $0, 0x8($4)
/* 20858 00120758 0800E003 */  jr         $31
/* 2085C 0012075C 040085AC */   sw        $5, 0x4($4)
