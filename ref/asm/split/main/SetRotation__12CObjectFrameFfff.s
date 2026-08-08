.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRotation__12CObjectFrameFfff
/* 057B20 00157A20 60008CE4 */  swc1        $f12, 0x60($4)
/* 057B24 00157A24 64008DE4 */  swc1        $f13, 0x64($4)
/* 057B28 00157A28 68008EE4 */  swc1        $f14, 0x68($4)
/* 057B2C 00157A2C 01000324 */  addiu       $3, $0, 0x1
/* 057B30 00157A30 C00083AC */  sw          $3, 0xC0($4)
/* 057B34 00157A34 0800E003 */  jr          $31
/* 057B38 00157A38 00000000 */   nop
/* 057B3C 00157A3C 00000000 */  nop
