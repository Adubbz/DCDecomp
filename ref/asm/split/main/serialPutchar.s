.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel serialPutchar
/* 015C90 00115B90 F0FFBD27 */  addiu       $29, $29, -0x10
/* 015C94 00115B94 0A000224 */  addiu       $2, $0, 0xA
/* 015C98 00115B98 07008214 */  bne         $4, $2, .L00115BB8
/* 015C9C 00115B9C 0000BFFF */   sd         $31, 0x0($29)
/* 015CA0 00115BA0 AA56040C */  jal         kputchar
/* 015CA4 00115BA4 0D000424 */   addiu      $4, $0, 0xD
/* 015CA8 00115BA8 0000BFDF */  ld          $31, 0x0($29)
/* 015CAC 00115BAC 0A000424 */  addiu       $4, $0, 0xA
/* 015CB0 00115BB0 AA560408 */  j           kputchar
/* 015CB4 00115BB4 1000BD27 */   addiu      $29, $29, 0x10
.L00115BB8:
/* 015CB8 00115BB8 0000BFDF */  ld          $31, 0x0($29)
/* 015CBC 00115BBC AA560408 */  j           kputchar
/* 015CC0 00115BC0 1000BD27 */   addiu      $29, $29, 0x10
/* 015CC4 00115BC4 00000000 */  nop
