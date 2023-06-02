.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkReset
/* 20D18 00120C18 0400828C */  lw         $2, 0x4($4)
/* 20D1C 00120C1C 080080AC */  sw         $0, 0x8($4)
/* 20D20 00120C20 0800E003 */  jr         $31
/* 20D24 00120C24 000082AC */   sw        $2, 0x0($4)
