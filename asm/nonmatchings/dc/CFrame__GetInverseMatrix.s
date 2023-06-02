.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetInverseMatrix__6CFrameFv
/* 28610 00128510 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 28614 00128514 1000BF7F */  sq         $31, 0x10($sp)
/* 28618 00128518 0000B07F */  sq         $16, 0x0($sp)
/* 2861C 0012851C 28868070 */  paddub     $16, $4, $0
/* 28620 00128520 2000A527 */  addiu      $5, $sp, 0x20
/* 28624 00128524 6CA0040C */  jal        GetLWMatrix__6CFrameFPA4_f
/* 28628 00128528 00000000 */   nop
/* 2862C 0012852C 90010426 */  addiu      $4, $16, 0x190
/* 28630 00128530 2000A527 */  addiu      $5, $sp, 0x20
/* 28634 00128534 B285040C */  jal        sceVu0InversMatrix
/* 28638 00128538 00000000 */   nop
/* 2863C 0012853C 90010226 */  addiu      $2, $16, 0x190
/* 28640 00128540 1000BF7B */  lq         $31, 0x10($sp)
/* 28644 00128544 0000B07B */  lq         $16, 0x0($sp)
/* 28648 00128548 6000BD27 */  addiu      $sp, $sp, 0x60
/* 2864C 0012854C 0800E003 */  jr         $31
/* 28650 00128550 00000000 */   nop
/* 28654 00128554 00000000 */  nop
/* 28658 00128558 00000000 */  nop
/* 2865C 0012855C 00000000 */  nop
