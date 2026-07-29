.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChkKills__14CDngStatusDataFii
/* 0BF840 001BF740 80100500 */  sll         $2, $5, 2
/* 0BF844 001BF744 21184500 */  addu        $3, $2, $5
/* 0BF848 001BF748 80100300 */  sll         $2, $3, 2
/* 0BF84C 001BF74C 21106200 */  addu        $2, $3, $2
/* 0BF850 001BF750 C0100200 */  sll         $2, $2, 3
/* 0BF854 001BF754 21184400 */  addu        $3, $2, $4
/* 0BF858 001BF758 40100600 */  sll         $2, $6, 1
/* 0BF85C 001BF75C 21104300 */  addu        $2, $2, $3
/* 0BF860 001BF760 983C4284 */  lh          $2, 0x3C98($2)
/* 0BF864 001BF764 0800E003 */  jr          $31
/* 0BF868 001BF768 00000000 */   nop
/* 0BF86C 001BF76C 00000000 */  nop
