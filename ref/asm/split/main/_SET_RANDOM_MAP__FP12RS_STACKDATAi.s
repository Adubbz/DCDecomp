.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_RANDOM_MAP__FP12RS_STACKDATAi
/* 0BC680 001BC580 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC684 001BC584 0000BF7F */  sq          $31, 0x0($29)
/* 0BC688 001BC588 C89C828F */  lw          $2, -0x6338($28)
/* 0BC68C 001BC58C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BC690 001BC590 21084100 */  addu        $1, $2, $1
/* 0BC694 001BC594 ECBD238C */  lw          $3, -0x4214($1)
/* 0BC698 001BC598 01000224 */  addiu       $2, $0, 0x1
/* 0BC69C 001BC59C 05006214 */  bne         $3, $2, .L001BC5B4
/* 0BC6A0 001BC5A0 00000000 */   nop
/* 0BC6A4 001BC5A4 E4E1760C */  jal         BtCleatRandomMap__Fv
/* 0BC6A8 001BC5A8 00000000 */   nop
/* 0BC6AC 001BC5AC 03000010 */  b           .L001BC5BC
/* 0BC6B0 001BC5B0 00000000 */   nop
.L001BC5B4:
/* 0BC6B4 001BC5B4 70E4760C */  jal         BtCleatFreeMap__Fv
/* 0BC6B8 001BC5B8 00000000 */   nop
.L001BC5BC:
/* 0BC6BC 001BC5BC 01000224 */  addiu       $2, $0, 0x1
/* 0BC6C0 001BC5C0 0000BF7B */  lq          $31, 0x0($29)
/* 0BC6C4 001BC5C4 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC6C8 001BC5C8 0800E003 */  jr          $31
/* 0BC6CC 001BC5CC 00000000 */   nop
