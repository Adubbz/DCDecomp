.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddKills__14CDngStatusDataFv
/* 0BF800 001BF700 00008580 */  lb          $5, 0x0($4)
/* 0BF804 001BF704 80180500 */  sll         $3, $5, 2
/* 0BF808 001BF708 21286500 */  addu        $5, $3, $5
/* 0BF80C 001BF70C 80180500 */  sll         $3, $5, 2
/* 0BF810 001BF710 2118A300 */  addu        $3, $5, $3
/* 0BF814 001BF714 C0180300 */  sll         $3, $3, 3
/* 0BF818 001BF718 21286400 */  addu        $5, $3, $4
/* 0BF81C 001BF71C 02008380 */  lb          $3, 0x2($4)
/* 0BF820 001BF720 40180300 */  sll         $3, $3, 1
/* 0BF824 001BF724 21206500 */  addu        $4, $3, $5
/* 0BF828 001BF728 983C8384 */  lh          $3, 0x3C98($4)
/* 0BF82C 001BF72C 01006324 */  addiu       $3, $3, 0x1
/* 0BF830 001BF730 983C83A4 */  sh          $3, 0x3C98($4)
/* 0BF834 001BF734 0800E003 */  jr          $31
/* 0BF838 001BF738 00000000 */   nop
/* 0BF83C 001BF73C 00000000 */  nop
