.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSPInfo__Fi
/* 5B6B0 0015B5B0 04008004 */  bltz       $4, .L0015B5C4
/* 5B6B4 0015B5B4 00000000 */   nop
/* 5B6B8 0015B5B8 40008228 */  slti       $2, $4, 0x40
/* 5B6BC 0015B5BC 04004014 */  bnez       $2, .L0015B5D0
/* 5B6C0 0015B5C0 00000000 */   nop
.L0015B5C4:
/* 5B6C4 0015B5C4 28160070 */  paddub     $2, $0, $0
/* 5B6C8 0015B5C8 07000010 */  b          .L0015B5E8
/* 5B6CC 0015B5CC 00000000 */   nop
.L0015B5D0:
/* 5B6D0 0015B5D0 40100400 */  sll        $2, $4, 1
/* 5B6D4 0015B5D4 21104400 */  addu       $2, $2, $4
/* 5B6D8 0015B5D8 40180200 */  sll        $3, $2, 1
/* 5B6DC 0015B5DC 2600023C */  lui        $2, %hi(special_se_info)
/* 5B6E0 0015B5E0 B0654224 */  addiu      $2, $2, %lo(special_se_info)
/* 5B6E4 0015B5E4 21104300 */  addu       $2, $2, $3
.L0015B5E8:
/* 5B6E8 0015B5E8 0800E003 */  jr         $31
/* 5B6EC 0015B5EC 00000000 */   nop
