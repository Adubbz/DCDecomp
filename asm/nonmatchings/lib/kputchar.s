.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel kputchar
/* 15BA8 00115AA8 0010033C */  lui        $3, (0x1000F130 >> 16)
/* 15BAC 00115AAC 30F16334 */  ori        $3, $3, (0x1000F130 & 0xFFFF)
.L00115AB0:
/* 15BB0 00115AB0 0000628C */  lw         $2, 0x0($3)
/* 15BB4 00115AB4 00804230 */  andi       $2, $2, 0x8000
/* 15BB8 00115AB8 00000000 */  nop
/* 15BBC 00115ABC 00000000 */  nop
/* 15BC0 00115AC0 00000000 */  nop
/* 15BC4 00115AC4 FAFF4014 */  bnez       $2, .L00115AB0
/* 15BC8 00115AC8 00000000 */   nop
/* 15BCC 00115ACC 0010033C */  lui        $3, (0x1000F180 >> 16)
/* 15BD0 00115AD0 2D108000 */  daddu      $2, $4, $0
/* 15BD4 00115AD4 80F16334 */  ori        $3, $3, (0x1000F180 & 0xFFFF)
/* 15BD8 00115AD8 0800E003 */  jr         $31
/* 15BDC 00115ADC 000064A0 */   sb        $4, 0x0($3)
