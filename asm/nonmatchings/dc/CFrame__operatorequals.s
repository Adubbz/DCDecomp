.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__6CFrameFR6CFrame
/* 28FB0 00128EB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28FB4 00128EB4 1000BF7F */  sq         $31, 0x10($sp)
/* 28FB8 00128EB8 0000B07F */  sq         $16, 0x0($sp)
/* 28FBC 00128EBC 28868070 */  paddub     $16, $4, $0
/* 28FC0 00128EC0 60020624 */  addiu      $6, $0, 0x260
/* 28FC4 00128EC4 EC0C040C */  jal        memcpy
/* 28FC8 00128EC8 00000000 */   nop
/* 28FCC 00128ECC 3C0100AE */  sw         $0, 0x13C($16)
/* 28FD0 00128ED0 380100AE */  sw         $0, 0x138($16)
/* 28FD4 00128ED4 100100AE */  sw         $0, 0x110($16)
/* 28FD8 00128ED8 400200AE */  sw         $0, 0x240($16)
/* 28FDC 00128EDC 440200AE */  sw         $0, 0x244($16)
/* 28FE0 00128EE0 28160072 */  paddub     $2, $16, $0
/* 28FE4 00128EE4 1000BF7B */  lq         $31, 0x10($sp)
/* 28FE8 00128EE8 0000B07B */  lq         $16, 0x0($sp)
/* 28FEC 00128EEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 28FF0 00128EF0 0800E003 */  jr         $31
/* 28FF4 00128EF4 00000000 */   nop
/* 28FF8 00128EF8 00000000 */  nop
/* 28FFC 00128EFC 00000000 */  nop
