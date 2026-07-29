.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableDmac
/* 014F70 00114E70 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014F74 00114E74 1000BFFF */  sd          $31, 0x10($29)
/* 014F78 00114E78 0000B0FF */  sd          $16, 0x0($29)
/* 014F7C 00114E7C 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 014F80 00114E80 0100023C */  lui         $2, (0x10000 >> 16)
/* 014F84 00114E84 24800202 */  and         $16, $16, $2
/* 014F88 00114E88 08000012 */  beqz        $16, .L00114EAC
/* 014F8C 00114E8C 0100033C */   lui        $3, (0x10000 >> 16)
.L00114E90:
/* 014F90 00114E90 39000042 */  di /* handwritten instruction */
/* 014F94 00114E94 0F040000 */  sync.p
/* 014F98 00114E98 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 014F9C 00114E9C 24104300 */  and         $2, $2, $3
/* 014FA0 00114EA0 00000000 */  nop
/* 014FA4 00114EA4 FAFF4014 */  bnez        $2, .L00114E90
/* 014FA8 00114EA8 00000000 */   nop
.L00114EAC:
/* 014FAC 00114EAC 2450040C */  jal         _DisableDmac
/* 014FB0 00114EB0 00000000 */   nop
/* 014FB4 00114EB4 0F000000 */  sync
/* 014FB8 00114EB8 03000012 */  beqz        $16, .L00114EC8
/* 014FBC 00114EBC 1000BFDF */   ld         $31, 0x10($29)
/* 014FC0 00114EC0 38000042 */  ei /* handwritten instruction */
/* 014FC4 00114EC4 1000BFDF */  ld          $31, 0x10($29)
.L00114EC8:
/* 014FC8 00114EC8 0000B0DF */  ld          $16, 0x0($29)
/* 014FCC 00114ECC 0800E003 */  jr          $31
/* 014FD0 00114ED0 2000BD27 */   addiu      $29, $29, 0x20
/* 014FD4 00114ED4 00000000 */  nop
