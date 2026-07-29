.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__12CEffectGroupFP7CEffecti
/* 064C20 00164B20 000085AC */  sw          $5, 0x0($4)
/* 064C24 00164B24 040086AC */  sw          $6, 0x4($4)
/* 064C28 00164B28 0800E003 */  jr          $31
/* 064C2C 00164B2C 00000000 */   nop
