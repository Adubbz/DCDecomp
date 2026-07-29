.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopLoop2__Fv
/* 0EC220 001EC120 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0EC224 001EC124 1000BF7F */  sq          $31, 0x10($29)
/* 0EC228 001EC128 0000B07F */  sq          $16, 0x0($29)
/* 0EC22C 001EC12C 38FB040C */  jal         ReadBG__Fv
/* 0EC230 001EC130 00000000 */   nop
/* 0EC234 001EC134 5CBB070C */  jal         ItemShopKey2__Fv
/* 0EC238 001EC138 00000000 */   nop
/* 0EC23C 001EC13C 28864070 */  paddub      $16, $2, $0
/* 0EC240 001EC140 00C2070C */  jal         ItemShopDraw2__Fv
/* 0EC244 001EC144 00000000 */   nop
/* 0EC248 001EC148 03000012 */  beqz        $16, .L001EC158
/* 0EC24C 001EC14C 00000000 */   nop
/* 0EC250 001EC150 60AE070C */  jal         ExitItemShop2__Fv
/* 0EC254 001EC154 00000000 */   nop
.L001EC158:
/* 0EC258 001EC158 28160072 */  paddub      $2, $16, $0
/* 0EC25C 001EC15C 1000BF7B */  lq          $31, 0x10($29)
/* 0EC260 001EC160 0000B07B */  lq          $16, 0x0($29)
/* 0EC264 001EC164 2000BD27 */  addiu       $29, $29, 0x20
/* 0EC268 001EC168 0800E003 */  jr          $31
/* 0EC26C 001EC16C 00000000 */   nop
