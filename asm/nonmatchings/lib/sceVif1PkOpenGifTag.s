.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceVif1PkOpenGifTag
/* 20FC0 00120EC0 0000828C */  lw         $2, 0x0($4)
/* 20FC4 00120EC4 10004324 */  addiu      $3, $2, 0x10
/* 20FC8 00120EC8 0000457C */  sq         $5, 0x0($2)
/* 20FCC 00120ECC 000083AC */  sw         $3, 0x0($4)
/* 20FD0 00120ED0 0800E003 */  jr         $31
/* 20FD4 00120ED4 140082AC */   sw        $2, 0x14($4)
