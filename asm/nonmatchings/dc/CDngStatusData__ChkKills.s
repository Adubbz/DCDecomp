.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChkKills__14CDngStatusDataFii
/* BF840 001BF740 80100500 */  sll        $2, $5, 2
/* BF844 001BF744 21184500 */  addu       $3, $2, $5
/* BF848 001BF748 80100300 */  sll        $2, $3, 2
/* BF84C 001BF74C 21106200 */  addu       $2, $3, $2
/* BF850 001BF750 C0100200 */  sll        $2, $2, 3
/* BF854 001BF754 21184400 */  addu       $3, $2, $4
/* BF858 001BF758 40100600 */  sll        $2, $6, 1
/* BF85C 001BF75C 21104300 */  addu       $2, $2, $3
/* BF860 001BF760 983C4284 */  lh         $2, 0x3C98($2)
/* BF864 001BF764 0800E003 */  jr         $31
/* BF868 001BF768 00000000 */   nop
/* BF86C 001BF76C 00000000 */  nop
