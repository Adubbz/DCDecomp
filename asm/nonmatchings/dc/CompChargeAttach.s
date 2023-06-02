.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CompChargeAttach__FP11ATTACH_LISTP11ATTACH_LIST
/* 13FDF0 0023FCF0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 13FDF4 0023FCF4 3000BF7F */  sq         $31, 0x30($sp)
/* 13FDF8 0023FCF8 2000B27F */  sq         $18, 0x20($sp)
/* 13FDFC 0023FCFC 1000B17F */  sq         $17, 0x10($sp)
/* 13FE00 0023FD00 0000B07F */  sq         $16, 0x0($sp)
/* 13FE04 0023FD04 288E8070 */  paddub     $17, $4, $0
/* 13FE08 0023FD08 2886A070 */  paddub     $16, $5, $0
/* 13FE0C 0023FD0C 00008484 */  lh         $4, 0x0($4)
/* 13FE10 0023FD10 B4C6080C */  jal        GetAttachKind__Fi
/* 13FE14 0023FD14 00000000 */   nop
/* 13FE18 0023FD18 80180200 */  sll        $3, $2, 2
/* 13FE1C 0023FD1C 2900023C */  lui        $2, %hi(asort_table_3)
/* 13FE20 0023FD20 20604224 */  addiu      $2, $2, %lo(asort_table_3)
/* 13FE24 0023FD24 21104300 */  addu       $2, $2, $3
/* 13FE28 0023FD28 0000528C */  lw         $18, 0x0($2)
/* 13FE2C 0023FD2C 00000486 */  lh         $4, 0x0($16)
/* 13FE30 0023FD30 B4C6080C */  jal        GetAttachKind__Fi
/* 13FE34 0023FD34 00000000 */   nop
/* 13FE38 0023FD38 80180200 */  sll        $3, $2, 2
/* 13FE3C 0023FD3C 2900023C */  lui        $2, %hi(asort_table_3)
/* 13FE40 0023FD40 20604224 */  addiu      $2, $2, %lo(asort_table_3)
/* 13FE44 0023FD44 21104300 */  addu       $2, $2, $3
/* 13FE48 0023FD48 0000428C */  lw         $2, 0x0($2)
/* 13FE4C 0023FD4C 00002486 */  lh         $4, 0x0($17)
/* 13FE50 0023FD50 51008128 */  slti       $at, $4, 0x51
/* 13FE54 0023FD54 02002010 */  beqz       $at, .L0023FD60
/* 13FE58 0023FD58 00000000 */   nop
/* 13FE5C 0023FD5C 05001224 */  addiu      $18, $0, 0x5
.L0023FD60:
/* 13FE60 0023FD60 00000386 */  lh         $3, 0x0($16)
/* 13FE64 0023FD64 51006128 */  slti       $at, $3, 0x51
/* 13FE68 0023FD68 02002010 */  beqz       $at, .L0023FD74
/* 13FE6C 0023FD6C 00000000 */   nop
/* 13FE70 0023FD70 05000224 */  addiu      $2, $0, 0x5
.L0023FD74:
/* 13FE74 0023FD74 2A085200 */  slt        $at, $2, $18
/* 13FE78 0023FD78 04002010 */  beqz       $at, .L0023FD8C
/* 13FE7C 0023FD7C 00000000 */   nop
/* 13FE80 0023FD80 01000224 */  addiu      $2, $0, 0x1
/* 13FE84 0023FD84 12000010 */  b          .L0023FDD0
/* 13FE88 0023FD88 00000000 */   nop
.L0023FD8C:
/* 13FE8C 0023FD8C 2A084202 */  slt        $at, $18, $2
/* 13FE90 0023FD90 04002010 */  beqz       $at, .L0023FDA4
/* 13FE94 0023FD94 00000000 */   nop
/* 13FE98 0023FD98 FFFF0224 */  addiu      $2, $0, -0x1
/* 13FE9C 0023FD9C 0C000010 */  b          .L0023FDD0
/* 13FEA0 0023FDA0 00000000 */   nop
.L0023FDA4:
/* 13FEA4 0023FDA4 2A086400 */  slt        $at, $3, $4
/* 13FEA8 0023FDA8 04002010 */  beqz       $at, .L0023FDBC
/* 13FEAC 0023FDAC 00000000 */   nop
/* 13FEB0 0023FDB0 01000224 */  addiu      $2, $0, 0x1
/* 13FEB4 0023FDB4 06000010 */  b          .L0023FDD0
/* 13FEB8 0023FDB8 00000000 */   nop
.L0023FDBC:
/* 13FEBC 0023FDBC 2A088300 */  slt        $at, $4, $3
/* 13FEC0 0023FDC0 FFFF0224 */  addiu      $2, $0, -0x1
/* 13FEC4 0023FDC4 0A100100 */  movz       $2, $0, $at
/* 13FEC8 0023FDC8 01000010 */  b          .L0023FDD0
/* 13FECC 0023FDCC 00000000 */   nop
.L0023FDD0:
/* 13FED0 0023FDD0 3000BF7B */  lq         $31, 0x30($sp)
/* 13FED4 0023FDD4 2000B27B */  lq         $18, 0x20($sp)
/* 13FED8 0023FDD8 1000B17B */  lq         $17, 0x10($sp)
/* 13FEDC 0023FDDC 0000B07B */  lq         $16, 0x0($sp)
/* 13FEE0 0023FDE0 4000BD27 */  addiu      $sp, $sp, 0x40
/* 13FEE4 0023FDE4 0800E003 */  jr         $31
/* 13FEE8 0023FDE8 00000000 */   nop
/* 13FEEC 0023FDEC 00000000 */  nop
