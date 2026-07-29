.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetParam__6CWaterFffff
/* 0608A0 001607A0 94008CE4 */  swc1        $f12, 0x94($4)
/* 0608A4 001607A4 98008DE4 */  swc1        $f13, 0x98($4)
/* 0608A8 001607A8 9C008EE4 */  swc1        $f14, 0x9C($4)
/* 0608AC 001607AC A0008FE4 */  swc1        $f15, 0xA0($4)
/* 0608B0 001607B0 0800E003 */  jr          $31
/* 0608B4 001607B4 00000000 */   nop
/* 0608B8 001607B8 00000000 */  nop
/* 0608BC 001607BC 00000000 */  nop
