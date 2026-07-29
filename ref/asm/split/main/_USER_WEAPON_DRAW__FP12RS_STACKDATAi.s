.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _USER_WEAPON_DRAW__FP12RS_STACKDATAi
/* 0BCF00 001BCE00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BCF04 001BCE04 0000BF7F */  sq          $31, 0x0($29)
/* 0BCF08 001BCE08 01000224 */  addiu       $2, $0, 0x1
/* 0BCF0C 001BCE0C 0300A210 */  beq         $5, $2, .L001BCE1C
/* 0BCF10 001BCE10 00000000 */   nop
/* 0BCF14 001BCE14 06000010 */  b           .L001BCE30
/* 0BCF18 001BCE18 00000000 */   nop
.L001BCE1C:
/* 0BCF1C 001BCE1C 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BCF20 001BCE20 00000000 */   nop
/* 0BCF24 001BCE24 DC01013C */  lui         $1, %hi(BtActStatus + 0x58)
/* 0BCF28 001BCE28 D84422AC */  sw          $2, %lo(BtActStatus + 0x58)($1)
/* 0BCF2C 001BCE2C 01000224 */  addiu       $2, $0, 0x1
.L001BCE30:
/* 0BCF30 001BCE30 0000BF7B */  lq          $31, 0x0($29)
/* 0BCF34 001BCE34 1000BD27 */  addiu       $29, $29, 0x10
/* 0BCF38 001BCE38 0800E003 */  jr          $31
/* 0BCF3C 001BCE3C 00000000 */   nop
