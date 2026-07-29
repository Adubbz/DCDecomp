.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel copy_reg
/* 00DDE0 0010DCE0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00DDE4 0010DCE4 1000B1FF */  sd          $17, 0x10($29)
/* 00DDE8 0010DCE8 0000B0FF */  sd          $16, 0x0($29)
/* 00DDEC 0010DCEC 2D888000 */  daddu       $17, $4, $0
/* 00DDF0 0010DCF0 2D80C000 */  daddu       $16, $6, $0
/* 00DDF4 0010DCF4 2000B2FF */  sd          $18, 0x20($29)
/* 00DDF8 0010DCF8 3000BFFF */  sd          $31, 0x30($29)
/* 00DDFC 0010DCFC 1637040C */  jal         get_reg_addr
/* 00DE00 0010DD00 2D300000 */   daddu      $6, $0, $0
/* 00DE04 0010DD04 2D904000 */  daddu       $18, $2, $0
/* 00DE08 0010DD08 2D280002 */  daddu       $5, $16, $0
/* 00DE0C 0010DD0C 2D202002 */  daddu       $4, $17, $0
/* 00DE10 0010DD10 1637040C */  jal         get_reg_addr
/* 00DE14 0010DD14 2D300000 */   daddu      $6, $0, $0
/* 00DE18 0010DD18 2D204000 */  daddu       $4, $2, $0
/* 00DE1C 0010DD1C 1F00222A */  slti        $2, $17, 0x1F
/* 00DE20 0010DD20 06004054 */  bnel        $2, $0, .L0010DD3C
/* 00DE24 0010DD24 10000624 */   addiu      $6, $0, 0x10
/* 00DE28 0010DD28 3F000224 */  addiu       $2, $0, 0x3F
/* 00DE2C 0010DD2C 08000624 */  addiu       $6, $0, 0x8
/* 00DE30 0010DD30 2A105100 */  slt         $2, $2, $17
/* 00DE34 0010DD34 04000324 */  addiu       $3, $0, 0x4
/* 00DE38 0010DD38 0A306200 */  movz        $6, $3, $2
.L0010DD3C:
/* 00DE3C 0010DD3C EC0C040C */  jal         memcpy
/* 00DE40 0010DD40 2D284002 */   daddu      $5, $18, $0
/* 00DE44 0010DD44 3000BFDF */  ld          $31, 0x30($29)
/* 00DE48 0010DD48 2000B2DF */  ld          $18, 0x20($29)
/* 00DE4C 0010DD4C 1000B1DF */  ld          $17, 0x10($29)
/* 00DE50 0010DD50 0000B0DF */  ld          $16, 0x0($29)
/* 00DE54 0010DD54 0800E003 */  jr          $31
/* 00DE58 0010DD58 4000BD27 */   addiu      $29, $29, 0x40
/* 00DE5C 0010DD5C 00000000 */  nop
