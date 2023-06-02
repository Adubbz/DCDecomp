.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuAtraEventFlag__Fv
/* 11A190 0021A090 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A194 0021A094 6A822284 */  lh         $2, -0x7D96($at)
/* 11A198 0021A098 0800E003 */  jr         $31
/* 11A19C 0021A09C 00000000 */   nop
