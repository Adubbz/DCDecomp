.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel exch_ok_cancel__Fi
/* 08B940 0018B840 20008330 */  andi        $3, $4, 0x20
/* 08B944 0018B844 40008530 */  andi        $5, $4, 0x40
/* 08B948 0018B848 9FFF0224 */  addiu       $2, $0, -0x61
/* 08B94C 0018B84C 24208200 */  and         $4, $4, $2
/* 08B950 0018B850 02006010 */  beqz        $3, .L0018B85C
/* 08B954 0018B854 00000000 */   nop
/* 08B958 0018B858 40008434 */  ori         $4, $4, 0x40
.L0018B85C:
/* 08B95C 0018B85C 0200A010 */  beqz        $5, .L0018B868
/* 08B960 0018B860 00000000 */   nop
/* 08B964 0018B864 20008434 */  ori         $4, $4, 0x20
.L0018B868:
/* 08B968 0018B868 28168070 */  paddub      $2, $4, $0
/* 08B96C 0018B86C 0800E003 */  jr          $31
/* 08B970 0018B870 00000000 */   nop
/* 08B974 0018B874 00000000 */  nop
/* 08B978 0018B878 00000000 */  nop
/* 08B97C 0018B87C 00000000 */  nop
