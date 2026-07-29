.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PlayTimeCount__Fi
/* 041030 00140F30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 041034 00140F34 0000BF7F */  sq          $31, 0x0($29)
/* 041038 00140F38 A486838F */  lw          $3, -0x795C($28)
/* 04103C 00140F3C 05006010 */  beqz        $3, .L00140F54
/* 041040 00140F40 00000000 */   nop
/* 041044 00140F44 1C8D848F */  lw          $4, -0x72E4($28)
/* 041048 00140F48 01000524 */  addiu       $5, $0, 0x1
/* 04104C 00140F4C E45E050C */  jal         AddPlayTime__9CSaveDataFi
/* 041050 00140F50 00000000 */   nop
.L00140F54:
/* 041054 00140F54 0000BF7B */  lq          $31, 0x0($29)
/* 041058 00140F58 1000BD27 */  addiu       $29, $29, 0x10
/* 04105C 00140F5C 0800E003 */  jr          $31
/* 041060 00140F60 00000000 */   nop
/* 041064 00140F64 00000000 */  nop
/* 041068 00140F68 00000000 */  nop
/* 04106C 00140F6C 00000000 */  nop
