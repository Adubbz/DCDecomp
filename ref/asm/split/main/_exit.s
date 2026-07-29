.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _exit
/* 0001B0 001000B0 D04F0408 */  j           Exit
/* 0001B4 001000B4 25200000 */   move       $4, $0
