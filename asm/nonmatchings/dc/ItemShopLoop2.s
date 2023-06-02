.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopLoop2__Fv
/* EC220 001EC120 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* EC224 001EC124 1000BF7F */  sq         $31, 0x10($sp)
/* EC228 001EC128 0000B07F */  sq         $16, 0x0($sp)
/* EC22C 001EC12C 38FB040C */  jal        ReadBG__Fv
/* EC230 001EC130 00000000 */   nop
/* EC234 001EC134 5CBB070C */  jal        ItemShopKey2__Fv
/* EC238 001EC138 00000000 */   nop
/* EC23C 001EC13C 28864070 */  paddub     $16, $2, $0
/* EC240 001EC140 00C2070C */  jal        ItemShopDraw2__Fv
/* EC244 001EC144 00000000 */   nop
/* EC248 001EC148 03000012 */  beqz       $16, .L001EC158
/* EC24C 001EC14C 00000000 */   nop
/* EC250 001EC150 60AE070C */  jal        ExitItemShop2__Fv
/* EC254 001EC154 00000000 */   nop
.L001EC158:
/* EC258 001EC158 28160072 */  paddub     $2, $16, $0
/* EC25C 001EC15C 1000BF7B */  lq         $31, 0x10($sp)
/* EC260 001EC160 0000B07B */  lq         $16, 0x0($sp)
/* EC264 001EC164 2000BD27 */  addiu      $sp, $sp, 0x20
/* EC268 001EC168 0800E003 */  jr         $31
/* EC26C 001EC16C 00000000 */   nop
