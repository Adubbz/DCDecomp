.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishPullHook__Ff
/* 0AA270 001AA170 88938CE7 */  swc1        $f12, -0x6C78($28)
/* 0AA274 001AA174 0800E003 */  jr          $31
/* 0AA278 001AA178 00000000 */   nop
/* 0AA27C 001AA17C 00000000 */  nop
