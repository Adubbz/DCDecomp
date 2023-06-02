.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StatusErrCheck__Fi
/* B1A30 001B1930 789C838F */  lw         $3, -0x6388($gp)
/* B1A34 001B1934 04006280 */  lb         $2, 0x4($3)
/* B1A38 001B1938 80100200 */  sll        $2, $2, 2
/* B1A3C 001B193C 21104300 */  addu       $2, $2, $3
/* B1A40 001B1940 C842428C */  lw         $2, 0x42C8($2)
/* B1A44 001B1944 24184400 */  and        $3, $2, $4
/* B1A48 001B1948 01000224 */  addiu      $2, $0, 0x1
/* B1A4C 001B194C 0A100300 */  movz       $2, $0, $3
/* B1A50 001B1950 0800E003 */  jr         $31
/* B1A54 001B1954 00000000 */   nop
/* B1A58 001B1958 00000000 */  nop
/* B1A5C 001B195C 00000000 */  nop
