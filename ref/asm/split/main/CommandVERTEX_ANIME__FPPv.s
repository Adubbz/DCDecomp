.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandVERTEX_ANIME__FPPv
/* 03A070 00139F70 0000838C */  lw          $3, 0x0($4)
/* 03A074 00139F74 0000638C */  lw          $3, 0x0($3)
/* 03A078 00139F78 A48C83AF */  sw          $3, -0x735C($28)
/* 03A07C 00139F7C 0800E003 */  jr          $31
/* 03A080 00139F80 00000000 */   nop
/* 03A084 00139F84 00000000 */  nop
/* 03A088 00139F88 00000000 */  nop
/* 03A08C 00139F8C 00000000 */  nop
