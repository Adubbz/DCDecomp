.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLanguageName__FPc
/* 77890 00177790 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 77894 00177794 0000BF7F */  sq         $31, 0x0($sp)
/* 77898 00177798 9886868F */  lw         $6, -0x7968($gp)
/* 7789C 0017779C 0700C018 */  blez       $6, .L001777BC
/* 778A0 001777A0 00000000 */   nop
/* 778A4 001777A4 2A00023C */  lui        $2, %hi(_414_5)
/* 778A8 001777A8 10A94524 */  addiu      $5, $2, %lo(_414_5)
/* 778AC 001777AC 1614040C */  jal        sprintf
/* 778B0 001777B0 00000000 */   nop
/* 778B4 001777B4 02000010 */  b          .L001777C0
/* 778B8 001777B8 00000000 */   nop
.L001777BC:
/* 778BC 001777BC 000080A0 */  sb         $0, 0x0($4)
.L001777C0:
/* 778C0 001777C0 0000BF7B */  lq         $31, 0x0($sp)
/* 778C4 001777C4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 778C8 001777C8 0800E003 */  jr         $31
/* 778CC 001777CC 00000000 */   nop
