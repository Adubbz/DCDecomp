.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _Bfree
/* 0037E0 001036E0 0800A010 */  beqz        $5, .L00103704
/* 0037E4 001036E4 00000000 */   nop
/* 0037E8 001036E8 0400A28C */  lw          $2, 0x4($5)
/* 0037EC 001036EC 4C00848C */  lw          $4, 0x4C($4)
/* 0037F0 001036F0 80100200 */  sll         $2, $2, 2
/* 0037F4 001036F4 21104400 */  addu        $2, $2, $4
/* 0037F8 001036F8 0000438C */  lw          $3, 0x0($2)
/* 0037FC 001036FC 0000A3AC */  sw          $3, 0x0($5)
/* 003800 00103700 000045AC */  sw          $5, 0x0($2)
.L00103704:
/* 003804 00103704 0800E003 */  jr          $31
/* 003808 00103708 00000000 */   nop
/* 00380C 0010370C 00000000 */  nop
