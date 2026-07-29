.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel DisableIntc
/* 014EA0 00114DA0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 014EA4 00114DA4 1000BFFF */  sd          $31, 0x10($29)
/* 014EA8 00114DA8 0000B0FF */  sd          $16, 0x0($29)
/* 014EAC 00114DAC 00601040 */  mfc0        $16, $12 /* handwritten instruction */
/* 014EB0 00114DB0 0100023C */  lui         $2, (0x10000 >> 16)
/* 014EB4 00114DB4 24800202 */  and         $16, $16, $2
/* 014EB8 00114DB8 08000012 */  beqz        $16, .L00114DDC
/* 014EBC 00114DBC 0100033C */   lui        $3, (0x10000 >> 16)
.L00114DC0:
/* 014EC0 00114DC0 39000042 */  di /* handwritten instruction */
/* 014EC4 00114DC4 0F040000 */  sync.p
/* 014EC8 00114DC8 00600240 */  mfc0        $2, $12 /* handwritten instruction */
/* 014ECC 00114DCC 24104300 */  and         $2, $2, $3
/* 014ED0 00114DD0 00000000 */  nop
/* 014ED4 00114DD4 FAFF4014 */  bnez        $2, .L00114DC0
/* 014ED8 00114DD8 00000000 */   nop
.L00114DDC:
/* 014EDC 00114DDC 1C50040C */  jal         _DisableIntc
/* 014EE0 00114DE0 00000000 */   nop
/* 014EE4 00114DE4 0F000000 */  sync
/* 014EE8 00114DE8 03000012 */  beqz        $16, .L00114DF8
/* 014EEC 00114DEC 1000BFDF */   ld         $31, 0x10($29)
/* 014EF0 00114DF0 38000042 */  ei /* handwritten instruction */
/* 014EF4 00114DF4 1000BFDF */  ld          $31, 0x10($29)
.L00114DF8:
/* 014EF8 00114DF8 0000B0DF */  ld          $16, 0x0($29)
/* 014EFC 00114DFC 0800E003 */  jr          $31
/* 014F00 00114E00 2000BD27 */   addiu      $29, $29, 0x20
/* 014F04 00114E04 00000000 */  nop
