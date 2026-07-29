.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MapJump__Fii
/* 041E30 00141D30 A08684AF */  sw          $4, -0x7960($28)
/* 041E34 00141D34 348D85AF */  sw          $5, -0x72CC($28)
/* 041E38 00141D38 0800E003 */  jr          $31
/* 041E3C 00141D3C 00000000 */   nop
