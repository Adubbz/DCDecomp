.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandGRAVITY__FPPv
/* 3FE20 0013FD20 0000838C */  lw         $3, 0x0($4)
/* 3FE24 0013FD24 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FE28 0013FD28 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FE2C 0013FD2C C00060E4 */  swc1       $f0, 0xC0($3)
/* 3FE30 0013FD30 0400838C */  lw         $3, 0x4($4)
/* 3FE34 0013FD34 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FE38 0013FD38 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FE3C 0013FD3C C40060E4 */  swc1       $f0, 0xC4($3)
/* 3FE40 0013FD40 0800838C */  lw         $3, 0x8($4)
/* 3FE44 0013FD44 000060C4 */  lwc1       $f0, 0x0($3)
/* 3FE48 0013FD48 0C8D838F */  lw         $3, -0x72F4($gp)
/* 3FE4C 0013FD4C C80060E4 */  swc1       $f0, 0xC8($3)
/* 3FE50 0013FD50 0800E003 */  jr         $31
/* 3FE54 0013FD54 00000000 */   nop
/* 3FE58 0013FD58 00000000 */  nop
/* 3FE5C 0013FD5C 00000000 */  nop
