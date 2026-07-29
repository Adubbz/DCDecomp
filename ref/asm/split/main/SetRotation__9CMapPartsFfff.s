.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__9CMapPartsFfff
/* 09A930 0019A830 60008CE4 */  swc1        $f12, 0x60($4)
/* 09A934 0019A834 64008DE4 */  swc1        $f13, 0x64($4)
/* 09A938 0019A838 68008EE4 */  swc1        $f14, 0x68($4)
/* 09A93C 0019A83C 0800E003 */  jr          $31
/* 09A940 0019A840 00000000 */   nop
/* 09A944 0019A844 00000000 */  nop
/* 09A948 0019A848 00000000 */  nop
/* 09A94C 0019A84C 00000000 */  nop
