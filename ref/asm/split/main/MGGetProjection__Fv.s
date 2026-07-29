.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetProjection__Fv
/* 02DA90 0012D990 C701013C */  lui         $1, %hi(mgRenderInfo)
/* 02DA94 0012D994 205520C4 */  lwc1        $f0, %lo(mgRenderInfo)($1)
/* 02DA98 0012D998 0800E003 */  jr          $31
/* 02DA9C 0012D99C 00000000 */   nop
