.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetScale__13CCandleEffectFff
/* 063BA0 00163AA0 20008CE4 */  swc1        $f12, 0x20($4)
/* 063BA4 00163AA4 24008DE4 */  swc1        $f13, 0x24($4)
/* 063BA8 00163AA8 0800E003 */  jr          $31
/* 063BAC 00163AAC 00000000 */   nop
