.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAngleMode__5CFishFv
/* 140E20 00240D20 0A000324 */  addiu      $3, $0, 0xA
/* 140E24 00240D24 4C0083AC */  sw         $3, 0x4C($4)
/* 140E28 00240D28 500083AC */  sw         $3, 0x50($4)
/* 140E2C 00240D2C 800080AC */  sw         $0, 0x80($4)
/* 140E30 00240D30 0800E003 */  jr         $31
/* 140E34 00240D34 00000000 */   nop
/* 140E38 00240D38 00000000 */  nop
/* 140E3C 00240D3C 00000000 */  nop
