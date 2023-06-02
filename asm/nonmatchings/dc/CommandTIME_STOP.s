.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandTIME_STOP__FPPv
/* 76FD0 00176ED0 01000424 */  addiu      $4, $0, 0x1
/* 76FD4 00176ED4 C08F838F */  lw         $3, -0x7040($gp)
/* 76FD8 00176ED8 400064AC */  sw         $4, 0x40($3)
/* 76FDC 00176EDC 0800E003 */  jr         $31
/* 76FE0 00176EE0 00000000 */   nop
/* 76FE4 00176EE4 00000000 */  nop
/* 76FE8 00176EE8 00000000 */  nop
/* 76FEC 00176EEC 00000000 */  nop
