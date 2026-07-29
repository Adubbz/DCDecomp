.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel abs
/* 0002C8 001001C8 02008104 */  bgez        $4, .L001001D4
/* 0002CC 001001CC 2D108000 */   daddu      $2, $4, $0
/* 0002D0 001001D0 23100200 */  negu        $2, $2
.L001001D4:
/* 0002D4 001001D4 0800E003 */  jr          $31
/* 0002D8 001001D8 00000000 */   nop
/* 0002DC 001001DC 00000000 */  nop
