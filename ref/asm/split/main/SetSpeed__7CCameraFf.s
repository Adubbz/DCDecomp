.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetSpeed__7CCameraFf
/* 024750 00124650 A8028CE4 */  swc1        $f12, 0x2A8($4)
/* 024754 00124654 0800E003 */  jr          $31
/* 024758 00124658 00000000 */   nop
/* 02475C 0012465C 00000000 */  nop
