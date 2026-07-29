.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel add_tree__FP9NAME_TREEP9NAME_TREE
/* 03F080 0013EF80 0800838C */  lw          $3, 0x8($4)
/* 03F084 0013EF84 04006014 */  bnez        $3, .L0013EF98
/* 03F088 0013EF88 00000000 */   nop
/* 03F08C 0013EF8C 080085AC */  sw          $5, 0x8($4)
/* 03F090 0013EF90 0A000010 */  b           .L0013EFBC
/* 03F094 0013EF94 00000000 */   nop
.L0013EF98:
/* 03F098 0013EF98 0C00648C */  lw          $4, 0xC($3)
/* 03F09C 0013EF9C 04008014 */  bnez        $4, .L0013EFB0
/* 03F0A0 0013EFA0 00000000 */   nop
/* 03F0A4 0013EFA4 0C0065AC */  sw          $5, 0xC($3)
/* 03F0A8 0013EFA8 04000010 */  b           .L0013EFBC
/* 03F0AC 0013EFAC 00000000 */   nop
.L0013EFB0:
/* 03F0B0 0013EFB0 281E8070 */  paddub      $3, $4, $0
/* 03F0B4 0013EFB4 F8FF0010 */  b           .L0013EF98
/* 03F0B8 0013EFB8 00000000 */   nop
.L0013EFBC:
/* 03F0BC 0013EFBC 0800E003 */  jr          $31
/* 03F0C0 0013EFC0 00000000 */   nop
/* 03F0C4 0013EFC4 00000000 */  nop
/* 03F0C8 0013EFC8 00000000 */  nop
/* 03F0CC 0013EFCC 00000000 */  nop
