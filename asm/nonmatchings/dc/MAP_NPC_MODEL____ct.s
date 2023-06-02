.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__13MAP_NPC_MODELFv
/* 43600 00143500 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43604 00143504 1000BF7F */  sq         $31, 0x10($sp)
/* 43608 00143508 0000B07F */  sq         $16, 0x0($sp)
/* 4360C 0014350C 28868070 */  paddub     $16, $4, $0
/* 43610 00143510 4C0D050C */  jal        __ct__10CCharacterFv
/* 43614 00143514 00000000 */   nop
/* 43618 00143518 28160072 */  paddub     $2, $16, $0
/* 4361C 0014351C 1000BF7B */  lq         $31, 0x10($sp)
/* 43620 00143520 0000B07B */  lq         $16, 0x0($sp)
/* 43624 00143524 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43628 00143528 0800E003 */  jr         $31
/* 4362C 0014352C 00000000 */   nop
