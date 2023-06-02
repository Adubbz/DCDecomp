.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMDTDataAddress__13CVisualMDTVu1FPUi
/* 35050 00134F50 200085AC */  sw         $5, 0x20($4)
/* 35054 00134F54 0800E003 */  jr         $31
/* 35058 00134F58 00000000 */   nop
/* 3505C 00134F5C 00000000 */  nop
