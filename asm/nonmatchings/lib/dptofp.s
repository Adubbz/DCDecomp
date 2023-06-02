.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel dptofp
/* 10748 00110648 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1074C 0011064C 2000A4FF */  sd         $4, 0x20($sp)
/* 10750 00110650 2D28A003 */  daddu      $5, $sp, $0
/* 10754 00110654 3000BFFF */  sd         $31, 0x30($sp)
/* 10758 00110658 B63E040C */  jal        __unpack_d
/* 1075C 0011065C 2000A427 */   addiu     $4, $sp, 0x20
/* 10760 00110660 1000A2DF */  ld         $2, 0x10($sp)
/* 10764 00110664 FF3F033C */  lui        $3, (0x3FFFFFFF >> 16)
/* 10768 00110668 FFFF6334 */  ori        $3, $3, (0x3FFFFFFF & 0xFFFF)
/* 1076C 0011066C 0000A48F */  lw         $4, 0x0($sp)
/* 10770 00110670 B8400200 */  dsll       $8, $2, 2
/* 10774 00110674 3F400800 */  dsra32     $8, $8, 0
/* 10778 00110678 0400A58F */  lw         $5, 0x4($sp)
/* 1077C 0011067C 24104300 */  and        $2, $2, $3
/* 10780 00110680 01000735 */  ori        $7, $8, 0x1
/* 10784 00110684 0800A68F */  lw         $6, 0x8($sp)
/* 10788 00110688 8444040C */  jal        __make_fp
/* 1078C 0011068C 0A380201 */   movz      $7, $8, $2
/* 10790 00110690 3000BFDF */  ld         $31, 0x30($sp)
/* 10794 00110694 0800E003 */  jr         $31
/* 10798 00110698 4000BD27 */   addiu     $sp, $sp, 0x40
/* 1079C 0011069C 00000000 */  nop
