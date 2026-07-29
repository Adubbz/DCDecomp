.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __make_dp
/* 010718 00110618 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01071C 0011061C 0000A4AF */  sw          $4, 0x0($29)
/* 010720 00110620 2000BFFF */  sd          $31, 0x20($29)
/* 010724 00110624 2D20A003 */  daddu       $4, $29, $0
/* 010728 00110628 0400A5AF */  sw          $5, 0x4($29)
/* 01072C 0011062C 0800A6AF */  sw          $6, 0x8($29)
/* 010730 00110630 6A3E040C */  jal         __pack_d
/* 010734 00110634 1000A7FF */   sd         $7, 0x10($29)
/* 010738 00110638 2000BFDF */  ld          $31, 0x20($29)
/* 01073C 0011063C 0800E003 */  jr          $31
/* 010740 00110640 3000BD27 */   addiu      $29, $29, 0x30
/* 010744 00110644 00000000 */  nop
