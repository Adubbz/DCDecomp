.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
/* 02C0F0 0012BFF0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 02C0F4 0012BFF4 0000BF7F */  sq          $31, 0x0($29)
/* 02C0F8 0012BFF8 1000A327 */  addiu       $3, $29, 0x10
/* 02C0FC 0012BFFC 0000E2DC */  ld          $2, 0x0($7)
/* 02C100 0012C000 000062FC */  sd          $2, 0x0($3)
/* 02C104 0012C004 1800A227 */  addiu       $2, $29, 0x18
/* 02C108 0012C008 000003C5 */  lwc1        $f3, 0x0($8)
/* 02C10C 0012C00C 040002C5 */  lwc1        $f2, 0x4($8)
/* 02C110 0012C010 080001C5 */  lwc1        $f1, 0x8($8)
/* 02C114 0012C014 0C0000C5 */  lwc1        $f0, 0xC($8)
/* 02C118 0012C018 000043E4 */  swc1        $f3, 0x0($2)
/* 02C11C 0012C01C 040042E4 */  swc1        $f2, 0x4($2)
/* 02C120 0012C020 080041E4 */  swc1        $f1, 0x8($2)
/* 02C124 0012C024 0C0040E4 */  swc1        $f0, 0xC($2)
/* 02C128 0012C028 80000224 */  addiu       $2, $0, 0x80
/* 02C12C 0012C02C 2800A2A3 */  sb          $2, 0x28($29)
/* 02C130 0012C030 2900A2A3 */  sb          $2, 0x29($29)
/* 02C134 0012C034 2A00A2A3 */  sb          $2, 0x2A($29)
/* 02C138 0012C038 2B00A2A3 */  sb          $2, 0x2B($29)
/* 02C13C 0012C03C 283E6070 */  paddub      $7, $3, $0
/* 02C140 0012C040 28462071 */  paddub      $8, $9, $0
/* 02C144 0012C044 284E4071 */  paddub      $9, $10, $0
/* 02C148 0012C048 A4AF040C */  jal         AddTable__12CSpriteTableFiiP9MG_SPRITEii
/* 02C14C 0012C04C 00000000 */   nop
/* 02C150 0012C050 0000BF7B */  lq          $31, 0x0($29)
/* 02C154 0012C054 4000BD27 */  addiu       $29, $29, 0x40
/* 02C158 0012C058 0800E003 */  jr          $31
/* 02C15C 0012C05C 00000000 */   nop
