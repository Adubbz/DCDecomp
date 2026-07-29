.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetScale__7CObjectFfff
/* 0570B0 00156FB0 90008CE4 */  swc1        $f12, 0x90($4)
/* 0570B4 00156FB4 94008DE4 */  swc1        $f13, 0x94($4)
/* 0570B8 00156FB8 98008EE4 */  swc1        $f14, 0x98($4)
/* 0570BC 00156FBC 0800E003 */  jr          $31
/* 0570C0 00156FC0 00000000 */   nop
/* 0570C4 00156FC4 00000000 */  nop
/* 0570C8 00156FC8 00000000 */  nop
/* 0570CC 00156FCC 00000000 */  nop
