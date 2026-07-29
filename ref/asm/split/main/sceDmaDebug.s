.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDmaDebug
/* 00C5B0 0010C4B0 2500033C */  lui         $3, %hi(sceDmaDebugMode)
/* 00C5B4 0010C4B4 F802628C */  lw          $2, %lo(sceDmaDebugMode)($3)
/* 00C5B8 0010C4B8 0800E003 */  jr          $31
/* 00C5BC 0010C4BC F80264AC */   sw         $4, %lo(sceDmaDebugMode)($3)
