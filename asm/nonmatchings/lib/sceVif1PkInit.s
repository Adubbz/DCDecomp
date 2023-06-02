.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkInit
/* 20D08 00120C08 000085AC */  sw         $5, 0x0($4)
/* 20D0C 00120C0C 080080AC */  sw         $0, 0x8($4)
/* 20D10 00120C10 0800E003 */  jr         $31
/* 20D14 00120C14 040085AC */   sw        $5, 0x4($4)
