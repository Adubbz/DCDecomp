.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel modby0error__Fv
/* 13D920 0023D820 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 13D924 0023D824 0000BF7F */  sq         $31, 0x0($sp)
/* 13D928 0023D828 2A00023C */  lui        $2, %hi(_34)
/* 13D92C 0023D82C E0F74424 */  addiu      $4, $2, %lo(_34)
/* 13D930 0023D830 B0F5080C */  jal        runerror__FPCc
/* 13D934 0023D834 00000000 */   nop
/* 13D938 0023D838 0000BF7B */  lq         $31, 0x0($sp)
/* 13D93C 0023D83C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 13D940 0023D840 0800E003 */  jr         $31
/* 13D944 0023D844 00000000 */   nop
/* 13D948 0023D848 00000000 */  nop
/* 13D94C 0023D84C 00000000 */  nop
