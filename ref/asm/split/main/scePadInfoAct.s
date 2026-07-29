.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel scePadInfoAct
/* 01FE00 0011FD00 2D408000 */  daddu       $8, $4, $0
/* 01FE04 0011FD04 70000324 */  addiu       $3, $0, 0x70
/* 01FE08 0011FD08 1C000424 */  addiu       $4, $0, 0x1C
/* 01FE0C 0011FD0C 18180371 */  mult1       $3, $8, $3
/* 01FE10 0011FD10 1820A400 */  mult        $4, $5, $4
/* 01FE14 0011FD14 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01FE18 0011FD18 2B00023C */  lui         $2, %hi(PadInfo)
/* 01FE1C 0011FD1C 1000B1FF */  sd          $17, 0x10($29)
/* 01FE20 0011FD20 0000B0FF */  sd          $16, 0x0($29)
/* 01FE24 0011FD24 909C4224 */  addiu       $2, $2, %lo(PadInfo)
/* 01FE28 0011FD28 2000BFFF */  sd          $31, 0x20($29)
/* 01FE2C 0011FD2C 2D88C000 */  daddu       $17, $6, $0
/* 01FE30 0011FD30 21208300 */  addu        $4, $4, $3
/* 01FE34 0011FD34 21104400 */  addu        $2, $2, $4
/* 01FE38 0011FD38 1000438C */  lw          $3, 0x10($2)
/* 01FE3C 0011FD3C 32006010 */  beqz        $3, .L0011FE08
/* 01FE40 0011FD40 2D80E000 */   daddu      $16, $7, $0
/* 01FE44 0011FD44 8C7E040C */  jal         scePadGetDmaStr
/* 01FE48 0011FD48 2D200001 */   daddu      $4, $8, $0
/* 01FE4C 0011FD4C 2D204000 */  daddu       $4, $2, $0
/* 01FE50 0011FD50 72008590 */  lbu         $5, 0x72($4)
/* 01FE54 0011FD54 01000224 */  addiu       $2, $0, 0x1
/* 01FE58 0011FD58 2C00A214 */  bne         $5, $2, .L0011FE0C
/* 01FE5C 0011FD5C 2D100000 */   daddu      $2, $0, $0
/* 01FE60 0011FD60 64008290 */  lbu         $2, 0x64($4)
/* 01FE64 0011FD64 0200422C */  sltiu       $2, $2, 0x2
/* 01FE68 0011FD68 28004014 */  bnez        $2, .L0011FE0C
/* 01FE6C 0011FD6C 2D100000 */   daddu      $2, $0, $0
/* 01FE70 0011FD70 6A008390 */  lbu         $3, 0x6A($4)
/* 01FE74 0011FD74 2A102302 */  slt         $2, $17, $3
/* 01FE78 0011FD78 23004010 */  beqz        $2, .L0011FE08
/* 01FE7C 0011FD7C FFFF0224 */   addiu      $2, $0, -0x1
/* 01FE80 0011FD80 03002216 */  bne         $17, $2, .L0011FD90
/* 01FE84 0011FD84 02000224 */   addiu      $2, $0, 0x2
/* 01FE88 0011FD88 20000010 */  b           .L0011FE0C
/* 01FE8C 0011FD8C 2D106000 */   daddu      $2, $3, $0
.L0011FD90:
/* 01FE90 0011FD90 11000212 */  beq         $16, $2, .L0011FDD8
/* 01FE94 0011FD94 0300022A */   slti       $2, $16, 0x3
/* 01FE98 0011FD98 05004010 */  beqz        $2, .L0011FDB0
/* 01FE9C 0011FD9C 03000224 */   addiu      $2, $0, 0x3
/* 01FEA0 0011FDA0 09000512 */  beq         $16, $5, .L0011FDC8
/* 01FEA4 0011FDA4 2D100000 */   daddu      $2, $0, $0
/* 01FEA8 0011FDA8 19000010 */  b           .L0011FE10
/* 01FEAC 0011FDAC 2000BFDF */   ld         $31, 0x20($29)
.L0011FDB0:
/* 01FEB0 0011FDB0 0D000212 */  beq         $16, $2, .L0011FDE8
/* 01FEB4 0011FDB4 04000224 */   addiu      $2, $0, 0x4
/* 01FEB8 0011FDB8 0F000212 */  beq         $16, $2, .L0011FDF8
/* 01FEBC 0011FDBC 2D100000 */   daddu      $2, $0, $0
/* 01FEC0 0011FDC0 13000010 */  b           .L0011FE10
/* 01FEC4 0011FDC4 2000BFDF */   ld         $31, 0x20($29)
.L0011FDC8:
/* 01FEC8 0011FDC8 80181100 */  sll         $3, $17, 2
/* 01FECC 0011FDCC 21188300 */  addu        $3, $4, $3
/* 01FED0 0011FDD0 0E000010 */  b           .L0011FE0C
/* 01FED4 0011FDD4 30006290 */   lbu        $2, 0x30($3)
.L0011FDD8:
/* 01FED8 0011FDD8 80181100 */  sll         $3, $17, 2
/* 01FEDC 0011FDDC 21188300 */  addu        $3, $4, $3
/* 01FEE0 0011FDE0 0A000010 */  b           .L0011FE0C
/* 01FEE4 0011FDE4 31006290 */   lbu        $2, 0x31($3)
.L0011FDE8:
/* 01FEE8 0011FDE8 80181100 */  sll         $3, $17, 2
/* 01FEEC 0011FDEC 21188300 */  addu        $3, $4, $3
/* 01FEF0 0011FDF0 06000010 */  b           .L0011FE0C
/* 01FEF4 0011FDF4 32006290 */   lbu        $2, 0x32($3)
.L0011FDF8:
/* 01FEF8 0011FDF8 80181100 */  sll         $3, $17, 2
/* 01FEFC 0011FDFC 21188300 */  addu        $3, $4, $3
/* 01FF00 0011FE00 02000010 */  b           .L0011FE0C
/* 01FF04 0011FE04 33006290 */   lbu        $2, 0x33($3)
.L0011FE08:
/* 01FF08 0011FE08 2D100000 */  daddu       $2, $0, $0
.L0011FE0C:
/* 01FF0C 0011FE0C 2000BFDF */  ld          $31, 0x20($29)
.L0011FE10:
/* 01FF10 0011FE10 1000B1DF */  ld          $17, 0x10($29)
/* 01FF14 0011FE14 0000B0DF */  ld          $16, 0x0($29)
/* 01FF18 0011FE18 0800E003 */  jr          $31
/* 01FF1C 0011FE1C 3000BD27 */   addiu      $29, $29, 0x30
