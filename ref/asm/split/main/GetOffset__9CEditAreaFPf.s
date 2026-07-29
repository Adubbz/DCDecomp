.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetOffset__9CEditAreaFPf
/* 070250 00170150 100080C4 */  lwc1        $f0, 0x10($4)
/* 070254 00170154 0000A0E4 */  swc1        $f0, 0x0($5)
/* 070258 00170158 140080C4 */  lwc1        $f0, 0x14($4)
/* 07025C 0017015C 0400A0E4 */  swc1        $f0, 0x4($5)
/* 070260 00170160 180080C4 */  lwc1        $f0, 0x18($4)
/* 070264 00170164 0800A0E4 */  swc1        $f0, 0x8($5)
/* 070268 00170168 0800E003 */  jr          $31
/* 07026C 0017016C 00000000 */   nop
