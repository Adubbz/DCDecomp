.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDPrint__FPc
/* 70610 00170510 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 70614 00170514 0000BF7F */  sq         $31, 0x0($sp)
/* 70618 00170518 282E8070 */  paddub     $5, $4, $0
/* 7061C 0017051C 3487838F */  lw         $3, -0x78CC($gp)
/* 70620 00170520 06006010 */  beqz       $3, .L0017053C
/* 70624 00170524 00000000 */   nop
/* 70628 00170528 508F848F */  lw         $4, -0x70B0($gp)
/* 7062C 0017052C 03008010 */  beqz       $4, .L0017053C
/* 70630 00170530 00000000 */   nop
/* 70634 00170534 F4C0050C */  jal        AddStr__FP10CDebugFontPc
/* 70638 00170538 00000000 */   nop
.L0017053C:
/* 7063C 0017053C 0000BF7B */  lq         $31, 0x0($sp)
/* 70640 00170540 1000BD27 */  addiu      $sp, $sp, 0x10
/* 70644 00170544 0800E003 */  jr         $31
/* 70648 00170548 00000000 */   nop
/* 7064C 0017054C 00000000 */  nop
