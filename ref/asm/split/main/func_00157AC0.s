.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00157AC0
/* 057BC0 00157AC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057BC4 00157AC4 1000A627 */  addiu       $6, $29, 0x10
/* 057BC8 00157AC8 0000A378 */  lq          $3, 0x0($5)
/* 057BCC 00157ACC 0000C37C */  sq          $3, 0x0($6)
/* 057BD0 00157AD0 0000A527 */  addiu       $5, $29, 0x0
/* 057BD4 00157AD4 0000C378 */  lq          $3, 0x0($6)
/* 057BD8 00157AD8 0000A37C */  sq          $3, 0x0($5)
/* 057BDC 00157ADC 0000C378 */  lq          $3, 0x0($6)
/* 057BE0 00157AE0 8000837C */  sq          $3, 0x80($4)
/* 057BE4 00157AE4 01000324 */  addiu       $3, $0, 0x1
/* 057BE8 00157AE8 C00083AC */  sw          $3, 0xC0($4)
/* 057BEC 00157AEC 2000BD27 */  addiu       $29, $29, 0x20
/* 057BF0 00157AF0 0800E003 */  jr          $31
/* 057BF4 00157AF4 00000000 */   nop
/* 057BF8 00157AF8 00000000 */  nop
/* 057BFC 00157AFC 00000000 */  nop
