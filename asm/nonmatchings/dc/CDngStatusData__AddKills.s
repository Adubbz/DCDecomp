.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddKills__14CDngStatusDataFv
/* BF800 001BF700 00008580 */  lb         $5, 0x0($4)
/* BF804 001BF704 80180500 */  sll        $3, $5, 2
/* BF808 001BF708 21286500 */  addu       $5, $3, $5
/* BF80C 001BF70C 80180500 */  sll        $3, $5, 2
/* BF810 001BF710 2118A300 */  addu       $3, $5, $3
/* BF814 001BF714 C0180300 */  sll        $3, $3, 3
/* BF818 001BF718 21286400 */  addu       $5, $3, $4
/* BF81C 001BF71C 02008380 */  lb         $3, 0x2($4)
/* BF820 001BF720 40180300 */  sll        $3, $3, 1
/* BF824 001BF724 21206500 */  addu       $4, $3, $5
/* BF828 001BF728 983C8384 */  lh         $3, 0x3C98($4)
/* BF82C 001BF72C 01006324 */  addiu      $3, $3, 0x1
/* BF830 001BF730 983C83A4 */  sh         $3, 0x3C98($4)
/* BF834 001BF734 0800E003 */  jr         $31
/* BF838 001BF738 00000000 */   nop
/* BF83C 001BF73C 00000000 */  nop
