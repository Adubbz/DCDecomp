.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Init__7CCursolFv
/* 028FF0 01DD4CF0 1C0080AC */  sw          $0, 0x1C($4)
/* 028FF4 01DD4CF4 9043033C */  lui         $3, (0x43900000 >> 16)
/* 028FF8 01DD4CF8 000083AC */  sw          $3, 0x0($4)
/* 028FFC 01DD4CFC 040083AC */  sw          $3, 0x4($4)
/* 029000 01DD4D00 180080AC */  sw          $0, 0x18($4)
/* 029004 01DD4D04 140080AC */  sw          $0, 0x14($4)
/* 029008 01DD4D08 100080AC */  sw          $0, 0x10($4)
/* 02900C 01DD4D0C 0C0080AC */  sw          $0, 0xC($4)
/* 029010 01DD4D10 080080AC */  sw          $0, 0x8($4)
/* 029014 01DD4D14 0800E003 */  jr          $31
/* 029018 01DD4D18 00000000 */   nop
/* 02901C 01DD4D1C 00000000 */  nop
