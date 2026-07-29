.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSPInfo__Fi
/* 05B6B0 0015B5B0 04008004 */  bltz        $4, .L0015B5C4
/* 05B6B4 0015B5B4 00000000 */   nop
/* 05B6B8 0015B5B8 40008228 */  slti        $2, $4, 0x40
/* 05B6BC 0015B5BC 04004014 */  bnez        $2, .L0015B5D0
/* 05B6C0 0015B5C0 00000000 */   nop
.L0015B5C4:
/* 05B6C4 0015B5C4 28160070 */  paddub      $2, $0, $0
/* 05B6C8 0015B5C8 07000010 */  b           .L0015B5E8
/* 05B6CC 0015B5CC 00000000 */   nop
.L0015B5D0:
/* 05B6D0 0015B5D0 40100400 */  sll         $2, $4, 1
/* 05B6D4 0015B5D4 21104400 */  addu        $2, $2, $4
/* 05B6D8 0015B5D8 40180200 */  sll         $3, $2, 1
/* 05B6DC 0015B5DC 2600023C */  lui         $2, %hi(special_se_info)
/* 05B6E0 0015B5E0 B0654224 */  addiu       $2, $2, %lo(special_se_info)
/* 05B6E4 0015B5E4 21104300 */  addu        $2, $2, $3
.L0015B5E8:
/* 05B6E8 0015B5E8 0800E003 */  jr          $31
/* 05B6EC 0015B5EC 00000000 */   nop
