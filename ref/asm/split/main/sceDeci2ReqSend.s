.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ReqSend
/* 015518 00115418 002E0500 */  sll         $5, $5, 24
/* 01551C 0011541C E0FFBD27 */  addiu       $29, $29, -0x20
/* 015520 00115420 032E0500 */  sra         $5, $5, 24
/* 015524 00115424 0000A4AF */  sw          $4, 0x0($29)
/* 015528 00115428 0400A5AF */  sw          $5, 0x4($29)
/* 01552C 0011542C 03000424 */  addiu       $4, $0, 0x3
/* 015530 00115430 1000BFFF */  sd          $31, 0x10($29)
/* 015534 00115434 D451040C */  jal         Deci2Call
/* 015538 00115438 2D28A003 */   daddu      $5, $29, $0
/* 01553C 0011543C 1000BFDF */  ld          $31, 0x10($29)
/* 015540 00115440 0800E003 */  jr          $31
/* 015544 00115444 2000BD27 */   addiu      $29, $29, 0x20
