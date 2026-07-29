.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceResetttyinit
/* 014890 00114790 2500023C */  lui         $2, %hi(ttyinit)
/* 014894 00114794 7A560408 */  j           sceTtyInit
/* 014898 00114798 E00940AC */   sw         $0, %lo(ttyinit)($2)
/* 01489C 0011479C 00000000 */  nop
