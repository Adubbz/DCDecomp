.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceVif1PkInit
/* 020D08 00120C08 000085AC */  sw          $5, 0x0($4)
/* 020D0C 00120C0C 080080AC */  sw          $0, 0x8($4)
/* 020D10 00120C10 0800E003 */  jr          $31
/* 020D14 00120C14 040085AC */   sw         $5, 0x4($4)
