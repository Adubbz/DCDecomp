.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandREVERBE__FPPv
/* 5BCB0 0015BBB0 0000838C */  lw         $3, 0x0($4)
/* 5BCB4 0015BBB4 0000658C */  lw         $5, 0x0($3)
/* 5BCB8 0015BBB8 688E838F */  lw         $3, -0x7198($gp)
/* 5BCBC 0015BBBC 000065AC */  sw         $5, 0x0($3)
/* 5BCC0 0015BBC0 0400838C */  lw         $3, 0x4($4)
/* 5BCC4 0015BBC4 0000648C */  lw         $4, 0x0($3)
/* 5BCC8 0015BBC8 688E838F */  lw         $3, -0x7198($gp)
/* 5BCCC 0015BBCC 040064AC */  sw         $4, 0x4($3)
/* 5BCD0 0015BBD0 0800E003 */  jr         $31
/* 5BCD4 0015BBD4 00000000 */   nop
/* 5BCD8 0015BBD8 00000000 */  nop
/* 5BCDC 0015BBDC 00000000 */  nop
