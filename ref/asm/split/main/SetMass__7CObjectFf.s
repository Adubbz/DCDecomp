.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMass__7CObjectFf
/* 056D80 00156C80 00008CE4 */  swc1        $f12, 0x0($4)
/* 056D84 00156C84 0800E003 */  jr          $31
/* 056D88 00156C88 00000000 */   nop
/* 056D8C 00156C8C 00000000 */  nop
