.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandREVERBE__FPPv
/* 05BCB0 0015BBB0 0000838C */  lw          $3, 0x0($4)
/* 05BCB4 0015BBB4 0000658C */  lw          $5, 0x0($3)
/* 05BCB8 0015BBB8 688E838F */  lw          $3, -0x7198($28)
/* 05BCBC 0015BBBC 000065AC */  sw          $5, 0x0($3)
/* 05BCC0 0015BBC0 0400838C */  lw          $3, 0x4($4)
/* 05BCC4 0015BBC4 0000648C */  lw          $4, 0x0($3)
/* 05BCC8 0015BBC8 688E838F */  lw          $3, -0x7198($28)
/* 05BCCC 0015BBCC 040064AC */  sw          $4, 0x4($3)
/* 05BCD0 0015BBD0 0800E003 */  jr          $31
/* 05BCD4 0015BBD4 00000000 */   nop
/* 05BCD8 0015BBD8 00000000 */  nop
/* 05BCDC 0015BBDC 00000000 */  nop
