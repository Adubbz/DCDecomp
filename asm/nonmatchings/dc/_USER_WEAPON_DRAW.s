.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _USER_WEAPON_DRAW__FP12RS_STACKDATAi
/* BCF00 001BCE00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BCF04 001BCE04 0000BF7F */  sq         $31, 0x0($sp)
/* BCF08 001BCE08 01000224 */  addiu      $2, $0, 0x1
/* BCF0C 001BCE0C 0300A210 */  beq        $5, $2, .L001BCE1C
/* BCF10 001BCE10 00000000 */   nop
/* BCF14 001BCE14 06000010 */  b          .L001BCE30
/* BCF18 001BCE18 00000000 */   nop
.L001BCE1C:
/* BCF1C 001BCE1C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCF20 001BCE20 00000000 */   nop
/* BCF24 001BCE24 DC01013C */  lui        $at, (0x1DC44D8 >> 16)
/* BCF28 001BCE28 D84422AC */  sw         $2, (0x1DC44D8 & 0xFFFF)($at)
/* BCF2C 001BCE2C 01000224 */  addiu      $2, $0, 0x1
.L001BCE30:
/* BCF30 001BCE30 0000BF7B */  lq         $31, 0x0($sp)
/* BCF34 001BCE34 1000BD27 */  addiu      $sp, $sp, 0x10
/* BCF38 001BCE38 0800E003 */  jr         $31
/* BCF3C 001BCE3C 00000000 */   nop
