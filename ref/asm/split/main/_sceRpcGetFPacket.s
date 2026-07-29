.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceRpcGetFPacket
/* 016FF8 00116EF8 2400858C */  lw          $5, 0x24($4)
/* 016FFC 00116EFC 1800838C */  lw          $3, 0x18($4)
/* 017000 00116F00 1A00A300 */  div         $0, $5, $3
/* 017004 00116F04 01006050 */  beql        $3, $0, .L00116F0C
/* 017008 00116F08 CD010000 */   break      0, 7
.L00116F0C:
/* 01700C 00116F0C 1400858C */  lw          $5, 0x14($4)
/* 017010 00116F10 10100000 */  mfhi        $2
/* 017014 00116F14 01004324 */  addiu       $3, $2, 0x1
/* 017018 00116F18 80110200 */  sll         $2, $2, 6
/* 01701C 00116F1C 240083AC */  sw          $3, 0x24($4)
/* 017020 00116F20 0800E003 */  jr          $31
/* 017024 00116F24 2110A200 */   addu       $2, $5, $2
