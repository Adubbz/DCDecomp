.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __dl__FPv
/* 22650 00122550 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 22654 00122554 1000BF7F */  sq         $31, 0x10($sp)
/* 22658 00122558 0000BE7F */  sq         $fp, 0x0($sp)
/* 2265C 0012255C 060A040C */  jal        free
/* 22660 00122560 21F0A003 */   addu      $fp, $sp, $0
/* 22664 00122564 06000010 */  b          .L00122580
/* 22668 00122568 21E8C003 */   addu      $sp, $fp, $0
/* 2266C 0012256C D08A040C */  jal        __unexpected
/* 22670 00122570 2000C427 */   addiu     $4, $fp, 0x20
.L00122574:
/* 22674 00122574 FFFF0010 */  b          .L00122574
/* 22678 00122578 00000000 */   nop
/* 2267C 0012257C 21E8C003 */  addu       $sp, $fp, $0
.L00122580:
/* 22680 00122580 1000BF7B */  lq         $31, 0x10($sp)
/* 22684 00122584 0000BE7B */  lq         $fp, 0x0($sp)
/* 22688 00122588 0800E003 */  jr         $31
/* 2268C 0012258C 4000BD27 */   addiu     $sp, $sp, 0x40
