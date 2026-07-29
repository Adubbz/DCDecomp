.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifIsAliveIop
/* 0195E8 001194E8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0195EC 001194EC 0000BFFF */  sd          $31, 0x0($29)
/* 0195F0 001194F0 CC51040C */  jal         sceSifGetReg
/* 0195F4 001194F4 04000424 */   addiu      $4, $0, 0x4
/* 0195F8 001194F8 0100033C */  lui         $3, (0x10000 >> 16)
/* 0195FC 001194FC 0000BFDF */  ld          $31, 0x0($29)
/* 019600 00119500 24104300 */  and         $2, $2, $3
/* 019604 00119504 2B100200 */  sltu        $2, $0, $2
/* 019608 00119508 0800E003 */  jr          $31
/* 01960C 0011950C 1000BD27 */   addiu      $29, $29, 0x10
