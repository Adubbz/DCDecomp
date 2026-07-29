.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SellMoneyCheck2__Fv
/* 0EB640 001EB540 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0EB644 001EB544 0000BF7F */  sq          $31, 0x0($29)
/* 0EB648 001EB548 284E0070 */  paddub      $9, $0, $0
/* 0EB64C 001EB54C 28560070 */  paddub      $10, $0, $0
/* 0EB650 001EB550 20000010 */  b           .L001EB5D4
/* 0EB654 001EB554 00000000 */   nop
.L001EB558:
/* 0EB658 001EB558 80180A00 */  sll         $3, $10, 2
/* 0EB65C 001EB55C 9094828F */  lw          $2, -0x6B70($28)
/* 0EB660 001EB560 21104300 */  addu        $2, $2, $3
/* 0EB664 001EB564 0000438C */  lw          $3, 0x0($2)
/* 0EB668 001EB568 02000224 */  addiu       $2, $0, 0x2
/* 0EB66C 001EB56C 18006214 */  bne         $3, $2, .L001EB5D0
/* 0EB670 001EB570 00000000 */   nop
/* 0EB674 001EB574 80110A00 */  sll         $2, $10, 6
/* 0EB678 001EB578 23104A00 */  subu        $2, $2, $10
/* 0EB67C 001EB57C 80300200 */  sll         $6, $2, 2
/* 0EB680 001EB580 A094828F */  lw          $2, -0x6B60($28)
/* 0EB684 001EB584 21104600 */  addu        $2, $2, $6
/* 0EB688 001EB588 00004484 */  lh          $4, 0x0($2)
/* 0EB68C 001EB58C 51008228 */  slti        $2, $4, 0x51
/* 0EB690 001EB590 0F004014 */  bnez        $2, .L001EB5D0
/* 0EB694 001EB594 00000000 */   nop
/* 0EB698 001EB598 01000524 */  addiu       $5, $0, 0x1
/* 0EB69C 001EB59C B4AC070C */  jal         CalItemMoney__Fii
/* 0EB6A0 001EB5A0 00000000 */   nop
/* 0EB6A4 001EB5A4 285E4070 */  paddub      $11, $2, $0
/* 0EB6A8 001EB5A8 01018228 */  slti        $2, $4, 0x101
/* 0EB6AC 001EB5AC 07004014 */  bnez        $2, .L001EB5CC
/* 0EB6B0 001EB5B0 00000000 */   nop
/* 0EB6B4 001EB5B4 A094828F */  lw          $2, -0x6B60($28)
/* 0EB6B8 001EB5B8 21104600 */  addu        $2, $2, $6
/* 0EB6BC 001EB5BC 04004424 */  addiu       $4, $2, 0x4
/* 0EB6C0 001EB5C0 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0EB6C4 001EB5C4 00000000 */   nop
/* 0EB6C8 001EB5C8 21586201 */  addu        $11, $11, $2
.L001EB5CC:
/* 0EB6CC 001EB5CC 21482B01 */  addu        $9, $9, $11
.L001EB5D0:
/* 0EB6D0 001EB5D0 01004A25 */  addiu       $10, $10, 0x1
.L001EB5D4:
/* 0EB6D4 001EB5D4 1E004229 */  slti        $2, $10, 0x1E
/* 0EB6D8 001EB5D8 DFFF4014 */  bnez        $2, .L001EB558
/* 0EB6DC 001EB5DC 00000000 */   nop
/* 0EB6E0 001EB5E0 28162071 */  paddub      $2, $9, $0
/* 0EB6E4 001EB5E4 0000BF7B */  lq          $31, 0x0($29)
/* 0EB6E8 001EB5E8 1000BD27 */  addiu       $29, $29, 0x10
/* 0EB6EC 001EB5EC 0800E003 */  jr          $31
/* 0EB6F0 001EB5F0 00000000 */   nop
/* 0EB6F4 001EB5F4 00000000 */  nop
/* 0EB6F8 001EB5F8 00000000 */  nop
/* 0EB6FC 001EB5FC 00000000 */  nop
