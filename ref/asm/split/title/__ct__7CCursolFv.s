.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__7CCursolFv
/* 028FC0 01DD4CC0 1C0080AC */  sw          $0, 0x1C($4)
/* 028FC4 01DD4CC4 9043023C */  lui         $2, (0x43900000 >> 16)
/* 028FC8 01DD4CC8 000082AC */  sw          $2, 0x0($4)
/* 028FCC 01DD4CCC 040082AC */  sw          $2, 0x4($4)
/* 028FD0 01DD4CD0 180080AC */  sw          $0, 0x18($4)
/* 028FD4 01DD4CD4 140080AC */  sw          $0, 0x14($4)
/* 028FD8 01DD4CD8 100080AC */  sw          $0, 0x10($4)
/* 028FDC 01DD4CDC 0C0080AC */  sw          $0, 0xC($4)
/* 028FE0 01DD4CE0 080080AC */  sw          $0, 0x8($4)
/* 028FE4 01DD4CE4 28168070 */  paddub      $2, $4, $0
/* 028FE8 01DD4CE8 0800E003 */  jr          $31
/* 028FEC 01DD4CEC 00000000 */   nop
