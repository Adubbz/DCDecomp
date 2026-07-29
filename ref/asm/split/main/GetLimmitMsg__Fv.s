.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel GetLimmitMsg__Fv
/* 0F45F0 001F44F0 D494838F */  lw          $3, -0x6B2C($28)
/* 0F45F4 001F44F4 0100013C */  lui         $1, (0x10000 >> 16)
/* 0F45F8 001F44F8 21086100 */  addu        $1, $3, $1
/* 0F45FC 001F44FC 108B238C */  lw          $3, -0x74F0($1)
/* 0F4600 001F4500 01006520 */  addi        $5, $3, 0x1 /* handwritten instruction */
/* 0F4604 001F4504 0D00A12C */  sltiu       $1, $5, 0xD
/* 0F4608 001F4508 12002010 */  beqz        $1, .L001F4554$b
/* 0F460C 001F450C 00000000 */   nop
/* 0F4610 001F4510 2A00033C */  lui         $3, %hi(LIT_697__2)
/* 0F4614 001F4514 A0D46424 */  addiu       $4, $3, %lo(LIT_697__2)
/* 0F4618 001F4518 80180500 */  sll         $3, $5, 2
/* 0F461C 001F451C 21186400 */  addu        $3, $3, $4
/* 0F4620 001F4520 0000638C */  lw          $3, 0x0($3)
/* 0F4624 001F4524 08006000 */  jr          $3
/* 0F4628 001F4528 00000000 */   nop
jlabel .L001F452C
.L001F452C$b:
/* 0F462C 001F452C FFFF0224 */  addiu       $2, $0, -0x1
/* 0F4630 001F4530 08000010 */  b           .L001F4554$b
/* 0F4634 001F4534 00000000 */   nop
jlabel .L001F4538
.L001F4538$b:
/* 0F4638 001F4538 9E010224 */  addiu       $2, $0, 0x19E
/* 0F463C 001F453C 05000010 */  b           .L001F4554$b
/* 0F4640 001F4540 00000000 */   nop
jlabel .L001F4544
.L001F4544$b:
/* 0F4644 001F4544 9F010224 */  addiu       $2, $0, 0x19F
/* 0F4648 001F4548 02000010 */  b           .L001F4554$b
/* 0F464C 001F454C 00000000 */   nop
jlabel .L001F4550
.L001F4550$b:
/* 0F4650 001F4550 A0010224 */  addiu       $2, $0, 0x1A0
jlabel .L001F4554
.L001F4554$b:
/* 0F4654 001F4554 0800E003 */  jr          $31
/* 0F4658 001F4558 00000000 */   nop
/* 0F465C 001F455C 00000000 */  nop
