.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteReference__6CFrameFv
/* 282A0 001281A0 100180AC */  sw         $0, 0x110($4)
/* 282A4 001281A4 140180AC */  sw         $0, 0x114($4)
/* 282A8 001281A8 0800E003 */  jr         $31
/* 282AC 001281AC 00000000 */   nop
