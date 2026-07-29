.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaRestart
/* 00CF48 0010CE48 0000828C */  lw          $2, 0x0($4)
/* 00CF4C 0010CE4C FFFE0324 */  addiu       $3, $0, -0x101
/* 00CF50 0010CE50 24184300 */  and         $3, $2, $3
/* 00CF54 0010CE54 02120200 */  srl         $2, $2, 8
/* 00CF58 0010CE58 000083AC */  sw          $3, 0x0($4)
/* 00CF5C 0010CE5C 0800E003 */  jr          $31
/* 00CF60 0010CE60 01004230 */   andi       $2, $2, 0x1
/* 00CF64 0010CE64 00000000 */  nop
