.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel kputchar
/* 015BA8 00115AA8 0010033C */  lui         $3, (0x1000F130 >> 16)
/* 015BAC 00115AAC 30F16334 */  ori         $3, $3, (0x1000F130 & 0xFFFF)
.L00115AB0:
/* 015BB0 00115AB0 0000628C */  lw          $2, 0x0($3)
/* 015BB4 00115AB4 00804230 */  andi        $2, $2, 0x8000
/* 015BB8 00115AB8 00000000 */  nop
/* 015BBC 00115ABC 00000000 */  nop
/* 015BC0 00115AC0 00000000 */  nop
/* 015BC4 00115AC4 FAFF4014 */  bnez        $2, .L00115AB0
/* 015BC8 00115AC8 00000000 */   nop
/* 015BCC 00115ACC 0010033C */  lui         $3, (0x1000F180 >> 16)
/* 015BD0 00115AD0 2D108000 */  daddu       $2, $4, $0
/* 015BD4 00115AD4 80F16334 */  ori         $3, $3, (0x1000F180 & 0xFFFF)
/* 015BD8 00115AD8 0800E003 */  jr          $31
/* 015BDC 00115ADC 000064A0 */   sb         $4, 0x0($3)
