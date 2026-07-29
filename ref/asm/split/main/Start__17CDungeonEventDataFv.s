.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Start__17CDungeonEventDataFv
/* 0CC9E0 001CC8E0 01000324 */  addiu       $3, $0, 0x1
/* 0CC9E4 001CC8E4 340083AC */  sw          $3, 0x34($4)
/* 0CC9E8 001CC8E8 0800E003 */  jr          $31
/* 0CC9EC 001CC8EC 00000000 */   nop
