.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel putnum
/* 014BC0 00114AC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014BC4 00114AC4 07000624 */  addiu       $6, $0, 0x7
/* 014BC8 00114AC8 1000BFFF */  sd          $31, 0x10($29)
/* 014BCC 00114ACC 2D28A003 */  daddu       $5, $29, $0
.L00114AD0:
/* 014BD0 00114AD0 80100600 */  sll         $2, $6, 2
/* 014BD4 00114AD4 06104400 */  srlv        $2, $4, $2
/* 014BD8 00114AD8 0F004230 */  andi        $2, $2, 0xF
/* 014BDC 00114ADC 0A004328 */  slti        $3, $2, 0xA
/* 014BE0 00114AE0 02006050 */  beql        $3, $0, .L00114AEC
/* 014BE4 00114AE4 57004224 */   addiu      $2, $2, 0x57
/* 014BE8 00114AE8 30004224 */  addiu       $2, $2, 0x30
.L00114AEC:
/* 014BEC 00114AEC 0000A2A0 */  sb          $2, 0x0($5)
/* 014BF0 00114AF0 FFFFC624 */  addiu       $6, $6, -0x1
/* 014BF4 00114AF4 F6FFC104 */  bgez        $6, .L00114AD0
/* 014BF8 00114AF8 0100A524 */   addiu      $5, $5, 0x1
/* 014BFC 00114AFC 0000A0A0 */  sb          $0, 0x0($5)
/* 014C00 00114B00 AC51040C */  jal         print
/* 014C04 00114B04 2D20A003 */   daddu      $4, $29, $0
/* 014C08 00114B08 1000BFDF */  ld          $31, 0x10($29)
/* 014C0C 00114B0C 0800E003 */  jr          $31
/* 014C10 00114B10 2000BD27 */   addiu      $29, $29, 0x20
/* 014C14 00114B14 00000000 */  nop
