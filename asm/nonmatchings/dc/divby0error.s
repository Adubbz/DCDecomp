.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel divby0error__Fv
/* 13D8F0 0023D7F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D8F4 0023D7F4 0000BF7F */  sq         $31, 0x0($sp)
/* 13D8F8 0023D7F8 2A00023C */  lui        $2, %hi(_32)
/* 13D8FC 0023D7FC D0F74424 */  addiu      $4, $2, %lo(_32)
/* 13D900 0023D800 B0F5080C */  jal        runerror__FPCc
/* 13D904 0023D804 00000000 */   nop
/* 13D908 0023D808 0000BF7B */  lq         $31, 0x0($sp)
/* 13D90C 0023D80C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D910 0023D810 0800E003 */  jr         $31
/* 13D914 0023D814 00000000 */   nop
/* 13D918 0023D818 00000000 */  nop
/* 13D91C 0023D81C 00000000 */  nop
