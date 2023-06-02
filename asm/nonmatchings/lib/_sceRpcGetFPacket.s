.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceRpcGetFPacket
/* 16FF8 00116EF8 2400858C */  lw         $5, 0x24($4)
/* 16FFC 00116EFC 1800838C */  lw         $3, 0x18($4)
/* 17000 00116F00 1A00A300 */  div        $0, $5, $3
/* 17004 00116F04 01006050 */  beql       $3, $0, .L00116F0C
/* 17008 00116F08 CD010000 */   break     0, 7
.L00116F0C:
/* 1700C 00116F0C 1400858C */  lw         $5, 0x14($4)
/* 17010 00116F10 10100000 */  mfhi       $2
/* 17014 00116F14 01004324 */  addiu      $3, $2, 0x1
/* 17018 00116F18 80110200 */  sll        $2, $2, 6
/* 1701C 00116F1C 240083AC */  sw         $3, 0x24($4)
/* 17020 00116F20 0800E003 */  jr         $31
/* 17024 00116F24 2110A200 */   addu      $2, $5, $2
