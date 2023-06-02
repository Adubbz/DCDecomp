.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _init_signal
/* 5020 00104F20 2500023C */  lui        $2, (0x250000 >> 16)
/* 5024 00104F24 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5028 00104F28 ECFD448C */  lw         $4, -0x214($2)
/* 502C 00104F2C 0000BFFF */  sd         $31, 0x0($sp)
/* 5030 00104F30 0813040C */  jal        _init_signal_r
/* 5034 00104F34 00000000 */   nop
/* 5038 00104F38 0000BFDF */  ld         $31, 0x0($sp)
/* 503C 00104F3C 0800E003 */  jr         $31
/* 5040 00104F40 1000BD27 */   addiu     $sp, $sp, 0x10
/* 5044 00104F44 00000000 */  nop
