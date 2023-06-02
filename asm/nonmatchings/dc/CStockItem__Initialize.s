.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CStockItemFv
/* 13F690 0023F590 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 13F694 0023F594 1000BF7F */  sq         $31, 0x10($sp)
/* 13F698 0023F598 0000B07F */  sq         $16, 0x0($sp)
/* 13F69C 0023F59C 28868070 */  paddub     $16, $4, $0
/* 13F6A0 0023F5A0 282E0070 */  paddub     $5, $0, $0
/* 13F6A4 0023F5A4 78000624 */  addiu      $6, $0, 0x78
/* 13F6A8 0023F5A8 5A0D040C */  jal        memset
/* 13F6AC 0023F5AC 00000000 */   nop
/* 13F6B0 0023F5B0 78000426 */  addiu      $4, $16, 0x78
/* 13F6B4 0023F5B4 282E0070 */  paddub     $5, $0, $0
/* 13F6B8 0023F5B8 78000624 */  addiu      $6, $0, 0x78
/* 13F6BC 0023F5BC 5A0D040C */  jal        memset
/* 13F6C0 0023F5C0 00000000 */   nop
/* 13F6C4 0023F5C4 F0000426 */  addiu      $4, $16, 0xF0
/* 13F6C8 0023F5C8 282E0070 */  paddub     $5, $0, $0
/* 13F6CC 0023F5CC 101D0624 */  addiu      $6, $0, 0x1D10
/* 13F6D0 0023F5D0 5A0D040C */  jal        memset
/* 13F6D4 0023F5D4 00000000 */   nop
/* 13F6D8 0023F5D8 001E0426 */  addiu      $4, $16, 0x1E00
/* 13F6DC 0023F5DC 282E0070 */  paddub     $5, $0, $0
/* 13F6E0 0023F5E0 C0030624 */  addiu      $6, $0, 0x3C0
/* 13F6E4 0023F5E4 5A0D040C */  jal        memset
/* 13F6E8 0023F5E8 00000000 */   nop
/* 13F6EC 0023F5EC 1000BF7B */  lq         $31, 0x10($sp)
/* 13F6F0 0023F5F0 0000B07B */  lq         $16, 0x0($sp)
/* 13F6F4 0023F5F4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13F6F8 0023F5F8 0800E003 */  jr         $31
/* 13F6FC 0023F5FC 00000000 */   nop
