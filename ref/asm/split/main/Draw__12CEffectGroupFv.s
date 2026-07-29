.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__12CEffectGroupFv
/* 064B60 00164A60 D0FFBD27 */  addiu       $29, $29, -0x30
/* 064B64 00164A64 2000BF7F */  sq          $31, 0x20($29)
/* 064B68 00164A68 1000B17F */  sq          $17, 0x10($29)
/* 064B6C 00164A6C 0000B07F */  sq          $16, 0x0($29)
/* 064B70 00164A70 288E8070 */  paddub      $17, $4, $0
/* 064B74 00164A74 28860070 */  paddub      $16, $0, $0
/* 064B78 00164A78 07000010 */  b           .L00164A98
/* 064B7C 00164A7C 00000000 */   nop
.L00164A80:
/* 064B80 00164A80 001A1000 */  sll         $3, $16, 8
/* 064B84 00164A84 0000228E */  lw          $2, 0x0($17)
/* 064B88 00164A88 21204300 */  addu        $4, $2, $3
/* 064B8C 00164A8C D090050C */  jal         Draw__7CEffectFv
/* 064B90 00164A90 00000000 */   nop
/* 064B94 00164A94 01001026 */  addiu       $16, $16, 0x1
.L00164A98:
/* 064B98 00164A98 0400238E */  lw          $3, 0x4($17)
/* 064B9C 00164A9C 2A180302 */  slt         $3, $16, $3
/* 064BA0 00164AA0 F7FF6014 */  bnez        $3, .L00164A80
/* 064BA4 00164AA4 00000000 */   nop
/* 064BA8 00164AA8 2000BF7B */  lq          $31, 0x20($29)
/* 064BAC 00164AAC 1000B17B */  lq          $17, 0x10($29)
/* 064BB0 00164AB0 0000B07B */  lq          $16, 0x0($29)
/* 064BB4 00164AB4 3000BD27 */  addiu       $29, $29, 0x30
/* 064BB8 00164AB8 0800E003 */  jr          $31
/* 064BBC 00164ABC 00000000 */   nop
