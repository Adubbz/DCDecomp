.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DeleteReference__6CFrameFv
/* 0282A0 001281A0 100180AC */  sw          $0, 0x110($4)
/* 0282A4 001281A4 140180AC */  sw          $0, 0x114($4)
/* 0282A8 001281A8 0800E003 */  jr          $31
/* 0282AC 001281AC 00000000 */   nop
