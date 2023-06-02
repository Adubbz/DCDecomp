.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMenuAtraEventFlag__Fi
/* 11A1A0 0021A0A0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A1A4 0021A0A4 6A8224A4 */  sh         $4, -0x7D96($at)
/* 11A1A8 0021A0A8 0800E003 */  jr         $31
/* 11A1AC 0021A0AC 00000000 */   nop
