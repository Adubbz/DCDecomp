.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel StatusErrCheck__Fi
/* 0B1A30 001B1930 789C838F */  lw          $3, -0x6388($28)
/* 0B1A34 001B1934 04006280 */  lb          $2, 0x4($3)
/* 0B1A38 001B1938 80100200 */  sll         $2, $2, 2
/* 0B1A3C 001B193C 21104300 */  addu        $2, $2, $3
/* 0B1A40 001B1940 C842428C */  lw          $2, 0x42C8($2)
/* 0B1A44 001B1944 24184400 */  and         $3, $2, $4
/* 0B1A48 001B1948 01000224 */  addiu       $2, $0, 0x1
/* 0B1A4C 001B194C 0A100300 */  movz        $2, $0, $3
/* 0B1A50 001B1950 0800E003 */  jr          $31
/* 0B1A54 001B1954 00000000 */   nop
/* 0B1A58 001B1958 00000000 */  nop
/* 0B1A5C 001B195C 00000000 */  nop
