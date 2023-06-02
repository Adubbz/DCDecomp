.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CMajinBeemFv
/* 435C0 001434C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 435C4 001434C4 1000BF7F */  sq         $31, 0x10($sp)
/* 435C8 001434C8 0000B07F */  sq         $16, 0x0($sp)
/* 435CC 001434CC 28868070 */  paddub     $16, $4, $0
/* 435D0 001434D0 3C0D050C */  jal        Initialize__10CMajinBeemFv
/* 435D4 001434D4 00000000 */   nop
/* 435D8 001434D8 28160072 */  paddub     $2, $16, $0
/* 435DC 001434DC 1000BF7B */  lq         $31, 0x10($sp)
/* 435E0 001434E0 0000B07B */  lq         $16, 0x0($sp)
/* 435E4 001434E4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 435E8 001434E8 0800E003 */  jr         $31
/* 435EC 001434EC 00000000 */   nop
