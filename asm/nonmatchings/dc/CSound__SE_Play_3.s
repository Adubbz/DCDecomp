.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SE_Play__6CSoundFiiiii
/* 45920 00145820 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 45924 00145824 0000BF7F */  sq         $31, 0x0($sp)
/* 45928 00145828 28560071 */  paddub     $10, $8, $0
/* 4592C 0014582C 285E2071 */  paddub     $11, $9, $0
/* 45930 00145830 40000824 */  addiu      $8, $0, 0x40
/* 45934 00145834 7F000924 */  addiu      $9, $0, 0x7F
/* 45938 00145838 7C15050C */  jal        SE_Play__6CSoundFiiiiiii
/* 4593C 0014583C 00000000 */   nop
/* 45940 00145840 0000BF7B */  lq         $31, 0x0($sp)
/* 45944 00145844 1000BD27 */  addiu      $sp, $sp, 0x10
/* 45948 00145848 0800E003 */  jr         $31
/* 4594C 0014584C 00000000 */   nop
