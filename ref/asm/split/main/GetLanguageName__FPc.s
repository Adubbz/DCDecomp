.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLanguageName__FPc
/* 077890 00177790 F0FFBD27 */  addiu       $29, $29, -0x10
/* 077894 00177794 0000BF7F */  sq          $31, 0x0($29)
/* 077898 00177798 9886868F */  lw          $6, -0x7968($28)
/* 07789C 0017779C 0700C018 */  blez        $6, .L001777BC
/* 0778A0 001777A0 00000000 */   nop
/* 0778A4 001777A4 2A00023C */  lui         $2, %hi(LIT_414__5)
/* 0778A8 001777A8 10A94524 */  addiu       $5, $2, %lo(LIT_414__5)
/* 0778AC 001777AC 1614040C */  jal         sprintf
/* 0778B0 001777B0 00000000 */   nop
/* 0778B4 001777B4 02000010 */  b           .L001777C0
/* 0778B8 001777B8 00000000 */   nop
.L001777BC:
/* 0778BC 001777BC 000080A0 */  sb          $0, 0x0($4)
.L001777C0:
/* 0778C0 001777C0 0000BF7B */  lq          $31, 0x0($29)
/* 0778C4 001777C4 1000BD27 */  addiu       $29, $29, 0x10
/* 0778C8 001777C8 0800E003 */  jr          $31
/* 0778CC 001777CC 00000000 */   nop
