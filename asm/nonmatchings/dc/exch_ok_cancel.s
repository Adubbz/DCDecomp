.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel exch_ok_cancel__Fi
/* 8B940 0018B840 20008330 */  andi       $3, $4, 0x20
/* 8B944 0018B844 40008530 */  andi       $5, $4, 0x40
/* 8B948 0018B848 9FFF0224 */  addiu      $2, $0, -0x61
/* 8B94C 0018B84C 24208200 */  and        $4, $4, $2
/* 8B950 0018B850 02006010 */  beqz       $3, .L0018B85C
/* 8B954 0018B854 00000000 */   nop
/* 8B958 0018B858 40008434 */  ori        $4, $4, 0x40
.L0018B85C:
/* 8B95C 0018B85C 0200A010 */  beqz       $5, .L0018B868
/* 8B960 0018B860 00000000 */   nop
/* 8B964 0018B864 20008434 */  ori        $4, $4, 0x20
.L0018B868:
/* 8B968 0018B868 28168070 */  paddub     $2, $4, $0
/* 8B96C 0018B86C 0800E003 */  jr         $31
/* 8B970 0018B870 00000000 */   nop
/* 8B974 0018B874 00000000 */  nop
/* 8B978 0018B878 00000000 */  nop
/* 8B97C 0018B87C 00000000 */  nop
