.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetItemTypeInfo__FiPc
/* 0D0F30 001D0E30 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0D0F34 001D0E34 1000BF7F */  sq          $31, 0x10($29)
/* 0D0F38 001D0E38 0000B07F */  sq          $16, 0x0($29)
/* 0D0F3C 001D0E3C 2886A070 */  paddub      $16, $5, $0
/* 0D0F40 001D0E40 FFFF0224 */  addiu       $2, $0, -0x1
/* 0D0F44 001D0E44 0300801C */  bgtz        $4, .L001D0E54
/* 0D0F48 001D0E48 00000000 */   nop
/* 0D0F4C 001D0E4C 07000010 */  b           .L001D0E6C
/* 0D0F50 001D0E50 00000000 */   nop
.L001D0E54:
/* 0D0F54 001D0E54 7443070C */  jal         GetCommonItemInfo__Fi
/* 0D0F58 001D0E58 00000000 */   nop
/* 0D0F5C 001D0E5C 00004380 */  lb          $3, 0x0($2)
/* 0D0F60 001D0E60 000003A2 */  sb          $3, 0x0($16)
/* 0D0F64 001D0E64 02004284 */  lh          $2, 0x2($2)
/* 0D0F68 001D0E68 00000000 */  nop
.L001D0E6C:
/* 0D0F6C 001D0E6C 1000BF7B */  lq          $31, 0x10($29)
/* 0D0F70 001D0E70 0000B07B */  lq          $16, 0x0($29)
/* 0D0F74 001D0E74 2000BD27 */  addiu       $29, $29, 0x20
/* 0D0F78 001D0E78 0800E003 */  jr          $31
/* 0D0F7C 001D0E7C 00000000 */   nop
