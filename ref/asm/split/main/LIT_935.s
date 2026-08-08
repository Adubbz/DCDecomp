.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_935
/* 19D060 0029CF60 63313561 */ .word 0x61353163
/* 19D064 0029CF64 30330000 */ .word 0x00003330
