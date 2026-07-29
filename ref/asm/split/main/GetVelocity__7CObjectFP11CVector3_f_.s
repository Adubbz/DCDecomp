.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetVelocity__7CObjectFP11CVector3_f_
/* 056FB0 00156EB0 20008378 */  lq          $3, 0x20($4)
/* 056FB4 00156EB4 0000A37C */  sq          $3, 0x0($5)
/* 056FB8 00156EB8 0800E003 */  jr          $31
/* 056FBC 00156EBC 00000000 */   nop
