.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGifPkInit
/* 020850 00120750 000085AC */  sw          $5, 0x0($4)
/* 020854 00120754 080080AC */  sw          $0, 0x8($4)
/* 020858 00120758 0800E003 */  jr          $31
/* 02085C 0012075C 040085AC */   sw         $5, 0x4($4)
