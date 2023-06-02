.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetTransMatrix__6CFrameFPA4_f
/* 28660 00128560 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28664 00128564 1000BF7F */  sq         $31, 0x10($sp)
/* 28668 00128568 0000B07F */  sq         $16, 0x0($sp)
/* 2866C 0012856C 28868070 */  paddub     $16, $4, $0
/* 28670 00128570 D0010426 */  addiu      $4, $16, 0x1D0
/* 28674 00128574 1086040C */  jal        sceVu0CopyMatrix
/* 28678 00128578 00000000 */   nop
/* 2867C 0012857C 400200AE */  sw         $0, 0x240($16)
/* 28680 00128580 1000BF7B */  lq         $31, 0x10($sp)
/* 28684 00128584 0000B07B */  lq         $16, 0x0($sp)
/* 28688 00128588 2000BD27 */  addiu      $sp, $sp, 0x20
/* 2868C 0012858C 0800E003 */  jr         $31
/* 28690 00128590 00000000 */   nop
/* 28694 00128594 00000000 */  nop
/* 28698 00128598 00000000 */  nop
/* 2869C 0012859C 00000000 */  nop
