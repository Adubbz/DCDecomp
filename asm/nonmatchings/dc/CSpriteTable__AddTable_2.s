.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii
/* 2C0F0 0012BFF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2C0F4 0012BFF4 0000BF7F */  sq         $31, 0x0($sp)
/* 2C0F8 0012BFF8 1000A327 */  addiu      $3, $sp, 0x10
/* 2C0FC 0012BFFC 0000E2DC */  ld         $2, 0x0($7)
/* 2C100 0012C000 000062FC */  sd         $2, 0x0($3)
/* 2C104 0012C004 1800A227 */  addiu      $2, $sp, 0x18
/* 2C108 0012C008 000003C5 */  lwc1       $f3, 0x0($8)
/* 2C10C 0012C00C 040002C5 */  lwc1       $f2, 0x4($8)
/* 2C110 0012C010 080001C5 */  lwc1       $f1, 0x8($8)
/* 2C114 0012C014 0C0000C5 */  lwc1       $f0, 0xC($8)
/* 2C118 0012C018 000043E4 */  swc1       $f3, 0x0($2)
/* 2C11C 0012C01C 040042E4 */  swc1       $f2, 0x4($2)
/* 2C120 0012C020 080041E4 */  swc1       $f1, 0x8($2)
/* 2C124 0012C024 0C0040E4 */  swc1       $f0, 0xC($2)
/* 2C128 0012C028 80000224 */  addiu      $2, $0, 0x80
/* 2C12C 0012C02C 2800A2A3 */  sb         $2, 0x28($sp)
/* 2C130 0012C030 2900A2A3 */  sb         $2, 0x29($sp)
/* 2C134 0012C034 2A00A2A3 */  sb         $2, 0x2A($sp)
/* 2C138 0012C038 2B00A2A3 */  sb         $2, 0x2B($sp)
/* 2C13C 0012C03C 283E6070 */  paddub     $7, $3, $0
/* 2C140 0012C040 28462071 */  paddub     $8, $9, $0
/* 2C144 0012C044 284E4071 */  paddub     $9, $10, $0
/* 2C148 0012C048 A4AF040C */  jal        AddTable__12CSpriteTableFiiP9MG_SPRITEii
/* 2C14C 0012C04C 00000000 */   nop
/* 2C150 0012C050 0000BF7B */  lq         $31, 0x0($sp)
/* 2C154 0012C054 4000BD27 */  addiu      $sp, $sp, 0x40
/* 2C158 0012C058 0800E003 */  jr         $31
/* 2C15C 0012C05C 00000000 */   nop
