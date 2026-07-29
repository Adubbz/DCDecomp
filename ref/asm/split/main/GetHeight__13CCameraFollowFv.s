.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetHeight__13CCameraFollowFv
/* 024CC0 00124BC0 D40280C4 */  lwc1        $f0, 0x2D4($4)
/* 024CC4 00124BC4 0800E003 */  jr          $31
/* 024CC8 00124BC8 00000000 */   nop
/* 024CCC 00124BCC 00000000 */  nop
