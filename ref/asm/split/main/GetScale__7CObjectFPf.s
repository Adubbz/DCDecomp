.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetScale__7CObjectFPf
/* 0570F0 00156FF0 900080C4 */  lwc1        $f0, 0x90($4)
/* 0570F4 00156FF4 0000A0E4 */  swc1        $f0, 0x0($5)
/* 0570F8 00156FF8 940080C4 */  lwc1        $f0, 0x94($4)
/* 0570FC 00156FFC 0400A0E4 */  swc1        $f0, 0x4($5)
/* 057100 00157000 980080C4 */  lwc1        $f0, 0x98($4)
/* 057104 00157004 0800A0E4 */  swc1        $f0, 0x8($5)
/* 057108 00157008 0800E003 */  jr          $31
/* 05710C 0015700C 00000000 */   nop
