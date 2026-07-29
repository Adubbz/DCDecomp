.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel free
/* 002918 00102818 2D288000 */  daddu       $5, $4, $0
/* 00291C 0010281C 2500023C */  lui         $2, (0x250000 >> 16)
/* 002920 00102820 FC060408 */  j           _free_r
/* 002924 00102824 ECFD448C */   lw         $4, -0x214($2)
