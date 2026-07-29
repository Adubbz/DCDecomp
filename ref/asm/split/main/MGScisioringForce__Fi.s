.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGScisioringForce__Fi
/* 02E370 0012E270 C701013C */  lui         $1, %hi(mgRenderInfo + 0x318)
/* 02E374 0012E274 385824AC */  sw          $4, %lo(mgRenderInfo + 0x318)($1)
/* 02E378 0012E278 0800E003 */  jr          $31
/* 02E37C 0012E27C 00000000 */   nop
