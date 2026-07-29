.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__7CObjectFf
/* 057110 00157010 E0FFBD27 */  addiu       $29, $29, -0x20
/* 057114 00157014 1000BF7F */  sq          $31, 0x10($29)
/* 057118 00157018 0000B07F */  sq          $16, 0x0($29)
/* 05711C 0015701C 28868070 */  paddub      $16, $4, $0
/* 057120 00157020 2A00023C */  lui         $2, %hi(__vt__7CObject)
/* 057124 00157024 D0154224 */  addiu       $2, $2, %lo(__vt__7CObject)
/* 057128 00157028 A00082AC */  sw          $2, 0xA0($4)
/* 05712C 0015702C 145C050C */  jal         Initialize__7CObjectFf
/* 057130 00157030 00000000 */   nop
/* 057134 00157034 28160072 */  paddub      $2, $16, $0
/* 057138 00157038 1000BF7B */  lq          $31, 0x10($29)
/* 05713C 0015703C 0000B07B */  lq          $16, 0x0($29)
/* 057140 00157040 2000BD27 */  addiu       $29, $29, 0x20
/* 057144 00157044 0800E003 */  jr          $31
/* 057148 00157048 00000000 */   nop
/* 05714C 0015704C 00000000 */  nop
