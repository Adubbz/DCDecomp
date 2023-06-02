.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetColor__6CWaterFUcUcUcUc
/* 608C0 001607C0 900085A0 */  sb         $5, 0x90($4)
/* 608C4 001607C4 910086A0 */  sb         $6, 0x91($4)
/* 608C8 001607C8 920087A0 */  sb         $7, 0x92($4)
/* 608CC 001607CC 930088A0 */  sb         $8, 0x93($4)
/* 608D0 001607D0 0800E003 */  jr         $31
/* 608D4 001607D4 00000000 */   nop
/* 608D8 001607D8 00000000 */  nop
/* 608DC 001607DC 00000000 */  nop
