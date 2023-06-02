.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdMoveCharaInit__Fv
/* 6A0D0 00169FD0 F08E80AF */  sw         $0, -0x7110($gp)
/* 6A0D4 00169FD4 F48E80AF */  sw         $0, -0x710C($gp)
/* 6A0D8 00169FD8 F88E80AF */  sw         $0, -0x7108($gp)
/* 6A0DC 00169FDC FC8E80AF */  sw         $0, -0x7104($gp)
/* 6A0E0 00169FE0 0800E003 */  jr         $31
/* 6A0E4 00169FE4 00000000 */   nop
/* 6A0E8 00169FE8 00000000 */  nop
/* 6A0EC 00169FEC 00000000 */  nop
