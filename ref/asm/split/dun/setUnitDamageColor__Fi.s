.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setUnitDamageColor__Fi
/* 015220 01DC0F20 F0FFBD27 */  addiu       $29, $29, -0x10
/* 015224 01DC0F24 0000BF7F */  sq          $31, 0x0($29)
/* 015228 01DC0F28 F49E8283 */  lb          $2, -0x610C($28)
/* 01522C 01DC0F2C 05004014 */  bnez        $2, .L01DC0F44_2FC544
/* 015230 01DC0F30 00000000 */   nop
/* 015234 01DC0F34 0043023C */  lui         $2, (0x43000000 >> 16)
/* 015238 01DC0F38 F09E82AF */  sw          $2, -0x6110($28)
/* 01523C 01DC0F3C 01000224 */  addiu       $2, $0, 0x1
/* 015240 01DC0F40 F49E82A3 */  sb          $2, -0x610C($28)
.L01DC0F44_2FC544:
/* 015244 01DC0F44 FC9E8283 */  lb          $2, -0x6104($28)
/* 015248 01DC0F48 04004014 */  bnez        $2, .L01DC0F5C_2FC55C
/* 01524C 01DC0F4C 00000000 */   nop
/* 015250 01DC0F50 F89E80AF */  sw          $0, -0x6108($28)
/* 015254 01DC0F54 01000224 */  addiu       $2, $0, 0x1
/* 015258 01DC0F58 FC9E82A3 */  sb          $2, -0x6104($28)
.L01DC0F5C_2FC55C:
/* 01525C 01DC0F5C 04008010 */  beqz        $4, .L01DC0F70_2FC570
/* 015260 01DC0F60 00000000 */   nop
/* 015264 01DC0F64 01000224 */  addiu       $2, $0, 0x1
/* 015268 01DC0F68 009F82AF */  sw          $2, -0x6100($28)
/* 01526C 01DC0F6C F89E80AF */  sw          $0, -0x6108($28)
.L01DC0F70_2FC570:
/* 015270 01DC0F70 009F828F */  lw          $2, -0x6100($28)
/* 015274 01DC0F74 18004010 */  beqz        $2, .L01DC0FD8_2FC5D8
/* 015278 01DC0F78 00000000 */   nop
/* 01527C 01DC0F7C F89E81C7 */  lwc1        $f1, -0x6108($28)
/* 015280 01DC0F80 D48580C7 */  lwc1        $f0, -0x7A2C($28)
/* 015284 01DC0F84 000B0046 */  add.s       $f12, $f1, $f0
/* 015288 01DC0F88 F89E8CE7 */  swc1        $f12, -0x6108($28)
/* 01528C 01DC0F8C 2876040C */  jal         sinf
/* 015290 01DC0F90 00000000 */   nop
/* 015294 01DC0F94 A042023C */  lui         $2, (0x42A00000 >> 16)
/* 015298 01DC0F98 00088244 */  mtc1        $2, $f1
/* 01529C 01DC0F9C 00000000 */  nop
/* 0152A0 01DC0FA0 42080046 */  mul.s       $f1, $f1, $f0
/* 0152A4 01DC0FA4 0043023C */  lui         $2, (0x43000000 >> 16)
/* 0152A8 01DC0FA8 00008244 */  mtc1        $2, $f0
/* 0152AC 01DC0FAC 00000000 */  nop
/* 0152B0 01DC0FB0 00000146 */  add.s       $f0, $f0, $f1
/* 0152B4 01DC0FB4 F09E80E7 */  swc1        $f0, -0x6110($28)
/* 0152B8 01DC0FB8 F89E81C7 */  lwc1        $f1, -0x6108($28)
/* 0152BC 01DC0FBC D88580C7 */  lwc1        $f0, -0x7A28($28)
/* 0152C0 01DC0FC0 34080046 */  c.lt.s      $f1, $f0
/* 0152C4 01DC0FC4 00000000 */  nop
/* 0152C8 01DC0FC8 03000145 */  bc1t        .L01DC0FD8_2FC5D8
/* 0152CC 01DC0FCC 00000000 */   nop
/* 0152D0 01DC0FD0 009F80AF */  sw          $0, -0x6100($28)
/* 0152D4 01DC0FD4 F09E82AF */  sw          $2, -0x6110($28)
.L01DC0FD8_2FC5D8:
/* 0152D8 01DC0FD8 F09E80C7 */  lwc1        $f0, -0x6110($28)
/* 0152DC 01DC0FDC 0000BF7B */  lq          $31, 0x0($29)
/* 0152E0 01DC0FE0 1000BD27 */  addiu       $29, $29, 0x10
/* 0152E4 01DC0FE4 0800E003 */  jr          $31
/* 0152E8 01DC0FE8 00000000 */   nop
/* 0152EC 01DC0FEC 00000000 */  nop
