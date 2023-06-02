.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdVillagerAppearOut__Fii
/* 85660 00185560 04008004 */  bltz       $4, .L00185574
/* 85664 00185564 00000000 */   nop
/* 85668 00185568 10008328 */  slti       $3, $4, 0x10
/* 8566C 0018556C 03006014 */  bnez       $3, .L0018557C
/* 85670 00185570 00000000 */   nop
.L00185574:
/* 85674 00185574 11000010 */  b          .L001855BC
/* 85678 00185578 00000000 */   nop
.L0018557C:
/* 8567C 0018557C 40180400 */  sll        $3, $4, 1
/* 85680 00185580 21186400 */  addu       $3, $3, $4
/* 85684 00185584 80300300 */  sll        $6, $3, 2
/* 85688 00185588 D401033C */  lui        $3, %hi(D_1D3CB64)
/* 8568C 0018558C 64CB6324 */  addiu      $3, $3, %lo(D_1D3CB64)
/* 85690 00185590 21386600 */  addu       $7, $3, $6
/* 85694 00185594 0000E38C */  lw         $3, 0x0($7)
/* 85698 00185598 2A08A300 */  slt        $at, $5, $3
/* 8569C 0018559C 07002014 */  bnez       $at, .L001855BC
/* 856A0 001855A0 00000000 */   nop
/* 856A4 001855A4 02000424 */  addiu      $4, $0, 0x2
/* 856A8 001855A8 D401033C */  lui        $3, %hi(appear)
/* 856AC 001855AC 60CB6324 */  addiu      $3, $3, %lo(appear)
/* 856B0 001855B0 21186600 */  addu       $3, $3, $6
/* 856B4 001855B4 000064AC */  sw         $4, 0x0($3)
/* 856B8 001855B8 0000E5AC */  sw         $5, 0x0($7)
.L001855BC:
/* 856BC 001855BC 0800E003 */  jr         $31
/* 856C0 001855C0 00000000 */   nop
/* 856C4 001855C4 00000000 */  nop
/* 856C8 001855C8 00000000 */  nop
/* 856CC 001855CC 00000000 */  nop