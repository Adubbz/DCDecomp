.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotation__6CFrameFPf
/* 028F30 00128E30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 028F34 00128E34 0000BF7F */  sq          $31, 0x0($29)
/* 028F38 00128E38 28368070 */  paddub      $6, $4, $0
/* 028F3C 00128E3C 4402838C */  lw          $3, 0x244($4)
/* 028F40 00128E40 07006010 */  beqz        $3, .L00128E60
/* 028F44 00128E44 00000000 */   nop
/* 028F48 00128E48 0C00A0AC */  sw          $0, 0xC($5)
/* 028F4C 00128E4C 0800A0AC */  sw          $0, 0x8($5)
/* 028F50 00128E50 0400A0AC */  sw          $0, 0x4($5)
/* 028F54 00128E54 0000A0AC */  sw          $0, 0x0($5)
/* 028F58 00128E58 05000010 */  b           .L00128E70
/* 028F5C 00128E5C 00000000 */   nop
.L00128E60:
/* 028F60 00128E60 2826A070 */  paddub      $4, $5, $0
/* 028F64 00128E64 3002C524 */  addiu       $5, $6, 0x230
/* 028F68 00128E68 0C86040C */  jal         sceVu0CopyVector
/* 028F6C 00128E6C 00000000 */   nop
.L00128E70:
/* 028F70 00128E70 0000BF7B */  lq          $31, 0x0($29)
/* 028F74 00128E74 1000BD27 */  addiu       $29, $29, 0x10
/* 028F78 00128E78 0800E003 */  jr          $31
/* 028F7C 00128E7C 00000000 */   nop
