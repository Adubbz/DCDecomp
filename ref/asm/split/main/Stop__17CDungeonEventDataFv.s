.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Stop__17CDungeonEventDataFv
/* 0CC9D0 001CC8D0 340080AC */  sw          $0, 0x34($4)
/* 0CC9D4 001CC8D4 0800E003 */  jr          $31
/* 0CC9D8 001CC8D8 00000000 */   nop
/* 0CC9DC 001CC8DC 00000000 */  nop
