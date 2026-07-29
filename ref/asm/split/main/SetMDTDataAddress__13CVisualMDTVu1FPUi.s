.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMDTDataAddress__13CVisualMDTVu1FPUi
/* 035050 00134F50 200085AC */  sw          $5, 0x20($4)
/* 035054 00134F54 0800E003 */  jr          $31
/* 035058 00134F58 00000000 */   nop
/* 03505C 00134F5C 00000000 */  nop
