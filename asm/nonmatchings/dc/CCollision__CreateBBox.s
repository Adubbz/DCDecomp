.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CreateBBox__10CCollisionFv
/* 24E50 00124D50 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 24E54 00124D54 1000BF7F */  sq         $31, 0x10($sp)
/* 24E58 00124D58 0000B07F */  sq         $16, 0x0($sp)
/* 24E5C 00124D5C 28868070 */  paddub     $16, $4, $0
/* 24E60 00124D60 2C00A527 */  addiu      $5, $sp, 0x2C
/* 24E64 00124D64 2000198E */  lw         $25, 0x20($16)
/* 24E68 00124D68 1000398F */  lw         $25, 0x10($25)
/* 24E6C 00124D6C 09F82003 */  jalr       $25
/* 24E70 00124D70 00000000 */   nop
/* 24E74 00124D74 282E4070 */  paddub     $5, $2, $0
/* 24E78 00124D78 0900A014 */  bnez       $5, .L00124DA0
/* 24E7C 00124D7C 00000000 */   nop
/* 24E80 00124D80 100000AE */  sw         $0, 0x10($16)
/* 24E84 00124D84 000000AE */  sw         $0, 0x0($16)
/* 24E88 00124D88 140000AE */  sw         $0, 0x14($16)
/* 24E8C 00124D8C 040000AE */  sw         $0, 0x4($16)
/* 24E90 00124D90 180000AE */  sw         $0, 0x18($16)
/* 24E94 00124D94 080000AE */  sw         $0, 0x8($16)
/* 24E98 00124D98 40000010 */  b          .L00124E9C
/* 24E9C 00124D9C 00000000 */   nop
.L00124DA0:
/* 24EA0 00124DA0 0000A0C4 */  lwc1       $f0, 0x0($5)
/* 24EA4 00124DA4 000000E6 */  swc1       $f0, 0x0($16)
/* 24EA8 00124DA8 0400A0C4 */  lwc1       $f0, 0x4($5)
/* 24EAC 00124DAC 040000E6 */  swc1       $f0, 0x4($16)
/* 24EB0 00124DB0 0800A0C4 */  lwc1       $f0, 0x8($5)
/* 24EB4 00124DB4 080000E6 */  swc1       $f0, 0x8($16)
/* 24EB8 00124DB8 0000A0C4 */  lwc1       $f0, 0x0($5)
/* 24EBC 00124DBC 100000E6 */  swc1       $f0, 0x10($16)
/* 24EC0 00124DC0 0400A0C4 */  lwc1       $f0, 0x4($5)
/* 24EC4 00124DC4 140000E6 */  swc1       $f0, 0x14($16)
/* 24EC8 00124DC8 0800A0C4 */  lwc1       $f0, 0x8($5)
/* 24ECC 00124DCC 180000E6 */  swc1       $f0, 0x18($16)
/* 24ED0 00124DD0 28260070 */  paddub     $4, $0, $0
/* 24ED4 00124DD4 2D000010 */  b          .L00124E8C
/* 24ED8 00124DD8 00000000 */   nop
.L00124DDC:
/* 24EDC 00124DDC 000000C6 */  lwc1       $f0, 0x0($16)
/* 24EE0 00124DE0 0000A1C4 */  lwc1       $f1, 0x0($5)
/* 24EE4 00124DE4 34000146 */  c.lt.s     $f0, $f1
/* 24EE8 00124DE8 00000000 */  nop
/* 24EEC 00124DEC 02000045 */  bc1f       .L00124DF8
/* 24EF0 00124DF0 00000000 */   nop
/* 24EF4 00124DF4 000001E6 */  swc1       $f1, 0x0($16)
.L00124DF8:
/* 24EF8 00124DF8 040000C6 */  lwc1       $f0, 0x4($16)
/* 24EFC 00124DFC 0400A1C4 */  lwc1       $f1, 0x4($5)
/* 24F00 00124E00 34000146 */  c.lt.s     $f0, $f1
/* 24F04 00124E04 00000000 */  nop
/* 24F08 00124E08 02000045 */  bc1f       .L00124E14
/* 24F0C 00124E0C 00000000 */   nop
/* 24F10 00124E10 040001E6 */  swc1       $f1, 0x4($16)
.L00124E14:
/* 24F14 00124E14 080000C6 */  lwc1       $f0, 0x8($16)
/* 24F18 00124E18 0800A1C4 */  lwc1       $f1, 0x8($5)
/* 24F1C 00124E1C 34000146 */  c.lt.s     $f0, $f1
/* 24F20 00124E20 00000000 */  nop
/* 24F24 00124E24 02000045 */  bc1f       .L00124E30
/* 24F28 00124E28 00000000 */   nop
/* 24F2C 00124E2C 080001E6 */  swc1       $f1, 0x8($16)
.L00124E30:
/* 24F30 00124E30 100000C6 */  lwc1       $f0, 0x10($16)
/* 24F34 00124E34 0000A1C4 */  lwc1       $f1, 0x0($5)
/* 24F38 00124E38 36000146 */  c.le.s     $f0, $f1
/* 24F3C 00124E3C 00000000 */  nop
/* 24F40 00124E40 02000145 */  bc1t       .L00124E4C
/* 24F44 00124E44 00000000 */   nop
/* 24F48 00124E48 100001E6 */  swc1       $f1, 0x10($16)
.L00124E4C:
/* 24F4C 00124E4C 140000C6 */  lwc1       $f0, 0x14($16)
/* 24F50 00124E50 0400A1C4 */  lwc1       $f1, 0x4($5)
/* 24F54 00124E54 36000146 */  c.le.s     $f0, $f1
/* 24F58 00124E58 00000000 */  nop
/* 24F5C 00124E5C 02000145 */  bc1t       .L00124E68
/* 24F60 00124E60 00000000 */   nop
/* 24F64 00124E64 140001E6 */  swc1       $f1, 0x14($16)
.L00124E68:
/* 24F68 00124E68 180000C6 */  lwc1       $f0, 0x18($16)
/* 24F6C 00124E6C 0800A1C4 */  lwc1       $f1, 0x8($5)
/* 24F70 00124E70 36000146 */  c.le.s     $f0, $f1
/* 24F74 00124E74 00000000 */  nop
/* 24F78 00124E78 02000145 */  bc1t       .L00124E84
/* 24F7C 00124E7C 00000000 */   nop
/* 24F80 00124E80 180001E6 */  swc1       $f1, 0x18($16)
.L00124E84:
/* 24F84 00124E84 1000A524 */  addiu      $5, $5, 0x10
/* 24F88 00124E88 01008424 */  addiu      $4, $4, 0x1
.L00124E8C:
/* 24F8C 00124E8C 2C00A38F */  lw         $3, 0x2C($sp)
/* 24F90 00124E90 2A188300 */  slt        $3, $4, $3
/* 24F94 00124E94 D1FF6014 */  bnez       $3, .L00124DDC
/* 24F98 00124E98 00000000 */   nop
.L00124E9C:
/* 24F9C 00124E9C 1000BF7B */  lq         $31, 0x10($sp)
/* 24FA0 00124EA0 0000B07B */  lq         $16, 0x0($sp)
/* 24FA4 00124EA4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 24FA8 00124EA8 0800E003 */  jr         $31
/* 24FAC 00124EAC 00000000 */   nop
