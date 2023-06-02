.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMenuClsMes__FP6ClsMesii
/* 12CFA0 0022CEA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12CFA4 0022CEA4 1000BF7F */  sq         $31, 0x10($sp)
/* 12CFA8 0022CEA8 0000B07F */  sq         $16, 0x0($sp)
/* 12CFAC 0022CEAC 28868070 */  paddub     $16, $4, $0
/* 12CFB0 0022CEB0 08000012 */  beqz       $16, .L0022CED4
/* 12CFB4 0022CEB4 00000000 */   nop
/* 12CFB8 0022CEB8 000005AE */  sw         $5, 0x0($16)
/* 12CFBC 0022CEBC 040006AE */  sw         $6, 0x4($16)
/* 12CFC0 0022CEC0 6437050C */  jal        Step__6ClsMesFv
/* 12CFC4 0022CEC4 00000000 */   nop
/* 12CFC8 0022CEC8 28260072 */  paddub     $4, $16, $0
/* 12CFCC 0022CECC C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 12CFD0 0022CED0 00000000 */   nop
.L0022CED4:
/* 12CFD4 0022CED4 1000BF7B */  lq         $31, 0x10($sp)
/* 12CFD8 0022CED8 0000B07B */  lq         $16, 0x0($sp)
/* 12CFDC 0022CEDC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12CFE0 0022CEE0 0800E003 */  jr         $31
/* 12CFE4 0022CEE4 00000000 */   nop
/* 12CFE8 0022CEE8 00000000 */  nop
/* 12CFEC 0022CEEC 00000000 */  nop
