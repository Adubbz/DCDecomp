.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTexture__13CCandleEffectFP8CTexture
/* 063B90 00163A90 080085AC */  sw          $5, 0x8($4)
/* 063B94 00163A94 0800E003 */  jr          $31
/* 063B98 00163A98 00000000 */   nop
/* 063B9C 00163A9C 00000000 */  nop
