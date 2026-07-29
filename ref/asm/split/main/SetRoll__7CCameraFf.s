.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRoll__7CCameraFf
/* 024760 00124660 A0028CE4 */  swc1        $f12, 0x2A0($4)
/* 024764 00124664 0800E003 */  jr          $31
/* 024768 00124668 00000000 */   nop
/* 02476C 0012466C 00000000 */  nop
