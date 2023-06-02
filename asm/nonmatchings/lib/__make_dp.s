.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __make_dp
/* 10718 00110618 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1071C 0011061C 0000A4AF */  sw         $4, 0x0($sp)
/* 10720 00110620 2000BFFF */  sd         $31, 0x20($sp)
/* 10724 00110624 2D20A003 */  daddu      $4, $sp, $0
/* 10728 00110628 0400A5AF */  sw         $5, 0x4($sp)
/* 1072C 0011062C 0800A6AF */  sw         $6, 0x8($sp)
/* 10730 00110630 6A3E040C */  jal        __pack_d
/* 10734 00110634 1000A7FF */   sd        $7, 0x10($sp)
/* 10738 00110638 2000BFDF */  ld         $31, 0x20($sp)
/* 1073C 0011063C 0800E003 */  jr         $31
/* 10740 00110640 3000BD27 */   addiu     $sp, $sp, 0x30
/* 10744 00110644 00000000 */  nop
